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
        
        public ClientWebSocket clientSocket
        {
            get
            {
                return ws;
            }
        }

        public WebSocketNode(string url)
        {
            this.url = url;
            Connect();
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
                    Trace.WriteLine(string.Format("Socket state[{0}] not allowed while game not finish! Try reconnect...", ws.State));
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
    }
}