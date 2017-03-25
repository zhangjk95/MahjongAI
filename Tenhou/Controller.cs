using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Tenhou.Models;

namespace Tenhou
{
    class Controller
    {
        protected TenhouClient client;
        protected bool isRunning;

        public Controller(TenhouClient client)
        {
            this.client = client;
            this.isRunning = false;
        }

        ~Controller()
        {
            if (isRunning)
            {
                Stop();
            }
        }

        public virtual void Start()
        {
            client.OnDraw += OnDraw;
            client.OnWait += OnWait;
            client.OnDiscard += OnDiscard;
            client.OnGameStart += OnGameStart;
            client.OnGameEnd += OnGameEnd;
            client.OnLogin += OnLogin;
            client.OnClose += OnClose;
            client.OnConnectionException += OnConnectionException;
            client.OnNaki += OnNaki;
            client.OnReach += OnReach;
            client.OnUnknownEvent += OnUnknownEvent;
            isRunning = true;
        }

        public virtual void Stop()
        {
            client.OnDraw -= OnDraw;
            client.OnWait -= OnWait;
            client.OnDiscard -= OnDiscard;
            client.OnGameStart -= OnGameStart;
            client.OnGameEnd -= OnGameEnd;
            client.OnLogin -= OnLogin;
            client.OnClose -= OnClose;
            client.OnConnectionException -= OnConnectionException;
            client.OnNaki -= OnNaki;
            client.OnReach -= OnReach;
            client.OnUnknownEvent -= OnUnknownEvent;
            isRunning = false;
        }

        protected virtual void OnLogin()
        {

        }

        protected virtual void OnClose()
        {
            Stop();
        }

        protected virtual void OnConnectionException()
        {
            
        }

        protected virtual void OnDraw(Tile tile)
        {
            
        }

        protected virtual void OnWait(Tile tile, Player fromPlayer)
        {
            
        }

        protected virtual void OnDiscard(Player player, Tile tile)
        {
            
        }

        protected virtual void OnReach(Player player)
        {

        }

        protected virtual void OnNaki(Player player, FuuroGroup fuuro)
        {

        }

        protected virtual void OnGameStart(bool continued)
        {
            
        }

        protected virtual void OnGameEnd()
        {
            
        }

        protected virtual void OnUnknownEvent(string str)
        {
            
        }
    }
}
