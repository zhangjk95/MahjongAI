using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Diagnostics;
using System.IO;
using Tenhou.Models;

namespace Tenhou
{
    class Controller
    {
        TenhouClient client;
        Process process;
        bool isRunning;

        public Controller(TenhouClient client, string program)
        {
            this.client = client;

            this.process = new Process()
            {
                StartInfo = new ProcessStartInfo()
                {
                    FileName = program,
                    WorkingDirectory = Path.GetDirectoryName(program),
                    CreateNoWindow = true,
                    UseShellExecute = false,
                    RedirectStandardInput = true,
                    RedirectStandardOutput = true,
                    RedirectStandardError = true
                }
            };          

            this.isRunning = false;
        }

        ~Controller()
        {
            Stop();
        }

        public void Start()
        {
            client.OnDraw += OnDraw;
            client.OnWait += OnWait;
            client.OnClose += OnClose;

            process.Start();
            process.StandardInput.AutoFlush = true;
            process.OutputDataReceived += process_OutputDataReceived;
            process.BeginOutputReadLine();

            isRunning = true;
        }

        public void Stop()
        {
            if (isRunning)
            {
                client.OnDraw -= OnDraw;
                client.OnWait -= OnWait;
                client.OnClose -= OnClose;

                process.Kill();
                process.OutputDataReceived -= process_OutputDataReceived;

                isRunning = false;
            }
        }

        void process_OutputDataReceived(object sender, DataReceivedEventArgs e)
        {
            if (!string.IsNullOrEmpty(e.Data))
            {
                Trace.TraceInformation("Program output: {0}", e.Data);
                HandleCommand(e.Data.Split());
            }
        }

        void Send(string message)
        {
            process.StandardInput.WriteLine(message);
            Trace.TraceInformation("Program input: {0}", message);
        }

        private void OnClose()
        {
            Stop();
        }

        private void OnDraw(Tile tile)
        {
            Send(string.Format("draw {0}", tile.Name));
        }

        private void OnWait(Tile tile)
        {
            Send(string.Format("wait {0}", tile.Name));
        }

        private void HandleCommand(string[] cmd)
        {
            switch (cmd[0])
            {
                case "hand":
                    Send(client.GameData.hand.tile.ToString(" ", (tile) => tile.Name));
                    break;
                case "reached":
                    Send(client.GameData.player[int.Parse(cmd[1])].reached.ToString());
                    break;
                case "graveyard":
                    IEnumerable<Tile> tiles = client.GameData.player[int.Parse(cmd[1])].graveyard.tile;
                    if (cmd.Length > 2 && cmd[2] == "1")
                    {
                        tiles = tiles.Where((tile) => !tile.IsTakenAway);
                    }
                    Send(tiles.ToString(" ", (tile) => tile.Name));
                    break;
                case "dora":
                    Send(client.GameData.dora.tile.ToString(" ", (tile) => tile.Name));
                    break;
                case "fuuro":
                    Send(client.GameData.player[int.Parse(cmd[1])].fuuro.tile.Select((group) => group.ToString(" ", (tile) => tile.Name)).ToString(" "));
                    break;
                case "discard":
                    client.Discard(client.GameData.hand.tile.First((tile) => tile.Name == cmd[1]));
                    break;
                case "tsumokiri":
                    client.Discard(client.GameData.lastTile);
                    break;
                case "reach":
                    client.Reach(client.GameData.hand.tile.First((tile) => tile.Name == cmd[1]));
                    break;
                case "pass":
                    client.Pass();
                    break;
                case "ron":
                    client.Ron();
                    break;
                case "tsumo":
                    client.Tsumo();
                    break;
            }
        }
    }
}
