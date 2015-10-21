using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Net.Sockets;
using System.Diagnostics;

namespace Tenhou
{
    class SocketClient
    {
        const int bufferSize = 1024;

        private TcpClient client;
        private NetworkStream stream;

        public SocketClient(string server, int port)
        {
            client = new TcpClient(server, port);
            stream = client.GetStream();
        }

        ~SocketClient()
        {
            Close();
        }

        public void Close()
        {
            stream.Close();
            client.Close();
        }

        public void Send(String message)
        {
            byte[] data = System.Text.Encoding.ASCII.GetBytes(message + "\0");
            stream.Write(data, 0, data.Length);
            Trace.TraceInformation("Send: {0}", message);
        }
        public string Receive()
        {
            byte[] data = new Byte[bufferSize];
            int bytes = stream.Read(data, 0, data.Length);
            string responseData = System.Text.Encoding.ASCII.GetString(data, 0, bytes);
            if (!string.IsNullOrEmpty(responseData))
            {
                Trace.TraceInformation("Receive: {0}", responseData);
            }
            return responseData;
        }
    }
}
