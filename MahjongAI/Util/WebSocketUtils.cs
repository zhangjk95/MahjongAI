using System;
using System.Threading.Tasks;
using System.Net.WebSockets;
using System.Threading;
using System.Reflection;
using System.Collections;
using System.Net;

namespace MahjongAI.Util
{
    class WebSocketUtils
    {
        private CancellationTokenSource cts = new CancellationTokenSource();

        public ClientWebSocket Connect(string uri)
        {
            var ws = new ClientWebSocket();
            AllowSettingRequestHeader();
            ws.Options.SetRequestHeader("User-Agent", "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/94.0.4606.61 Safari/537.36");
            ws.ConnectAsync(new Uri(uri), cts.Token).Wait();
            return ws;
        }

        public async Task Send(ClientWebSocket ws, byte[] buffer)
        {
            await ws.SendAsync(new ArraySegment<byte>(buffer), WebSocketMessageType.Binary, /* endOfMessage */ true, cts.Token);
        }

        public void StartRecv(ClientWebSocket ws, Action<byte[], int> onMessage, Action<Exception> onError)
        {
            Task.Factory.StartNew(
                async () =>
                {
                    byte[] buffer = new byte[1048576];
                    while (true)
                    {
                        WebSocketReceiveResult result = await ws.ReceiveAsync(new ArraySegment<byte>(buffer), cts.Token);
                        if (result.CloseStatus.HasValue)
                        {
                            if (result.CloseStatus.Value != WebSocketCloseStatus.NormalClosure)
                            {
                                onError(new Exception(result.CloseStatus.Value.ToString() + ": " + result.CloseStatusDescription));
                            }
                            return;
                        }
                        onMessage(buffer, result.Count);
                    }
                }, cts.Token, TaskCreationOptions.LongRunning, TaskScheduler.Default);
        }

        public async Task Close(ClientWebSocket ws)
        {
            await ws.CloseAsync(WebSocketCloseStatus.NormalClosure, "", cts.Token);
        }

        /**
         * A hack using reflection to allow setting request header.
         * See https://stackoverflow.com/a/58585845.
         */
        private static void AllowSettingRequestHeader()
        {
            Assembly a = typeof(HttpWebRequest).Assembly;
            foreach (FieldInfo f in a.GetType("System.Net.HeaderInfoTable").GetFields(BindingFlags.NonPublic | BindingFlags.Static))
            {
                if (f.Name == "HeaderHashTable")
                {
                    Hashtable hashTable = f.GetValue(null) as Hashtable;
                    foreach (string sKey in hashTable.Keys)
                    {
                        object headerInfo = hashTable[sKey];
                        foreach (FieldInfo g in a.GetType("System.Net.HeaderInfo").GetFields(BindingFlags.NonPublic | BindingFlags.Instance))
                        {
                            if (g.Name == "IsRequestRestricted")
                            {
                                bool b = (bool)g.GetValue(headerInfo);
                                if (b)
                                {
                                    g.SetValue(headerInfo, false);
                                }
                            }
                        }
                    }
                }
            }
        }
    }
}
