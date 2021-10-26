using System;
using System.Diagnostics;
using System.Net.WebSockets;
using System.Threading.Tasks;
using MahjongAI.Util;

namespace MahjongAI
{
    public class WebSocketNode
    {
        private ClientWebSocket ws;
        private WebSocketUtils wsUtils = new WebSocketUtils();
        private string url;
        public WebSocketNode(string url, Action<byte[], int> onMessage, Action<Exception> onError)
        {
            this.url = url;
            
            Connect();
            
            StartRecv(onMessage, onError);
        }
        public async Task Send(byte[] buffer, bool gameEnded = false)
        {
            if (ws.State == WebSocketState.Open || ws.State == WebSocketState.CloseReceived)
            {
                await wsUtils.Send(ws, buffer);
            }
            else
            {
                if (!gameEnded)
                {
                    Trace.WriteLine(string.Format("The WebSocket is in an invalid state [{0}] while the game is not finished! Reconnecting...", ws.State));
                    
                    ReconnectAndSend(buffer);
                }
            }
        }

        public void Close()
        {
            wsUtils.Close(ws).Wait();
        }
        private void ReconnectAndSend(byte[] buffer)
        {
            Connect();
            
            Trace.WriteLine("Socket successfully reconnected, state=" + ws.State);
            
            Send(buffer);
        }
        private void Connect()
        {
            ws = wsUtils.Connect(url);
        }
        
        private void StartRecv(Action<byte[], int> onMessage, Action<Exception> onError)
        {
            wsUtils.StartRecv(ws, onMessage, onError);
        }
    }
}