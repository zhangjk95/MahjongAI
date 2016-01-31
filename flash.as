//子图形 1
//  帧 0
//    动作标记 #0

__reg0 = "MTASC_MAIN";
Main.main(this);

//子图形 2
//  初始化剪辑
#initclip 0

if (!com.cegg.game.mahjong.MainInit) 
{
    if (!com) 
    {
        _global.com = new Object();
    }
    if (!com.cegg) 
    {
        _global.com.cegg = new Object();
    }
    if (!com.cegg.game) 
    {
        _global.com.cegg.game = new Object();
    }
    if (!com.cegg.game.mahjong) 
    {
        _global.com.cegg.game.mahjong = new Object();
    }
    var __reg1 = (_global.com.cegg.game.mahjong.MainInit = function ()
    {
    }
    ).prototype;
    __reg0.init = function ()
    {
        var __reg2 = com.cegg.game.mahjong.SaveData.MJINFO();
        _global.nobgm = __reg2.data.nobgm;
        _global.nose = __reg2.data.nose;
        var mc = _root.Main;
        var __reg3 = 0;
        mc.attachMovie(com.cegg.game.SE.SymbolName, "SE", __reg3++);
        mc.attachMovie("bg" + Stage.width + "x" + Stage.height, "bg", __reg3++);
        mc.attachMovie(com.cegg.MCImageButton.SymbolName, "menu_sound", __reg3++, {bn: "menu_sound_n", bf: "menu_sound_f", cmd: "menu_sound"});
        mc.attachMovie(com.cegg.MCImageButton.SymbolName, "menu_display", __reg3++, {bn: "menu_display_n", bf: "menu_display_f", cmd: "menu_display"});
        mc.createEmptyMovieClip("CS", __reg3++);
        mc.createEmptyMovieClip("Game", __reg3++);
        mc.createEmptyMovieClip("View", __reg3++);
        mc.createEmptyMovieClip("Owari", __reg3++);
        _root.SE = mc.SE;
        mc.menu_sound._x = Stage.width - mc.menu_sound._width;
        mc.menu_display._x = Stage.width - 35;
        mc.setMenuBottom = function (b)
        {
            if (b) 
            {
                mc.menu_sound._y = Stage.height - mc.menu_sound._height;
                mc.menu_display._y = Stage.height - mc.menu_display._height;
                return;
            }
            mc.menu_sound._y = 0;
            mc.menu_display._y = 0;
        }
        ;
        mc.bg.c = new Color(mc.bg);
        mc.bg.setColor = function (cb, ch, bSave)
        {
            if (ch != undefined) 
            {
                com.cegg.game.mahjong.Hai.ct = {ra: (ch >> 16 & 255) * 100 / 255, rb: 0, ga: (ch >> 8 & 255) * 100 / 255, gb: 0, ba: (ch >> 0 & 255) * 100 / 255, bb: 0, aa: 100, ab: 0};
                var __reg5 = [_root.Main];
                while (__reg5.length) 
                {
                    var __reg6 = __reg5.shift();
                    if (typeof __reg6 == "movieclip") 
                    {
                        for (var __reg7 in __reg6) 
                        {
                            if (typeof __reg6[__reg7] != "movieclip") 
                            {
                                continue;
                            }
                            if (__reg7 != __reg6[__reg7]._name) 
                            {
                                continue;
                            }
                            __reg5.push(__reg6[__reg7]);
                            __reg6[__reg7].ccol.setTransform(com.cegg.game.mahjong.Hai.ct);
                        }
                    }
                }
            }
            if (cb != undefined) 
            {
                this.c.setTransform({ra: (cb >> 16 & 255) * 100 / 255, rb: 0, ga: (cb >> 8 & 255) * 100 / 255, gb: 0, ba: (cb >> 0 & 255) * 100 / 255, bb: 0, aa: 100, ab: 0});
            }
            if (bSave) 
            {
                var __reg8 = com.cegg.game.mahjong.SaveData.MJINFO();
                if (cb != undefined) 
                {
                    __reg8.data.cb = com.cegg.LColor.toString6(cb);
                }
                if (ch != undefined) 
                {
                    __reg8.data.ch = com.cegg.LColor.toString6(ch);
                }
                __reg8.flush();
            }
        }
        ;
        mc.onCommand = function (msg)
        {
            if ((__reg0 = msg.cmd) === "menu_sound") 
            {
                if (_root.BGM) 
                {
                    if (_global.nobgm) 
                    {
                        _global.nose = !_global.nose;
                    }
                    _global.nobgm = !_global.nobgm;
                    _root.BGM.play(_global.nobgm ? "mute" : "nomute");
                }
                else 
                {
                    _global.nose = !_global.nose;
                }
                var __reg3 = com.cegg.game.mahjong.SaveData.MJINFO();
                __reg3.data.nobgm = _global.nobgm;
                __reg3.data.nose = _global.nose;
                __reg3.flush();
                _root.createEmptyMovieClip("popup", 1048575);
                var __reg4 = _root.popup;
                __reg4.createTextField("tf", 0, 0, 0, Stage.width, 0);
                with (__reg4.tf)
                {
                    autoSize = "right";
                    selectable = false;
                    textColor = 16777215;
                    text = "SE: " + (_global.nose ? "off" : "on") + "\n";
                    if (_root.BGM) 
                    {
                        text = text + ("BGM: " + (_global.nobgm ? "off" : "on"));
                    }
                }
                __reg4.c = 50;
                __reg4.onEnterFrame = function ()
                {
                    if (this.c--) 
                    {
                        return undefined;
                    }
                    this.removeMovieClip();
                }
                ;
                if (mc.menu_sound._y) 
                {
                    __reg4._y = mc.menu_sound._y - __reg4._height;
                }
                else 
                {
                    __reg4._y = mc.menu_sound._y + mc.menu_sound._height;
                }
                return;
            }
            else if (__reg0 === "menu_display") 
            {
                com.cegg.GPopupMenu.trackPopupMenu((new XML("<menu>" + "<item disp=\"Color\">" + "<item disp=\"" + com.cegg.game.mahjong.Res.T_TAKUCOLOR + "\"><item type=\"color\" cmd=\"TAKCOLOR\" value=\"00FF00\"/></item><br/>" + "<item disp=\"" + com.cegg.game.mahjong.Res.T_HAICOLOR + "\"><item type=\"color\" cmd=\"HAICOLOR\" value=\"FF0000\"/></item><br/>" + "<separator/>" + "<item disp=\"Standard\" cmd=\"SETCOLOR\" cb=\"00EE00\" ch=\"0000CC\"/><br/>" + "<item disp=\"Brown\"    cmd=\"SETCOLOR\" cb=\"F3F34C\" ch=\"702200\"/><br/>" + "<item disp=\"Water\"    cmd=\"SETCOLOR\" cb=\"00FFFF\" ch=\"003366\"/><br/>" + "<item disp=\"Wine\"     cmd=\"SETCOLOR\" cb=\"FFB366\" ch=\"700000\"/><br/>" + "<item disp=\"White\"    cmd=\"SETCOLOR\" cb=\"FFFFFF\" ch=\"FFFFFF\"/><br/>" + "<separator/>" + "<item disp=\"Default\" cmd=\"SETCOLOR\" cb=\"CCCCCC\" ch=\"111111\"/><br/>" + "</item><br/>" + "<item disp=\"Window\">" + "<item disp=\"FullWindow\" cmd=\"WINDOW_FULLWINDOW\" /><br/>" + "<item disp=\"FullScreen\" cmd=\"WINDOW_FULLSCREEN\" /><br/>" + "<separator/>" + "<item disp=\"Default\"    cmd=\"WINDOW_NORMAL\" /><br/>" + "</item>" + "</menu>")).firstChild, _root._xmouse, _root._ymouse, this);
                return;
            }
            else if (__reg0 === "TAKCOLOR") 
            {
                mc.bg.setColor(com.cegg.LColor.fromString(msg.value), undefined, true);
                return;
            }
            else if (__reg0 === "HAICOLOR") 
            {
                mc.bg.setColor(undefined, com.cegg.LColor.fromString(msg.value), true);
                return;
            }
            else if (__reg0 === "SETCOLOR") 
            {
                mc.bg.setColor(com.cegg.LColor.fromString(msg.cb), com.cegg.LColor.fromString(msg.ch), true);
                return;
            }
            else if (__reg0 === "LOADCOLOR") 
            {
                var __reg5 = com.cegg.game.mahjong.SaveData.MJINFO().data;
                mc.bg.setColor(__reg5.cb == undefined ? 13421772 : com.cegg.LColor.fromString(__reg5.cb), __reg5.ch == undefined ? 1118481 : com.cegg.LColor.fromString(__reg5.ch), false);
                return;
            }
            else if (__reg0 === "WINDOW_NORMAL") 
            {
                if (Stage.displayState != "normal") 
                {
                    Stage.displayState = "normal";
                }
                getURL("javascript:wnd(\"normal\");", "_self");
                return;
            }
            else if (__reg0 === "WINDOW_FULLWINDOW") 
            {
                if (Stage.displayState != "normal") 
                {
                    Stage.displayState = "normal";
                }
                getURL("javascript:wnd(\"fullwindow\");", "_self");
                return;
            }
            else if (__reg0 === "WINDOW_FULLSCREEN") 
            {
                if (Stage.displayState != "fullScreen") 
                {
                    Stage.displayState = "fullScreen";
                }
                return;
            }
            _root.onCommand(msg);
            return;
        }
        ;
        mc.onCommand({cmd: "LOADCOLOR"});
        var gameDepth = mc.Game.getDepth();
        _root.startGame = function (type, obj)
        {
            if ((__reg0 = type) === "MAHJONG") 
            {
                mc.attachMovie(com.cegg.game.mahjong.MahjongMain.SymbolName, "Game", gameDepth, obj);
                return;
            }
            else if (__reg0 === "NIKAKU") 
            {
                mc.attachMovie(com.cegg.game.nikaku.NikakuMain.SymbolName, "Game", gameDepth);
                return;
            }
            else if (__reg0 === "SHANGHAI") 
            {
                mc.attachMovie(com.cegg.game.shanghai.ShanghaiMain.SymbolName, "Game", gameDepth);
                return;
            }
            else if (__reg0 !== "NERIMA") 
            {
                return;
            }
            mc.attachMovie(com.cegg.game.nerima.NerimaMain.SymbolName, "Game", gameDepth);
            return;
        }
        ;
        _root.onCommand = com.cegg.game.mahjong.MainRoot.onCommandRoot;
        _root.onXMLNode = com.cegg.game.mahjong.MainRoot.onXMLNode_HELO;
        com.cegg.GPopupMenu._rootView = _root.Main;
        com.cegg.game.mahjong.SaveData.init_f0();
        _root.tw = int(_root.tw) % 4;
        if (!_root.log.length && !_root.wg.length) 
        {
            com.cegg.game.mahjong.MainInit.lc = new LocalConnection();
            if (com.cegg.game.mahjong.MainInit.lc.connect("mjlc16")) 
            {
                if (com.cegg.game.mahjong.MainInit.lc.domain() != "mjv.jp" && com.cegg.game.mahjong.MainInit.lc.domain() != "tenhou.net") 
                {
                    _root.onXMLNode((new XML("<ERR code=\"2000\"/>")).firstChild);
                    return undefined;
                }
            }
            else 
            {
                _root.onXMLNode((new XML("<ERR code=\"2001\"/>")).firstChild);
                return undefined;
            }
            if (!com.cegg.game.mahjong.MainInit.lc) 
            {
                _root.createTextField("tf", 1000, 0, 0, 0, 0);
                with (_root.tf)
                {
                    autoSize = "left";
                    textColor = 16711680;
                    text = "DEBUG MODE\n";
                }
            }
        }
        if (_root.log.length > 0) 
        {
            _root.onCommand({cmd: "LOGVIEWER", log: _root.log, tw: _root.tw, ts: _root.ts});
        }
        else 
        {
            _root.onCommand({cmd: "OPENXMLSOCKET"});
        }
        var __reg4 = com.cegg.game.mahjong.SaveData.MJINFO();
        delete __reg4.data.conf_join;
        delete __reg4.data.tid;
        __reg4.flush();
    }
    ;
    ASSetPropFlags(__reg1, null, 1);
}#endinitclip

//子图形 3
//  初始化剪辑
#initclip 0

if (!com.cegg.game.mahjong.Dice) 
{
    if (!com) 
    {
        _global.com = new Object();
    }
    if (!com.cegg) 
    {
        _global.com.cegg = new Object();
    }
    if (!com.cegg.game) 
    {
        _global.com.cegg.game = new Object();
    }
    if (!com.cegg.game.mahjong) 
    {
        _global.com.cegg.game.mahjong = new Object();
    }
    (_global.com.cegg.game.mahjong.Dice = function ()
    {
        super();
        this.attachMovie("sai_sdw", "sdw", 0);
        this.createEmptyMovieClip("img", 1);
        this.img.attachMovie("sai0", "sai", 0);
        this.img.createEmptyMovieClip("mask", 2);
        with (this.img.mask)
        {
            lineStyle();
            beginFill(16777215, 100);
            moveTo(0, 0);
            lineTo(0, 32);
            lineTo(32, 32);
            lineTo(32, 0);
            endFill();
        }
        this.img.sai.setMask(this.img.mask);
        this.seed = random(8);
        this.a = random(8);
        this.b = this.c = 12 + random(4);
    }
    ).prototype.__proto__ = MovieClip.prototype;
    __reg0.prototype.__constructor__ = MovieClip;
    var __reg1 = __reg0.prototype;
    __reg1.onEnterFrame = function ()
    {
        var __reg2 = (this.c - this.b / 2) / (this.b / 2);
        __reg2 = __reg2 * __reg2;
        this.sdw._alpha = 25 + __reg2 * 75;
        this.img._y = (0 - (1 - __reg2)) * 100;
        if (this.c) 
        {
            this.img.sai._y = (0 - this.seed) * 32;
            this.img.sai._x = (0 - (this.a + this.c) % 8) * 32;
            this.sdw._x = (1 - __reg2) * 20;
            this.sdw._y = (0 - (1 - __reg2)) * 20;
            --this.c;
            return;
        }
        this.img.attachMovie("sai1", "sai", 0);
        this.img.sai.setMask(this.img.mask);
        this.img.sai._x = (0 - this.me) * 32;
        this.c = 25;
        this._alpha = 100;
        this.onEnterFrame = this.onEnterFrame_FadeOut;
    }
    ;
    __reg1.onEnterFrame_FadeOut = function ()
    {
        if (--this.c <= 0) 
        {
            this._alpha = this._alpha - 10;
            if (this._alpha <= 0) 
            {
                this.removeMovieClip();
            }
        }
    }
    ;
    ASSetPropFlags(__reg1, null, 1);
    __reg0.SymbolName = "__Packages.com.cegg.game.mahjong.Dice";
    __reg0.SymbolOwner = com.cegg.game.mahjong.Dice;
    __reg0.SymbolLinked = Object.registerClass(com.cegg.game.mahjong.Dice.SymbolName, com.cegg.game.mahjong.Dice.SymbolOwner);
}#endinitclip

//子图形 4
//  初始化剪辑
#initclip 0

if (!com.cegg.LGraphics) 
{
    if (!com) 
    {
        _global.com = new Object();
    }
    if (!com.cegg) 
    {
        _global.com.cegg = new Object();
    }
    (_global.com.cegg.LGraphics = function ()
    {
        super();
    }
    ).prototype.__proto__ = MovieClip.prototype;
    __reg0.prototype.__constructor__ = MovieClip;
    var __reg1 = __reg0.prototype;
    __reg0.drawFrame = function (mc, x, y, w, h, bg)
    {
        if (bg != undefined) 
        {
            mc.beginFill(bg);
        }
        mc.moveTo(x, y);
        mc.lineStyle(1, 13421772);
        mc.lineTo(x, y + h);
        mc.lineStyle(1, 4210752);
        mc.lineTo(x + w, y + h);
        mc.lineTo(x + w, y);
        mc.lineStyle(1, 13421772);
        mc.lineTo(x, y);
        if (bg != undefined) 
        {
            mc.endFill();
        }
    }
    ;
    __reg0.drawShadow = function (mc, x, y, w, h)
    {
        var __reg7 = 6;
        var __reg8 = 6;
        var __reg9 = [0, 0];
        var __reg10 = [40, 0];
        var __reg11 = [0, 255];
        var __reg12 = {a: 0, b: y + __reg8, c: 0, d: 0 - y - __reg8, e: 0, f: 0, g: 0, h: y + h + int(__reg8 / 2), i: 1};
        mc.lineStyle();
        mc.beginGradientFill("linear", __reg9, __reg10, __reg11, __reg12);
        mc.moveTo(x, y + h);
        mc.lineTo(x + __reg7, y + h + __reg8);
        mc.lineTo(x + w + __reg7, y + h + __reg8);
        mc.lineTo(x + w, y + h);
        mc.endFill();
        __reg12 = {a: x + __reg7, b: 0, c: 0, d: 0, e: x + __reg7, f: 0, g: x + w + int(__reg7 / 2), h: 0, i: 1};
        mc.beginGradientFill("linear", __reg9, __reg10, __reg11, __reg12);
        mc.moveTo(x + w, y);
        mc.lineTo(x + w, y + h);
        mc.lineTo(x + w + __reg7, y + h + __reg8);
        mc.lineTo(x + w + __reg7, y + __reg8);
        mc.endFill();
    }
    ;
    __reg0.drawCaption = function (mc, cx, cy)
    {
        var __reg5 = cy;
        var __reg6 = [15001820, 9674864];
        var __reg7 = [100, 100];
        var __reg8 = [0, 255];
        var __reg9 = {a: cx, b: 0, c: 0, d: 0, e: 0 - cy, f: 0, g: int(cx / 2), h: 0, i: 1};
        mc.beginGradientFill("linear", __reg6, __reg7, __reg8, __reg9);
        mc.moveTo(0, 0);
        mc.lineTo(0, __reg5);
        mc.lineTo(cx, __reg5);
        mc.lineTo(cx, 0);
        mc.endFill();
        var __reg10 = 2;
        var __reg11 = [0, 0];
        var __reg12 = [25, 0];
        var __reg13 = [0, 255];
        var __reg14 = {a: 0, b: __reg10, c: 0, d: 0 - __reg10, e: 0, f: 0, g: 0, h: __reg5 + int(__reg10 / 2), i: 1};
        mc.beginGradientFill("linear", __reg11, __reg12, __reg13, __reg14);
        mc.moveTo(0, __reg5);
        mc.lineTo(0, __reg5 + __reg10);
        mc.lineTo(cx, __reg5 + __reg10);
        mc.lineTo(cx, __reg5);
        mc.endFill();
    }
    ;
    ASSetPropFlags(__reg1, null, 1);
}#endinitclip

//子图形 5
//  初始化剪辑
#initclip 0

if (!com.cegg.game.mahjong.LogViewerUtil) 
{
    if (!com) 
    {
        _global.com = new Object();
    }
    if (!com.cegg) 
    {
        _global.com.cegg = new Object();
    }
    if (!com.cegg.game) 
    {
        _global.com.cegg.game = new Object();
    }
    if (!com.cegg.game.mahjong) 
    {
        _global.com.cegg.game.mahjong = new Object();
    }
    var __reg1 = (_global.com.cegg.game.mahjong.LogViewerUtil = function ()
    {
    }
    ).prototype;
    __reg0.rotateXMLNode = function (n, r)
    {
        var __reg4 = ["D", "E", "F", "G"];
        var __reg5 = ["T", "U", "V", "W"];
        __reg4 = __reg4.concat(__reg4.splice(0, (4 - r) % 4));
        __reg5 = __reg5.concat(__reg5.splice(0, (4 - r) % 4));
        com.cegg.game.mahjong.LogViewerUtil.rotateXMLNode_internal(n, r, __reg4, __reg5);
    }
    ;
    __reg0.rotateXMLNode_internal = function (n, r, DEFG, TUVW)
    {
        var __reg6 = n.attributes;
        var __reg7 = n.nodeName.charCodeAt(1);
        if (n.nodeName.length == 1 || (48 <= __reg7 && __reg7 <= 57)) 
        {
            __reg7 = n.nodeName.charCodeAt(0);
            if ((__reg0 = __reg7) === 68) 
            {
                n.nodeName = DEFG[0] + n.nodeName.substr(1);
            }
            else if (__reg0 === 69) 
            {
                n.nodeName = DEFG[1] + n.nodeName.substr(1);
            }
            else if (__reg0 === 70) 
            {
                n.nodeName = DEFG[2] + n.nodeName.substr(1);
            }
            else if (__reg0 === 71) 
            {
                n.nodeName = DEFG[3] + n.nodeName.substr(1);
            }
            else if (__reg0 === 78) 
            {
                __reg6.who = (int(__reg6.who) + 4 - r) % 4;
            }
            else if (__reg0 === 84) 
            {
                n.nodeName = TUVW[0] + n.nodeName.substr(1);
            }
            else if (__reg0 === 85) 
            {
                n.nodeName = TUVW[1] + n.nodeName.substr(1);
            }
            else if (__reg0 === 86) 
            {
                n.nodeName = TUVW[2] + n.nodeName.substr(1);
            }
            else if (__reg0 === 87) 
            {
                n.nodeName = TUVW[3] + n.nodeName.substr(1);
            }
            return;
        }
        if ((__reg0 = n.nodeName) === "UN") 
        {
            var __reg8 = [__reg6.n0, __reg6.n1, __reg6.n2, __reg6.n3];
            __reg6.n0 = __reg8[(r + 0) % 4];
            __reg6.n1 = __reg8[(r + 1) % 4];
            __reg6.n2 = __reg8[(r + 2) % 4];
            __reg6.n3 = __reg8[(r + 3) % 4];
            var __reg9 = __reg6.dan.split(",");
            __reg6.dan = __reg9.concat(__reg9.splice(0, r)).join(",");
            var __reg10 = __reg6.rate.split(",");
            __reg6.rate = __reg10.concat(__reg10.splice(0, r)).join(",");
            var __reg11 = __reg6.rc.split(",");
            __reg6.rc = __reg11.concat(__reg11.splice(0, r)).join(",");
            var __reg12 = __reg6.gold.split(",");
            __reg6.gold = __reg12.concat(__reg12.splice(0, r)).join(",");
            var __reg13 = __reg6.sx.split(",");
            __reg6.sx = __reg13.concat(__reg13.splice(0, r)).join(",");
            return;
        }
        else if (__reg0 === "TAIKYOKU") 
        {
            __reg6.oya = (int(__reg6.oya) + 4 - r) % 4;
            return;
        }
        else if (__reg0 === "KANSEN") 
        {
            __reg6.oya = (int(__reg6.oya) + 4 - r) % 4;
            return;
        }
        else if (__reg0 === "REINIT") 
        {
            var __reg14 = [__reg6.m0, __reg6.m1, __reg6.m2, __reg6.m3];
            __reg6.m0 = __reg14[(r + 0) % 4];
            __reg6.m1 = __reg14[(r + 1) % 4];
            __reg6.m2 = __reg14[(r + 2) % 4];
            __reg6.m3 = __reg14[(r + 3) % 4];
            var __reg15 = [__reg6.kawa0, __reg6.kawa1, __reg6.kawa2, __reg6.kawa3];
            __reg6.kawa0 = __reg15[(r + 0) % 4];
            __reg6.kawa1 = __reg15[(r + 1) % 4];
            __reg6.kawa2 = __reg15[(r + 2) % 4];
            __reg6.kawa3 = __reg15[(r + 3) % 4];
            __reg6.oya = (int(__reg6.oya) + 4 - r) % 4;
            var __reg16 = [__reg6.hai0, __reg6.hai1, __reg6.hai2, __reg6.hai3];
            __reg6.hai0 = __reg16[(r + 0) % 4];
            __reg6.hai1 = __reg16[(r + 1) % 4];
            __reg6.hai2 = __reg16[(r + 2) % 4];
            __reg6.hai3 = __reg16[(r + 3) % 4];
            var __reg17 = __reg6.ten.split(",");
            __reg6.ten = __reg17.concat(__reg17.splice(0, r)).join(",");
            if (__reg6.chip != undefined) 
            {
                var __reg18 = __reg6.chip.split(",");
                __reg6.chip = __reg18.concat(__reg18.splice(0, r)).join(",");
            }
            return;
        }
        else if (__reg0 === "INIT") 
        {
            __reg6.oya = (int(__reg6.oya) + 4 - r) % 4;
            __reg16 = [__reg6.hai0, __reg6.hai1, __reg6.hai2, __reg6.hai3];
            __reg6.hai0 = __reg16[(r + 0) % 4];
            __reg6.hai1 = __reg16[(r + 1) % 4];
            __reg6.hai2 = __reg16[(r + 2) % 4];
            __reg6.hai3 = __reg16[(r + 3) % 4];
            __reg17 = __reg6.ten.split(",");
            __reg6.ten = __reg17.concat(__reg17.splice(0, r)).join(",");
            if (__reg6.chip != undefined) 
            {
                __reg18 = __reg6.chip.split(",");
                __reg6.chip = __reg18.concat(__reg18.splice(0, r)).join(",");
            }
            return;
        }
        else if (__reg0 === "REACH") 
        {
            __reg6.who = (int(__reg6.who) + 4 - r) % 4;
            var __reg19 = __reg6.ten.split(",");
            __reg6.ten = __reg19.concat(__reg19.splice(0, r)).join(",");
            return;
        }
        else if (__reg0 === "RYUUKYOKU") 
        {
            var __reg20 = [__reg6.hai0, __reg6.hai1, __reg6.hai2, __reg6.hai3];
            __reg6.hai0 = __reg20[(r + 0) % 4];
            __reg6.hai1 = __reg20[(r + 1) % 4];
            __reg6.hai2 = __reg20[(r + 2) % 4];
            __reg6.hai3 = __reg20[(r + 3) % 4];
            __reg6.sc = com.cegg.game.mahjong.LogViewerUtil._rot_sc(__reg6.sc, r);
            if (__reg6.owari != undefined) 
            {
                __reg6.owari = com.cegg.game.mahjong.LogViewerUtil._rot_sc(__reg6.owari, r);
            }
            return;
        }
        else if (__reg0 === "AGARI") 
        {
            __reg6.who = (int(__reg6.who) + 4 - r) % 4;
            __reg6.fromWho = (int(__reg6.fromWho) + 4 - r) % 4;
            if (__reg6.paoWho != undefined) 
            {
                __reg6.paoWho = (int(__reg6.paoWho) + 4 - r) % 4;
            }
            __reg6.sc = com.cegg.game.mahjong.LogViewerUtil._rot_sc(__reg6.sc, r);
            if (__reg6.owari != undefined) 
            {
                __reg6.owari = com.cegg.game.mahjong.LogViewerUtil._rot_sc(__reg6.owari, r);
            }
            return;
        }
        else if (__reg0 !== "BYE") 
        {
            return;
        }
        __reg6.who = (int(__reg6.who) + 4 - r) % 4;
        return;
    }
    ;
    __reg0._rot_sc = function (s, r)
    {
        var __reg4 = s.split(",");
        if (__reg4.length == 8) 
        {
            __reg4 = [__reg4[(0 + r) % 4 * 2 + 0], __reg4[(0 + r) % 4 * 2 + 1], __reg4[(1 + r) % 4 * 2 + 0], __reg4[(1 + r) % 4 * 2 + 1], __reg4[(2 + r) % 4 * 2 + 0], __reg4[(2 + r) % 4 * 2 + 1], __reg4[(3 + r) % 4 * 2 + 0], __reg4[(3 + r) % 4 * 2 + 1]];
        }
        else if (__reg4.length == 16) 
        {
            __reg4 = [__reg4[0 + (0 + r) % 4 * 2 + 0], __reg4[0 + (0 + r) % 4 * 2 + 1], __reg4[0 + (1 + r) % 4 * 2 + 0], __reg4[0 + (1 + r) % 4 * 2 + 1], __reg4[0 + (2 + r) % 4 * 2 + 0], __reg4[0 + (2 + r) % 4 * 2 + 1], __reg4[0 + (3 + r) % 4 * 2 + 0], __reg4[0 + (3 + r) % 4 * 2 + 1], __reg4[8 + (0 + r) % 4 * 2 + 0], __reg4[8 + (0 + r) % 4 * 2 + 1], __reg4[8 + (1 + r) % 4 * 2 + 0], __reg4[8 + (1 + r) % 4 * 2 + 1], __reg4[8 + (2 + r) % 4 * 2 + 0], __reg4[8 + (2 + r) % 4 * 2 + 1], __reg4[8 + (3 + r) % 4 * 2 + 0], __reg4[8 + (3 + r) % 4 * 2 + 1]];
        }
        return __reg4.join(",");
    }
    ;
    __reg0.log2reinitXML = function (n, nw, bTehaiOpen)
    {
        var __reg5 = [-1, -1, -1, -1];
        var __reg6 = new Array(136);
        var __reg7 = [[], [], [], []];
        var __reg8 = [[], [], [], []];
        var __reg13 = 0;
        if (n && nw) 
        {
            for (;;) 
            {
                --nw;
                if (!(n && nw)) 
                {
                    break;
                }
                var __reg14 = n.attributes;
                var __reg15 = n.nodeName.charCodeAt(1);
                if (n.nodeName.length > 1 && (48 <= __reg15 && __reg15 <= 57)) 
                {
                    __reg15 = n.nodeName.charCodeAt(0);
                    var __reg16 = int(n.nodeName.substr(1));
                    if ((__reg0 = __reg15) === 68) 
                    {
                        __reg6[__reg16] = 0;
                        if (__reg16 == __reg5[__reg15 - 68]) 
                        {
                            __reg8[__reg15 - 68].push(254);
                        }
                        __reg8[__reg15 - 68].push(__reg16);
                        __reg5[__reg15 - 68] = -1;
                    }
                    else if (__reg0 === 69) 
                    {
                        __reg6[__reg16] = 0;
                        if (__reg16 == __reg5[__reg15 - 68]) 
                        {
                            __reg8[__reg15 - 68].push(254);
                        }
                        __reg8[__reg15 - 68].push(__reg16);
                        __reg5[__reg15 - 68] = -1;
                    }
                    else if (__reg0 === 70) 
                    {
                        __reg6[__reg16] = 0;
                        if (__reg16 == __reg5[__reg15 - 68]) 
                        {
                            __reg8[__reg15 - 68].push(254);
                        }
                        __reg8[__reg15 - 68].push(__reg16);
                        __reg5[__reg15 - 68] = -1;
                    }
                    else if (__reg0 === 71) 
                    {
                        __reg6[__reg16] = 0;
                        if (__reg16 == __reg5[__reg15 - 68]) 
                        {
                            __reg8[__reg15 - 68].push(254);
                        }
                        __reg8[__reg15 - 68].push(__reg16);
                        __reg5[__reg15 - 68] = -1;
                    }
                    else if (__reg0 === 84) 
                    {
                        __reg6[__reg16] = __reg15 - 84 + 1;
                        __reg5[__reg15 - 84] = __reg16;
                    }
                    else if (__reg0 === 85) 
                    {
                        __reg6[__reg16] = __reg15 - 84 + 1;
                        __reg5[__reg15 - 84] = __reg16;
                    }
                    else if (__reg0 === 86) 
                    {
                        __reg6[__reg16] = __reg15 - 84 + 1;
                        __reg5[__reg15 - 84] = __reg16;
                    }
                    else if (__reg0 === 87) 
                    {
                        __reg6[__reg16] = __reg15 - 84 + 1;
                        __reg5[__reg15 - 84] = __reg16;
                    }
                }
                else if ((__reg0 = n.nodeName) === "INIT") 
                {
                    var __reg17 = [__reg14.hai0.split(","), __reg14.hai1.split(","), __reg14.hai2.split(","), __reg14.hai3.split(",")];
                    while (__reg17[0].length) 
                    {
                        __reg6[__reg17[0].pop()] = 1;
                    }
                    while (__reg17[1].length) 
                    {
                        __reg6[__reg17[1].pop()] = 2;
                    }
                    while (__reg17[2].length) 
                    {
                        __reg6[__reg17[2].pop()] = 3;
                    }
                    while (__reg17[3].length) 
                    {
                        __reg6[__reg17[3].pop()] = 4;
                    }
                    var __reg10 = __reg14.ten.split(",");
                    var __reg9 = __reg14.seed.split(",");
                    if (__reg14.chip != undefined) 
                    {
                        var __reg11 = __reg14.chip.split(",");
                    }
                    if (__reg14.shibari != undefined) 
                    {
                        var __reg12 = __reg14.shibari;
                    }
                    __reg13 = int(__reg14.oya);
                }
                else if (__reg0 === "N") 
                {
                    var __reg18 = new com.cegg.game.mahjong.Mentsu136(__reg14.m);
                    __reg6[__reg18.hai0] = __reg6[__reg18.hai1] = __reg6[__reg18.hai2] = 0;
                    if (__reg18.hai3 != undefined) 
                    {
                        __reg6[__reg18.hai3] = 0;
                    }
                    var __reg19 = com.cegg.game.mahjong.Mentsu136.getNakiType(__reg14.m);
                    if (__reg19 != 4 && (__reg19 != 5 && __reg19 != 10)) 
                    {
                        var __reg20 = __reg8[(int(__reg14.who) + int(__reg18.kui)) % 4];
                        __reg20.pop();
                        if (__reg20.length && __reg20[__reg20.length - 1] == 254) 
                        {
                            __reg20.pop();
                        }
                    }
                    __reg5[int(__reg14.who)] = -1;
                    __reg7[int(__reg14.who)].unshift(int(__reg14.m));
                }
                else if (__reg0 === "REACH") 
                {
                    if (__reg14.step == 2) 
                    {
                        __reg10 = __reg14.ten.split(",");
                    }
                    else if (__reg14.step == 1) 
                    {
                        __reg8[__reg14.who].push(255);
                        __reg9[2] = int(__reg9[2]) + 1;
                    }
                    else 
                    {
                        __reg8[__reg14.who].push(255);
                        __reg10[int(__reg14.who)] = int(__reg10[int(__reg14.who)]) - 10;
                        __reg9[2] = int(__reg9[2]) + 1;
                    }
                }
                else if (__reg0 === "DORA") 
                {
                    __reg9.push(__reg14.hai);
                }
                n = n.nextSibling;
            }
        }
        var __reg21 = [[], [], [], []];
        if (__reg5[0] != -1) 
        {
            __reg6[__reg5[0]] = 0;
        }
        if (__reg5[1] != -1) 
        {
            __reg6[__reg5[1]] = 0;
        }
        if (__reg5[2] != -1) 
        {
            __reg6[__reg5[2]] = 0;
        }
        if (__reg5[3] != -1) 
        {
            __reg6[__reg5[3]] = 0;
        }
        var __reg22 = 0;
        __reg22 = 0;
        if (__reg22 < 136) 
        {
            for (;;) 
            {
                ++__reg22;
                if (__reg22 >= 136) 
                {
                    break;
                }
                if ((__reg0 = __reg6[__reg22]) === 1) 
                {
                    __reg21[0].push(__reg22);
                }
                else if (__reg0 === 2) 
                {
                    __reg21[1].push(__reg22);
                }
                else if (__reg0 === 3) 
                {
                    __reg21[2].push(__reg22);
                }
                else if (__reg0 === 4) 
                {
                    __reg21[3].push(__reg22);
                }
            }
        }
        if (__reg5[0] != -1) 
        {
            __reg21[0].push(__reg5[0]);
        }
        if (__reg5[1] != -1) 
        {
            __reg21[1].push(__reg5[1]);
        }
        if (__reg5[2] != -1) 
        {
            __reg21[2].push(__reg5[2]);
        }
        if (__reg5[3] != -1) 
        {
            __reg21[3].push(__reg5[3]);
        }
        var __reg23 = "<REINIT";
        __reg23 = __reg23 + (" seed=\"" + __reg9.join(",") + "\"");
        if (__reg12.length) 
        {
            __reg23 = __reg23 + (" shibari=\"" + __reg12 + "\"");
        }
        __reg23 = __reg23 + (" ten=\"" + __reg10.join(",") + "\"");
        if (__reg11.length) 
        {
            __reg23 = __reg23 + (" chip=\"" + __reg11.join(",") + "\"");
        }
        __reg23 = __reg23 + (" oya=\"" + __reg13 + "\"");
        __reg23 = __reg23 + (" hai0=\"" + __reg21[0].join(",") + "\"");
        if (bTehaiOpen) 
        {
            __reg23 = __reg23 + (" hai1=\"" + __reg21[1].join(",") + "\"");
        }
        if (bTehaiOpen) 
        {
            __reg23 = __reg23 + (" hai2=\"" + __reg21[2].join(",") + "\"");
        }
        if (bTehaiOpen) 
        {
            __reg23 = __reg23 + (" hai3=\"" + __reg21[3].join(",") + "\"");
        }
        if (__reg7[0].length) 
        {
            __reg23 = __reg23 + (" m0=\"" + __reg7[0].join(",") + "\"");
        }
        if (__reg7[1].length) 
        {
            __reg23 = __reg23 + (" m1=\"" + __reg7[1].join(",") + "\"");
        }
        if (__reg7[2].length) 
        {
            __reg23 = __reg23 + (" m2=\"" + __reg7[2].join(",") + "\"");
        }
        if (__reg7[3].length) 
        {
            __reg23 = __reg23 + (" m3=\"" + __reg7[3].join(",") + "\"");
        }
        if (__reg8[0].length) 
        {
            __reg23 = __reg23 + (" kawa0=\"" + __reg8[0].join(",") + "\"");
        }
        if (__reg8[1].length) 
        {
            __reg23 = __reg23 + (" kawa1=\"" + __reg8[1].join(",") + "\"");
        }
        if (__reg8[2].length) 
        {
            __reg23 = __reg23 + (" kawa2=\"" + __reg8[2].join(",") + "\"");
        }
        if (__reg8[3].length) 
        {
            __reg23 = __reg23 + (" kawa3=\"" + __reg8[3].join(",") + "\"");
        }
        __reg23 = __reg23 + "/>";
        return __reg23;
    }
    ;
    ASSetPropFlags(__reg1, null, 1);
}#endinitclip

//子图形 6
//  初始化剪辑
#initclip 0

if (!com.cegg.MCTab) 
{
    if (!com) 
    {
        _global.com = new Object();
    }
    if (!com.cegg) 
    {
        _global.com.cegg = new Object();
    }
    (_global.com.cegg.MCTab = function ()
    {
        super();
        this.tabEnabled = false;
        this.tabChildren = false;
    }
    ).prototype.__proto__ = MovieClip.prototype;
    __reg0.prototype.__constructor__ = MovieClip;
    var __reg1 = __reg0.prototype;
    __reg1.initTab = function (elements)
    {
        this.clearTab();
        var __reg3 = 0;
        if (__reg3 < elements.length) 
        {
            for (;;) 
            {
                ++__reg3;
                if (__reg3 >= elements.length) 
                {
                    break;
                }
                this.createTabElement(elements[__reg3][0], elements[__reg3][1], elements[__reg3][2], __reg3);
            }
        }
        this.createTextField("tfInfo", __reg3, 0, 2, 0, 0);
    }
    ;
    __reg1.clearTab = function ()
    {
        for (var __reg2 in this) 
        {
            this[__reg2].removeMovieClip();
        }
    }
    ;
    __reg1.createTabElement = function (name, disp, info, depth)
    {
        var __reg5 = this.createEmptyMovieClip(name, depth);
        __reg5._focusrect = false;
        __reg5.tabOrder = depth;
        __reg5.tabInfo = info;
        __reg5.onDragOver = __reg5.onRollOver = function ()
        {
            this.tf.textColor = 3381759;
        }
        ;
        __reg5.onDragOut = __reg5.onRollOut = function ()
        {
            this.tf.textColor = 0;
        }
        ;
        __reg5.onRelease = function ()
        {
            this._parent.selectTab(this._name);
        }
        ;
        __reg5.createTextField("tf", 0, 4, 1, 0, 0);
        with (__reg5.tf)
        {
            autoSize = "left";
            text = disp;
            selectable = false;
        }
        var __reg6 = __reg5.tf._x + __reg5.tf._width;
        var __reg7 = __reg5.tf._y + __reg5.tf._height + 1;
        __reg5.clear();
        with (__reg5)
        {
            lineStyle();
            beginFill(16777215, 100);
            moveTo(__reg6 + 10, __reg7);
            lineTo(__reg6, 0);
            lineTo(0, 0);
            lineTo(0, __reg7);
            endFill();
            lineStyle(1, 13421772, 100);
            --__reg7;
            moveTo(__reg6 + 10, __reg7);
            lineTo(__reg6, 0);
            lineTo(0, 0);
            lineTo(0, __reg7);
        }
    }
    ;
    __reg1.selectTab = function (sel)
    {
        var __reg3 = [];
        for (var i in this) 
        {
            if (this[i].tabOrder != undefined) 
            {
                __reg3.push(this[i]);
            }
        }
        __reg3.sort(function (a, b)
        {
            return a.tabOrder - b.tabOrder;
        }
        );
        if (!this[sel]) 
        {
            sel = __reg3[0]._name;
        }
        var __reg4 = 0;
        var __reg5 = 0;
        if (__reg5 < __reg3.length) 
        {
            for (;;) 
            {
                ++__reg5;
                if (__reg5 >= __reg3.length) 
                {
                    break;
                }
                if (__reg5 != __reg3[__reg5].getDepth()) 
                {
                    __reg3[__reg5].swapDepths(__reg5);
                }
                __reg3[__reg5]._y = 0;
                __reg3[__reg5]._x = __reg4;
                __reg4 = __reg4 + (__reg3[__reg5]._width - 10);
            }
        }
        var __reg6 = this[sel];
        __reg6.swapDepths(__reg3.length);
        __reg6._y = 2;
        this.tfInfo.text = __reg6.tabInfo;
        this.tfInfo._x = __reg4;
        this.tfInfo._width = this.cx - __reg4;
        this.tfInfo.autoSize = "center";
        this.onChanged(sel);
    }
    ;
    __reg1.onChanged = function (sel)
    {
    }
    ;
    ASSetPropFlags(__reg1, null, 1);
    __reg0.SymbolName = "__Packages.com.cegg.MCTab";
    __reg0.SymbolOwner = com.cegg.MCTab;
    __reg0.SymbolLinked = Object.registerClass(com.cegg.MCTab.SymbolName, com.cegg.MCTab.SymbolOwner);
}#endinitclip

//子图形 7
//  初始化剪辑
#initclip 0

if (!com.cegg.game.mahjong.Util) 
{
    if (!com) 
    {
        _global.com = new Object();
    }
    if (!com.cegg) 
    {
        _global.com.cegg = new Object();
    }
    if (!com.cegg.game) 
    {
        _global.com.cegg.game = new Object();
    }
    if (!com.cegg.game.mahjong) 
    {
        _global.com.cegg.game.mahjong = new Object();
    }
    var __reg1 = (_global.com.cegg.game.mahjong.Util = function ()
    {
    }
    ).prototype;
    __reg0.createTextFieldTACS = function (mc, name, depth, x, y, w, h, t, autoSize, c, sel)
    {
        mc.createTextField(name, depth, x, y, w, h);
        var __reg13 = mc[name];
        __reg13.autoSize = autoSize;
        __reg13.textColor = c;
        __reg13.text = t;
        __reg13.selectable = sel;
    }
    ;
    __reg0.printDigit = function (mc, name, dx, n)
    {
        var __reg6 = 0;
        var __reg7 = 0;
        if (__reg7 < n.length) 
        {
            if (n.charCodeAt(__reg7) == 20) 
            {
                for (;;) 
                {
                    ++__reg7;
                    if (__reg7 >= n.length) 
                    {
                        return;
                    }
                    if (n.charCodeAt(__reg7) != 20) 
                    {
                        break;
                    }
                    __reg6 = __reg6 + int(dx / 2);
                }
            }
            if (n.charCodeAt(__reg7) == 64) 
            {
                __reg6 = __reg6 - 2;
            }
            mc.attachMovie(name + (n.charCodeAt(__reg7) - 48), String(__reg7), __reg7);
            mc[__reg7]._x = __reg6;
            __reg6 = __reg6 + int(dx);
            if (n.charCodeAt(__reg7) == 64) 
            {
                __reg6 = __reg6 - 1;
            }
        }
    }
    ;
    __reg0.htmlescape = function (s)
    {
        s = s.split("&").join("&amp;");
        s = s.split("<").join("&lt;");
        s = s.split(">").join("&gt;");
        return s;
    }
    ;
    __reg0.csv_intZA = function (s)
    {
        var __reg3 = "ABCDEFGHIJKLMNOPQRSTUVWXYZ" + "abcdefghijklmnopqrstuvwxyz";
        var __reg4 = "";
        var __reg5 = 0;
        var __reg6 = 0;
        var __reg7 = 1;
        var __reg8 = 0;
        if (__reg8 < s.length) 
        {
            for (;;) 
            {
                ++__reg8;
                if (__reg8 >= s.length) 
                {
                    break;
                }
                var __reg9 = s.substr(__reg8, 1);
                if (__reg9 == "-") 
                {
                    __reg7 = -1;
                    continue;
                }
                var __reg10 = __reg3.indexOf(__reg9);
                if (__reg10 < 0) 
                {
                    if (__reg6) 
                    {
                        __reg4 = __reg4 + __reg6 * __reg7;
                    }
                    __reg6 = 0;
                    __reg7 = 1;
                    __reg5 = __reg5 * 10 + (s.charCodeAt(__reg8) - 48);
                }
                else 
                {
                    if (__reg5 > 0) 
                    {
                        for (;;) 
                        {
                            --__reg5;
                            if (__reg5 <= 0) 
                            {
                                break;
                            }
                            __reg4 = __reg4 + ",";
                        }
                    }
                    __reg5 = 0;
                    __reg6 = __reg6 * 52 + __reg10;
                }
            }
        }
        __reg4 = __reg4 + __reg6 * __reg7;
        return __reg4;
    }
    ;
    __reg0.ffmt = function (v, n, n0, plus)
    {
        var __reg6 = String(v).split(".");
        if (n0 && __reg6[0] == "0") 
        {
            __reg6[0] = "";
        }
        if (n0 && __reg6[0] == "-0") 
        {
            __reg6[0] = "-";
        }
        __reg6[1] = __reg6[1].substr(0, n);
        while (__reg6[1].length < n) 
        {
            __reg6[1] = __reg6[1] + "0";
        }
        return (plus != undefined && v > 0 ? plus : "") + __reg6[0] + (n ? "." + __reg6[1] : "");
    }
    ;
    __reg0.ffmt3 = function (v, n)
    {
        var __reg4 = Math.abs(v) < 100 ? (Math.abs(v) < 10 ? 2 : 1) : 0;
        return com.cegg.game.mahjong.Util.ffmt(v, n < __reg4 ? n : __reg4, false, "+");
    }
    ;
    __reg0.ffmt100 = function (v, n)
    {
        return com.cegg.game.mahjong.Util.ffmt(v, n - (v == 1 ? 1 : 0), true, "");
    }
    ;
    __reg0.gold2string = function (g, c)
    {
        var __reg4 = String(g);
        var __reg5 = 3;
        if (__reg5 < __reg4.length) 
        {
            for (;;) 
            {
                __reg5 = __reg5 + 4;
                if (__reg5 >= __reg4.length) 
                {
                    break;
                }
                __reg4 = __reg4.substr(0, __reg4.length - __reg5) + c + __reg4.substr(__reg4.length - __reg5);
            }
        }
        return __reg4;
    }
    ;
    __reg0.logEncode = function (log)
    {
        var __reg3 = log.split("-");
        if (__reg3.length != 4) 
        {
            return log;
        }
        if (__reg3[3].length != 8) 
        {
            return log;
        }
        var __reg4 = random(65536);
        var __reg5 = com.cegg.game.mahjong.UtilBase.unhex4(__reg3[3].substr(0, 4));
        var __reg6 = com.cegg.game.mahjong.UtilBase.unhex4(__reg3[3].substr(4, 4));
        __reg3.pop();
        var __reg7 = 0;
        if (__reg3[0] >= "2010041111gm") 
        {
            __reg7 = int("3" + __reg3[0].substr(4, 6)) % (17 * 2 - int(__reg3[0].substr(9, 1)) - 1);
        }
        return __reg3.join("-") + "-x" + com.cegg.game.mahjong.UtilBase.hexToString4(__reg4) + com.cegg.game.mahjong.UtilBase.hexToString4(__reg4 ^ __reg5 ^ com.cegg.game.mahjong.Util.t[__reg7 + 0]) + com.cegg.game.mahjong.UtilBase.hexToString4(__reg4 ^ __reg5 ^ __reg6 ^ com.cegg.game.mahjong.Util.t[__reg7 + 1]);
    }
    ;
    __reg0.logDecode = function (log)
    {
        var __reg3 = log.split("-");
        if (__reg3.length != 4) 
        {
            return log;
        }
        if (__reg3[3].charCodeAt(0) == 120) 
        {
            var __reg4 = com.cegg.game.mahjong.UtilBase.unhex4(__reg3[3].substr(1, 4));
            var __reg5 = com.cegg.game.mahjong.UtilBase.unhex4(__reg3[3].substr(5, 4));
            var __reg6 = com.cegg.game.mahjong.UtilBase.unhex4(__reg3[3].substr(9, 4));
            var __reg7 = 0;
            if (__reg3[0] >= "2010041111gm") 
            {
                __reg7 = int("3" + __reg3[0].substr(4, 6)) % (17 * 2 - int(__reg3[0].substr(9, 1)) - 1);
            }
            __reg3[3] = com.cegg.game.mahjong.UtilBase.hexToString4(__reg4 ^ __reg5 ^ com.cegg.game.mahjong.Util.t[__reg7 + 0]) + com.cegg.game.mahjong.UtilBase.hexToString4(__reg5 ^ com.cegg.game.mahjong.Util.t[__reg7 + 0] ^ __reg6 ^ com.cegg.game.mahjong.Util.t[__reg7 + 1]);
        }
        return __reg3.join("-");
    }
    ;
    __reg0.lineVG = function (mc, x, y, h, c0, c1)
    {
        var __reg8 = 1;
        var __reg9 = [c0, c1, c0];
        var __reg10 = [100, 100, 100];
        var __reg11 = [0, 136, 255];
        var __reg12 = {a: 0, b: h, c: 0, d: 0 - y, e: 0, f: 0, g: 0, h: y + int(h / 2), i: 1};
        mc.lineStyle();
        mc.beginGradientFill("linear", __reg9, __reg10, __reg11, __reg12);
        mc.moveTo(x, y);
        mc.lineTo(x, y + h);
        mc.lineTo(x + __reg8, y + h);
        mc.lineTo(x + __reg8, y);
        mc.endFill();
    }
    ;
    __reg0.playVoice = function (type, who, sx)
    {
        if (com.cegg.game.mahjong.UtilBase.bPremiumVersion && sx == "M") 
        {
            if ((__reg0 = type) === 1) 
            {
                _root.SE.play("SE_PON_M", true, who);
                _root.SE.play("SE_SHA", true, who);
            }
            else if (__reg0 === 2) 
            {
                _root.SE.play("SE_KAN_M", true, who);
                _root.SE.play("SE_SHA", true, who);
            }
            else if (__reg0 === 3) 
            {
                _root.SE.play("SE_CHII_M", true, who);
                _root.SE.play("SE_SHA", true, who);
            }
            else if (__reg0 === 6) 
            {
                _root.SE.play("SE_RON_M", true, who);
                _root.SE.play("SE_KIRA", true, who);
            }
            else if (__reg0 === 7) 
            {
                _root.SE.play("SE_TSUMO_M", true, who);
                _root.SE.play("SE_KIRA", true, who);
            }
            else if (__reg0 === 8) 
            {
                _root.SE.play("SE_REACH_M", true, who);
                _root.SE.play("SE_REACH", true, who);
            }
            else if (__reg0 !== 9) 
            {
                if (__reg0 === 10) 
                {
                    _root.SE.play("SE_NUKI", true, who);
                }
            }
            return;
        }
        if (com.cegg.game.mahjong.UtilBase.bPremiumVersion && sx == "F") 
        {
            if ((__reg0 = type) === 1) 
            {
                _root.SE.play("SE_PON_F", true, who);
                _root.SE.play("SE_SHA", true, who);
            }
            else if (__reg0 === 2) 
            {
                _root.SE.play("SE_KAN_F", true, who);
                _root.SE.play("SE_SHA", true, who);
            }
            else if (__reg0 === 3) 
            {
                _root.SE.play("SE_CHII_F", true, who);
                _root.SE.play("SE_SHA", true, who);
            }
            else if (__reg0 === 6) 
            {
                _root.SE.play("SE_RON_F", true, who);
                _root.SE.play("SE_KIRA", true, who);
            }
            else if (__reg0 === 7) 
            {
                _root.SE.play("SE_TSUMO_F", true, who);
                _root.SE.play("SE_KIRA", true, who);
            }
            else if (__reg0 === 8) 
            {
                _root.SE.play("SE_REACH_F", true, who);
                _root.SE.play("SE_REACH", true, who);
            }
            else if (__reg0 !== 9) 
            {
                if (__reg0 === 10) 
                {
                    _root.SE.play("SE_NUKI", true, who);
                }
            }
            return;
        }
        if ((__reg0 = type) === 1) 
        {
            _root.SE.play("SE_PON", true, who);
            return;
        }
        else if (__reg0 === 2) 
        {
            _root.SE.play("SE_PON", true, who);
            return;
        }
        else if (__reg0 === 3) 
        {
            _root.SE.play("SE_CHII", true, who);
            return;
        }
        else if (__reg0 === 6) 
        {
            _root.SE.play("SE_RON", true, who);
            return;
        }
        else if (__reg0 === 7) 
        {
            _root.SE.play("SE_TSUMO", true, who);
            return;
        }
        else if (__reg0 === 8) 
        {
            _root.SE.play("SE_REACH", true, who);
            return;
        }
        else if (__reg0 === 9) 
        {
            return;
        }
        else if (__reg0 !== 10) 
        {
            return;
        }
        _root.SE.play("SE_NUKI", true, who);
        return;
    }
    ;
    __reg0.RatingClassDisp = function (c_rate, sDefault)
    {
        if (!c_rate) 
        {
            return sDefault;
        }
        var __reg4 = c_rate >= 80 ? 79 : c_rate;
        var __reg5 = "";
        __reg5 = __reg5 + "SABCDEFG".substr(int(__reg4 / 10), 1);
        __reg5 = __reg5 + "1122334455".substr(__reg4 % 10, 1);
        return __reg5;
    }
    ;
    __reg0.GoldToClass = function (gold)
    {
        if (gold <= 0) 
        {
            return "";
        }
        var __reg3 = "9876543210";
        if (gold < 1000 * 10) 
        {
            return "F" + __reg3.substr(gold / 1000, 1);
        }
        else 
        {
            gold = gold - 1000 * 10;
        }
        if (gold < 2000 * 10) 
        {
            return "E" + __reg3.substr(gold / 2000, 1);
        }
        else 
        {
            gold = gold - 2000 * 10;
        }
        if (gold < 3000 * 10) 
        {
            return "D" + __reg3.substr(gold / 3000, 1);
        }
        else 
        {
            gold = gold - 3000 * 10;
        }
        if (gold < 4000 * 10) 
        {
            return "C" + __reg3.substr(gold / 4000, 1);
        }
        else 
        {
            gold = gold - 4000 * 10;
        }
        if (gold < 5000 * 10) 
        {
            return "B" + __reg3.substr(gold / 5000, 1);
        }
        else 
        {
            gold = gold - 5000 * 10;
        }
        if (gold < 6000 * 10) 
        {
            return "A" + __reg3.substr(gold / 6000, 1);
        }
        else 
        {
            gold = gold - 6000 * 10;
        }
        return "S9";
    }
    ;
    ASSetPropFlags(__reg1, null, 1);
    __reg0.t = [22136, 52719, 55146, 42104, 59591, 46934, 9248, 28891, 49597, 52974, 62844, 4015, 18311, 50730, 43056, 17939, 64838, 38145, 27008, 39128, 35652, 63407, 65535, 23473, 35164, 55230, 27536, 4386, 64920, 29075, 42617, 17294, 18868, 2081];
}#endinitclip

//子图形 8
//  初始化剪辑
#initclip 0

if (!com.cegg.LColor) 
{
    if (!com) 
    {
        _global.com = new Object();
    }
    if (!com.cegg) 
    {
        _global.com.cegg = new Object();
    }
    var __reg1 = (_global.com.cegg.LColor = function ()
    {
    }
    ).prototype;
    __reg0.unhex = function (c)
    {
        if (48 <= c && c <= 57) 
        {
            return c - 48;
        }
        if (65 <= c && c <= 90) 
        {
            return c - 55;
        }
        if (97 <= c && c <= 122) 
        {
            return c - 87;
        }
        return 0;
    }
    ;
    __reg0.fromString = function (s)
    {
        var __reg3 = s.charCodeAt(0) == 35 ? 1 : 0;
        if (s.length - __reg3 == 3) 
        {
            return com.cegg.LColor.unhex(s.charCodeAt(__reg3 + 0)) * 1114112 | com.cegg.LColor.unhex(s.charCodeAt(__reg3 + 1)) * 4352 | com.cegg.LColor.unhex(s.charCodeAt(__reg3 + 2)) * 17;
        }
        return com.cegg.LColor.unhex(s.charCodeAt(__reg3 + 0)) * 1048576 | com.cegg.LColor.unhex(s.charCodeAt(__reg3 + 1)) * 65536 | com.cegg.LColor.unhex(s.charCodeAt(__reg3 + 2)) * 4096 | com.cegg.LColor.unhex(s.charCodeAt(__reg3 + 3)) * 256 | com.cegg.LColor.unhex(s.charCodeAt(__reg3 + 4)) * 16 | com.cegg.LColor.unhex(s.charCodeAt(__reg3 + 5)) * 1;
    }
    ;
    __reg0.toString = function (c)
    {
        c = int(c);
        if ((c >> 20 & 15) == (c >> 16 & 15) && ((c >> 12 & 15) == (c >> 8 & 15) && (c >> 4 & 15) == (c >> 0 & 15))) 
        {
            return com.cegg.LColor.tohex_table.charAt(c >> 16 & 15) + com.cegg.LColor.tohex_table.charAt(c >> 8 & 15) + com.cegg.LColor.tohex_table.charAt(c >> 0 & 15);
        }
        return com.cegg.LColor.toString6(c);
    }
    ;
    __reg0.toString6 = function (c)
    {
        c = int(c);
        return com.cegg.LColor.tohex_table.charAt(c >> 20 & 15) + com.cegg.LColor.tohex_table.charAt(c >> 16 & 15) + com.cegg.LColor.tohex_table.charAt(c >> 12 & 15) + com.cegg.LColor.tohex_table.charAt(c >> 8 & 15) + com.cegg.LColor.tohex_table.charAt(c >> 4 & 15) + com.cegg.LColor.tohex_table.charAt(c >> 0 & 15);
    }
    ;
    ASSetPropFlags(__reg1, null, 1);
    __reg0.tohex_table = "0123456789ABCDEF";
}#endinitclip

//子图形 9
//  初始化剪辑
#initclip 0

if (!com.cegg.game.mahjong.MahjongMain) 
{
    if (!com) 
    {
        _global.com = new Object();
    }
    if (!com.cegg) 
    {
        _global.com.cegg = new Object();
    }
    if (!com.cegg.game) 
    {
        _global.com.cegg.game = new Object();
    }
    if (!com.cegg.game.mahjong) 
    {
        _global.com.cegg.game.mahjong = new Object();
    }
    (_global.com.cegg.game.mahjong.MahjongMain = function ()
    {
        super();
        _root.Main.setMenuBottom(true);
        com.cegg.game.mahjong.Tehai.sock = _root;
        this.uname = ["", "", "", ""];
        this.dan = [0, 0, 0, 0];
        this.rate = [1500, 1500, 1500, 1500];
        this.gold = [0, 0, 0, 0];
        this.connected = [true, true, true, true];
        this.AgariBoxQ = [];
        this.xmlQ = [];
        this.xmlQSleep = 0;
        this.onEnterFrame = this.onEnterFrame_Main;
        this.bTsumogiriAsGray = false;
        if (com.cegg.game.mahjong.UtilBase.bPremiumVersion && _root.Main.View.LogViewer) 
        {
            this.bTsumogiriAsGray = com.cegg.game.mahjong.SaveData.f0_logvw_tsumogiriasgray;
        }
        com.cegg.game.mahjong.Hai.aka = this.type & com.cegg.game.mahjong.Res.GT_NOAKA ? false : true;
        if (com.cegg.game.mahjong.Res.GT_ISSAKU(this.type)) 
        {
            com.cegg.game.mahjong.CountDown.excountinit = 1000 * 5;
            com.cegg.game.mahjong.CountDown.exinit = 1000 * 3;
        }
        else 
        {
            com.cegg.game.mahjong.CountDown.excountinit = 1000 * 10;
            com.cegg.game.mahjong.CountDown.exinit = 1000 * 5;
        }
        this.logplay = _root.Main.View.LogViewer != undefined || this.kansen.length > 0;
        var __reg3 = 0;
        this.attachMovie(com.cegg.game.mahjong.CenterPanel.SymbolName, "bgc", __reg3++, {_x: 276, _y: 229});
        this.createEmptyMovieClip("ruledisp", __reg3++);
        this.ruledisp._x = 470;
        this.ruledisp._y = 115;
        this.ruledisp._alpha = 50;
        var __reg4 = [];
        if (this.type & com.cegg.game.mahjong.Res.GT_SANMA) 
        {
            __reg4.push("08");
        }
        if (!com.cegg.game.mahjong.Res.GT_ISTECH(this.type)) 
        {
            __reg4.push("0" + com.cegg.game.mahjong.Res.GT_GETTAKU2(this.type));
        }
        if (!com.cegg.game.mahjong.Res.GT_ISTECH(this.type)) 
        {
            __reg4.push(this.type & com.cegg.game.mahjong.Res.GT_NAN ? "10" : "09");
        }
        if (com.cegg.game.mahjong.Res.GT_ISJANS(this.type)) 
        {
            __reg4.push("11");
            __reg4.push("12");
            if (this.type ^ -1 & com.cegg.game.mahjong.Res.GT_NAN) 
            {
                __reg4.push("13");
            }
            __reg4.push("15");
            __reg4.push(this.type ^ -1 & com.cegg.game.mahjong.Res.GT_CHIP ? "16" : (this.type & com.cegg.game.mahjong.Res.GT_JANS ? "18" : "17"));
        }
        else 
        {
            if (this.type ^ -1 & com.cegg.game.mahjong.Res.GT_NOKUI) 
            {
                __reg4.push("11");
            }
            if (this.type ^ -1 & com.cegg.game.mahjong.Res.GT_NOAKA) 
            {
                __reg4.push("12");
            }
            if (this.type & com.cegg.game.mahjong.Res.GT_SAKU) 
            {
                __reg4.push("13");
            }
            if (this.type & com.cegg.game.mahjong.Res.GT_GRAY) 
            {
                __reg4.push("14");
            }
        }
        var __reg5 = 0;
        while (__reg4.length) 
        {
            this.ruledisp.attachMovie("ruledisp3" + __reg4.shift(), String(__reg3), __reg3, {_x: __reg5});
            ++__reg3;
            __reg5 = __reg5 + 12;
        }
        this.createEmptyMovieClip("ruledispO", __reg3++);
        this.createEmptyMovieClip("ruledisp2", __reg3++);
        this.ruledispO.attachMovie("ruledisp_O", "img", 0);
        this.ruledisp2.attachMovie("ruledisp_2", "img", 0);
        this.ruledisp2._x = this.ruledisp._x + this.ruledisp._width - int(this.ruledisp2.img._width / 2);
        this.ruledispO._x = this.ruledisp._x + int(this.ruledisp2.img._width / 2);
        this.ruledispO._y = this.ruledisp2._y = 129;
        this.ruledisp2.img._x = 0 - int(this.ruledisp2.img._width / 2);
        this.ruledispO.img._x = 0 - int(this.ruledispO.img._width / 2);
        this.ruledispO._visible = this.ruledisp2._visible = false;
        this.ruledispO._alpha = this.ruledisp2._alpha = 50;
        if (!this.logplay) 
        {
            this.attachMovie(com.cegg.MCImageCheck.SymbolName, "menu_nonaki", __reg3++, {_x: Stage.width - 125, _y: Stage.height - 20, bn: "menu_nonaki_n", bf: "menu_nonaki_f"});
            this.attachMovie(com.cegg.MCImageCheck.SymbolName, "menu_tsumogiri", __reg3++, {_x: Stage.width - 200, _y: Stage.height - 20, bn: "menu_tsumogiri_n", bf: "menu_tsumogiri_f"});
            this.attachMovie(com.cegg.MCImageCheck.SymbolName, "menu_autoron", __reg3++, {_x: Stage.width - 270, _y: Stage.height - 20, bn: "menu_autoron_n", bf: "menu_autoron_f"});
        }
        this.attachMovie("furiten", "furiten", __reg3++);
        this.furiten._x = int((Stage.width - this.furiten._width) / 2);
        this.furiten._y = Stage.height - 20;
        this.furiten._visible = false;
        var __reg6 = int(Stage.width / 2);
        var __reg7 = int((Stage.height - 20) / 2) - 17;
        if ((this.kansen.length > 0 && !_root.wg.length) || this.type ^ -1 & com.cegg.game.mahjong.Res.GT_MULTI) 
        {
            com.cegg.GButton.createTextButton("EXIT", "Exit", __reg3++, this);
            this.EXIT._y = Stage.height - 20;
        }
        if (this.kansen.length > 0) 
        {
            this.attachMovie(com.cegg.game.mahjong.KansenManager.SymbolName, "km", __reg3++);
            this.km._y = Stage.height - 20;
            if (this.EXIT) 
            {
                this.km._x = this.EXIT._x + this.EXIT._width;
            }
        }
    }
    ).prototype.__proto__ = MovieClip.prototype;
    __reg0.prototype.__constructor__ = MovieClip;
    var __reg1 = __reg0.prototype;
    __reg1.gameCommand_Init = function (kyoku, honba, dice0, dice1, shibari)
    {
        this.lastDahai = undefined;
        this.lastTsumo136 = 255;
        this.furiten._visible = false;
        if (this.nonresponse < 60 * 1000) 
        {
            this.menu_tsumogiri.setCheck(false);
            this.menu_nonaki.setCheck(false);
        }
        this.menu_autoron.setCheck(false);
        this.kan = 0;
        this.nuki = 0;
        this.rinsyan = false;
        this.yamaNext = 0;
        this.kawaCount = [0, 0, 0, 0];
        this.kawaReachPos = [-1, -1, -1, -1];
        this.yamaOffset = ((4 * 5 - 1 - (dice0 + dice1) - this.oya) * 34 + (dice0 + dice1) * 2 + 4) % 136;
        this.AgariBoxQ = [];
        this.bgc.printKyokuBaNagare(kyoku, honba, this.nagare);
        var __reg7 = int(Stage.width / 2);
        var __reg8 = int((Stage.height - 20) / 2) - 17;
        var __reg9 = 20;
        this.initKazeArray();
        this.bgc.showKazeActivate(this.kaze[this.oya], undefined);
        this.bgc.setPlayerNameColor(0, this.connected[0]);
        this.bgc.setPlayerNameColor(1, this.connected[1]);
        this.bgc.setPlayerNameColor(2, this.connected[2]);
        this.bgc.setPlayerNameColor(3, this.connected[3]);
        if (com.cegg.game.mahjong.Res.GT_ISTECH(this.type)) 
        {
            this.bgc.showGoldClass(this.gold);
        }
        else 
        {
            this.bgc.showDan(this.dan, this.rc);
        }
        this.bgc.updateTenDigits();
        this.createEmptyMovieClip("reach0", __reg9++);
        this.createEmptyMovieClip("reach1", __reg9++);
        this.createEmptyMovieClip("reach2", __reg9++);
        this.createEmptyMovieClip("reach3", __reg9++);
        this.reach0.attachMovie("reach0", "img", 0);
        this.reach1.attachMovie("reach1", "img", 0);
        this.reach2.attachMovie("reach0", "img", 0);
        this.reach3.attachMovie("reach1", "img", 0);
        this.reach0._x = __reg7 - 38;
        this.reach0._y = __reg8 + 70;
        this.reach0._visible = false;
        this.reach1._x = __reg7 + 80;
        this.reach1._y = __reg8 - 28;
        this.reach1._visible = false;
        this.reach2._x = __reg7 - 38;
        this.reach2._y = __reg8 - 58;
        this.reach2._visible = false;
        this.reach3._x = __reg7 - 90;
        this.reach3._y = __reg8 - 28;
        this.reach3._visible = false;
        this.createEmptyMovieClip("sai", __reg9 + 2);
        var __reg10 = this.sai.attachMovie(com.cegg.game.mahjong.Dice.SymbolName, "A", 0, {me: dice0});
        var __reg11 = this.sai.attachMovie(com.cegg.game.mahjong.Dice.SymbolName, "B", 1, {me: dice1});
        if ((__reg0 = this.oya) === 0) 
        {
            __reg10._x = __reg7 - 32;
            __reg10._y = __reg8 + 120;
            __reg11._x = __reg7 + 0;
            __reg11._y = __reg8 + 120;
        }
        else if (__reg0 === 1) 
        {
            __reg10._x = __reg7 + 130;
            __reg10._y = __reg8 - 16;
            __reg11._x = __reg7 + 130;
            __reg11._y = __reg8 + 16;
        }
        else if (__reg0 === 2) 
        {
            __reg10._x = __reg7 - 32;
            __reg10._y = __reg8 - 120;
            __reg11._x = __reg7 + 0;
            __reg11._y = __reg8 - 120;
        }
        else if (__reg0 === 3) 
        {
            __reg10._x = __reg7 - 160;
            __reg10._y = __reg8 - 16;
            __reg11._x = __reg7 - 160;
            __reg11._y = __reg8 + 16;
        }
        this.createEmptyMovieClip("yama0", __reg9 + 11);
        this.createEmptyMovieClip("yama1", __reg9 + 6);
        this.createEmptyMovieClip("yama2", __reg9 + 1);
        this.createEmptyMovieClip("yama3", __reg9 + 7);
        this.createEmptyMovieClip("kawa0", __reg9 + 10);
        this.createEmptyMovieClip("kawa1", __reg9 + 8);
        this.createEmptyMovieClip("kawa2", __reg9 + 5);
        this.createEmptyMovieClip("kawa3", __reg9 + 9);
        this.attachMovie(com.cegg.game.mahjong.Tehai.SymbolName, "tehai0", __reg9 + 12, {who: 0, silent: this.logplay});
        this.attachMovie(com.cegg.game.mahjong.Tehai.SymbolName, "tehai1", __reg9 + 3, {who: 1});
        this.attachMovie(com.cegg.game.mahjong.Tehai.SymbolName, "tehai2", __reg9 + 0, {who: 2});
        this.attachMovie(com.cegg.game.mahjong.Tehai.SymbolName, "tehai3", __reg9 + 4, {who: 3});
        __reg9 = __reg9 + 13;
        this.tehai0._y = int(Stage.height - 20 - com.cegg.game.mahjong.Hai.YT);
        this.tehai1._x = int(Stage.width - 22 - 18);
        this.kawa0._x = int(__reg7 - 31 * 6 / 2);
        this.kawa0._y = int(__reg8 + 25 * 6 / 2 + 10);
        this.kawa1._x = int(__reg7 + 31 * 6 / 2);
        this.kawa1._y = int(__reg8 + 25 * 6 / 2 + 10);
        this.kawa2._x = int(__reg7 + 31 * 6 / 2);
        this.kawa2._y = int(__reg8 - 25 * 6 / 2 + 10);
        this.kawa3._x = int(__reg7 - 31 * 6 / 2);
        this.kawa3._y = int(__reg8 - 25 * 6 / 2 + 10);
        this.yama0._x = int(__reg7 + 31 * 17 / 2) + 23;
        this.yama0._y = int(__reg8 + 24 * 6 / 2 + 35 * 3 + 30) + 0 - 11;
        this.yama1._x = int(__reg7 - 32 * 6 / 2 - 40 * 3 - 7) - 23;
        this.yama1._y = int(__reg8 + 25 * 17 / 2 - 9) + 40 - 11;
        this.yama2._x = int(__reg7 - 31 * 17 / 2 + 2) - 23;
        this.yama2._y = int(__reg8 - 24 * 6 / 2 - 35 * 3 - 27) + 40 - 11;
        this.yama3._x = int(__reg7 + 32 * 6 / 2 + 40 * 3 + 7) + 23;
        this.yama3._y = int(__reg8 - 25 * 17 / 2 - 8) + 0 - 11;
        this.ruledispO._visible = kyoku >= (this.type & com.cegg.game.mahjong.Res.GT_NAN ? 7 : 3) - (this.type & com.cegg.game.mahjong.Res.GT_SANMA ? 1 : 0);
        this.ruledisp2._visible = shibari == 2;
        if (this.type & com.cegg.game.mahjong.Res.GT_SANMA) 
        {
            this.bgc.setVisibleSanma(this.uname[0].length > 0, this.uname[1].length > 0, this.uname[2].length > 0, this.uname[3].length > 0);
        }
    }
    ;
    __reg0.animRuleDisp = function (mc)
    {
        if (mc._visible) 
        {
            mc._alpha = 0;
            mc.onEnterFrame = function ()
            {
                if (this._alpha < 100) 
                {
                    this._alpha = this._alpha + 8;
                    this._xscale = this._yscale = 100 + (100 - this._alpha) * 4;
                    return;
                }
                this._alpha = 100;
                this._xscale = this._yscale = 100;
                this.onEnterFrame = this.onEnterFrame2;
            }
            ;
            mc.onEnterFrame2 = function ()
            {
                if (this._alpha > 50) 
                {
                    --this._alpha;
                    return;
                }
                this._alpha = 50;
                delete this.onEnterFrame;
            }
            ;
        }
    }
    ;
    __reg1.onEnterFrame_InitYama = function ()
    {
        _root.SE.play("SE_KACHI", false);
        this.onEnterFrame_Yama();
        this.onEnterFrame_Yama();
        if (this.anim >= 34) 
        {
            this.onEnterFrame = this.onEnterFrame_InitWanpai;
        }
    }
    ;
    __reg1.onEnterFrame_InitWanpai = function ()
    {
        this.onEnterFrame_Wanpai();
        this.anim = 0;
        this.onEnterFrame = this.onEnterFrame_Haipai;
        if (this.type & com.cegg.game.mahjong.Res.GT_SANMA) 
        {
            var __reg2 = function ()
            {
                if (this.c > 0) 
                {
                    --this.c;
                    return;
                }
                if (this._alpha > 0) 
                {
                    this._alpha = this._alpha - 10;
                    return;
                }
                delete this.onEnterFrame;
                this.removeMovieClip();
            }
            ;
            for (;;) 
            {
                if (this.yamaNext >= 28) 
                {
                    return;
                }
                var __reg3 = this.yamaPop(false);
                __reg3.c = this.yamaNext;
                __reg3.onEnterFrame = __reg2;
            }
        }
    }
    ;
    __reg1.onEnterFrame_Yama = function ()
    {
        var __reg2 = 34 - 1 - this.anim;
        this.yama0.attachMovie(com.cegg.game.mahjong.Hai.SymbolName, String(__reg2), (__reg2 & 1 ? 17 : 34) - int(__reg2 / 2), {_x: (0 - com.cegg.game.mahjong.Hai.X0) * ((__reg2 >> 1) + 1), _y: (com.cegg.game.mahjong.Hai.Y0T + 3) * (__reg2 & 1)});
        this.yama0[__reg2].setImage(undefined, 0);
        if (__reg2 ^ -1 & 1) 
        {
            this.yama0[__reg2].attachMovie("kawa_sdw0h", "0", 0);
        }
        this.yama1.attachMovie(com.cegg.game.mahjong.Hai.SymbolName, String(__reg2), 34 - __reg2, {_x: 0 - com.cegg.game.mahjong.Hai.X1, _y: (0 - com.cegg.game.mahjong.Hai.Y1) * ((__reg2 >> 1) + 1) + (__reg2 & 1) * (com.cegg.game.mahjong.Hai.Y1T + 2)});
        this.yama1[__reg2].setImage(undefined, 1);
        if (__reg2 ^ -1 & 1) 
        {
            this.yama1[__reg2][0].removeMovieClip();
        }
        this.yama2.attachMovie(com.cegg.game.mahjong.Hai.SymbolName, String(__reg2), __reg2 ^ 1, {_x: com.cegg.game.mahjong.Hai.X0 * (__reg2 >> 1), _y: (com.cegg.game.mahjong.Hai.Y0T + 3) * (__reg2 & 1) - 12 - 44});
        this.yama2[__reg2].setImage(undefined, 2);
        if (__reg2 ^ -1 & 1) 
        {
            this.yama2[__reg2][0].removeMovieClip();
        }
        this.yama3.attachMovie(com.cegg.game.mahjong.Hai.SymbolName, String(__reg2), __reg2 ^ 1, {_x: 0, _y: com.cegg.game.mahjong.Hai.Y1 * (__reg2 >> 1) + (__reg2 & 1) * (com.cegg.game.mahjong.Hai.Y1T + 2)});
        this.yama3[__reg2].setImage(undefined, 3);
        if (__reg2 ^ -1 & 1) 
        {
            this.yama3[__reg2][0].removeMovieClip();
        }
        ++this.anim;
    }
    ;
    __reg1.onEnterFrame_Wanpai = function ()
    {
        var __reg2 = 0;
        if (__reg2 < 14) 
        {
            for (;;) 
            {
                ++__reg2;
                if (__reg2 >= 14) 
                {
                    break;
                }
                var __reg3 = (this.yamaOffset + 136 - 1 - __reg2) % 136;
                var __reg4 = int(__reg3 / 34);
                var __reg5 = 0;
                var __reg6 = 0;
                if ((__reg0 = __reg4) === 0) 
                {
                    __reg5 = __reg5 - 3;
                }
                else if (__reg0 === 1) 
                {
                    __reg6 = __reg6 - 4;
                }
                else if (__reg0 === 2) 
                {
                    __reg5 = __reg5 + 3;
                }
                else if (__reg0 === 3) 
                {
                    __reg6 = __reg6 + 4;
                }
                this["yama" + __reg4][__reg3 % 34]._x = this["yama" + __reg4][__reg3 % 34]._x + __reg5;
                this["yama" + __reg4][__reg3 % 34]._y = this["yama" + __reg4][__reg3 % 34]._y + __reg6;
            }
        }
        for (;;) 
        {
            if (!this.init_dora.length) 
            {
                return;
            }
            this.gameCommand_Dora(int(this.init_dora.shift()));
        }
    }
    ;
    __reg1.onEnterFrame_Haipai = function ()
    {
        var __reg2 = 4;
        if (!(this.anim % __reg2)) 
        {
            var __reg3 = int(this.anim / __reg2 / 4);
            var __reg4 = (this.oya + int(this.anim / __reg2)) % 4;
            if (this.kaze[this.oya][__reg4] >= 4) 
            {
                this.anim = this.anim + (__reg2 - 1);
            }
            else 
            {
                var __reg5 = __reg3 * 4;
                if (__reg5 < (__reg3 + 1) * 4) 
                {
                    for (;;) 
                    {
                        ++__reg5;
                        if (__reg5 >= (__reg3 + 1) * 4) 
                        {
                            break;
                        }
                        if (__reg5 >= 13) 
                        {
                            break;
                        }
                        this.gameCommand_Tsumo(__reg4, this.haipai[__reg4].length ? int(this.haipai[__reg4].shift()) : undefined, false, 0);
                    }
                }
            }
        }
        if (this.anim++ >= 16 * __reg2 + 4) 
        {
            _root.SE.play("SE_KACHI", false, 0);
            _root.SE.play("SE_KACHI", false, 0);
            _root.SE.play("SE_KACHI", false, 0);
            this.tehai0.initsort();
            this.tehai1.initsort();
            this.tehai2.initsort();
            this.tehai3.initsort();
            this.anim = 0;
            this.onEnterFrame = this.onEnterFrame_Main;
            if (_root.Main.View.LogViewer) 
            {
                _root.Main.View.LogViewer.tick();
            }
        }
    }
    ;
    __reg1.onEnterFrame_AsyncTick = function ()
    {
        if (_root.Main.View.LogViewer) 
        {
            _root.Main.View.LogViewer.tick();
        }
        this.onEnterFrame = this.onEnterFrame_Main;
    }
    ;
    __reg1.onMouseMove = function ()
    {
        this.nonresponse = 0;
    }
    ;
    __reg1.onMouseDown = function ()
    {
        this.nonresponse = 0;
    }
    ;
    __reg1.onMouseUp = function ()
    {
        this.nonresponse = 0;
    }
    ;
    __reg1.onEnterFrame_Main = function ()
    {
        if (this.xmlQSleep > 0) 
        {
            --this.xmlQSleep;
        }
        else if (this.xmlQ.length) 
        {
            this.onXMLNode_Exe(this.xmlQ.shift());
        }
        if (Key.isDown(Key.ESCAPE)) 
        {
            this.nonresponse = 0;
        }
        if (this.reach0._visible) 
        {
            return undefined;
        }
        if (this.popup) 
        {
            return undefined;
        }
        if (this.menu_tsumogiri.checked && this.menu_nonaki.checked) 
        {
            return undefined;
        }
        this.nonresponse = this.nonresponse + 50;
        if (this.nonresponse > 60 * 1000) 
        {
            this.menu_tsumogiri.setCheck(true);
            this.menu_nonaki.setCheck(true);
        }
    }
    ;
    __reg1.gameCommand_Dora = function (hai136)
    {
        var __reg3 = (this.yamaOffset + 136 - 1 - (this.type & com.cegg.game.mahjong.Res.GT_SANMA ? 9 : 5)) % 136;
        if (1) 
        {
            var __reg4 = int(__reg3 / 34);
            var __reg5 = this["yama" + __reg4][__reg3 % 34];
            if (__reg5.hai136 != undefined) 
            {
                for (;;) 
                {
                    __reg3 = (__reg3 + 134) % 136;
                    if (!1) 
                    {
                        return;
                    }
                    __reg4 = int(__reg3 / 34);
                    __reg5 = this["yama" + __reg4][__reg3 % 34];
                    if (__reg5.hai136 == undefined) 
                    {
                        break;
                    }
                }
            }
            __reg5.setImage(hai136, __reg4 & 1 ? __reg4 ^ 2 : __reg4);
            return;
        }
    }
    ;
    __reg1.gameCommand_kazeActivate = function (who)
    {
        this.bgc.showKazeActivate(this.kaze[this.oya], who);
    }
    ;
    __reg1.gameCommand_Tsumo = function (who, hai136, activate, naki)
    {
        _root.SE.play("SE_KACHI", false, who);
        this.gameCommand_kazeActivate(who);
        var __reg6 = this.yamaPop(this.rinsyan);
        this.rinsyan = false;
        if (activate && !who) 
        {
            var __reg7 = 136 - this.yamaNext - this.kan - this.nuki;
            if (__reg7 > 14 && this.kan < 4) 
            {
                naki = naki | com.cegg.game.mahjong.Res.NAKI_KAN;
            }
            if (__reg7 > 14 && this.type & com.cegg.game.mahjong.Res.GT_SANMA) 
            {
                naki = naki | com.cegg.game.mahjong.Res.NAKI_NUKU;
            }
        }
        var __reg8 = {x: 0, y: 0};
        __reg6.localToGlobal(__reg8);
        this["tehai" + who].Tsumo(__reg8, hai136, activate, naki, this.menu_tsumogiri.checked, this.menu_autoron.checked);
        __reg6.removeMovieClip();
    }
    ;
    __reg1.gameCommand_Dahai = function (who, hai136, naki, tsumogiri)
    {
        _root.SE.play("SE_DA", true, who);
        var __reg6 = this.kawaPush(who, hai136);
        if (tsumogiri && this.bTsumogiriAsGray) 
        {
            __reg6.setColor(5);
        }
        var __reg7 = this["tehai" + who].Dahai(tsumogiri, hai136);
        __reg6._parent.globalToLocal(__reg7);
        if ((__reg0 = who) === 0) 
        {
            __reg7.x = __reg7.x + 4;
        }
        else if (__reg0 === 1) 
        {
            __reg7.x = __reg7.x - 24;
            __reg7.y = __reg7.y + 16;
        }
        else if (__reg0 === 2) 
        {
            __reg7.y = __reg7.y + 16;
        }
        else if (__reg0 === 3) 
        {
            __reg7.x = __reg7.x + 24;
            __reg7.y = __reg7.y + 16;
        }
        __reg6.ex = __reg6._x;
        __reg6.ey = __reg6._y;
        __reg6.x = __reg6._x;
        __reg6.y = __reg6._y;
        if ((__reg0 = who) === 0) 
        {
            __reg6.x = __reg6._x + 5;
            __reg6.y = __reg6._y + 2;
        }
        else if (__reg0 === 1) 
        {
            __reg6.x = __reg6._x + 2;
            __reg6.y = __reg6._y - 5;
        }
        else if (__reg0 === 2) 
        {
            __reg6.x = __reg6._x - 5;
            __reg6.y = __reg6._y - 2;
        }
        else if (__reg0 === 3) 
        {
            __reg6.x = __reg6._x - 2;
            __reg6.y = __reg6._y + 5;
        }
        __reg6.nakiEnd = function ()
        {
            this.a = 0;
            this._x = this.ex;
            this._y = this.ey;
            this._rotation = 0;
            delete this.ex;
            delete this.ex;
            delete this.nakiEnd;
        }
        ;
        __reg6._x = __reg7.x;
        __reg6._y = __reg7.y;
        __reg6.onTickAnimation = function (a)
        {
            if (this.a--) 
            {
                this._x = this.x + (this._x - this.x) * a;
                this._y = this.y + (this._y - this.y) * a;
                return;
            }
            if (this.iid != undefined) 
            {
                _global.clearInterval(this.iid);
            }
            this.iid = undefined;
            delete this.onInterval;
            delete this.onEnterFrame;
            delete this.x;
            delete this.y;
            delete this.a;
        }
        ;
        if (com.cegg.game.mahjong.UtilBase.bPremiumVersion) 
        {
            __reg6.a = 8;
            __reg6.iid = _global.setInterval(__reg6, "onInterval", 20);
            __reg6.onInterval = function ()
            {
                this.onTickAnimation(this.a * this.a / 8 / 8);
                _global.updateAfterEvent();
            }
            ;
        }
        else 
        {
            __reg6.a = 6;
            __reg6.onEnterFrame = function ()
            {
                this.onTickAnimation(this.a * 0.10000000149);
            }
            ;
        }
        if (who && naki) 
        {
            if ((this.menu_nonaki.checked || this.menu_tsumogiri.checked) && naki ^ -1 & com.cegg.game.mahjong.Res.NAKI_RON) 
            {
                naki = 0;
            }
            if (this.kan >= 4) 
            {
                naki = naki & com.cegg.game.mahjong.Res.NAKI_KAN ^ -1;
            }
            this.tehai0.askNaki(hai136, naki, __reg6, this.menu_autoron.checked);
        }
        return __reg6;
    }
    ;
    __reg1.gameCommand_Reach1 = function (who)
    {
        this.kawaReachPos[who] = this.kawaCount[who];
        this.gameCommand_Voice(who, 8);
    }
    ;
    __reg1.gameCommand_Reach2 = function (who, ten)
    {
        var __reg4 = this["reach" + who];
        this.createEmptyMovieClip("reach_tmp" + who, __reg4.getDepth() + 1000);
        var tmp = this["reach_tmp" + who];
        __reg4.swapDepths(tmp);
        __reg4._visible = true;
        __reg4 = __reg4.img;
        var __reg5 = {x: 0, y: 0};
        __reg4.localToGlobal(__reg5);
        if ((__reg0 = who) === 0) 
        {
            __reg4.dx = 1;
            __reg4.dy = 1;
        }
        else if (__reg0 === 1) 
        {
            __reg4.dy = -1;
            __reg4.dx = 1;
        }
        else if (__reg0 === 2) 
        {
            __reg4.dx = -1;
            __reg4.dy = -1;
        }
        else if (__reg0 === 3) 
        {
            __reg4.dy = 1;
            __reg4.dx = -1;
        }
        __reg4.c = 100;
        __reg4._alpha = 0;
        __reg4.onEnterFrame = function ()
        {
            if (this.c > 0.10000000149) 
            {
                this._yscale = this._xscale = 100 + this.c * 1.5;
                this._alpha = 100 - this.c;
                this._x = this.dx * this.c * 3.79999995232;
                this._y = this.dy * this.c * 3.09999990463;
                this.c = this.c * 0.5;
                return;
            }
            this._alpha = 100;
            this._x = this._y = 0;
            this._xscale = this._yscale = 100;
            this._parent.swapDepths(tmp);
            delete this.onEnterFrame;
            delete this.c;
            delete this.dx;
            delete this.dy;
            tmp.removeMovieClip();
        }
        ;
        this.nagare = int(this.nagare) + 1;
        if (ten && ten.length == 4) 
        {
            if (this.uname[0].length) 
            {
                this.bgc.ten[0] = int(ten[0]);
            }
            if (this.uname[1].length) 
            {
                this.bgc.ten[1] = int(ten[1]);
            }
            if (this.uname[2].length) 
            {
                this.bgc.ten[2] = int(ten[2]);
            }
            if (this.uname[3].length) 
            {
                this.bgc.ten[3] = int(ten[3]);
            }
        }
        else 
        {
            this.bgc.ten[who] = int(this.bgc.ten[who]) - 10;
        }
        this.bgc.printKyokuBaNagare(undefined, undefined, this.nagare);
        this.bgc.updateTenDigits();
    }
    ;
    __reg1.gameCommand_Voice = function (who, type)
    {
        var __reg4 = 0;
        var __reg5 = 0;
        if ((__reg0 = who) === 0) 
        {
            __reg4 = int((Stage.width - 160) / 2);
            __reg5 = 510;
        }
        else if (__reg0 === 1) 
        {
            __reg4 = Stage.width - 160 - 20;
            __reg5 = int((Stage.height - 52) / 2);
        }
        else if (__reg0 === 2) 
        {
            __reg4 = int((Stage.width - 160) / 2);
            __reg5 = 50;
        }
        else if (__reg0 === 3) 
        {
            __reg4 = 20;
            __reg5 = int((Stage.height - 52) / 2);
        }
        if (type == 4) 
        {
            type = 2;
        }
        if (type == 5) 
        {
            type = 2;
        }
        com.cegg.game.mahjong.Util.playVoice(type, who, this.bgc.sx[who]);
        this.createEmptyMovieClip("voice" + who, 101 + who);
        var __reg6 = this["voice" + who];
        if (__reg6 != undefined) 
        {
            __reg6._x = __reg4;
            __reg6._y = __reg5;
            __reg6.attachMovie("naki" + type, "0", 0);
            __reg6 = __reg6[0];
            __reg6.c = -1;
            __reg6._alpha = 0;
            __reg6.onEnterFrame = function ()
            {
                if (this.c < 0) 
                {
                    this._alpha = this._alpha + 10;
                    if (this._alpha > 100) 
                    {
                        this._alpha = 100;
                        this.c = 10;
                    }
                    this._xscale = 300 - this._alpha * 2;
                    this._yscale = 300 - this._alpha * 2;
                    this._x = int(this._width * (100 / this._xscale - 1) / 2);
                    this._y = int(this._height * (100 / this._yscale - 1) / 2);
                    return;
                }
                if (this.c) 
                {
                    --this.c;
                    return;
                }
                if (this._alpha > 0) 
                {
                    this._alpha = this._alpha - 10;
                    if (this._alpha < 0) 
                    {
                        this._alpha = 0;
                    }
                    return;
                }
                this.removeMovieClip();
            }
            ;
        }
    }
    ;
    __reg1.yamaPop = function (rinsyan)
    {
        var __reg3 = (this.yamaOffset + this.yamaNext) % 136;
        var __reg4 = undefined;
        if (rinsyan) 
        {
            __reg3 = (this.yamaOffset + 136 - 1) % 136;
            if (!__reg4) 
            {
                for (;;) 
                {
                    __reg3 = (__reg3 + 135) % 136;
                    if (__reg4) 
                    {
                        break;
                    }
                    __reg4 = this["yama" + int(__reg3 / 34)][__reg3 % 34 ^ 1];
                }
            }
        }
        else 
        {
            __reg4 = this["yama" + int(__reg3 / 34)][__reg3 % 34];
            ++this.yamaNext;
        }
        return __reg4;
    }
    ;
    __reg1.kawaPush = function (who, hai136)
    {
        var __reg5 = this.kawaCount[who]++;
        var __reg6 = 23;
        var __reg7 = __reg5 >= 12 ? __reg5 - 12 : __reg5 % 6;
        var __reg8 = __reg5 >= 12 ? 2 : int(__reg5 / 6);
        if ((__reg0 = who) === 0) 
        {
            var __reg11 = __reg5;
            var __reg9 = com.cegg.game.mahjong.Hai.X0 * __reg7;
            var __reg10 = com.cegg.game.mahjong.Hai.Y0 * __reg8;
            if (__reg5 == this.kawaReachPos[0]) 
            {
                __reg10 = __reg10 + 10;
            }
            if (this.kawaReachPos[0] < __reg5 && (this.kawaReachPos[0] >= 12 ? 1 : __reg5 < int(this.kawaReachPos[0] / 6 + 1) * 6)) 
            {
                __reg9 = __reg9 + 9;
            }
        }
        else if (__reg0 === 1) 
        {
            __reg11 = __reg5 >= 18 ? __reg6 - __reg5 : int(__reg5 / 6) * 6 + 5 - __reg5 % 6 + __reg6 - 17;
            __reg9 = com.cegg.game.mahjong.Hai.X1 * __reg8;
            __reg10 = (0 - com.cegg.game.mahjong.Hai.Y1) * (__reg7 + 1);
            if (__reg5 == this.kawaReachPos[1]) 
            {
                __reg9 = __reg9 + 9;
                __reg10 = __reg10 - 10;
            }
            if (this.kawaReachPos[1] < __reg5 && (this.kawaReachPos[1] >= 12 ? 1 : __reg5 < int(this.kawaReachPos[1] / 6 + 1) * 6)) 
            {
                __reg10 = __reg10 - 9;
            }
        }
        else if (__reg0 === 2) 
        {
            __reg11 = 30 - __reg5;
            __reg9 = (0 - com.cegg.game.mahjong.Hai.X0) * (__reg7 + 1);
            __reg10 = (0 - com.cegg.game.mahjong.Hai.Y0) * (__reg8 + 1);
            if (__reg5 == this.kawaReachPos[2]) 
            {
                __reg9 = __reg9 - 9;
            }
            if (this.kawaReachPos[2] < __reg5 && (this.kawaReachPos[2] >= 12 ? 1 : __reg5 < int(this.kawaReachPos[2] / 6 + 1) * 6)) 
            {
                __reg9 = __reg9 - 9;
            }
        }
        else if (__reg0 === 3) 
        {
            __reg11 = __reg5 >= 18 ? __reg5 : (2 - int(__reg5 / 6)) * 6 + __reg5 % 6;
            __reg9 = (0 - com.cegg.game.mahjong.Hai.X1) * (__reg8 + 1);
            __reg10 = com.cegg.game.mahjong.Hai.Y1 * __reg7;
            if (this.kawaReachPos[3] < __reg5 && (this.kawaReachPos[3] >= 12 ? 1 : __reg5 < int(this.kawaReachPos[3] / 6 + 1) * 6)) 
            {
                __reg10 = __reg10 + 9;
            }
        }
        this["kawa" + who].attachMovie(com.cegg.game.mahjong.Hai.SymbolName, String(__reg5), __reg11, {_x: __reg9, _y: __reg10});
        var __reg4 = this["kawa" + who][__reg5];
        __reg4.setImage(hai136, who + (__reg5 == this.kawaReachPos[who] ? 1 : 0), false);
        return __reg4;
    }
    ;
    __reg1.initKazeArray = function ()
    {
        if (!this.uname[1].length) 
        {
            this.kaze = [[0, 4, 1, 2], undefined, [2, 4, 0, 1], [1, 4, 2, 0]];
            return;
        }
        if (!this.uname[2].length) 
        {
            this.kaze = [[0, 1, 4, 2], [2, 0, 4, 1], undefined, [1, 2, 4, 0]];
            return;
        }
        if (!this.uname[3].length) 
        {
            this.kaze = [[0, 1, 2, 4], [2, 0, 1, 4], [1, 2, 0, 4], undefined];
            return;
        }
        this.kaze = [[0, 1, 2, 3], [3, 0, 1, 2], [2, 3, 0, 1], [1, 2, 3, 0]];
    }
    ;
    __reg1.onCommand = function (msg)
    {
        if ((__reg0 = msg.cmd) === "AGARIBOX_OK") 
        {
            if (this.AgariBoxQ.length) 
            {
                var __reg3 = this.AgariBoxQ.shift();
                this.attachMovie(com.cegg.game.mahjong.AgariBox.SymbolName, "popup", 2000, {attr: __reg3.attributes, mode: __reg3.nodeName, kaze: this.kaze[this.oya], uname: this.uname, dw_GameType: this.type, dw_LobbyID: this.lobby, dan: this.dan, rate: this.rate, rc: this.rc, gold: this.gold, smallwait: com.cegg.game.mahjong.Res.GT_ISSAKU(this.type) || (this.menu_tsumogiri.checked || this.menu_autoron.checked)});
            }
            else if (!this.kansen.length) 
            {
                com.cegg.game.mahjong.MahjongMain.sock.send("<NEXTREADY />");
            }
            return;
        }
        else if (__reg0 === "OWARI") 
        {
            _root.Main.View.LogViewer._visible = false;
            _root.Main.Owari.attachMovie(com.cegg.game.mahjong.OwariBox.SymbolName, "Main", 0, {un: msg.un, sc: msg.sc, ratio: msg.ratio});
            this.unloadMovie();
            return;
        }
        else if (__reg0 !== "EXIT") 
        {
            return;
        }
        this.EXIT.setEnable(false);
        _root.onCommand({cmd: "CLOSEXMLSOCKET"});
        _root.onCommand({cmd: "GOLOBBY"});
        return;
    }
    ;
    __reg1.sendDa = function (hai136)
    {
        this.lastDahai = this.gameCommand_Dahai(0, hai136, 0, this.lastTsumo136 == hai136);
        this.lastTsumo136 = 255;
        com.cegg.game.mahjong.MahjongMain.sock.send("<D p=\"" + hai136 + "\" />");
        this.xmlQSleep = 400 / 50;
    }
    ;
    __reg1.sendReach = function (hai136)
    {
        com.cegg.game.mahjong.MahjongMain.sock.send("<REACH hai=\"" + hai136 + "\" />");
        this.gameCommand_Reach1(0);
    }
    ;
    __reg1.onXMLNode = function (n)
    {
        if (n.nodeName == "WGC") 
        {
            this.km.onXMLNode(n);
            return;
        }
        if (_root.Main.View.LogViewer != undefined) 
        {
            this.onXMLNode_Exe(n);
            return;
        }
        this.xmlQ.push(n);
    }
    ;
    __reg1.onXMLNode_Exe = function (n)
    {
        var __reg3 = n.attributes;
        var __reg4 = n.nodeName;
        var __reg5 = __reg4.charCodeAt(1);
        if (__reg4.length == 1 || (48 <= __reg5 && __reg5 <= 57)) 
        {
            __reg5 = __reg4.charCodeAt(0);
            if ((__reg0 = __reg5) === 68) 
            {
                if (this.logplay) 
                {
                    var __reg6 = __reg5 <= 80 ? __reg5 - 68 : __reg5 - 100;
                    var __reg7 = int(__reg4.substr(1));
                    var __reg8 = int(__reg3.t);
                    var __reg9 = __reg5 > 80 || this.lastTsumo136 == __reg7;
                    this.lastTsumo136 = 255;
                    this.lastDahai = this.gameCommand_Dahai(__reg6, __reg7, __reg8, __reg9);
                    this.xmlQSleep = 400 / 50;
                }
            }
            else if (__reg0 === 69) 
            {
                __reg6 = __reg5 <= 80 ? __reg5 - 68 : __reg5 - 100;
                __reg7 = int(__reg4.substr(1));
                __reg8 = int(__reg3.t);
                __reg9 = __reg5 > 80 || this.lastTsumo136 == __reg7;
                this.lastTsumo136 = 255;
                this.lastDahai = this.gameCommand_Dahai(__reg6, __reg7, __reg8, __reg9);
                this.xmlQSleep = 400 / 50;
            }
            else if (__reg0 === 70) 
            {
                __reg6 = __reg5 <= 80 ? __reg5 - 68 : __reg5 - 100;
                __reg7 = int(__reg4.substr(1));
                __reg8 = int(__reg3.t);
                __reg9 = __reg5 > 80 || this.lastTsumo136 == __reg7;
                this.lastTsumo136 = 255;
                this.lastDahai = this.gameCommand_Dahai(__reg6, __reg7, __reg8, __reg9);
                this.xmlQSleep = 400 / 50;
            }
            else if (__reg0 === 71) 
            {
                __reg6 = __reg5 <= 80 ? __reg5 - 68 : __reg5 - 100;
                __reg7 = int(__reg4.substr(1));
                __reg8 = int(__reg3.t);
                __reg9 = __reg5 > 80 || this.lastTsumo136 == __reg7;
                this.lastTsumo136 = 255;
                this.lastDahai = this.gameCommand_Dahai(__reg6, __reg7, __reg8, __reg9);
                this.xmlQSleep = 400 / 50;
            }
            else if (__reg0 === 101) 
            {
                __reg6 = __reg5 <= 80 ? __reg5 - 68 : __reg5 - 100;
                __reg7 = int(__reg4.substr(1));
                __reg8 = int(__reg3.t);
                __reg9 = __reg5 > 80 || this.lastTsumo136 == __reg7;
                this.lastTsumo136 = 255;
                this.lastDahai = this.gameCommand_Dahai(__reg6, __reg7, __reg8, __reg9);
                this.xmlQSleep = 400 / 50;
            }
            else if (__reg0 === 102) 
            {
                __reg6 = __reg5 <= 80 ? __reg5 - 68 : __reg5 - 100;
                __reg7 = int(__reg4.substr(1));
                __reg8 = int(__reg3.t);
                __reg9 = __reg5 > 80 || this.lastTsumo136 == __reg7;
                this.lastTsumo136 = 255;
                this.lastDahai = this.gameCommand_Dahai(__reg6, __reg7, __reg8, __reg9);
                this.xmlQSleep = 400 / 50;
            }
            else if (__reg0 === 103) 
            {
                __reg6 = __reg5 <= 80 ? __reg5 - 68 : __reg5 - 100;
                __reg7 = int(__reg4.substr(1));
                __reg8 = int(__reg3.t);
                __reg9 = __reg5 > 80 || this.lastTsumo136 == __reg7;
                this.lastTsumo136 = 255;
                this.lastDahai = this.gameCommand_Dahai(__reg6, __reg7, __reg8, __reg9);
                this.xmlQSleep = 400 / 50;
            }
            else if (__reg0 === 84) 
            {
                this.lastDahai.nakiEnd();
                var __reg10 = __reg4.length == 1 ? undefined : int(__reg4.substr(1));
                var __reg11 = __reg5 - 84;
                if (__reg11) 
                {
                    this.gameCommand_Tsumo(__reg11, __reg10, false, 0);
                }
                else 
                {
                    var __reg12 = int(__reg3.t);
                    this.gameCommand_Tsumo(0, __reg10, true, __reg12);
                }
                this.lastTsumo136 = __reg10;
                this.xmlQSleep = 650 / 50;
            }
            else if (__reg0 === 85) 
            {
                this.lastDahai.nakiEnd();
                __reg10 = __reg4.length == 1 ? undefined : int(__reg4.substr(1));
                __reg11 = __reg5 - 84;
                if (__reg11) 
                {
                    this.gameCommand_Tsumo(__reg11, __reg10, false, 0);
                }
                else 
                {
                    __reg12 = int(__reg3.t);
                    this.gameCommand_Tsumo(0, __reg10, true, __reg12);
                }
                this.lastTsumo136 = __reg10;
                this.xmlQSleep = 650 / 50;
            }
            else if (__reg0 === 86) 
            {
                this.lastDahai.nakiEnd();
                __reg10 = __reg4.length == 1 ? undefined : int(__reg4.substr(1));
                __reg11 = __reg5 - 84;
                if (__reg11) 
                {
                    this.gameCommand_Tsumo(__reg11, __reg10, false, 0);
                }
                else 
                {
                    __reg12 = int(__reg3.t);
                    this.gameCommand_Tsumo(0, __reg10, true, __reg12);
                }
                this.lastTsumo136 = __reg10;
                this.xmlQSleep = 650 / 50;
            }
            else if (__reg0 === 87) 
            {
                this.lastDahai.nakiEnd();
                __reg10 = __reg4.length == 1 ? undefined : int(__reg4.substr(1));
                __reg11 = __reg5 - 84;
                if (__reg11) 
                {
                    this.gameCommand_Tsumo(__reg11, __reg10, false, 0);
                }
                else 
                {
                    __reg12 = int(__reg3.t);
                    this.gameCommand_Tsumo(0, __reg10, true, __reg12);
                }
                this.lastTsumo136 = __reg10;
                this.xmlQSleep = 650 / 50;
            }
            else if (__reg0 === 78) 
            {
                this.tehai0.setEnable(false);
                this.lastDahai.nakiEnd();
                this.gameCommand_kazeActivate(int(__reg3.who));
                var __reg13 = com.cegg.game.mahjong.Mentsu136.getNakiType(int(__reg3.m));
                this.gameCommand_Voice(int(__reg3.who), __reg13);
                if (__reg13 == 2 || (__reg13 == 4 || __reg13 == 5)) 
                {
                    ++this.kan;
                }
                if (__reg13 == 10) 
                {
                    ++this.nuki;
                }
                if (__reg13 == 2 || (__reg13 == 4 || (__reg13 == 5 || __reg13 == 10))) 
                {
                    this.rinsyan = true;
                }
                if (__reg13 != 4 && (__reg13 != 5 && __reg13 != 10)) 
                {
                    var __reg15 = (int(__reg3.who) + int(__reg3.m) & 3) % 4;
                    var __reg16 = --this.kawaCount[__reg15];
                    var __reg17 = this["kawa" + __reg15][__reg16];
                    var __reg14 = {x: 0, y: 0};
                    __reg17.localToGlobal(__reg14);
                    __reg17.unloadMovie();
                }
                this["tehai" + __reg3.who].Naki(int(__reg3.m), __reg14);
                if (__reg3.t == com.cegg.game.mahjong.Res.NAKI_RON && (__reg13 == 5 || __reg13 == 10)) 
                {
                    var __reg18 = new com.cegg.game.mahjong.Mentsu136(int(__reg3.m));
                    this.tehai0.askNaki(__reg18.hai0, int(__reg3.t), undefined, this.menu_autoron.checked);
                }
            }
            return undefined;
        }
        if ((__reg0 = __reg4) === "UN") 
        {
            if (__reg3.dan != undefined) 
            {
                this.dan = __reg3.dan.split(",");
            }
            if (__reg3.rate != undefined) 
            {
                this.rate = __reg3.rate.split(",");
            }
            if (__reg3.rc != undefined) 
            {
                this.rc = __reg3.rc.split(",");
            }
            if (__reg3.gold != undefined) 
            {
                this.gold = __reg3.gold.split(",");
            }
            if (__reg3.sx != undefined) 
            {
                this.bgc.sx = __reg3.sx.split(",");
            }
            if (__reg3.n0 != undefined) 
            {
                this.createPlayerInfo(0, __reg3.n0);
            }
            if (__reg3.n1 != undefined) 
            {
                this.createPlayerInfo(1, __reg3.n1);
            }
            if (__reg3.n2 != undefined) 
            {
                this.createPlayerInfo(2, __reg3.n2);
            }
            if (__reg3.n3 != undefined) 
            {
                this.createPlayerInfo(3, __reg3.n3);
            }
            return;
        }
        else if (__reg0 === "INIT") 
        {
            if (this.popup) 
            {
                this.popup.removeMovieClip();
            }
            this.haipai = [__reg3.hai0 == undefined ? __reg3.hai.split(",") : __reg3.hai0.split(","), __reg3.hai1 == undefined ? undefined : __reg3.hai1.split(","), __reg3.hai2 == undefined ? undefined : __reg3.hai2.split(","), __reg3.hai3 == undefined ? undefined : __reg3.hai3.split(",")];
            this.bgc.ten = __reg3.ten.split(",");
            this.bgc.chip = this.type & com.cegg.game.mahjong.Res.GT_CHIP ? __reg3.chip.split(",") : undefined;
            this.oya = int(__reg3.oya);
            var __reg19 = __reg3.seed.split(",");
            var __reg20 = int(__reg19[0]);
            var __reg21 = int(__reg19[1]);
            this.nagare = int(__reg19[2]);
            var __reg22 = int(__reg19[3]);
            var __reg23 = int(__reg19[4]);
            this.init_dora = __reg19.splice(5);
            this.gameCommand_Init(__reg20, __reg21, __reg22, __reg23, int(__reg3.shibari));
            if (__reg4 == "INIT" && (!this.logplay && (this.type & com.cegg.game.mahjong.Res.GT_MULTI && (__reg20 == 0 && (__reg21 == 0 && com.cegg.game.mahjong.UtilBase.bPlayStartSE))))) 
            {
                _root.SE.play("SE_DORA", true, 0);
                com.cegg.game.mahjong.UtilBase.bPlayStartSE = false;
            }
            this.anim = 0;
            if (__reg4 == "REINIT" || _root.Main.View.LogViewer) 
            {
                this.sai.removeMovieClip();
                while (this.anim < 34) 
                {
                    this.onEnterFrame_Yama();
                }
                this.onEnterFrame_Wanpai();
                this.tehai0.ReInit(this.haipai[0], __reg3.m0 == undefined ? undefined : __reg3.m0.split(","));
                if (this.uname[1].length > 0) 
                {
                    this.tehai1.ReInit(this.haipai[1], __reg3.m1 == undefined ? undefined : __reg3.m1.split(","));
                }
                if (this.uname[2].length > 0) 
                {
                    this.tehai2.ReInit(this.haipai[2], __reg3.m2 == undefined ? undefined : __reg3.m2.split(","));
                }
                if (this.uname[3].length > 0) 
                {
                    this.tehai3.ReInit(this.haipai[3], __reg3.m3 == undefined ? undefined : __reg3.m3.split(","));
                }
                var __reg24 = [__reg3.kawa0 == undefined ? undefined : __reg3.kawa0.split(","), __reg3.kawa1 == undefined ? undefined : __reg3.kawa1.split(","), __reg3.kawa2 == undefined ? undefined : __reg3.kawa2.split(","), __reg3.kawa3 == undefined ? undefined : __reg3.kawa3.split(",")];
                var __reg25 = 13 * (this.type & com.cegg.game.mahjong.Res.GT_SANMA ? 3 : 4);
                if (this.type & com.cegg.game.mahjong.Res.GT_SANMA) 
                {
                    __reg25 = __reg25 + 28;
                }
                var __reg26 = 0;
                if (__reg26 < 4) 
                {
                    for (;;) 
                    {
                        ++__reg26;
                        if (__reg26 >= 4) 
                        {
                            break;
                        }
                        if (__reg24[__reg26] != undefined) 
                        {
                            var __reg27 = false;
                            while (__reg24[__reg26].length) 
                            {
                                var __reg28 = __reg24[__reg26].shift();
                                if (__reg28 == 255) 
                                {
                                    this.kawaReachPos[__reg26] = this.kawaCount[__reg26];
                                    this["tehai" + __reg26].reached = true;
                                    this["tehai" + __reg26].setDisable();
                                    this["reach" + __reg26]._visible = true;
                                }
                                else if (__reg28 == 254) 
                                {
                                    __reg27 = true;
                                }
                                else 
                                {
                                    var __reg29 = this.kawaPush(__reg26, __reg28);
                                    if (__reg27 && this.bTsumogiriAsGray) 
                                    {
                                        __reg29.setColor(5);
                                    }
                                    __reg27 = false;
                                    ++__reg25;
                                }
                            }
                        }
                    }
                }
                var __reg30 = [];
                if (__reg3.m0 != undefined) 
                {
                    __reg30 = __reg30.concat(__reg3.m0.split(","));
                }
                if (__reg3.m1 != undefined) 
                {
                    __reg30 = __reg30.concat(__reg3.m1.split(","));
                }
                if (__reg3.m2 != undefined) 
                {
                    __reg30 = __reg30.concat(__reg3.m2.split(","));
                }
                if (__reg3.m3 != undefined) 
                {
                    __reg30 = __reg30.concat(__reg3.m3.split(","));
                }
                var __reg31 = 0;
                if (__reg31 < __reg30.length) 
                {
                    for (;;) 
                    {
                        ++__reg31;
                        if (__reg31 >= __reg30.length) 
                        {
                            break;
                        }
                        if ((__reg0 = com.cegg.game.mahjong.Mentsu136.getNakiType(__reg30[__reg31])) === 2) 
                        {
                            ++this.kan;
                            this.yamaPop(true).removeMovieClip();
                        }
                        else if (__reg0 === 4) 
                        {
                            ++this.kan;
                            this.yamaPop(true).removeMovieClip();
                        }
                        else if (__reg0 === 5) 
                        {
                            ++this.kan;
                            this.yamaPop(true).removeMovieClip();
                        }
                        else if (__reg0 === 10) 
                        {
                            ++this.nuki;
                            this.yamaPop(true).removeMovieClip();
                        }
                    }
                }
                while (this.yamaNext < __reg25) 
                {
                    this.yamaPop(false).removeMovieClip();
                }
                if (__reg4 == "INIT" && _root.Main.View.LogViewer) 
                {
                    this.onEnterFrame = this.onEnterFrame_AsyncTick;
                }
                else 
                {
                    this.onEnterFrame = this.onEnterFrame_Main;
                }
            }
            else 
            {
                com.cegg.game.mahjong.MahjongMain.animRuleDisp(this.ruledispO);
                com.cegg.game.mahjong.MahjongMain.animRuleDisp(this.ruledisp2);
                this.onEnterFrame = this.onEnterFrame_InitYama;
            }
            return;
        }
        else if (__reg0 === "REINIT") 
        {
            if (this.popup) 
            {
                this.popup.removeMovieClip();
            }
            this.haipai = [__reg3.hai0 == undefined ? __reg3.hai.split(",") : __reg3.hai0.split(","), __reg3.hai1 == undefined ? undefined : __reg3.hai1.split(","), __reg3.hai2 == undefined ? undefined : __reg3.hai2.split(","), __reg3.hai3 == undefined ? undefined : __reg3.hai3.split(",")];
            this.bgc.ten = __reg3.ten.split(",");
            this.bgc.chip = this.type & com.cegg.game.mahjong.Res.GT_CHIP ? __reg3.chip.split(",") : undefined;
            this.oya = int(__reg3.oya);
            __reg19 = __reg3.seed.split(",");
            __reg20 = int(__reg19[0]);
            __reg21 = int(__reg19[1]);
            this.nagare = int(__reg19[2]);
            __reg22 = int(__reg19[3]);
            __reg23 = int(__reg19[4]);
            this.init_dora = __reg19.splice(5);
            this.gameCommand_Init(__reg20, __reg21, __reg22, __reg23, int(__reg3.shibari));
            if (__reg4 == "INIT" && (!this.logplay && (this.type & com.cegg.game.mahjong.Res.GT_MULTI && (__reg20 == 0 && (__reg21 == 0 && com.cegg.game.mahjong.UtilBase.bPlayStartSE))))) 
            {
                _root.SE.play("SE_DORA", true, 0);
                com.cegg.game.mahjong.UtilBase.bPlayStartSE = false;
            }
            this.anim = 0;
            if (__reg4 == "REINIT" || _root.Main.View.LogViewer) 
            {
                this.sai.removeMovieClip();
                while (this.anim < 34) 
                {
                    this.onEnterFrame_Yama();
                }
                this.onEnterFrame_Wanpai();
                this.tehai0.ReInit(this.haipai[0], __reg3.m0 == undefined ? undefined : __reg3.m0.split(","));
                if (this.uname[1].length > 0) 
                {
                    this.tehai1.ReInit(this.haipai[1], __reg3.m1 == undefined ? undefined : __reg3.m1.split(","));
                }
                if (this.uname[2].length > 0) 
                {
                    this.tehai2.ReInit(this.haipai[2], __reg3.m2 == undefined ? undefined : __reg3.m2.split(","));
                }
                if (this.uname[3].length > 0) 
                {
                    this.tehai3.ReInit(this.haipai[3], __reg3.m3 == undefined ? undefined : __reg3.m3.split(","));
                }
                __reg24 = [__reg3.kawa0 == undefined ? undefined : __reg3.kawa0.split(","), __reg3.kawa1 == undefined ? undefined : __reg3.kawa1.split(","), __reg3.kawa2 == undefined ? undefined : __reg3.kawa2.split(","), __reg3.kawa3 == undefined ? undefined : __reg3.kawa3.split(",")];
                __reg25 = 13 * (this.type & com.cegg.game.mahjong.Res.GT_SANMA ? 3 : 4);
                if (this.type & com.cegg.game.mahjong.Res.GT_SANMA) 
                {
                    __reg25 = __reg25 + 28;
                }
                __reg26 = 0;
                if (__reg26 < 4) 
                {
                    for (;;) 
                    {
                        ++__reg26;
                        if (__reg26 >= 4) 
                        {
                            break;
                        }
                        if (__reg24[__reg26] != undefined) 
                        {
                            __reg27 = false;
                            while (__reg24[__reg26].length) 
                            {
                                __reg28 = __reg24[__reg26].shift();
                                if (__reg28 == 255) 
                                {
                                    this.kawaReachPos[__reg26] = this.kawaCount[__reg26];
                                    this["tehai" + __reg26].reached = true;
                                    this["tehai" + __reg26].setDisable();
                                    this["reach" + __reg26]._visible = true;
                                }
                                else if (__reg28 == 254) 
                                {
                                    __reg27 = true;
                                }
                                else 
                                {
                                    __reg29 = this.kawaPush(__reg26, __reg28);
                                    if (__reg27 && this.bTsumogiriAsGray) 
                                    {
                                        __reg29.setColor(5);
                                    }
                                    __reg27 = false;
                                    ++__reg25;
                                }
                            }
                        }
                    }
                }
                __reg30 = [];
                if (__reg3.m0 != undefined) 
                {
                    __reg30 = __reg30.concat(__reg3.m0.split(","));
                }
                if (__reg3.m1 != undefined) 
                {
                    __reg30 = __reg30.concat(__reg3.m1.split(","));
                }
                if (__reg3.m2 != undefined) 
                {
                    __reg30 = __reg30.concat(__reg3.m2.split(","));
                }
                if (__reg3.m3 != undefined) 
                {
                    __reg30 = __reg30.concat(__reg3.m3.split(","));
                }
                __reg31 = 0;
                if (__reg31 < __reg30.length) 
                {
                    for (;;) 
                    {
                        ++__reg31;
                        if (__reg31 >= __reg30.length) 
                        {
                            break;
                        }
                        if ((__reg0 = com.cegg.game.mahjong.Mentsu136.getNakiType(__reg30[__reg31])) === 2) 
                        {
                            ++this.kan;
                            this.yamaPop(true).removeMovieClip();
                        }
                        else if (__reg0 === 4) 
                        {
                            ++this.kan;
                            this.yamaPop(true).removeMovieClip();
                        }
                        else if (__reg0 === 5) 
                        {
                            ++this.kan;
                            this.yamaPop(true).removeMovieClip();
                        }
                        else if (__reg0 === 10) 
                        {
                            ++this.nuki;
                            this.yamaPop(true).removeMovieClip();
                        }
                    }
                }
                while (this.yamaNext < __reg25) 
                {
                    this.yamaPop(false).removeMovieClip();
                }
                if (__reg4 == "INIT" && _root.Main.View.LogViewer) 
                {
                    this.onEnterFrame = this.onEnterFrame_AsyncTick;
                }
                else 
                {
                    this.onEnterFrame = this.onEnterFrame_Main;
                }
            }
            else 
            {
                com.cegg.game.mahjong.MahjongMain.animRuleDisp(this.ruledispO);
                com.cegg.game.mahjong.MahjongMain.animRuleDisp(this.ruledisp2);
                this.onEnterFrame = this.onEnterFrame_InitYama;
            }
            return;
        }
        else if (__reg0 === "DORA") 
        {
            this.gameCommand_Dora(int(__reg3.hai));
            return;
        }
        else if (__reg0 === "REACH") 
        {
            if (__reg3.step == undefined) 
            {
                if (!__reg3.who && !this.logplay) 
                {
                    return;
                }
                this.gameCommand_Reach1(int(__reg3.who));
                this.gameCommand_Reach2(int(__reg3.who));
            }
            else if (__reg3.step == 1) 
            {
                if (!__reg3.who && !this.logplay) 
                {
                    return;
                }
                this.gameCommand_Reach1(int(__reg3.who));
                this.xmlQSleep = 650 / 50;
            }
            else if (__reg3.step == 2) 
            {
                this.gameCommand_Reach2(int(__reg3.who), __reg3.ten.split(","));
            }
            return;
        }
        else if (__reg0 === "FURITEN") 
        {
            this.furiten._visible = __reg3.show == 1;
            return;
        }
        else if (__reg0 === "TAIKYOKU") 
        {
            if (!this.logplay && __reg3.log != undefined) 
            {
                var __reg32 = __reg3.log;
                if (!com.cegg.game.mahjong.UtilBase.bPremiumVersion) 
                {
                    __reg32 = com.cegg.game.mahjong.Util.logEncode(__reg32);
                }
                var __reg33 = com.cegg.game.mahjong.SaveData.MJINFO();
                if (__reg33.data.logstr == undefined) 
                {
                    __reg33.data.logstr = "";
                }
                __reg33.data.logstr = __reg33.data.logstr + ("\n" + "file=" + _global.escape(__reg32) + "&un0=" + _global.escape(this.uname[0]) + "&un1=" + _global.escape(this.uname[1]) + "&un2=" + _global.escape(this.uname[2]) + "&un3=" + _global.escape(this.uname[3]) + "&oya=" + __reg3.oya + "&type=" + this.type);
                var __reg34 = __reg33.data.logstr.split("\n");
                while (__reg34.length > com.cegg.game.mahjong.Res.N_LOGMAX) 
                {
                    __reg34.shift();
                }
                __reg33.data.logstr = __reg34.join("\n");
                __reg33.flush();
            }
            if (!this.logplay && (_root.wb && (com.cegg.game.mahjong.UtilBase.bPremiumVersion && (com.cegg.game.mahjong.UtilBase.nExpireDays && __reg3.log != undefined)))) 
            {
                var __reg35 = (4 - int(__reg3.oya)) % 4;
                this.getURL("javascript:try{if (window.external && window.external.startGame) void(window.external.startGame(\'" + __reg3.log + "&tw=" + __reg35 + "\'));}catch(e){}");
            }
            if (this.type & com.cegg.game.mahjong.Res.GT_GRAY) 
            {
                this.bTsumogiriAsGray = true;
            }
            this.oya = int(__reg3.oya);
            this.initKazeArray();
            if (this.km) 
            {
                var __reg36 = com.cegg.game.mahjong.Res.GameTypeToProfIndex(this.type);
                var __reg37 = int(_root.tw) % 4;
                var __reg38 = "";
                __reg38 = __reg38 + "<menu>";
                if (this.uname[(4 - __reg37) % 4].length > 0) 
                {
                    __reg38 = __reg38 + ("<item disp=\"" + _global.escape(this.uname[(4 - __reg37) % 4]) + " (" + com.cegg.game.mahjong.Res.T_DANDISP[this.dan[(4 - __reg37) % 4]] + "R" + com.cegg.game.mahjong.Res.RatingConvFronProfIndex(__reg36, this.rate[(4 - __reg37) % 4]) + ")\" cmd=\"WHO\" who=\"0\"/><br/>");
                }
                if (this.uname[(5 - __reg37) % 4].length > 0) 
                {
                    __reg38 = __reg38 + ("<item disp=\"" + _global.escape(this.uname[(5 - __reg37) % 4]) + " (" + com.cegg.game.mahjong.Res.T_DANDISP[this.dan[(5 - __reg37) % 4]] + "R" + com.cegg.game.mahjong.Res.RatingConvFronProfIndex(__reg36, this.rate[(5 - __reg37) % 4]) + ")\" cmd=\"WHO\" who=\"1\"/><br/>");
                }
                if (this.uname[(6 - __reg37) % 4].length > 0) 
                {
                    __reg38 = __reg38 + ("<item disp=\"" + _global.escape(this.uname[(6 - __reg37) % 4]) + " (" + com.cegg.game.mahjong.Res.T_DANDISP[this.dan[(6 - __reg37) % 4]] + "R" + com.cegg.game.mahjong.Res.RatingConvFronProfIndex(__reg36, this.rate[(6 - __reg37) % 4]) + ")\" cmd=\"WHO\" who=\"2\"/><br/>");
                }
                if (this.uname[(7 - __reg37) % 4].length > 0) 
                {
                    __reg38 = __reg38 + ("<item disp=\"" + _global.escape(this.uname[(7 - __reg37) % 4]) + " (" + com.cegg.game.mahjong.Res.T_DANDISP[this.dan[(7 - __reg37) % 4]] + "R" + com.cegg.game.mahjong.Res.RatingConvFronProfIndex(__reg36, this.rate[(7 - __reg37) % 4]) + ")\" cmd=\"WHO\" who=\"3\"/><br/>");
                }
                if (com.cegg.game.mahjong.UtilBase.bPremiumVersion) 
                {
                    __reg38 = __reg38 + "<separator/>";
                    __reg38 = __reg38 + ("<item disp=\"" + com.cegg.game.mahjong.Res.T_LOGTSUMOGIRIASGRAY + "\" cmd=\"TSUMOGIRIASGRAY\" /><br/>");
                }
                __reg38 = __reg38 + "</menu>";
                this.km.WHO.subMenu = (new XML(__reg38)).firstChild;
                this.km.WHO.setEnable(true);
            }
            this.tehai1.showTehai(__reg3.hai1 == undefined ? undefined : __reg3.hai1.split(","));
            this.tehai2.showTehai(__reg3.hai2 == undefined ? undefined : __reg3.hai2.split(","));
            this.tehai3.showTehai(__reg3.hai3 == undefined ? undefined : __reg3.hai3.split(","));
            if (__reg3.type == "ron3") 
            {
                if (__reg3.hai0 != undefined) 
                {
                    this.gameCommand_Voice(0, 6);
                }
                if (__reg3.hai1 != undefined) 
                {
                    this.gameCommand_Voice(1, 6);
                }
                if (__reg3.hai2 != undefined) 
                {
                    this.gameCommand_Voice(2, 6);
                }
                if (__reg3.hai3 != undefined) 
                {
                    this.gameCommand_Voice(3, 6);
                }
            }
            if (__reg3.owari != undefined) 
            {
                if (!this.logplay && this.type & com.cegg.game.mahjong.Res.GT_MULTI) 
                {
                    var __reg39 = com.cegg.game.mahjong.SaveData.MJINFO();
                    __reg39.data.logstr = __reg39.data.logstr + ("&sc=" + __reg3.owari);
                    __reg39.flush();
                    var __reg40 = com.cegg.game.mahjong.SaveData.MJSTATUS();
                    delete __reg40.data.gpid;
                    __reg40.flush();
                }
                _root.onCommand({cmd: "CLOSEXMLSOCKET"});
            }
            this.lastDahai.nakiEnd();
            this.tehai0.setDisable();
            if (__reg4 == "AGARI") 
            {
                this.gameCommand_Voice(int(__reg3.who), __reg3.who == __reg3.fromWho ? 7 : 6);
                if (__reg3.paoWho != undefined) 
                {
                    this.gameCommand_Voice(int(__reg3.paoWho), 9);
                }
            }
            if (!this.logplay && (com.cegg.game.mahjong.Res.GT_ISTECH(this.type) && __reg4 == "TAIKYOKU")) 
            {
                com.cegg.game.mahjong.MahjongMain.sock.send("<NEXTREADY />");
            }
            else 
            {
                this.AgariBoxQ.push(n);
                if (this.popup == undefined) 
                {
                    this.onCommand({cmd: "AGARIBOX_OK"});
                }
            }
            return;
        }
        else if (__reg0 === "SAIKAI") 
        {
            if (this.type & com.cegg.game.mahjong.Res.GT_GRAY) 
            {
                this.bTsumogiriAsGray = true;
            }
            this.oya = int(__reg3.oya);
            this.initKazeArray();
            if (this.km) 
            {
                __reg36 = com.cegg.game.mahjong.Res.GameTypeToProfIndex(this.type);
                __reg37 = int(_root.tw) % 4;
                __reg38 = "";
                __reg38 = __reg38 + "<menu>";
                if (this.uname[(4 - __reg37) % 4].length > 0) 
                {
                    __reg38 = __reg38 + ("<item disp=\"" + _global.escape(this.uname[(4 - __reg37) % 4]) + " (" + com.cegg.game.mahjong.Res.T_DANDISP[this.dan[(4 - __reg37) % 4]] + "R" + com.cegg.game.mahjong.Res.RatingConvFronProfIndex(__reg36, this.rate[(4 - __reg37) % 4]) + ")\" cmd=\"WHO\" who=\"0\"/><br/>");
                }
                if (this.uname[(5 - __reg37) % 4].length > 0) 
                {
                    __reg38 = __reg38 + ("<item disp=\"" + _global.escape(this.uname[(5 - __reg37) % 4]) + " (" + com.cegg.game.mahjong.Res.T_DANDISP[this.dan[(5 - __reg37) % 4]] + "R" + com.cegg.game.mahjong.Res.RatingConvFronProfIndex(__reg36, this.rate[(5 - __reg37) % 4]) + ")\" cmd=\"WHO\" who=\"1\"/><br/>");
                }
                if (this.uname[(6 - __reg37) % 4].length > 0) 
                {
                    __reg38 = __reg38 + ("<item disp=\"" + _global.escape(this.uname[(6 - __reg37) % 4]) + " (" + com.cegg.game.mahjong.Res.T_DANDISP[this.dan[(6 - __reg37) % 4]] + "R" + com.cegg.game.mahjong.Res.RatingConvFronProfIndex(__reg36, this.rate[(6 - __reg37) % 4]) + ")\" cmd=\"WHO\" who=\"2\"/><br/>");
                }
                if (this.uname[(7 - __reg37) % 4].length > 0) 
                {
                    __reg38 = __reg38 + ("<item disp=\"" + _global.escape(this.uname[(7 - __reg37) % 4]) + " (" + com.cegg.game.mahjong.Res.T_DANDISP[this.dan[(7 - __reg37) % 4]] + "R" + com.cegg.game.mahjong.Res.RatingConvFronProfIndex(__reg36, this.rate[(7 - __reg37) % 4]) + ")\" cmd=\"WHO\" who=\"3\"/><br/>");
                }
                if (com.cegg.game.mahjong.UtilBase.bPremiumVersion) 
                {
                    __reg38 = __reg38 + "<separator/>";
                    __reg38 = __reg38 + ("<item disp=\"" + com.cegg.game.mahjong.Res.T_LOGTSUMOGIRIASGRAY + "\" cmd=\"TSUMOGIRIASGRAY\" /><br/>");
                }
                __reg38 = __reg38 + "</menu>";
                this.km.WHO.subMenu = (new XML(__reg38)).firstChild;
                this.km.WHO.setEnable(true);
            }
            this.tehai1.showTehai(__reg3.hai1 == undefined ? undefined : __reg3.hai1.split(","));
            this.tehai2.showTehai(__reg3.hai2 == undefined ? undefined : __reg3.hai2.split(","));
            this.tehai3.showTehai(__reg3.hai3 == undefined ? undefined : __reg3.hai3.split(","));
            if (__reg3.type == "ron3") 
            {
                if (__reg3.hai0 != undefined) 
                {
                    this.gameCommand_Voice(0, 6);
                }
                if (__reg3.hai1 != undefined) 
                {
                    this.gameCommand_Voice(1, 6);
                }
                if (__reg3.hai2 != undefined) 
                {
                    this.gameCommand_Voice(2, 6);
                }
                if (__reg3.hai3 != undefined) 
                {
                    this.gameCommand_Voice(3, 6);
                }
            }
            if (__reg3.owari != undefined) 
            {
                if (!this.logplay && this.type & com.cegg.game.mahjong.Res.GT_MULTI) 
                {
                    __reg39 = com.cegg.game.mahjong.SaveData.MJINFO();
                    __reg39.data.logstr = __reg39.data.logstr + ("&sc=" + __reg3.owari);
                    __reg39.flush();
                    __reg40 = com.cegg.game.mahjong.SaveData.MJSTATUS();
                    delete __reg40.data.gpid;
                    __reg40.flush();
                }
                _root.onCommand({cmd: "CLOSEXMLSOCKET"});
            }
            this.lastDahai.nakiEnd();
            this.tehai0.setDisable();
            if (__reg4 == "AGARI") 
            {
                this.gameCommand_Voice(int(__reg3.who), __reg3.who == __reg3.fromWho ? 7 : 6);
                if (__reg3.paoWho != undefined) 
                {
                    this.gameCommand_Voice(int(__reg3.paoWho), 9);
                }
            }
            if (!this.logplay && (com.cegg.game.mahjong.Res.GT_ISTECH(this.type) && __reg4 == "TAIKYOKU")) 
            {
                com.cegg.game.mahjong.MahjongMain.sock.send("<NEXTREADY />");
            }
            else 
            {
                this.AgariBoxQ.push(n);
                if (this.popup == undefined) 
                {
                    this.onCommand({cmd: "AGARIBOX_OK"});
                }
            }
            return;
        }
        else if (__reg0 === "KANSEN") 
        {
            if (this.type & com.cegg.game.mahjong.Res.GT_GRAY) 
            {
                this.bTsumogiriAsGray = true;
            }
            this.oya = int(__reg3.oya);
            this.initKazeArray();
            if (this.km) 
            {
                __reg36 = com.cegg.game.mahjong.Res.GameTypeToProfIndex(this.type);
                __reg37 = int(_root.tw) % 4;
                __reg38 = "";
                __reg38 = __reg38 + "<menu>";
                if (this.uname[(4 - __reg37) % 4].length > 0) 
                {
                    __reg38 = __reg38 + ("<item disp=\"" + _global.escape(this.uname[(4 - __reg37) % 4]) + " (" + com.cegg.game.mahjong.Res.T_DANDISP[this.dan[(4 - __reg37) % 4]] + "R" + com.cegg.game.mahjong.Res.RatingConvFronProfIndex(__reg36, this.rate[(4 - __reg37) % 4]) + ")\" cmd=\"WHO\" who=\"0\"/><br/>");
                }
                if (this.uname[(5 - __reg37) % 4].length > 0) 
                {
                    __reg38 = __reg38 + ("<item disp=\"" + _global.escape(this.uname[(5 - __reg37) % 4]) + " (" + com.cegg.game.mahjong.Res.T_DANDISP[this.dan[(5 - __reg37) % 4]] + "R" + com.cegg.game.mahjong.Res.RatingConvFronProfIndex(__reg36, this.rate[(5 - __reg37) % 4]) + ")\" cmd=\"WHO\" who=\"1\"/><br/>");
                }
                if (this.uname[(6 - __reg37) % 4].length > 0) 
                {
                    __reg38 = __reg38 + ("<item disp=\"" + _global.escape(this.uname[(6 - __reg37) % 4]) + " (" + com.cegg.game.mahjong.Res.T_DANDISP[this.dan[(6 - __reg37) % 4]] + "R" + com.cegg.game.mahjong.Res.RatingConvFronProfIndex(__reg36, this.rate[(6 - __reg37) % 4]) + ")\" cmd=\"WHO\" who=\"2\"/><br/>");
                }
                if (this.uname[(7 - __reg37) % 4].length > 0) 
                {
                    __reg38 = __reg38 + ("<item disp=\"" + _global.escape(this.uname[(7 - __reg37) % 4]) + " (" + com.cegg.game.mahjong.Res.T_DANDISP[this.dan[(7 - __reg37) % 4]] + "R" + com.cegg.game.mahjong.Res.RatingConvFronProfIndex(__reg36, this.rate[(7 - __reg37) % 4]) + ")\" cmd=\"WHO\" who=\"3\"/><br/>");
                }
                if (com.cegg.game.mahjong.UtilBase.bPremiumVersion) 
                {
                    __reg38 = __reg38 + "<separator/>";
                    __reg38 = __reg38 + ("<item disp=\"" + com.cegg.game.mahjong.Res.T_LOGTSUMOGIRIASGRAY + "\" cmd=\"TSUMOGIRIASGRAY\" /><br/>");
                }
                __reg38 = __reg38 + "</menu>";
                this.km.WHO.subMenu = (new XML(__reg38)).firstChild;
                this.km.WHO.setEnable(true);
            }
            this.tehai1.showTehai(__reg3.hai1 == undefined ? undefined : __reg3.hai1.split(","));
            this.tehai2.showTehai(__reg3.hai2 == undefined ? undefined : __reg3.hai2.split(","));
            this.tehai3.showTehai(__reg3.hai3 == undefined ? undefined : __reg3.hai3.split(","));
            if (__reg3.type == "ron3") 
            {
                if (__reg3.hai0 != undefined) 
                {
                    this.gameCommand_Voice(0, 6);
                }
                if (__reg3.hai1 != undefined) 
                {
                    this.gameCommand_Voice(1, 6);
                }
                if (__reg3.hai2 != undefined) 
                {
                    this.gameCommand_Voice(2, 6);
                }
                if (__reg3.hai3 != undefined) 
                {
                    this.gameCommand_Voice(3, 6);
                }
            }
            if (__reg3.owari != undefined) 
            {
                if (!this.logplay && this.type & com.cegg.game.mahjong.Res.GT_MULTI) 
                {
                    __reg39 = com.cegg.game.mahjong.SaveData.MJINFO();
                    __reg39.data.logstr = __reg39.data.logstr + ("&sc=" + __reg3.owari);
                    __reg39.flush();
                    __reg40 = com.cegg.game.mahjong.SaveData.MJSTATUS();
                    delete __reg40.data.gpid;
                    __reg40.flush();
                }
                _root.onCommand({cmd: "CLOSEXMLSOCKET"});
            }
            this.lastDahai.nakiEnd();
            this.tehai0.setDisable();
            if (__reg4 == "AGARI") 
            {
                this.gameCommand_Voice(int(__reg3.who), __reg3.who == __reg3.fromWho ? 7 : 6);
                if (__reg3.paoWho != undefined) 
                {
                    this.gameCommand_Voice(int(__reg3.paoWho), 9);
                }
            }
            if (!this.logplay && (com.cegg.game.mahjong.Res.GT_ISTECH(this.type) && __reg4 == "TAIKYOKU")) 
            {
                com.cegg.game.mahjong.MahjongMain.sock.send("<NEXTREADY />");
            }
            else 
            {
                this.AgariBoxQ.push(n);
                if (this.popup == undefined) 
                {
                    this.onCommand({cmd: "AGARIBOX_OK"});
                }
            }
            return;
        }
        else if (__reg0 === "RYUUKYOKU") 
        {
            this.tehai1.showTehai(__reg3.hai1 == undefined ? undefined : __reg3.hai1.split(","));
            this.tehai2.showTehai(__reg3.hai2 == undefined ? undefined : __reg3.hai2.split(","));
            this.tehai3.showTehai(__reg3.hai3 == undefined ? undefined : __reg3.hai3.split(","));
            if (__reg3.type == "ron3") 
            {
                if (__reg3.hai0 != undefined) 
                {
                    this.gameCommand_Voice(0, 6);
                }
                if (__reg3.hai1 != undefined) 
                {
                    this.gameCommand_Voice(1, 6);
                }
                if (__reg3.hai2 != undefined) 
                {
                    this.gameCommand_Voice(2, 6);
                }
                if (__reg3.hai3 != undefined) 
                {
                    this.gameCommand_Voice(3, 6);
                }
            }
            if (__reg3.owari != undefined) 
            {
                if (!this.logplay && this.type & com.cegg.game.mahjong.Res.GT_MULTI) 
                {
                    __reg39 = com.cegg.game.mahjong.SaveData.MJINFO();
                    __reg39.data.logstr = __reg39.data.logstr + ("&sc=" + __reg3.owari);
                    __reg39.flush();
                    __reg40 = com.cegg.game.mahjong.SaveData.MJSTATUS();
                    delete __reg40.data.gpid;
                    __reg40.flush();
                }
                _root.onCommand({cmd: "CLOSEXMLSOCKET"});
            }
            this.lastDahai.nakiEnd();
            this.tehai0.setDisable();
            if (__reg4 == "AGARI") 
            {
                this.gameCommand_Voice(int(__reg3.who), __reg3.who == __reg3.fromWho ? 7 : 6);
                if (__reg3.paoWho != undefined) 
                {
                    this.gameCommand_Voice(int(__reg3.paoWho), 9);
                }
            }
            if (!this.logplay && (com.cegg.game.mahjong.Res.GT_ISTECH(this.type) && __reg4 == "TAIKYOKU")) 
            {
                com.cegg.game.mahjong.MahjongMain.sock.send("<NEXTREADY />");
            }
            else 
            {
                this.AgariBoxQ.push(n);
                if (this.popup == undefined) 
                {
                    this.onCommand({cmd: "AGARIBOX_OK"});
                }
            }
            return;
        }
        else if (__reg0 === "AGARI") 
        {
            if (__reg3.owari != undefined) 
            {
                if (!this.logplay && this.type & com.cegg.game.mahjong.Res.GT_MULTI) 
                {
                    __reg39 = com.cegg.game.mahjong.SaveData.MJINFO();
                    __reg39.data.logstr = __reg39.data.logstr + ("&sc=" + __reg3.owari);
                    __reg39.flush();
                    __reg40 = com.cegg.game.mahjong.SaveData.MJSTATUS();
                    delete __reg40.data.gpid;
                    __reg40.flush();
                }
                _root.onCommand({cmd: "CLOSEXMLSOCKET"});
            }
            this.lastDahai.nakiEnd();
            this.tehai0.setDisable();
            if (__reg4 == "AGARI") 
            {
                this.gameCommand_Voice(int(__reg3.who), __reg3.who == __reg3.fromWho ? 7 : 6);
                if (__reg3.paoWho != undefined) 
                {
                    this.gameCommand_Voice(int(__reg3.paoWho), 9);
                }
            }
            if (!this.logplay && (com.cegg.game.mahjong.Res.GT_ISTECH(this.type) && __reg4 == "TAIKYOKU")) 
            {
                com.cegg.game.mahjong.MahjongMain.sock.send("<NEXTREADY />");
            }
            else 
            {
                this.AgariBoxQ.push(n);
                if (this.popup == undefined) 
                {
                    this.onCommand({cmd: "AGARIBOX_OK"});
                }
            }
            return;
        }
        else if (__reg0 === "PROF") 
        {
            if (__reg3.lobby) 
            {
                var __reg41 = com.cegg.game.mahjong.SaveData.MJINFO();
                if (this.type & com.cegg.game.mahjong.Res.GT_SANMA) 
                {
                    __reg42 = __reg41.data.prof_private3;
                }
                else 
                {
                    var __reg42 = __reg41.data.prof_private;
                }
                if (__reg42.length) 
                {
                    var __reg43 = __reg42.split(",");
                    var __reg44 = __reg3.add.split(",");
                    var __reg45 = 0;
                    if (__reg45 < __reg44.length) 
                    {
                        for (;;) 
                        {
                            ++__reg45;
                            if (__reg45 >= __reg44.length) 
                            {
                                break;
                            }
                            __reg43[__reg45] = int(__reg43[__reg45]) + int(__reg44[__reg45]);
                        }
                    }
                    __reg42 = __reg43.join(",");
                }
                else 
                {
                    __reg42 = __reg3.add;
                }
                if (this.type & com.cegg.game.mahjong.Res.GT_SANMA) 
                {
                    __reg41.data.prof_private3 = __reg42;
                }
                else 
                {
                    __reg41.data.prof_private = __reg42;
                }
                __reg41.flush();
            }
            return;
        }
        else if (__reg0 !== "BYE") 
        {
            return;
        }
        this.bgc.setPlayerNameColor(__reg3.who, false);
        this.connected[int(__reg3.who)] = false;
        return;
    }
    ;
    __reg1.createPlayerInfo = function (who, un, cc)
    {
        var __reg5 = this.bgc["name" + who];
        this.uname[who] = _global.unescape(un);
        if (this.uname[who].length > 0) 
        {
            __reg5[0].loadMovie(com.cegg.game.mahjong.UtilBase.resolveAsSWFUNURL("swf?" + (who & 1) + _global.escape(this.uname[who])));
        }
        this.connected[who] = true;
        this.bgc.setPlayerNameColor(who, true);
    }
    ;
    ASSetPropFlags(__reg1, null, 1);
    __reg0.SymbolName = "__Packages.com.cegg.game.mahjong.MahjongMain";
    __reg0.SymbolOwner = com.cegg.game.mahjong.MahjongMain;
    __reg0.SymbolLinked = Object.registerClass(com.cegg.game.mahjong.MahjongMain.SymbolName, com.cegg.game.mahjong.MahjongMain.SymbolOwner);
    __reg0.sock = _root;
    __reg1.nagare = 0;
    __reg1.nonresponse = 0;
    __reg1.logplay = false;
    __reg1.anim = 0;
}#endinitclip

//子图形 10
//  初始化剪辑
#initclip 0

if (!com.cegg.GButton) 
{
    if (!com) 
    {
        _global.com = new Object();
    }
    if (!com.cegg) 
    {
        _global.com.cegg = new Object();
    }
    (_global.com.cegg.GButton = function ()
    {
        super();
        this._focusrect = false;
        this.createTextField("face", 0, 0, 0, 0, 0);
    }
    ).prototype.__proto__ = MovieClip.prototype;
    __reg0.prototype.__constructor__ = MovieClip;
    var __reg1 = __reg0.prototype;
    __reg0.createTextButton = function (name, disp, depth, parent, xml)
    {
        var __reg7 = parent.attachMovie(com.cegg.GButton.SymbolName, name, depth);
        if (xml != undefined && xml.childNodes.length != 0) 
        {
            __reg7.subMenu = xml;
        }
        if (xml != undefined && xml.attributes.textPrefix != undefined) 
        {
            __reg7.textPrefix = xml.attributes.textPrefix;
        }
        var __reg8 = __reg7.face;
        __reg8.textColor = 2105376;
        __reg8.autoSize = "left";
        __reg8.selectable = false;
        var __reg9 = 0;
        if (disp == undefined && xml != undefined) 
        {
            var __reg10 = xml.firstChild;
            if (__reg10) 
            {
                for (;;) 
                {
                    __reg10 = __reg10.nextSibling;
                    if (!__reg10) 
                    {
                        break;
                    }
                    if (__reg10.attributes.disp != undefined) 
                    {
                        __reg7.setText(__reg10.attributes.disp);
                        __reg7.value = __reg10.attributes.value;
                        if (__reg9 < __reg8._width) 
                        {
                            __reg9 = __reg8._width;
                        }
                    }
                }
            }
        }
        else 
        {
            __reg7.setText(disp);
            __reg9 = __reg8._width;
        }
        __reg8._x = 6;
        __reg9 = __reg9 + 6 * 2;
        var __reg11 = __reg7.subMenu != undefined;
        if (__reg11) 
        {
            __reg9 = __reg9 + 6;
        }
        if (xml != undefined && xml.attributes.width != undefined) 
        {
            __reg9 = int(xml.attributes.width);
        }
        var __reg12 = __reg7.face._height;
        if (__reg12 < 20) 
        {
            __reg12 = 20;
        }
        __reg8._y = int((__reg12 - __reg7._height) / 2);
        __reg7.drawButton(__reg9, __reg12);
        if (__reg11) 
        {
            __reg7.drawDropDown(__reg9 - 10, int(__reg12 / 2) - 1, 6, 4);
        }
        __reg7.setEnable(true);
        return __reg7;
    }
    ;
    __reg1.drawButton = function (w, h)
    {
        this.beginFill(16777215, 100);
        this.moveTo(0, 0);
        this.lineTo(0, int(h / 2));
        this.lineTo(w, int(h / 2));
        this.lineTo(w, 0);
        this.endFill();
        var __reg4 = [13421772, 16777215];
        var __reg5 = [100, 100];
        var __reg6 = [0, 255];
        var __reg7 = {a: 0, b: h, c: 0, d: 0 - h, e: 0, f: 0, g: 0, h: int(h / 2), i: 1};
        this.lineStyle();
        this.beginGradientFill("linear", __reg4, __reg5, __reg6, __reg7);
        this.moveTo(0, int(h / 2));
        this.lineTo(0, h);
        this.lineTo(w, h);
        this.lineTo(w, int(h / 2));
        this.endFill();
        this.lineStyle(1, 8947848, 100);
        this.moveTo(0, 0);
        this.lineTo(0, h);
        this.lineTo(w, h);
        this.lineTo(w, 0);
        this.lineTo(0, 0);
    }
    ;
    __reg1.drawDropDown = function (x, y, w, h)
    {
        this.lineStyle();
        this.beginFill(4473924, 100);
        this.moveTo(x + 0, y + 0);
        this.lineTo(x + int(w / 2), y + h);
        this.lineTo(x + w, y + 0);
        this.endFill();
    }
    ;
    __reg1.setText = function (s)
    {
        this.face.text = this.textPrefix + s;
    }
    ;
    __reg1.getText = function ()
    {
        return this.face.text;
    }
    ;
    __reg1.selectValue = function (val)
    {
        if (val == undefined) 
        {
            return false;
        }
        return this.selectValueInternal(val, this.subMenu.firstChild);
    }
    ;
    __reg1.selectValueInternal = function (val, n)
    {
        if (n) 
        {
            for (;;) 
            {
                n = n.nextSibling;
                if (!n) 
                {
                    break;
                }
                if (n.attributes.type == "input") 
                {
                    n.attributes.disp = val == undefined ? "" : val;
                }
                if (n.attributes.value == val) 
                {
                    this.setText(n.attributes.disp);
                    this.value = n.attributes.value;
                    return true;
                }
                if (n.childNodes.length && this.selectValueInternal(val, n.firstChild)) 
                {
                    return true;
                }
            }
        }
        return false;
    }
    ;
    __reg1.isEnable = function ()
    {
        return this.onPress != undefined;
    }
    ;
    __reg1.setEnable = function (b)
    {
        if (b) 
        {
            this._alpha = 100;
            this.face.textColor = 0;
            this.onPress = this._onPress;
            this.onRelease = this._onRelease;
            this.onReleaseOutside = this._onReleaseOutside;
            this.onRollOver = this._onRollOver;
            this.onRollOut = this._onRollOut;
            this.onDragOver = this._onDragOver;
            this.onDragOut = this._onDragOut;
            return;
        }
        this.showBorder(false);
        this._alpha = 25;
        this.face.textColor = 13421772;
        delete this.onPress;
        delete this.onRelease;
        delete this.onReleaseOutside;
        delete this.onRollOver;
        delete this.onRollOut;
        delete this.onDragOver;
        delete this.onDragOut;
    }
    ;
    __reg1.invokeCommand = function ()
    {
        if (this.subMenu && this.subMenu.attributes.cmd == undefined) 
        {
            var __reg2 = {x: 0, y: this._height - 1};
            this.localToGlobal(__reg2);
            com.cegg.GPopupMenu.trackPopupMenu(this.subMenu, __reg2.x, __reg2.y, this);
            if (__reg2) 
            {
                __reg2 = undefined;
            }
            return;
        }
        if (this.subMenu) 
        {
            this.onCommand(this.subMenu.attributes, this.subMenu.firstChild);
            return;
        }
        this.onCommand({cmd: this._name, value: this.value});
    }
    ;
    __reg1.onCommand = function (msg)
    {
        this._parent.onCommand(msg);
    }
    ;
    __reg1.moveFace = function (i)
    {
        this.face._x = this.face._x + i;
        this.face._y = this.face._y + i;
    }
    ;
    __reg1.showBorder = function (b)
    {
        if (b) 
        {
            var __reg3 = this._width - 2;
            var __reg4 = this._height - 2;
            this.createEmptyMovieClip("border", 1);
            with (this.border)
            {
                lineStyle(1, 3381759, 100);
                moveTo(0, 0);
                lineTo(0, __reg4);
                lineTo(__reg3, __reg4);
                lineTo(__reg3, 0);
                lineTo(0, 0);
            }
            if (this._parent.onButtonRollOver != undefined) 
            {
                this._parent.onButtonRollOver(this._name);
            }
            return;
        }
        this.border.removeMovieClip();
        if (this._parent.onButtonRollOut != undefined) 
        {
            this._parent.onButtonRollOut(this._name);
        }
    }
    ;
    __reg1._onPress = function ()
    {
        this.moveFace(1);
    }
    ;
    __reg1._onRelease = function ()
    {
        this.invokeCommand();
        this.moveFace(-1);
    }
    ;
    __reg1._onReleaseOutside = function ()
    {
    }
    ;
    __reg1._onRollOver = function ()
    {
        this.showBorder(true);
    }
    ;
    __reg1._onRollOut = function ()
    {
        this.showBorder(false);
    }
    ;
    __reg1._onDragOver = function ()
    {
        this.showBorder(true);
        this.moveFace(1);
    }
    ;
    __reg1._onDragOut = function ()
    {
        this.showBorder(false);
        this.moveFace(-1);
    }
    ;
    ASSetPropFlags(__reg1, null, 1);
    __reg0.SymbolName = "__Packages.com.cegg.GButton";
    __reg0.SymbolOwner = com.cegg.GButton;
    __reg0.SymbolLinked = Object.registerClass(com.cegg.GButton.SymbolName, com.cegg.GButton.SymbolOwner);
    __reg1.subMenu = undefined;
    __reg1.textPrefix = "";
}#endinitclip

//子图形 11
//  初始化剪辑
#initclip 0

if (!com.cegg.game.mahjong.LobbyBase) 
{
    if (!com) 
    {
        _global.com = new Object();
    }
    if (!com.cegg) 
    {
        _global.com.cegg = new Object();
    }
    if (!com.cegg.game) 
    {
        _global.com.cegg.game = new Object();
    }
    if (!com.cegg.game.mahjong) 
    {
        _global.com.cegg.game.mahjong = new Object();
    }
    (_global.com.cegg.game.mahjong.LobbyBase = function ()
    {
        super();
    }
    ).prototype.__proto__ = MovieClip.prototype;
    __reg0.prototype.__constructor__ = MovieClip;
    var __reg1 = __reg0.prototype;
    __reg0.CompileLOG = function ()
    {
        var __reg2 = com.cegg.game.mahjong.LobbyBase.getLogArray();
        var __reg3 = "";
        var __reg4 = 0;
        if (__reg4 < __reg2.length) 
        {
            for (;;) 
            {
                ++__reg4;
                if (__reg4 >= __reg2.length) 
                {
                    break;
                }
                var __reg5 = __reg2[__reg4];
                var __reg6 = __reg5.un;
                var __reg7 = __reg5.sc.split(",");
                var __reg8 = __reg5.file;
                var __reg9 = int(__reg5.oya);
                var __reg10 = int(__reg5.type);
                var __reg11 = "log=" + __reg8 + "&tw=" + (4 - __reg9) % 4;
                __reg3 = __reg3 + (__reg8.substr(4, 2) + "/" + __reg8.substr(6, 2) + " | <font color=\"#0000FF\"><u><a href=\"asfunction:openlog," + __reg11 + "\">" + com.cegg.game.mahjong.Res.T_LOG + "</a></u></font>" + " | " + com.cegg.game.mahjong.Res.GameTypeToString(__reg10) + " | http://tenhou.net/0/?" + __reg11 + "\n");
                var __reg12 = 0;
                if (__reg12 < __reg7.length) 
                {
                    for (;;) 
                    {
                        ++__reg12;
                        if (__reg12 >= __reg7.length) 
                        {
                            break;
                        }
                        __reg7[__reg12] = Number(__reg7[__reg12]);
                    }
                }
                var __reg13 = 1;
                if ((__reg0 = __reg9) === 0) 
                {
                    __reg13 = __reg13 + (int(__reg6[1].length > 0 && __reg7[0 * 2 + 1] < __reg7[1 * 2 + 1]) + int(__reg6[2].length > 0 && __reg7[0 * 2 + 1] < __reg7[2 * 2 + 1]) + int(__reg6[3].length > 0 && __reg7[0 * 2 + 1] < __reg7[3 * 2 + 1]));
                }
                else if (__reg0 === 1) 
                {
                    __reg13 = __reg13 + (int(__reg6[1].length > 0 && __reg7[0 * 2 + 1] <= __reg7[1 * 2 + 1]) + int(__reg6[2].length > 0 && __reg7[0 * 2 + 1] <= __reg7[2 * 2 + 1]) + int(__reg6[3].length > 0 && __reg7[0 * 2 + 1] <= __reg7[3 * 2 + 1]));
                }
                else if (__reg0 === 2) 
                {
                    __reg13 = __reg13 + (int(__reg6[1].length > 0 && __reg7[0 * 2 + 1] < __reg7[1 * 2 + 1]) + int(__reg6[2].length > 0 && __reg7[0 * 2 + 1] <= __reg7[2 * 2 + 1]) + int(__reg6[3].length > 0 && __reg7[0 * 2 + 1] <= __reg7[3 * 2 + 1]));
                }
                else if (__reg0 === 3) 
                {
                    __reg13 = __reg13 + (int(__reg6[1].length > 0 && __reg7[0 * 2 + 1] < __reg7[1 * 2 + 1]) + int(__reg6[2].length > 0 && __reg7[0 * 2 + 1] < __reg7[2 * 2 + 1]) + int(__reg6[3].length > 0 && __reg7[0 * 2 + 1] <= __reg7[3 * 2 + 1]));
                }
                __reg3 = __reg3 + ("  <b>" + __reg13 + com.cegg.game.mahjong.Res.T_LOGMGB[5] + "</b> ");
                if (__reg7.length == 16) 
                {
                    if (__reg6[0].length > 0) 
                    {
                        __reg3 = __reg3 + (com.cegg.game.mahjong.Util.htmlescape(__reg6[0]) + "(" + com.cegg.game.mahjong.Util.ffmt(__reg7[0 * 2 + 1], 1, false, "+") + "," + com.cegg.game.mahjong.Util.ffmt(__reg7[8 + 0 * 2 + 0], 0, false, "+") + com.cegg.game.mahjong.Res.T_MAI + ") ");
                    }
                    if (__reg6[1].length > 0) 
                    {
                        __reg3 = __reg3 + (com.cegg.game.mahjong.Util.htmlescape(__reg6[1]) + "(" + com.cegg.game.mahjong.Util.ffmt(__reg7[1 * 2 + 1], 1, false, "+") + "," + com.cegg.game.mahjong.Util.ffmt(__reg7[8 + 1 * 2 + 0], 0, false, "+") + com.cegg.game.mahjong.Res.T_MAI + ") ");
                    }
                    if (__reg6[2].length > 0) 
                    {
                        __reg3 = __reg3 + (com.cegg.game.mahjong.Util.htmlescape(__reg6[2]) + "(" + com.cegg.game.mahjong.Util.ffmt(__reg7[2 * 2 + 1], 1, false, "+") + "," + com.cegg.game.mahjong.Util.ffmt(__reg7[8 + 2 * 2 + 0], 0, false, "+") + com.cegg.game.mahjong.Res.T_MAI + ") ");
                    }
                    if (__reg6[3].length > 0) 
                    {
                        __reg3 = __reg3 + (com.cegg.game.mahjong.Util.htmlescape(__reg6[3]) + "(" + com.cegg.game.mahjong.Util.ffmt(__reg7[3 * 2 + 1], 1, false, "+") + "," + com.cegg.game.mahjong.Util.ffmt(__reg7[8 + 3 * 2 + 0], 0, false, "+") + com.cegg.game.mahjong.Res.T_MAI + ")");
                    }
                }
                else 
                {
                    if (__reg6[0].length > 0) 
                    {
                        __reg3 = __reg3 + (com.cegg.game.mahjong.Util.htmlescape(__reg6[0]) + "(" + com.cegg.game.mahjong.Util.ffmt(__reg7[0 * 2 + 1], 1, false, "+") + ") ");
                    }
                    if (__reg6[1].length > 0) 
                    {
                        __reg3 = __reg3 + (com.cegg.game.mahjong.Util.htmlescape(__reg6[1]) + "(" + com.cegg.game.mahjong.Util.ffmt(__reg7[1 * 2 + 1], 1, false, "+") + ") ");
                    }
                    if (__reg6[2].length > 0) 
                    {
                        __reg3 = __reg3 + (com.cegg.game.mahjong.Util.htmlescape(__reg6[2]) + "(" + com.cegg.game.mahjong.Util.ffmt(__reg7[2 * 2 + 1], 1, false, "+") + ") ");
                    }
                    if (__reg6[3].length > 0) 
                    {
                        __reg3 = __reg3 + (com.cegg.game.mahjong.Util.htmlescape(__reg6[3]) + "(" + com.cegg.game.mahjong.Util.ffmt(__reg7[3 * 2 + 1], 1, false, "+") + ")");
                    }
                }
                __reg3 = __reg3 + "\n";
            }
        }
        return __reg3.length ? __reg3 : com.cegg.game.mahjong.Res.T_LOGNOLOG;
    }
    ;
    __reg0.CompileWG = function (a)
    {
        if (a.text.length) 
        {
            var __reg3 = a.text.split("%0D");
            var __reg4 = "";
            var __reg5 = 0;
            if (__reg5 < __reg3.length) 
            {
                for (;;) 
                {
                    ++__reg5;
                    if (__reg5 >= __reg3.length) 
                    {
                        break;
                    }
                    var __reg6 = __reg3[__reg5].split(",");
                    var __reg7 = int(__reg6[3]);
                    var __reg8 = [com.cegg.game.mahjong.Util.htmlescape(com.cegg.LBase64.decode(__reg6[4])), com.cegg.game.mahjong.Util.htmlescape(com.cegg.LBase64.decode(__reg6[7])), com.cegg.game.mahjong.Util.htmlescape(com.cegg.LBase64.decode(__reg6[10])), com.cegg.game.mahjong.Util.htmlescape(com.cegg.LBase64.decode(__reg6[13]))];
                    var __reg9 = [int(__reg6[5]), int(__reg6[8]), int(__reg6[11]), int(__reg6[14])];
                    var __reg10 = [int(__reg6[6]), int(__reg6[9]), int(__reg6[12]), int(__reg6[15])];
                    __reg4 = __reg4 + ("<b>" + __reg6[2] + "</b> | ");
                    __reg4 = __reg4 + com.cegg.game.mahjong.Res.T_WG;
                    __reg4 = __reg4 + (" | " + com.cegg.game.mahjong.Res.GameTypeToString(__reg7));
                    __reg4 = __reg4 + (" | http://tenhou.net/0/?wg=" + __reg6[0]);
                    __reg4 = __reg4 + "\n";
                    if (__reg8[0].length) 
                    {
                        __reg4 = __reg4 + (" <font color=\"#0000FF\"><u><a href=\"asfunction:startwg," + __reg6[0] + ",0\">" + __reg8[0] + "</a></u></font>(" + com.cegg.game.mahjong.Res.T_DANDISP[__reg9[0]] + "R" + __reg10[0] + ")");
                    }
                    if (__reg8[1].length) 
                    {
                        __reg4 = __reg4 + ("   <font color=\"#0000FF\"><u><a href=\"asfunction:startwg," + __reg6[0] + ",1\">" + __reg8[1] + "</a></u></font>(" + com.cegg.game.mahjong.Res.T_DANDISP[__reg9[1]] + "R" + __reg10[1] + ")");
                    }
                    __reg4 = __reg4 + "\n";
                    if (__reg8[2].length) 
                    {
                        __reg4 = __reg4 + (" <font color=\"#0000FF\"><u><a href=\"asfunction:startwg," + __reg6[0] + ",2\">" + __reg8[2] + "</a></u></font>(" + com.cegg.game.mahjong.Res.T_DANDISP[__reg9[2]] + "R" + __reg10[2] + ")");
                    }
                    if (__reg8[3].length) 
                    {
                        __reg4 = __reg4 + ("   <font color=\"#0000FF\"><u><a href=\"asfunction:startwg," + __reg6[0] + ",3\">" + __reg8[3] + "</a></u></font>(" + com.cegg.game.mahjong.Res.T_DANDISP[__reg9[3]] + "R" + __reg10[3] + ")");
                    }
                    __reg4 = __reg4 + "\n\n";
                }
            }
            if (!__reg4.length) 
            {
                return com.cegg.game.mahjong.Res.T_ERRTXT.E1013;
            }
            return __reg4;
        }
        return com.cegg.game.mahjong.Res.T_ERRTXT.E1013;
    }
    ;
    __reg0.getLogArray = function ()
    {
        var __reg2 = [];
        var __reg3 = com.cegg.game.mahjong.SaveData.MJINFO();
        var __reg4 = __reg3.data.logstr.split("\n");
        if (__reg4.length) 
        {
            for (;;) 
            {
                __reg4.shift();
                if (!__reg4.length) 
                {
                    break;
                }
                if (__reg4[0].length) 
                {
                    var __reg5 = __reg4[0].split("&");
                    var __reg6 = {};
                    if (__reg5.length) 
                    {
                        for (;;) 
                        {
                            __reg5.shift();
                            if (!__reg5.length) 
                            {
                                break;
                            }
                            var __reg7 = __reg5[0].split("=");
                            __reg6[__reg7[0]] = _global.unescape(__reg7[1]);
                        }
                    }
                    __reg6.un = [__reg6.un0, __reg6.un1, __reg6.un2, __reg6.un3];
                    __reg2.push(__reg6);
                }
            }
        }
        return __reg2;
    }
    ;
    ASSetPropFlags(__reg1, null, 1);
}#endinitclip

//子图形 12
//  初始化剪辑
#initclip 0

if (!com.cegg.GDialog) 
{
    if (!com) 
    {
        _global.com = new Object();
    }
    if (!com.cegg) 
    {
        _global.com.cegg = new Object();
    }
    (_global.com.cegg.GDialog = function ()
    {
        super();
    }
    ).prototype.__proto__ = MovieClip.prototype;
    __reg0.prototype.__constructor__ = MovieClip;
    var __reg1 = __reg0.prototype;
    __reg1.onLoad = function ()
    {
        ++_global.numPopup;
        Key.addListener(this);
        Stage.addListener(this);
    }
    ;
    __reg1.onUnload = function ()
    {
        Stage.removeListener(this);
        Key.removeListener(this);
        --_global.numPopup;
    }
    ;
    __reg1.removeMovieClip = function ()
    {
        this.onUnload();
        super.removeMovieClip();
    }
    ;
    __reg0.messageBox = function (parent, txt, cmd0, disp0, cmd1, disp1, okvalue)
    {
        if (cmd0 == undefined) 
        {
            cmd0 = "OK";
        }
        if (disp0 == undefined) 
        {
            disp0 = "OK";
        }
        var __reg9 = parent.attachMovie(com.cegg.GDialog.SymbolName, "MessageBox", 1048575);
        __reg9.onKeyDown = __reg9._onKeyDown;
        com.cegg.GClipper.create("Clipper", 0, __reg9, 0, 10);
        var __reg10 = __reg9.createEmptyMovieClip("Body", 1);
        __reg10.createEmptyMovieClip("Caption", 0);
        var __reg11 = __reg10.createEmptyMovieClip("0", 1);
        __reg11.onCommand = function (msg)
        {
            this._parent._parent.onCommand(msg);
        }
        ;
        __reg11.createTextField("txt", 0, 0, 0, 0, 0);
        __reg11.txt.html = true;
        __reg11.txt.multiline = true;
        __reg11.txt.autoSize = "left";
        __reg11.txt.htmlText = txt;
        var __reg12 = com.cegg.GButton.createTextButton(cmd0, disp0, 1, __reg11);
        __reg12._x = int((__reg11.txt._width - __reg12._width) / 2);
        __reg12._y = __reg11.txt._height + 15;
        __reg12.value = okvalue;
        if (cmd1.length) 
        {
            __reg12._x = __reg12._x - 50;
            __reg12 = com.cegg.GButton.createTextButton(cmd1, disp1, 2, __reg11);
            __reg12._x = int((__reg11.txt._width - __reg12._width) / 2);
            __reg12._y = __reg11.txt._height + 15;
            __reg12._x = __reg12._x + 50;
        }
        __reg9.makeFrame(__reg10, 80, 40);
        __reg9.onResize();
        return __reg9;
    }
    ;
    __reg0.textBox = function (parent, txt, message, bMultiline, cmdOk, maxChars)
    {
        var __reg8 = parent.attachMovie(com.cegg.GDialog.SymbolName, "MessageBox", 1048575);
        __reg8._visible = false;
        if (!bMultiline || !cmdOk.length) 
        {
            __reg8.onKeyDown = __reg8._onKeyDown;
        }
        com.cegg.GClipper.create("Clipper", 0, __reg8, 0, 10);
        var __reg9 = __reg8.createEmptyMovieClip("Body", 1);
        __reg9.createEmptyMovieClip("Caption", 0);
        var __reg10 = __reg9.createEmptyMovieClip("0", 1);
        __reg10.onCommand = function (msg)
        {
            this._parent._parent.onCommand(msg);
        }
        ;
        var __reg11 = 0;
        if (message.length) 
        {
            __reg10.createTextField("message", 0, 0, 0, 0, 0);
            __reg10.message.autoSize = "left";
            __reg10.message.html = true;
            __reg10.message.htmlText = message;
            __reg11 = __reg11 + __reg10.message._height;
            __reg11 = __reg11 + 10;
        }
        __reg10.createTextField("txt", 1, 0, __reg11, 400, 200);
        if (bMultiline) 
        {
            __reg10.txt.multiline = true;
            __reg10.txt.wordWrap = true;
            var __reg12 = com.cegg.GScrollVert.createScrollBar("SB_VERT", __reg10.txt, 2);
            __reg12._alpha = 50;
        }
        else 
        {
            __reg10.txt.text = "A";
            __reg10.txt.autoSize = "left";
            var __reg13 = __reg10.txt._height;
            __reg10.txt.autoSize = "none";
            __reg10.txt._height = __reg13;
            __reg10.txt._width = 400;
        }
        __reg10.txt.border = true;
        __reg10.txt.borderColor = 13421772;
        __reg10.txt.text = txt;
        Selection.setFocus(__reg10.txt);
        __reg11 = __reg11 + __reg10.txt._height;
        if (maxChars != undefined) 
        {
            __reg10.txt.maxChars = maxChars;
        }
        var __reg14 = com.cegg.GButton.createTextButton("OK", "OK", 3, __reg10);
        __reg14.cmd = cmdOk;
        __reg14._x = int((__reg10.txt._width - __reg14._width) / 2);
        __reg14._y = __reg11 + 15;
        if (cmdOk.length) 
        {
            __reg14._x = __reg14._x - 50;
            __reg14 = com.cegg.GButton.createTextButton("CANCEL", "CANCEL", 4, __reg10);
            __reg14._x = int((__reg10.txt._width - __reg14._width) / 2);
            __reg14._y = __reg11 + 15;
            __reg14._x = __reg14._x + 50;
        }
        __reg8.makeFrame(__reg9, 10, 20);
        if (cmdOk.length) 
        {
            __reg8.Body[0].txt.type = "input";
        }
        __reg8.onResize();
        __reg8._visible = true;
        return __reg8;
    }
    ;
    __reg1.makeFrame = function (bd, margin_x, margin_y)
    {
        var __reg5 = 0;
        var __reg6 = undefined;
        this.cx = this.cy = 0;
        __reg5 = 0;
        if (__reg6 = bd[__reg5]) 
        {
            for (;;) 
            {
                ++__reg5;
                if (!(__reg6 = bd[__reg5])) 
                {
                    break;
                }
                if (this.cx < __reg6._width) 
                {
                    this.cx = __reg6._x + __reg6._width;
                }
                if (this.cy < __reg6._height) 
                {
                    this.cy = __reg6._y + __reg6._height;
                }
            }
        }
        this.cx = this.cx + margin_x;
        this.cy = this.cy + (margin_y + com.cegg.GDialog.caption_cy);
        if (this.cx < 280) 
        {
            this.cx = 280;
        }
        __reg5 = 0;
        if (__reg6 = bd[__reg5]) 
        {
            for (;;) 
            {
                ++__reg5;
                if (!(__reg6 = bd[__reg5])) 
                {
                    break;
                }
                __reg6._x = int((this.cx - __reg6._width) / 2);
                __reg6._y = int(margin_y / 2) + com.cegg.GDialog.caption_cy;
            }
        }
        bd.clear();
        com.cegg.LGraphics.drawFrame(bd, 0, 0, this.cx, this.cy, 16777215);
        com.cegg.LGraphics.drawShadow(bd, 0, 0, this.cx, this.cy);
        var __reg7 = bd.Caption;
        __reg7.clear();
        com.cegg.LGraphics.drawCaption(__reg7, this.cx, com.cegg.GDialog.caption_cy);
        __reg7.onPress = function ()
        {
            this._parent.startDrag();
        }
        ;
        __reg7.onRelease = function ()
        {
            this._parent.stopDrag();
        }
        ;
        __reg7.onMouseUp = __reg7.onRelease;
        __reg7._focusrect = false;
    }
    ;
    __reg1.onResize = function ()
    {
        var __reg2 = this.Body;
        var __reg3 = Stage.width;
        var __reg4 = Stage.height;
        if (!__reg3) 
        {
            __reg3 = int(_root.width);
        }
        if (!__reg4) 
        {
            __reg4 = int(_root.height);
        }
        var __reg5 = {x: int((__reg3 - __reg2._width) / 2), y: int((__reg4 - __reg2._height) / 2)};
        __reg2.globalToLocal(__reg5);
        __reg2._x = __reg5.x;
        __reg2._y = __reg5.y;
    }
    ;
    __reg1._onKeyDown = function ()
    {
        if (Key.getCode() == Key.ENTER) 
        {
            this.onCommand({cmd: "OK"});
        }
    }
    ;
    __reg1.onCommand = function (msg)
    {
        if (msg.cmd == "OK" && this.Body[0].OK.cmd != undefined) 
        {
            var __reg3 = this.Body[0].txt.text;
            this._parent.onCommand({cmd: this.Body[0].OK.cmd, text: __reg3});
            this.onCommand({cmd: "CANCEL"});
            return undefined;
        }
        if ((__reg0 = msg.cmd) === "CANCEL") 
        {
            Selection.setFocus(null);
            this.removeMovieClip();
            return;
        }
        this._parent.onCommand(msg);
        this.onCommand({cmd: "CANCEL"});
        return;
    }
    ;
    ASSetPropFlags(__reg1, null, 1);
    __reg0.SymbolName = "__Packages.com.cegg.GDialog";
    __reg0.SymbolOwner = com.cegg.GDialog;
    __reg0.SymbolLinked = Object.registerClass(com.cegg.GDialog.SymbolName, com.cegg.GDialog.SymbolOwner);
    __reg0.caption_cy = 12;
}#endinitclip

//子图形 13
//  初始化剪辑
#initclip 0

if (!com.cegg.GScrollVert) 
{
    if (!com) 
    {
        _global.com = new Object();
    }
    if (!com.cegg) 
    {
        _global.com.cegg = new Object();
    }
    (_global.com.cegg.GScrollVert = function ()
    {
        super();
    }
    ).prototype.__proto__ = MovieClip.prototype;
    __reg0.prototype.__constructor__ = MovieClip;
    var __reg1 = __reg0.prototype;
    __reg1.onLoad = function ()
    {
    }
    ;
    __reg1.onUnload = function ()
    {
    }
    ;
    __reg0.createScrollBar = function (name, tf, depth)
    {
        var w = 14;
        var h = tf._height;
        var __reg5 = tf._parent[name];
        if (!__reg5) 
        {
            __reg5 = tf._parent.attachMovie(com.cegg.GScrollVert.SymbolName, name, depth);
            tf.addListener(__reg5);
        }
        __reg5.createEmptyMovieClip("BG", 0);
        with (__reg5.BG)
        {
            lineStyle(1, 13421772, 100);
            beginFill(15790320, 100);
            moveTo(0, 0);
            lineTo(0, h - 1);
            lineTo(w - 1, h - 1);
            lineTo(w - 1, 0);
            endFill();
        }
        var mb = __reg5.createEmptyMovieClip("Grip", 1);
        mb.tf = tf;
        mb.onSetPos = function (x, y)
        {
            if (y < 0) 
            {
                y = 0;
            }
            if (this._parent._height - this._height < y) 
            {
                y = this._parent._height - this._height;
            }
            mb._y = y;
            var __reg4 = y * mb.maxPos / (this._parent._height - this._height);
            mb.tf.scroll = __reg4 + 1;
        }
        ;
        com.cegg.LDrag.enableDrag(mb);
        __reg5.update();
        __reg5._x = tf._x + tf._width - w;
        __reg5._y = tf._y;
        return __reg5;
    }
    ;
    __reg1.drawGrip = function (pos, page, max)
    {
        var __reg5 = this.Grip;
        __reg5.maxPos = max;
        __reg5.view.removeMovieClip();
        if (max) 
        {
            __reg5.createEmptyMovieClip("view", 0);
            var w = this._width - 2;
            var __reg6 = this._height - 2;
            var cy = __reg6 * page / (max + page);
            if (cy < com.cegg.GScrollVert.minGripHeight) 
            {
                cy = com.cegg.GScrollVert.minGripHeight;
            }
            with (__reg5.view)
            {
                lineStyle(1, 8421504, 100);
                beginFill(13421772, 100);
                moveTo(1, 0);
                lineTo(1, cy);
                lineTo(w - 1, cy);
                lineTo(w - 1, 0);
                endFill();
            }
            __reg5._y = (__reg6 - cy) * pos / max;
        }
    }
    ;
    __reg1.update = function ()
    {
        _global.clearInterval(this.intervalID);
        var __reg2 = this.Grip;
        this.drawGrip(__reg2.tf.scroll - 1, __reg2.tf.bottomScroll - __reg2.tf.scroll, __reg2.tf.maxscroll - 1);
    }
    ;
    __reg1.onScroller = function ()
    {
        this.intervalID = _global.setInterval(this, "update", 20);
    }
    ;
    ASSetPropFlags(__reg1, null, 1);
    __reg0.SymbolName = "__Packages.com.cegg.GScrollVert";
    __reg0.SymbolOwner = com.cegg.GScrollVert;
    __reg0.SymbolLinked = Object.registerClass(com.cegg.GScrollVert.SymbolName, com.cegg.GScrollVert.SymbolOwner);
    __reg0.minGripHeight = 8;
    __reg1.intervalID = undefined;
}#endinitclip

//子图形 14
//  初始化剪辑
#initclip 0

if (!com.cegg.MCImageButton) 
{
    if (!com) 
    {
        _global.com = new Object();
    }
    if (!com.cegg) 
    {
        _global.com.cegg = new Object();
    }
    (_global.com.cegg.MCImageButton = function ()
    {
        super();
        this._focusrect = false;
        if (this.bg.length) 
        {
            this.attachMovie(this.bg, "mg", 0);
        }
        this.setImage(this.bn);
    }
    ).prototype.__proto__ = MovieClip.prototype;
    __reg0.prototype.__constructor__ = MovieClip;
    var __reg1 = __reg0.prototype;
    __reg1.onPress = function ()
    {
        this.mc._x = this.mc._y = 1;
    }
    ;
    __reg1.onRelease = function ()
    {
        this.onRollOver();
        this._parent.onCommand(this);
    }
    ;
    __reg1.onReleaseOutside = function ()
    {
        this.setImage(this.bn);
        this.mc._x = this.mc._y = 0;
    }
    ;
    __reg1.onRollOver = function ()
    {
        this.setImage(this.bf);
        this.mc._x = this.mc._y = 0;
    }
    ;
    __reg1.onRollOut = function ()
    {
        this.onReleaseOutside();
    }
    ;
    __reg1.onDragOver = function ()
    {
        this.setImage(this.bf);
        this.mc._x = this.mc._y = 1;
    }
    ;
    __reg1.onDragOut = function ()
    {
        this.onReleaseOutside();
    }
    ;
    __reg1.setImage = function (img)
    {
        this.attachMovie(img, "mc", 1);
    }
    ;
    ASSetPropFlags(__reg1, null, 1);
    __reg0.SymbolName = "__Packages.com.cegg.MCImageButton";
    __reg0.SymbolOwner = com.cegg.MCImageButton;
    __reg0.SymbolLinked = Object.registerClass(com.cegg.MCImageButton.SymbolName, com.cegg.MCImageButton.SymbolOwner);
}#endinitclip

//子图形 15
//  初始化剪辑
#initclip 0

if (!com.cegg.game.mahjong.NakiBox) 
{
    if (!com) 
    {
        _global.com = new Object();
    }
    if (!com.cegg) 
    {
        _global.com.cegg = new Object();
    }
    if (!com.cegg.game) 
    {
        _global.com.cegg.game = new Object();
    }
    if (!com.cegg.game.mahjong) 
    {
        _global.com.cegg.game.mahjong = new Object();
    }
    (_global.com.cegg.game.mahjong.NakiBox = function ()
    {
        super();
        this.c = new Color(this);
        this.dahai.c = new Color(this.dahai);
        var __reg3 = 0;
        var __reg4 = ["reach", "tsumo", "ron", "ryuukyoku", "nuku", "pass"];
        var __reg5 = 0;
        var __reg6 = 0;
        if (__reg6 < __reg4.length) 
        {
            if (!this[__reg4[__reg6]]) 
            {
                for (;;) 
                {
                    ++__reg6;
                    if (__reg6 >= __reg4.length) 
                    {
                        return;
                    }
                    if (this[__reg4[__reg6]]) 
                    {
                        break;
                    }
                }
            }
            this.attachMovie(com.cegg.MCImageButton.SymbolName, String(__reg6), __reg3++, {bg: "btnbg", bn: "btn0" + __reg6, bf: "btn1" + __reg6, _x: 110 * __reg5, _y: 0, cmd: __reg4[__reg6]});
            ++__reg5;
        }
    }
    ).prototype.__proto__ = MovieClip.prototype;
    __reg0.prototype.__constructor__ = MovieClip;
    var __reg1 = __reg0.prototype;
    __reg1.onLoad = function ()
    {
    }
    ;
    __reg1.onUnload = function ()
    {
        this.dahai.c.setTransform({ra: 100, rb: 0, ga: 100, gb: 0, ba: 100, bb: 0, aa: 100, ab: 0});
        delete (this.dahai.c);
    }
    ;
    __reg1.removeMovieClip = function ()
    {
        this.onUnload();
        super.removeMovieClip();
    }
    ;
    __reg1.onCommand = function (msg)
    {
        this._parent.onCommand(msg);
    }
    ;
    __reg1.onEnterFrame = function ()
    {
        ++this.anim;
        var __reg2 = this.anim % 20 / 19;
        __reg2 = (0.5 - __reg2) * 2;
        __reg2 = __reg2 * __reg2 * __reg2 * __reg2;
        __reg2 = __reg2 * __reg2 * 0.40000000596;
        this.c.setTransform({ra: (1 - __reg2) * 100, rb: __reg2 * 255, ga: (1 - __reg2) * 100, gb: __reg2 * 255, ba: (1 - __reg2) * 100, bb: __reg2 * 255, aa: 100, ab: 0});
        this.dahai.c.setTransform({ra: (1 - __reg2) * 100, rb: __reg2 * 255, ga: (1 - __reg2) * 100, gb: __reg2 * 255, ba: (1 - __reg2) * 100, bb: __reg2 * 255, aa: 100, ab: 0});
    }
    ;
    ASSetPropFlags(__reg1, null, 1);
    __reg0.SymbolName = "__Packages.com.cegg.game.mahjong.NakiBox";
    __reg0.SymbolOwner = com.cegg.game.mahjong.NakiBox;
    __reg0.SymbolLinked = Object.registerClass(com.cegg.game.mahjong.NakiBox.SymbolName, com.cegg.game.mahjong.NakiBox.SymbolOwner);
    __reg1.anim = 0;
}#endinitclip

//子图形 16
//  初始化剪辑
#initclip 0

if (!com.cegg.game.mahjong.CenterPanel) 
{
    if (!com) 
    {
        _global.com = new Object();
    }
    if (!com.cegg) 
    {
        _global.com.cegg = new Object();
    }
    if (!com.cegg.game) 
    {
        _global.com.cegg.game = new Object();
    }
    if (!com.cegg.game.mahjong) 
    {
        _global.com.cegg.game.mahjong = new Object();
    }
    (_global.com.cegg.game.mahjong.CenterPanel = function ()
    {
        super();
        this.ten = [0, 0, 0, 0];
        this.chip = undefined;
        this.sx = ["C", "C", "C", "C"];
        this.nHoverCounter = 0;
        var __reg3 = 0;
        this.attachMovie("bgc", "bg", __reg3++, {_x: 0, _y: 0});
        var __reg4 = 88;
        var __reg5 = 54;
        this.createEmptyMovieClip("kyokuba", __reg3++);
        this.kyokuba._x = __reg4;
        this.kyokuba._y = __reg5 + 18;
        this.createEmptyMovieClip("kaze0", __reg3++);
        this.createEmptyMovieClip("kaze1", __reg3++);
        this.createEmptyMovieClip("kaze2", __reg3++);
        this.createEmptyMovieClip("kaze3", __reg3++);
        this.kaze0._x = __reg4 - 10 - 36;
        this.kaze0._y = __reg5 + 45;
        this.kaze0._rotation = -90 * 0;
        this.kaze1._x = __reg4 + 50;
        this.kaze1._y = __reg5 + 21 + 39;
        this.kaze1._rotation = -90 * 1;
        this.kaze2._x = __reg4 + 10 + 36;
        this.kaze2._y = __reg5 - 15;
        this.kaze2._rotation = -90 * 2;
        this.kaze3._x = __reg4 - 50;
        this.kaze3._y = __reg5 + 9 - 39;
        this.kaze3._rotation = -90 * 3;
        this.createEmptyMovieClip("name0", __reg3++);
        this.name0.createEmptyMovieClip("0", 0);
        this.name0.c = new Color(this.name0);
        this.createEmptyMovieClip("name1", __reg3++);
        this.name1.createEmptyMovieClip("0", 0);
        this.name1.c = new Color(this.name1);
        this.createEmptyMovieClip("name2", __reg3++);
        this.name2.createEmptyMovieClip("0", 0);
        this.name2.c = new Color(this.name2);
        this.createEmptyMovieClip("name3", __reg3++);
        this.name3.createEmptyMovieClip("0", 0);
        this.name3.c = new Color(this.name3);
        this.name0._x = __reg4 - 10 - 8;
        this.name0._y = __reg5 + 58;
        this.name0._rotation = -90 * 0;
        this.name1._x = __reg4 + 64;
        this.name1._y = __reg5 + 21 - 50;
        this.name1._rotation = -90 * 0;
        this.name2._x = __reg4 + 10 + 8;
        this.name2._y = __reg5 - 29;
        this.name2._rotation = -90 * 2;
        this.name3._x = __reg4 - 65;
        this.name3._y = __reg5 + 9 + 50;
        this.name3._rotation = -90 * 2;
        this.createEmptyMovieClip("ten0", __reg3++);
        this.createEmptyMovieClip("ten1", __reg3++);
        this.createEmptyMovieClip("ten2", __reg3++);
        this.createEmptyMovieClip("ten3", __reg3++);
        this.ten0._x = __reg4 - 24 + 4;
        this.ten0._y = __reg5 + 40 + 4;
        this.ten0._rotation = -90 * 0;
        this.ten1._x = __reg4 + 46 + 4;
        this.ten1._y = __reg5 + 34 + 0;
        this.ten1._rotation = -90 * 1;
        this.ten2._x = __reg4 + 24 - 4;
        this.ten2._y = __reg5 - 11 - 4;
        this.ten2._rotation = -90 * 2;
        this.ten3._x = __reg4 - 47 - 4;
        this.ten3._y = __reg5 - 4 - 0;
        this.ten3._rotation = -90 * 3;
        this.createEmptyMovieClip("dan0", __reg3++);
        this.createEmptyMovieClip("dan1", __reg3++);
        this.createEmptyMovieClip("dan2", __reg3++);
        this.createEmptyMovieClip("dan3", __reg3++);
        this.dan0._y = __reg5 + 49 - 7;
        this.dan0._rotation = -90 * 0;
        this.dan1._x = __reg4 + 55 - 7;
        this.dan1._rotation = -90 * 1;
        this.dan2._y = __reg5 - 20 + 7;
        this.dan2._rotation = -90 * 2;
        this.dan3._x = __reg4 - 56 + 7;
        this.dan3._rotation = -90 * 3;
        this.onEnterFrame = this.onEnterFrame_onHover;
    }
    ).prototype.__proto__ = MovieClip.prototype;
    __reg0.prototype.__constructor__ = MovieClip;
    var __reg1 = __reg0.prototype;
    __reg1.onEnterFrame_onHover = function ()
    {
        var __reg2 = 0 <= this._xmouse && (this._xmouse < this._width && (0 <= this._ymouse && this._ymouse < this._height));
        if (!__reg2 && !this.nHoverCounter) 
        {
            return undefined;
        }
        if (__reg2) 
        {
            if (this.nHoverCounter) 
            {
                this.nHoverCounter = 15;
            }
            else 
            {
                if (this.name0._visible) 
                {
                    this.dan0._visible = false;
                }
                if (this.name1._visible) 
                {
                    this.dan1._visible = false;
                }
                if (this.name2._visible) 
                {
                    this.dan2._visible = false;
                }
                if (this.name3._visible) 
                {
                    this.dan3._visible = false;
                }
                this.nHoverCounter = 15;
                this.updateTenDigits();
            }
            return;
        }
        if (--this.nHoverCounter) 
        {
            return;
        }
        if (this.name0._visible) 
        {
            this.dan0._visible = true;
        }
        if (this.name1._visible) 
        {
            this.dan1._visible = true;
        }
        if (this.name2._visible) 
        {
            this.dan2._visible = true;
        }
        if (this.name3._visible) 
        {
            this.dan3._visible = true;
        }
        this.updateTenDigits();
    }
    ;
    __reg1.setVisibleSanma = function (b0, b1, b2, b3)
    {
        this.name0._visible = this.ten0._visible = this.kaze0._visible = this.dan0._visible = b0;
        this.name1._visible = this.ten1._visible = this.kaze1._visible = this.dan1._visible = b1;
        this.name2._visible = this.ten2._visible = this.kaze2._visible = this.dan2._visible = b2;
        this.name3._visible = this.ten3._visible = this.kaze3._visible = this.dan3._visible = b3;
    }
    ;
    __reg1.setPlayerNameColor = function (who, bConnected)
    {
        var __reg4 = {ra: 100, rb: 0, ga: 100, gb: 0, ba: 100, bb: 0, aa: 90, ab: 0};
        var __reg5 = {ra: 100, rb: 0, ga: 0, gb: 0, ba: 0, bb: 0, aa: 50, ab: 0};
        this["name" + who].c.setTransform(bConnected ? __reg4 : __reg5);
    }
    ;
    __reg1.showDan = function (dan, rc)
    {
        this.dan0[0].removeMovieClip();
        this.dan0[1].removeMovieClip();
        this.dan1[0].removeMovieClip();
        this.dan1[1].removeMovieClip();
        this.dan2[0].removeMovieClip();
        this.dan2[1].removeMovieClip();
        this.dan3[0].removeMovieClip();
        this.dan3[1].removeMovieClip();
        if (rc != undefined) 
        {
            rc[0] = com.cegg.game.mahjong.Util.RatingClassDisp(rc[0], "");
            rc[1] = com.cegg.game.mahjong.Util.RatingClassDisp(rc[1], "");
            rc[2] = com.cegg.game.mahjong.Util.RatingClassDisp(rc[2], "");
            rc[3] = com.cegg.game.mahjong.Util.RatingClassDisp(rc[3], "");
            this.dan0.attachMovie("rc" + rc[0].substr(0, 1), "0", 0, {_x: 4, _y: 4});
            this.dan1.attachMovie("rc" + rc[1].substr(0, 1), "0", 0, {_x: 4, _y: 4});
            this.dan2.attachMovie("rc" + rc[2].substr(0, 1), "0", 0, {_x: 4, _y: 4});
            this.dan3.attachMovie("rc" + rc[3].substr(0, 1), "0", 0, {_x: 4, _y: 4});
            this.dan0.attachMovie("rc" + rc[0].substr(1, 1), "1", 1, {_x: 4 + 9, _y: 4});
            this.dan1.attachMovie("rc" + rc[1].substr(1, 1), "1", 1, {_x: 4 + 9, _y: 4});
            this.dan2.attachMovie("rc" + rc[2].substr(1, 1), "1", 1, {_x: 4 + 9, _y: 4});
            this.dan3.attachMovie("rc" + rc[3].substr(1, 1), "1", 1, {_x: 4 + 9, _y: 4});
            return;
        }
        this.dan0.attachMovie("dan" + dan[0], "0", 0);
        this.dan1.attachMovie("dan" + dan[1], "0", 0);
        this.dan2.attachMovie("dan" + dan[2], "0", 0);
        this.dan3.attachMovie("dan" + dan[3], "0", 0);
    }
    ;
    __reg1.showGoldClass = function (gold)
    {
        this.dan0[0].removeMovieClip();
        this.dan0[1].removeMovieClip();
        this.dan1[0].removeMovieClip();
        this.dan1[1].removeMovieClip();
        this.dan2[0].removeMovieClip();
        this.dan2[1].removeMovieClip();
        this.dan3[0].removeMovieClip();
        this.dan3[1].removeMovieClip();
        var __reg3 = [com.cegg.game.mahjong.Util.GoldToClass(gold[0]), com.cegg.game.mahjong.Util.GoldToClass(gold[1]), com.cegg.game.mahjong.Util.GoldToClass(gold[2]), com.cegg.game.mahjong.Util.GoldToClass(gold[3])];
        this.dan0.attachMovie("rc" + __reg3[0].substr(0, 1), "0", 0, {_x: 4, _y: 4});
        this.dan0.attachMovie("rc" + __reg3[0].substr(1, 1), "1", 1, {_x: 4 + 9, _y: 4});
        this.dan1.attachMovie("rc" + __reg3[1].substr(0, 1), "0", 0, {_x: 4, _y: 4});
        this.dan1.attachMovie("rc" + __reg3[1].substr(1, 1), "1", 1, {_x: 4 + 9, _y: 4});
        this.dan2.attachMovie("rc" + __reg3[2].substr(0, 1), "0", 0, {_x: 4, _y: 4});
        this.dan2.attachMovie("rc" + __reg3[2].substr(1, 1), "1", 1, {_x: 4 + 9, _y: 4});
        this.dan3.attachMovie("rc" + __reg3[3].substr(0, 1), "0", 0, {_x: 4, _y: 4});
        this.dan3.attachMovie("rc" + __reg3[3].substr(1, 1), "1", 1, {_x: 4 + 9, _y: 4});
    }
    ;
    __reg1.showKazeActivate = function (kaze, whoActivate)
    {
        this.kaze0.attachMovie("kaze" + kaze[0] * 2, "0", 0);
        this.kaze1.attachMovie("kaze" + kaze[1] * 2, "0", 0);
        this.kaze2.attachMovie("kaze" + kaze[2] * 2, "0", 0);
        this.kaze3.attachMovie("kaze" + kaze[3] * 2, "0", 0);
        if (whoActivate != undefined) 
        {
            this["kaze" + whoActivate].attachMovie("kaze" + (kaze[whoActivate] * 2 + 1), "0", 0);
        }
    }
    ;
    __reg1.printKyokuBaNagare = function (kyoku, honba, nagare)
    {
        if (kyoku != undefined) 
        {
            this.kyokuba.createEmptyMovieClip("ky", 0);
            com.cegg.game.mahjong.Util.printDigit(this.kyokuba.ky, "kyokudigit", 14, String((int(kyoku / 4) % 4 + 4) * 100 + kyoku % 4 * 10 + 8));
        }
        if (honba != undefined) 
        {
            this.kyokuba.createEmptyMovieClip("b1", 2);
            com.cegg.game.mahjong.Util.printDigit(this.kyokuba.b1, "badigit", 7, String(honba));
        }
        this.kyokuba.createEmptyMovieClip("b3", 4);
        com.cegg.game.mahjong.Util.printDigit(this.kyokuba.b3, "badigit", 7, String(nagare));
        this.kyokuba.attachMovie("badigit10", "b0", 1);
        this.kyokuba.attachMovie("badigit11", "b2", 3);
        this.kyokuba.ky._x = 0 - int(this.kyokuba.ky._width / 2);
        this.kyokuba.ky._y = -19;
        var __reg5 = 0 - int((this.kyokuba.b0._width + this.kyokuba.b1._width + this.kyokuba.b2._width + this.kyokuba.b3._width) / 2);
        this.kyokuba.b0._x = __reg5;
        __reg5 = __reg5 + this.kyokuba.b0._width;
        this.kyokuba.b1._x = __reg5;
        __reg5 = __reg5 + this.kyokuba.b1._width;
        this.kyokuba.b2._x = __reg5;
        __reg5 = __reg5 + this.kyokuba.b2._width;
        this.kyokuba.b3._x = __reg5;
        __reg5 = __reg5 + this.kyokuba.b3._width;
        this.kyokuba.b1._y = 2;
        this.kyokuba.b3._y = 2;
    }
    ;
    __reg1.updateTenDigits = function ()
    {
        var __reg2 = 0;
        if (int(this.ten[__reg2]) < int(this.ten[1])) 
        {
            __reg2 = 1;
        }
        if (int(this.ten[__reg2]) < int(this.ten[2])) 
        {
            __reg2 = 2;
        }
        if (int(this.ten[__reg2]) < int(this.ten[3])) 
        {
            __reg2 = 3;
        }
        if (this.nHoverCounter) 
        {
            if (this.chip.length == 4) 
            {
                com.cegg.game.mahjong.CenterPanel.printTenDigit(this.ten0, this.ten[0], this.ten[__reg2] == this.ten[0], this.chip[0], this.sx[0], false);
                com.cegg.game.mahjong.CenterPanel.printTenDigit(this.ten1, this.ten[1] - this.ten[0], this.ten[__reg2] == this.ten[1], this.chip[1], this.sx[1], true);
                com.cegg.game.mahjong.CenterPanel.printTenDigit(this.ten2, this.ten[2] - this.ten[0], this.ten[__reg2] == this.ten[2], this.chip[2], this.sx[2], true);
                com.cegg.game.mahjong.CenterPanel.printTenDigit(this.ten3, this.ten[3] - this.ten[0], this.ten[__reg2] == this.ten[3], this.chip[3], this.sx[3], true);
            }
            else 
            {
                com.cegg.game.mahjong.CenterPanel.printTenDigit(this.ten0, this.ten[0], this.ten[__reg2] == this.ten[0], undefined, this.sx[0], false);
                com.cegg.game.mahjong.CenterPanel.printTenDigit(this.ten1, this.ten[1] - this.ten[0], this.ten[__reg2] == this.ten[1], undefined, this.sx[1], true);
                com.cegg.game.mahjong.CenterPanel.printTenDigit(this.ten2, this.ten[2] - this.ten[0], this.ten[__reg2] == this.ten[2], undefined, this.sx[2], true);
                com.cegg.game.mahjong.CenterPanel.printTenDigit(this.ten3, this.ten[3] - this.ten[0], this.ten[__reg2] == this.ten[3], undefined, this.sx[3], true);
            }
        }
        else 
        {
            com.cegg.game.mahjong.CenterPanel.printTenDigit(this.ten0, this.ten[0], this.ten[__reg2] == this.ten[0], undefined, this.sx[0], false);
            com.cegg.game.mahjong.CenterPanel.printTenDigit(this.ten1, this.ten[1], this.ten[__reg2] == this.ten[1], undefined, this.sx[1], false);
            com.cegg.game.mahjong.CenterPanel.printTenDigit(this.ten2, this.ten[2], this.ten[__reg2] == this.ten[2], undefined, this.sx[2], false);
            com.cegg.game.mahjong.CenterPanel.printTenDigit(this.ten3, this.ten[3], this.ten[__reg2] == this.ten[3], undefined, this.sx[3], false);
        }
        this.dan0._x = this.ten0._x + this.ten0._width - 2;
        this.dan1._y = this.ten1._y - this.ten1._height + 2;
        this.dan2._x = this.ten2._x - this.ten2._width + 1;
        this.dan3._y = this.ten3._y + this.ten3._height - 2;
    }
    ;
    __reg0.printTenDigit = function (mc, ten, btop, chip, sexuality, bShowDiff)
    {
        mc.clear();
        mc[0].removeMovieClip();
        mc[1].removeMovieClip();
        mc[2].removeMovieClip();
        mc[3].removeMovieClip();
        mc[4].removeMovieClip();
        mc[5].removeMovieClip();
        mc[6].removeMovieClip();
        mc[7].removeMovieClip();
        var __reg8 = [8, 6, 8, 7, 8, 8, 8, 8, 8, 8];
        var __reg9 = 0;
        var __reg10 = (bShowDiff && ten > 0 ? "+" : "") + String(ten);
        if (chip != undefined) 
        {
            __reg10 = __reg10 + (" " + (chip <= 0 ? "" : "+") + String(chip));
        }
        var __reg12 = 0;
        var __reg11 = 0;
        if (__reg11 < __reg10.length) 
        {
            for (;;) 
            {
                ++__reg11;
                if (__reg11 >= __reg10.length) 
                {
                    break;
                }
                var __reg13 = __reg10.charCodeAt(__reg11);
                if (__reg13 != 20) 
                {
                    mc.attachMovie("tendigit_" + __reg13, String(__reg12), __reg12);
                    mc[__reg12]._x = __reg9;
                    ++__reg12;
                }
                if ((__reg0 = __reg13) === 20) 
                {
                    __reg9 = __reg9 + 5;
                }
                else if (__reg0 === 45) 
                {
                    __reg9 = __reg9 + 6;
                }
                else if (__reg0 === 49) 
                {
                    __reg9 = __reg9 + 6;
                }
                else if (__reg0 === 51) 
                {
                    __reg9 = __reg9 + 7;
                }
                else 
                {
                    __reg9 = __reg9 + 8;
                }
            }
        }
        if (chip != undefined) 
        {
            __reg9 = __reg9 + 5;
            return;
        }
        mc.attachMovie("tendigit__00", String(__reg11), __reg11);
        mc[__reg11]._x = __reg9 + 1;
        mc[__reg11]._y = 4;
        __reg9 = __reg9 + mc[__reg11]._width;
        ++__reg11;
        if (bShowDiff) 
        {
            return;
        }
        var __reg14 = mc._rotation;
        with (mc)
        {
            _rotation = 0;
            clear();
            var __reg15 = sexuality == "M" ? 255 : (sexuality == "F" ? 11141120 : 43520);
            if (btop) 
            {
                com.cegg.game.mahjong.CenterPanel.lineHG(mc, _width - 17, 2, 13, __reg15, 16777215);
            }
            else 
            {
                com.cegg.game.mahjong.CenterPanel.line(mc, _width - 17, 2, _width - 4, 2, __reg15, 50);
            }
            _rotation = __reg14;
        }
    }
    ;
    __reg0.line = function (mc, x0, y0, x1, y1, c, a)
    {
        mc.lineStyle(1, c, a);
        mc.moveTo(x0, y0);
        mc.lineTo(x1, y1);
    }
    ;
    __reg0.lineHG = function (mc, x, y, w, c0, c1)
    {
        var __reg8 = 1;
        var __reg9 = [c0, c1];
        var __reg10 = [100, 100];
        var __reg11 = [0, 255];
        var __reg12 = {a: w, b: 0, c: 0, d: 0, e: 0 - x, f: 0, g: x + int(w / 2), h: 0, i: 1};
        mc.lineStyle();
        mc.beginGradientFill("linear", __reg9, __reg10, __reg11, __reg12);
        mc.moveTo(x, y);
        mc.lineTo(x, y + __reg8);
        mc.lineTo(x + w, y + __reg8);
        mc.lineTo(x + w, y);
        mc.endFill();
    }
    ;
    ASSetPropFlags(__reg1, null, 1);
    __reg0.SymbolName = "__Packages.com.cegg.game.mahjong.CenterPanel";
    __reg0.SymbolOwner = com.cegg.game.mahjong.CenterPanel;
    __reg0.SymbolLinked = Object.registerClass(com.cegg.game.mahjong.CenterPanel.SymbolName, com.cegg.game.mahjong.CenterPanel.SymbolOwner);
}#endinitclip

//子图形 17
//  初始化剪辑
#initclip 0

if (!com.cegg.game.mahjong.LogManager) 
{
    if (!com) 
    {
        _global.com = new Object();
    }
    if (!com.cegg) 
    {
        _global.com.cegg = new Object();
    }
    if (!com.cegg.game) 
    {
        _global.com.cegg.game = new Object();
    }
    if (!com.cegg.game.mahjong) 
    {
        _global.com.cegg.game.mahjong = new Object();
    }
    (_global.com.cegg.game.mahjong.LogManager = function ()
    {
        super();
        this.openMethod = com.cegg.game.mahjong.SaveData.MJSTATUS().data.logopen;
        if (this.openMethod == undefined) 
        {
            this.openMethod = "opt";
        }
        var __reg3 = 540;
        var __reg4 = 280;
        var __reg5 = 0;
        this.createEmptyMovieClip("caption", __reg5++);
        com.cegg.GButton.createTextButton("CLEAR", com.cegg.game.mahjong.Res.T_LOGMGCLEAR, __reg5++, this);
        com.cegg.GButton.createTextButton("CLOSE", com.cegg.game.mahjong.Res.T_CLOSE, __reg5++, this);
        com.cegg.GButton.createTextButton("OPENTYPE", undefined, __reg5++, this, (new XML(com.cegg.game.mahjong.Res.T_LOGMGOPENTYPE)).firstChild);
        this.createTextField("tf", __reg5++, 0, 0, 0, 0);
        this.attachMovie(com.cegg.MCTab.SymbolName, "tab", __reg5++, {_y: 13});
        with (this.tf)
        {
            html = true;
        }
        this.tab.initTab(com.cegg.game.mahjong.Res.T_TAB[4]);
        this.tab.onChanged = function (sel)
        {
            this._parent.onCommand({cmd: sel});
        }
        ;
        this.tab.selectTab();
        this.OPENTYPE.selectValue(this.openMethod);
        this.CLOSE._x = __reg3 - this.CLOSE._width;
        this.CLEAR._x = this.CLOSE._x - this.CLEAR._width;
        this.OPENTYPE._x = this.CLEAR._x - this.OPENTYPE._width;
        this.OPENTYPE._y = this.CLEAR._y = this.CLOSE._y = 14;
        this.tf._y = this.tab._y + this.tab._height;
        this.tf._width = __reg3 - 1;
        this.tf._height = __reg4 - this.tf._y - 1;
        com.cegg.GScrollVert.createScrollBar("SB_VERT", this.tf, __reg5++);
        this.SB_VERT._alpha = 50;
        com.cegg.LGraphics.drawCaption(this.caption, __reg3, 12);
        com.cegg.LGraphics.drawFrame(this, 0, 0, __reg3, __reg4, 16777215);
        com.cegg.LGraphics.drawShadow(this, 0, 0, __reg3, __reg4, 4);
        this.lineStyle(1, 13421772, 100);
        this.moveTo(0, this.tab._y + this.tab._height - 3);
        this.lineTo(__reg3, this.tab._y + this.tab._height - 3);
        this.caption._focusrect = false;
        this.caption.onPress = function ()
        {
            this._parent.startDrag();
        }
        ;
        this.caption.onMouseUp = this.caption.onRelease = function ()
        {
            this._parent.stopDrag();
        }
        ;
        this._x = int(Stage.width - __reg3) / 2;
        this._y = int(Stage.height - __reg4) / 2;
        this.update();
    }
    ).prototype.__proto__ = MovieClip.prototype;
    __reg0.prototype.__constructor__ = MovieClip;
    var __reg1 = __reg0.prototype;
    __reg1.update = function ()
    {
        var __reg2 = "";
        var __reg3 = com.cegg.game.mahjong.LogManager.getLogArray();
        if ((__reg0 = this.mode) === "BROWSE") 
        {
            var __reg4 = 0;
            if (__reg4 < __reg3.length) 
            {
                for (;;) 
                {
                    ++__reg4;
                    if (__reg4 >= __reg3.length) 
                    {
                        break;
                    }
                    var __reg5 = __reg3[__reg4];
                    var __reg6 = __reg5.un;
                    var __reg7 = __reg5.sc.split(",");
                    var __reg8 = __reg5.file;
                    var __reg9 = int(__reg5.oya);
                    var __reg10 = int(__reg5.type);
                    if (this.openMethod == "opt") 
                    {
                        __reg11 = "asfunction:" + this.openMethod + ",log=" + __reg8 + "&tw=" + (4 - __reg9) % 4;
                    }
                    else 
                    {
                        var __reg11 = "javascript:" + this.openMethod + "(\'" + __reg8 + "&tw=" + (4 - __reg9) % 4 + "\');";
                    }
                    __reg2 = __reg2 + ("<a href=\"asfunction:del," + __reg4 + "\">&nbsp;" + com.cegg.game.mahjong.Res.T_BATSU + "&nbsp;</a>" + "[" + __reg8.substr(4, 2) + "/" + __reg8.substr(6, 2) + "] " + "<font color=\"#0000FF\"><u><a href=\"" + __reg11 + "\">" + com.cegg.game.mahjong.Res.T_LOGPLAY + "</a></u></font>" + "&nbsp;");
                    var __reg12 = 0;
                    if (__reg12 < __reg7.length) 
                    {
                        for (;;) 
                        {
                            ++__reg12;
                            if (__reg12 >= __reg7.length) 
                            {
                                break;
                            }
                            __reg7[__reg12] = Number(__reg7[__reg12]);
                        }
                    }
                    if (__reg7.length == 16) 
                    {
                        if (__reg6[0].length > 0) 
                        {
                            __reg2 = __reg2 + (com.cegg.game.mahjong.Util.htmlescape(__reg6[0]) + "(" + (__reg7[0 * 2 + 1] <= 0 ? "" : "+") + com.cegg.game.mahjong.Util.ffmt(__reg7[0 * 2 + 1], 1, false) + "," + com.cegg.game.mahjong.Util.ffmt(__reg7[8 + 0 * 2 + 0], 0, false, "+") + com.cegg.game.mahjong.Res.T_MAI + ") ");
                        }
                        if (__reg6[1].length > 0) 
                        {
                            __reg2 = __reg2 + (com.cegg.game.mahjong.Util.htmlescape(__reg6[1]) + "(" + (__reg7[1 * 2 + 1] <= 0 ? "" : "+") + com.cegg.game.mahjong.Util.ffmt(__reg7[1 * 2 + 1], 1, false) + "," + com.cegg.game.mahjong.Util.ffmt(__reg7[8 + 1 * 2 + 0], 0, false, "+") + com.cegg.game.mahjong.Res.T_MAI + ") ");
                        }
                        if (__reg6[2].length > 0) 
                        {
                            __reg2 = __reg2 + (com.cegg.game.mahjong.Util.htmlescape(__reg6[2]) + "(" + (__reg7[2 * 2 + 1] <= 0 ? "" : "+") + com.cegg.game.mahjong.Util.ffmt(__reg7[2 * 2 + 1], 1, false) + "," + com.cegg.game.mahjong.Util.ffmt(__reg7[8 + 2 * 2 + 0], 0, false, "+") + com.cegg.game.mahjong.Res.T_MAI + ") ");
                        }
                        if (__reg6[3].length > 0) 
                        {
                            __reg2 = __reg2 + (com.cegg.game.mahjong.Util.htmlescape(__reg6[3]) + "(" + (__reg7[3 * 2 + 1] <= 0 ? "" : "+") + com.cegg.game.mahjong.Util.ffmt(__reg7[3 * 2 + 1], 1, false) + "," + com.cegg.game.mahjong.Util.ffmt(__reg7[8 + 3 * 2 + 0], 0, false, "+") + com.cegg.game.mahjong.Res.T_MAI + ")");
                        }
                    }
                    else 
                    {
                        if (__reg6[0].length > 0) 
                        {
                            __reg2 = __reg2 + (com.cegg.game.mahjong.Util.htmlescape(__reg6[0]) + "(" + (__reg7[0 * 2 + 1] <= 0 ? "" : "+") + com.cegg.game.mahjong.Util.ffmt(__reg7[0 * 2 + 1], 1, false) + ") ");
                        }
                        if (__reg6[1].length > 0) 
                        {
                            __reg2 = __reg2 + (com.cegg.game.mahjong.Util.htmlescape(__reg6[1]) + "(" + (__reg7[1 * 2 + 1] <= 0 ? "" : "+") + com.cegg.game.mahjong.Util.ffmt(__reg7[1 * 2 + 1], 1, false) + ") ");
                        }
                        if (__reg6[2].length > 0) 
                        {
                            __reg2 = __reg2 + (com.cegg.game.mahjong.Util.htmlescape(__reg6[2]) + "(" + (__reg7[2 * 2 + 1] <= 0 ? "" : "+") + com.cegg.game.mahjong.Util.ffmt(__reg7[2 * 2 + 1], 1, false) + ") ");
                        }
                        if (__reg6[3].length > 0) 
                        {
                            __reg2 = __reg2 + (com.cegg.game.mahjong.Util.htmlescape(__reg6[3]) + "(" + (__reg7[3 * 2 + 1] <= 0 ? "" : "+") + com.cegg.game.mahjong.Util.ffmt(__reg7[3 * 2 + 1], 1, false) + ")");
                        }
                    }
                    __reg2 = __reg2 + "\n";
                }
            }
        }
        else if (__reg0 === "BLOG") 
        {
            var __reg13 = int(__reg3.length);
            var __reg14 = [0, 0, 0, 0];
            var __reg15 = 0;
            var __reg16 = 0;
            __reg4 = 0;
            if (__reg4 < __reg3.length) 
            {
                for (;;) 
                {
                    ++__reg4;
                    if (__reg4 >= __reg3.length) 
                    {
                        break;
                    }
                    var __reg17 = __reg3[__reg4];
                    if (__reg17.sc != undefined) 
                    {
                        var __reg18 = __reg17.sc.split(",");
                        var __reg19 = 0;
                        if (__reg19 < __reg18.length) 
                        {
                            for (;;) 
                            {
                                ++__reg19;
                                if (__reg19 >= __reg18.length) 
                                {
                                    break;
                                }
                                __reg18[__reg19] = Number(__reg18[__reg19]);
                            }
                        }
                        __reg16 = __reg16 + __reg18[1];
                        var __reg20 = 0;
                        if (__reg18[3] > __reg18[1]) 
                        {
                            ++__reg20;
                        }
                        if (__reg18[5] > __reg18[1]) 
                        {
                            ++__reg20;
                        }
                        if (__reg18[7] > __reg18[1]) 
                        {
                            ++__reg20;
                        }
                        ++__reg14[__reg20];
                        __reg15 = __reg15 + (__reg20 + 1);
                    }
                }
            }
            __reg2 = __reg2 + (com.cegg.game.mahjong.Res.T_LOGMGB[0] + "\n");
            __reg2 = __reg2 + "--------------------------\n";
            __reg2 = __reg2 + (com.cegg.game.mahjong.Res.T_LOGMGB[1] + __reg13 + "\n");
            __reg2 = __reg2 + (com.cegg.game.mahjong.Res.T_LOGMGB[2] + com.cegg.game.mahjong.Util.ffmt(__reg16, 1, false, "+") + "\n");
            __reg2 = __reg2 + (com.cegg.game.mahjong.Res.T_LOGMGB[3] + com.cegg.game.mahjong.Util.ffmt(__reg13 ? __reg16 / __reg13 : 0, 2, false, "+") + "\n");
            __reg2 = __reg2 + (com.cegg.game.mahjong.Res.T_LOGMGB[4] + __reg14[0] + "-" + __reg14[1] + "-" + __reg14[2] + "-" + __reg14[3] + "-" + com.cegg.game.mahjong.Util.ffmt(__reg13 ? __reg15 / (__reg14[0] + __reg14[1] + __reg14[2] + __reg14[3]) : 0, 2, false) + "\n");
            __reg2 = __reg2 + "--------------------------\n";
            __reg4 = 0;
            if (__reg4 < __reg3.length) 
            {
                for (;;) 
                {
                    ++__reg4;
                    if (__reg4 >= __reg3.length) 
                    {
                        break;
                    }
                    var __reg21 = __reg3[__reg4];
                    var __reg22 = __reg21.un;
                    var __reg23 = __reg21.sc.split(",");
                    var __reg24 = __reg21.file;
                    var __reg25 = int(__reg21.oya);
                    var __reg26 = int(__reg21.type);
                    __reg2 = __reg2 + (com.cegg.game.mahjong.Res.T_BRA + (__reg4 + 1) + com.cegg.game.mahjong.Res.T_CKET);
                    var __reg27 = 0;
                    if (__reg27 < __reg23.length) 
                    {
                        for (;;) 
                        {
                            ++__reg27;
                            if (__reg27 >= __reg23.length) 
                            {
                                break;
                            }
                            __reg23[__reg27] = Number(__reg23[__reg27]);
                        }
                    }
                    var __reg28 = 1;
                    if ((__reg0 = __reg25) === 0) 
                    {
                        __reg28 = __reg28 + (int(__reg22[1].length > 0 && __reg23[0 * 2 + 1] < __reg23[1 * 2 + 1]) + int(__reg22[2].length > 0 && __reg23[0 * 2 + 1] < __reg23[2 * 2 + 1]) + int(__reg22[3].length > 0 && __reg23[0 * 2 + 1] < __reg23[3 * 2 + 1]));
                    }
                    else if (__reg0 === 1) 
                    {
                        __reg28 = __reg28 + (int(__reg22[1].length > 0 && __reg23[0 * 2 + 1] <= __reg23[1 * 2 + 1]) + int(__reg22[2].length > 0 && __reg23[0 * 2 + 1] <= __reg23[2 * 2 + 1]) + int(__reg22[3].length > 0 && __reg23[0 * 2 + 1] <= __reg23[3 * 2 + 1]));
                    }
                    else if (__reg0 === 2) 
                    {
                        __reg28 = __reg28 + (int(__reg22[1].length > 0 && __reg23[0 * 2 + 1] < __reg23[1 * 2 + 1]) + int(__reg22[2].length > 0 && __reg23[0 * 2 + 1] <= __reg23[2 * 2 + 1]) + int(__reg22[3].length > 0 && __reg23[0 * 2 + 1] <= __reg23[3 * 2 + 1]));
                    }
                    else if (__reg0 === 3) 
                    {
                        __reg28 = __reg28 + (int(__reg22[1].length > 0 && __reg23[0 * 2 + 1] < __reg23[1 * 2 + 1]) + int(__reg22[2].length > 0 && __reg23[0 * 2 + 1] < __reg23[2 * 2 + 1]) + int(__reg22[3].length > 0 && __reg23[0 * 2 + 1] <= __reg23[3 * 2 + 1]));
                    }
                    __reg2 = __reg2 + (" " + __reg28 + com.cegg.game.mahjong.Res.T_LOGMGB[5] + "(" + com.cegg.game.mahjong.Util.ffmt(__reg23[1], 1, false, "+"));
                    if (__reg23.length == 16) 
                    {
                        __reg2 = __reg2 + ("," + (__reg23[8] <= 0 ? "" : "+") + __reg23[8] + com.cegg.game.mahjong.Res.T_MAI);
                    }
                    __reg2 = __reg2 + (") [" + com.cegg.game.mahjong.Res.GameTypeToString(__reg26) + "]\n");
                    __reg2 = __reg2 + (com.cegg.game.mahjong.Res.T_LOGMGB[6] + "http://tenhou.net/0/?log=" + __reg24 + "&tw=" + (4 - __reg25) % 4 + "\n");
                }
            }
            __reg2 = __reg2 + "--------------------------\n";
        }
        else if (__reg0 === "BACKUP") 
        {
            __reg4 = 0;
            if (__reg4 < __reg3.length) 
            {
                for (;;) 
                {
                    ++__reg4;
                    if (__reg4 >= __reg3.length) 
                    {
                        break;
                    }
                    var __reg29 = __reg3[__reg4];
                    var __reg30 = __reg29.un;
                    var __reg31 = __reg29.sc.split(",");
                    var __reg32 = __reg29.file;
                    var __reg33 = int(__reg29.oya);
                    var __reg34 = int(__reg29.type);
                    __reg2 = __reg2 + ("[" + __reg32.substr(0, 4) + "/" + __reg32.substr(4, 2) + "/" + __reg32.substr(6, 2) + "/" + com.cegg.game.mahjong.Res.GameTypeToString(__reg34) + "]");
                    var __reg35 = 0;
                    if (__reg35 < __reg31.length) 
                    {
                        for (;;) 
                        {
                            ++__reg35;
                            if (__reg35 >= __reg31.length) 
                            {
                                break;
                            }
                            __reg31[__reg35] = Number(__reg31[__reg35]);
                        }
                    }
                    if (__reg31.length == 16) 
                    {
                        if (__reg30[(__reg33 + 0) % 4].length > 0) 
                        {
                            __reg2 = __reg2 + (" A:" + com.cegg.game.mahjong.Util.htmlescape(__reg30[(__reg33 + 0) % 4]) + "(" + com.cegg.game.mahjong.Util.ffmt(__reg31[(__reg33 + 0) % 4 * 2 + 1], 1, false, "+") + "," + com.cegg.game.mahjong.Util.ffmt(__reg31[8 + (__reg33 + 0) % 4 * 2 + 0], 0, false, "+") + com.cegg.game.mahjong.Res.T_MAI + ")");
                        }
                        if (__reg30[(__reg33 + 1) % 4].length > 0) 
                        {
                            __reg2 = __reg2 + (" B:" + com.cegg.game.mahjong.Util.htmlescape(__reg30[(__reg33 + 1) % 4]) + "(" + com.cegg.game.mahjong.Util.ffmt(__reg31[(__reg33 + 1) % 4 * 2 + 1], 1, false, "+") + "," + com.cegg.game.mahjong.Util.ffmt(__reg31[8 + (__reg33 + 1) % 4 * 2 + 0], 0, false, "+") + com.cegg.game.mahjong.Res.T_MAI + ")");
                        }
                        if (__reg30[(__reg33 + 2) % 4].length > 0) 
                        {
                            __reg2 = __reg2 + (" C:" + com.cegg.game.mahjong.Util.htmlescape(__reg30[(__reg33 + 2) % 4]) + "(" + com.cegg.game.mahjong.Util.ffmt(__reg31[(__reg33 + 2) % 4 * 2 + 1], 1, false, "+") + "," + com.cegg.game.mahjong.Util.ffmt(__reg31[8 + (__reg33 + 2) % 4 * 2 + 0], 0, false, "+") + com.cegg.game.mahjong.Res.T_MAI + ")");
                        }
                        if (__reg30[(__reg33 + 3) % 4].length > 0) 
                        {
                            __reg2 = __reg2 + (" D:" + com.cegg.game.mahjong.Util.htmlescape(__reg30[(__reg33 + 3) % 4]) + "(" + com.cegg.game.mahjong.Util.ffmt(__reg31[(__reg33 + 3) % 4 * 2 + 1], 1, false, "+") + "," + com.cegg.game.mahjong.Util.ffmt(__reg31[8 + (__reg33 + 3) % 4 * 2 + 0], 0, false, "+") + com.cegg.game.mahjong.Res.T_MAI + ")");
                        }
                    }
                    else 
                    {
                        if (__reg30[(__reg33 + 0) % 4].length > 0) 
                        {
                            __reg2 = __reg2 + (" A:" + com.cegg.game.mahjong.Util.htmlescape(__reg30[(__reg33 + 0) % 4]) + "(" + com.cegg.game.mahjong.Util.ffmt(__reg31[(__reg33 + 0) % 4 * 2 + 1], 1, false, "+") + ")");
                        }
                        if (__reg30[(__reg33 + 1) % 4].length > 0) 
                        {
                            __reg2 = __reg2 + (" B:" + com.cegg.game.mahjong.Util.htmlescape(__reg30[(__reg33 + 1) % 4]) + "(" + com.cegg.game.mahjong.Util.ffmt(__reg31[(__reg33 + 1) % 4 * 2 + 1], 1, false, "+") + ")");
                        }
                        if (__reg30[(__reg33 + 2) % 4].length > 0) 
                        {
                            __reg2 = __reg2 + (" C:" + com.cegg.game.mahjong.Util.htmlescape(__reg30[(__reg33 + 2) % 4]) + "(" + com.cegg.game.mahjong.Util.ffmt(__reg31[(__reg33 + 2) % 4 * 2 + 1], 1, false, "+") + ")");
                        }
                        if (__reg30[(__reg33 + 3) % 4].length > 0) 
                        {
                            __reg2 = __reg2 + (" D:" + com.cegg.game.mahjong.Util.htmlescape(__reg30[(__reg33 + 3) % 4]) + "(" + com.cegg.game.mahjong.Util.ffmt(__reg31[(__reg33 + 3) % 4 * 2 + 1], 1, false, "+") + ")");
                        }
                    }
                    __reg2 = __reg2 + ("\n" + "http://tenhou.net/0/?log=" + __reg32 + "&tw=" + (4 - __reg33) % 4 + "\n");
                }
            }
        }
        if (!__reg3.length) 
        {
            __reg2 = __reg2 + com.cegg.game.mahjong.Res.T_LOGNOLOG;
        }
        this.tf.htmlText = __reg2;
        this.tf.scroll = this.tf.maxscroll;
        this.SB_VERT.update();
    }
    ;
    __reg1.del = function (i)
    {
        com.cegg.GDialog.messageBox(this, com.cegg.game.mahjong.Res.T_LOGCLEAR, "LOGDEL", "Yes", "NO", "No", i);
    }
    ;
    __reg1.opt = function (args)
    {
        var __reg3 = new LoadVars();
        __reg3.onData(args);
        _root.onCommand({cmd: "LOGVIEWER", log: __reg3.log, tw: __reg3.tw, ts: undefined});
    }
    ;
    __reg1.onCommand = function (msg)
    {
        if ((__reg0 = msg.cmd) === "BROWSE") 
        {
            this.onCommand({cmd: "VIEW", mode: msg.cmd});
            return;
        }
        else if (__reg0 === "BLOG") 
        {
            this.onCommand({cmd: "VIEW", mode: msg.cmd});
            return;
        }
        else if (__reg0 === "BACKUP") 
        {
            this.onCommand({cmd: "VIEW", mode: msg.cmd});
            return;
        }
        else if (__reg0 === "VIEW") 
        {
            this.mode = msg.mode;
            this.update();
            return;
        }
        else if (__reg0 === "CLEAR") 
        {
            com.cegg.GDialog.messageBox(this, com.cegg.game.mahjong.Res.T_LOGCLEARALL, "LOGCLEAROK", "Yes", "NO", "No");
            return;
        }
        else if (__reg0 === "LOGCLEAROK") 
        {
            var __reg3 = com.cegg.game.mahjong.SaveData.MJINFO();
            delete __reg3.data.logstr;
            __reg3.flush();
            this.update();
            return;
        }
        else if (__reg0 === "LOGDEL") 
        {
            var __reg4 = com.cegg.game.mahjong.SaveData.MJINFO();
            var __reg5 = __reg4.data.logstr.split("\n");
            if (!__reg5[0].length) 
            {
                __reg5.splice(0, 1);
            }
            __reg5.splice(int(msg.value), 1);
            __reg4.data.logstr = __reg5.join("\n");
            __reg4.flush();
            this.update();
            return;
        }
        else if (__reg0 === "CLOSE") 
        {
            this.removeMovieClip();
            return;
        }
        else if (__reg0 !== "OPENTYPE") 
        {
            return;
        }
        this.OPENTYPE.setText(msg.disp);
        this.openMethod = msg.value;
        if (this.mode == "BROWSE") 
        {
            this.update();
        }
        var __reg6 = com.cegg.game.mahjong.SaveData.MJSTATUS();
        __reg6.data.logopen = this.openMethod;
        __reg6.flush();
        return;
    }
    ;
    __reg0.getLogArray = function ()
    {
        var __reg2 = [];
        var __reg3 = com.cegg.game.mahjong.SaveData.MJINFO();
        var __reg4 = __reg3.data.logstr.split("\n");
        if (__reg4.length) 
        {
            for (;;) 
            {
                __reg4.shift();
                if (!__reg4.length) 
                {
                    break;
                }
                if (__reg4[0].length) 
                {
                    var __reg5 = __reg4[0].split("&");
                    var __reg6 = {};
                    if (__reg5.length) 
                    {
                        for (;;) 
                        {
                            __reg5.shift();
                            if (!__reg5.length) 
                            {
                                break;
                            }
                            var __reg7 = __reg5[0].split("=");
                            __reg6[__reg7[0]] = _global.unescape(__reg7[1]);
                        }
                    }
                    __reg6.un = [__reg6.un0, __reg6.un1, __reg6.un2, __reg6.un3];
                    __reg2.push(__reg6);
                }
            }
        }
        return __reg2;
    }
    ;
    ASSetPropFlags(__reg1, null, 1);
    __reg0.SymbolName = "__Packages.com.cegg.game.mahjong.LogManager";
    __reg0.SymbolOwner = com.cegg.game.mahjong.LogManager;
    __reg0.SymbolLinked = Object.registerClass(com.cegg.game.mahjong.LogManager.SymbolName, com.cegg.game.mahjong.LogManager.SymbolOwner);
    __reg1.mode = "BROWSE";
}#endinitclip

//子图形 18
//  初始化剪辑
#initclip 0

if (!com.cegg.LCoordinate) 
{
    if (!com) 
    {
        _global.com = new Object();
    }
    if (!com.cegg) 
    {
        _global.com.cegg = new Object();
    }
    var __reg1 = (_global.com.cegg.LCoordinate = function ()
    {
    }
    ).prototype;
    __reg0.globalScale = function (mc)
    {
        var __reg3 = {x: 0, y: 0};
        var __reg4 = {x: 100, y: 100};
        mc._parent.localToGlobal(__reg3);
        mc._parent.localToGlobal(__reg4);
        mc._xscale = 10000 / (__reg4.x - __reg3.x);
        mc._yscale = 10000 / (__reg4.y - __reg3.y);
    }
    ;
    ASSetPropFlags(__reg1, null, 1);
}#endinitclip

//子图形 19
//  初始化剪辑
#initclip 0

if (!com.cegg.LBase64) 
{
    if (!com) 
    {
        _global.com = new Object();
    }
    if (!com.cegg) 
    {
        _global.com.cegg = new Object();
    }
    var __reg1 = (_global.com.cegg.LBase64 = function ()
    {
    }
    ).prototype;
    __reg0.unhex = function (c)
    {
        if (48 <= c && c <= 57) 
        {
            return c - 48;
        }
        if (65 <= c && c <= 90) 
        {
            return c - 55;
        }
        if (97 <= c && c <= 122) 
        {
            return c - 87;
        }
        return 0;
    }
    ;
    __reg0.encode = function (str)
    {
        var __reg3 = [];
        var __reg4 = _global.escape(str);
        var __reg5 = 0;
        if (__reg5 < __reg4.length) 
        {
            for (;;) 
            {
                ++__reg5;
                if (__reg5 >= __reg4.length) 
                {
                    break;
                }
                var __reg6 = __reg4.charCodeAt(__reg5);
                if (__reg6 == 37) 
                {
                    __reg3.push(com.cegg.LBase64.unhex(__reg4.charCodeAt(__reg5 + 1)) << 4 | com.cegg.LBase64.unhex(__reg4.charCodeAt(__reg5 + 2)));
                    __reg5 = __reg5 + 2;
                }
                else 
                {
                    __reg3.push(__reg6);
                }
            }
        }
        var __reg7 = "";
        var __reg8 = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/";
        var __reg9 = __reg3.length;
        var __reg10 = 0;
        __reg10 = 0;
        if (__reg10 + 3 <= __reg9) 
        {
            for (;;) 
            {
                __reg10 = __reg10 + 3;
                if (__reg10 + 3 > __reg9) 
                {
                    break;
                }
                var __reg11 = __reg3[__reg10 + 2] | __reg3[__reg10 + 1] << 8 | __reg3[__reg10 + 0] << 16;
                __reg7 = __reg7 + __reg8.charAt(__reg11 >> 18 & 63);
                __reg7 = __reg7 + __reg8.charAt(__reg11 >> 12 & 63);
                __reg7 = __reg7 + __reg8.charAt(__reg11 >> 6 & 63);
                __reg7 = __reg7 + __reg8.charAt(__reg11 >> 0 & 63);
            }
        }
        if (__reg9 - __reg10 == 1) 
        {
            var __reg12 = __reg3[__reg10 + 0] << 16;
            __reg7 = __reg7 + __reg8.charAt(__reg12 >> 18 & 63);
            __reg7 = __reg7 + __reg8.charAt(__reg12 >> 12 & 63);
        }
        else if (__reg9 - __reg10 == 2) 
        {
            var __reg13 = __reg3[__reg10 + 1] << 8 | __reg3[__reg10 + 0] << 16;
            __reg7 = __reg7 + __reg8.charAt(__reg13 >> 18 & 63);
            __reg7 = __reg7 + __reg8.charAt(__reg13 >> 12 & 63);
            __reg7 = __reg7 + __reg8.charAt(__reg13 >> 6 & 63);
        }
        return __reg7;
    }
    ;
    __reg0.toescape = function (c)
    {
        return "%" + com.cegg.LBase64.tohex_table.charAt(c >> 4 & 15) + com.cegg.LBase64.tohex_table.charAt(c & 15);
    }
    ;
    __reg0.unbase = function (c)
    {
        if (65 <= c && c <= 90) 
        {
            return c - 65;
        }
        if (97 <= c && c <= 122) 
        {
            return c - 71;
        }
        if (48 <= c && c <= 57) 
        {
            return c + 4;
        }
        if (c == 43) 
        {
            return 62;
        }
        if (c == 47) 
        {
            return 63;
        }
        return 0;
    }
    ;
    __reg0.decode = function (s)
    {
        if ((__reg0 = s.length % 4) !== 0) 
        {
            if (__reg0 === 1) 
            {
                s = s + "===";
            }
            else if (__reg0 === 2) 
            {
                s = s + "==";
            }
            else if (__reg0 === 3) 
            {
                s = s + "=";
            }
        }
        var __reg3 = "";
        var __reg4 = 0;
        if (__reg4 < s.length) 
        {
            for (;;) 
            {
                __reg4 = __reg4 + 4;
                if (__reg4 >= s.length) 
                {
                    break;
                }
                var __reg5 = [com.cegg.LBase64.unbase(s.charCodeAt(__reg4 + 0)), com.cegg.LBase64.unbase(s.charCodeAt(__reg4 + 1)), com.cegg.LBase64.unbase(s.charCodeAt(__reg4 + 2)), com.cegg.LBase64.unbase(s.charCodeAt(__reg4 + 3))];
                var __reg6 = __reg5[3] | __reg5[2] << 6 | __reg5[1] << 12 | __reg5[0] << 18;
                __reg3 = __reg3 + com.cegg.LBase64.toescape(__reg6 >> 16 & 255);
                __reg3 = __reg3 + com.cegg.LBase64.toescape(__reg6 >> 8 & 255);
                __reg3 = __reg3 + com.cegg.LBase64.toescape(__reg6 >> 0 & 255);
            }
        }
        return _global.unescape(__reg3);
    }
    ;
    ASSetPropFlags(__reg1, null, 1);
    __reg0.tohex_table = "0123456789ABCDEF";
}#endinitclip

//子图形 20
//  初始化剪辑
#initclip 0

if (!com.cegg.game.mahjong.NinteiBox) 
{
    if (!com) 
    {
        _global.com = new Object();
    }
    if (!com.cegg) 
    {
        _global.com.cegg = new Object();
    }
    if (!com.cegg.game) 
    {
        _global.com.cegg.game = new Object();
    }
    if (!com.cegg.game.mahjong) 
    {
        _global.com.cegg.game.mahjong = new Object();
    }
    (_global.com.cegg.game.mahjong.NinteiBox = function ()
    {
        super();
        var __reg3 = new Sound(this);
        __reg3.attachSound("WAVE40");
        __reg3.setVolume(70);
        __reg3.start();
        var __reg4 = 400;
        var __reg5 = 0;
        this.createEmptyMovieClip("bg", __reg5++);
        this.createEmptyMovieClip("img", __reg5++);
        this.createTextField("tf", __reg5++, 30, 0, __reg4 - 30, 100);
        com.cegg.GButton.createTextButton("OK", "OK", __reg5++, this);
        var __reg7 = 0;
        __reg7 = __reg7 + 50;
        this.img.attachMovie("nintei", "0", 0);
        this.img._x = int((__reg4 - this.img._width) / 2);
        this.img._y = __reg7;
        this.img._alpha = 0;
        this.img.onEnterFrame = function ()
        {
            if (this._parent._alpha >= 100) 
            {
                if (this._alpha >= 100) 
                {
                    this._alpha = 100;
                    this._parent.tf._visible = true;
                    if (this._parent.tf.textColor == 16579836) 
                    {
                        this._parent.tf.textColor = this._parent.tf.textColor + 16777215;
                        delete this.onEnterFrame;
                    }
                    else 
                    {
                        this._parent.tf.textColor = this._parent.tf.textColor + 263172;
                    }
                    return;
                }
                this._alpha = this._alpha + 4;
            }
        }
        ;
        __reg7 = __reg7 + (this.img._height + 20);
        with (this.tf)
        {
            _y = __reg7;
            selectable = false;
            text = _global.unescape(this.nintei);
            autoSize = "left";
            _visible = false;
            _width = __reg4 - 60;
            textColor = 1052688;
        }
        __reg7 = __reg7 + (this.tf._height + 30);
        this.OK._x = int((__reg4 - this.OK._width) / 2);
        this.OK._y = __reg7;
        __reg7 = __reg7 + (this.OK._height + 30);
        com.cegg.LGraphics.drawFrame(this.bg, 0, 0, __reg4, __reg7, 0);
        com.cegg.LGraphics.drawShadow(this.bg, 0, 0, __reg4, __reg7, 4);
        this.bg._alpha = 80;
        this._x = int((Stage.width - __reg4) / 2);
        this._y = int((Stage.height - __reg7) / 2);
        this._alpha = 0;
    }
    ).prototype.__proto__ = MovieClip.prototype;
    __reg0.prototype.__constructor__ = MovieClip;
    var __reg1 = __reg0.prototype;
    __reg1.onEnterFrame = function ()
    {
        this._alpha = this._alpha + 8;
        if (this._alpha >= 100) 
        {
            this.onEnterFrame = undefined;
        }
    }
    ;
    __reg1.onCommand = function (msg)
    {
        if ((__reg0 = msg.cmd) === "OK") 
        {
            this.removeMovieClip();
            return;
        }
    }
    ;
    ASSetPropFlags(__reg1, null, 1);
    __reg0.SymbolName = "__Packages.com.cegg.game.mahjong.NinteiBox";
    __reg0.SymbolOwner = com.cegg.game.mahjong.NinteiBox;
    __reg0.SymbolLinked = Object.registerClass(com.cegg.game.mahjong.NinteiBox.SymbolName, com.cegg.game.mahjong.NinteiBox.SymbolOwner);
}#endinitclip

//子图形 21
//  初始化剪辑
#initclip 0

if (!com.cegg.game.mahjong.KansenManager) 
{
    if (!com) 
    {
        _global.com = new Object();
    }
    if (!com.cegg) 
    {
        _global.com.cegg = new Object();
    }
    if (!com.cegg.game) 
    {
        _global.com.cegg.game = new Object();
    }
    if (!com.cegg.game.mahjong) 
    {
        _global.com.cegg.game.mahjong = new Object();
    }
    (_global.com.cegg.game.mahjong.KansenManager = function ()
    {
        super();
        com.cegg.GButton.createTextButton("WHO", "PLAYER", 0, this, (new XML("<menu><br/></menu>")).firstChild);
        this.WHO.setEnable(false);
        this.xmlQ = [];
        this.xmlQSleep = 0;
        this.tStart = 0;
        this.tNext = 0;
        _root.Main.Game.bTsumogiriAsGray = com.cegg.game.mahjong.UtilBase.bPremiumVersion && com.cegg.game.mahjong.SaveData.f0_kansen_tsumogiriasgray;
    }
    ).prototype.__proto__ = MovieClip.prototype;
    __reg0.prototype.__constructor__ = MovieClip;
    var __reg1 = __reg0.prototype;
    __reg1.onCommand = function (msg)
    {
        if ((__reg0 = msg.cmd) === "WHO") 
        {
            this.xmlQ = [];
            this.xmlQSleep = 0;
            this.tStart = 0;
            this.tNext = 0;
            this.WHO.setEnable(false);
            if (msg.who != undefined) 
            {
                _root.tw = int(msg.who) % 4;
            }
            com.cegg.game.mahjong.KansenManager.sock.send("<REINIT />");
            return;
        }
        else if (__reg0 === "REFRESH") 
        {
            this.xmlQ = [];
            this.xmlQSleep = 0;
            this.tStart = 0;
            this.tNext = 0;
            this.WHO.setEnable(false);
            if (msg.who != undefined) 
            {
                _root.tw = int(msg.who) % 4;
            }
            com.cegg.game.mahjong.KansenManager.sock.send("<REINIT />");
            return;
        }
        else if (__reg0 !== "TSUMOGIRIASGRAY") 
        {
            return;
        }
        _root.Main.Game.bTsumogiriAsGray = !_root.Main.Game.bTsumogiriAsGray;
        com.cegg.game.mahjong.SaveData.f0_kansen_tsumogiriasgray = _root.Main.Game.bTsumogiriAsGray;
        com.cegg.game.mahjong.SaveData.save_f0();
        this.onCommand({cmd: "REFRESH"});
        return;
    }
    ;
    __reg1.onEnterFrame = function ()
    {
        if (!this.xmlQ.length) 
        {
            this.tStart = 0;
            return undefined;
        }
        var __reg2 = (new Date()).getTime() - this.tStart;
        if (__reg2 >= this.tNext) 
        {
            var __reg3 = this.xmlQ.shift();
            if (__reg3.nodeType == 1) 
            {
                this._parent.onXMLNode(__reg3);
                return;
            }
            if (__reg3.nodeType == 3) 
            {
                if (!this.tStart) 
                {
                    this.tStart = (new Date()).getTime() - this.tNext;
                }
                this.tNext = this.tNext + int(__reg3.nodeValue);
            }
        }
    }
    ;
    __reg1.onXMLNode = function (n)
    {
        if (n.nodeName == "WGC") 
        {
            n = n.firstChild;
            if (n != undefined) 
            {
                if (n) 
                {
                    this.xmlQ.push(n);
                }
            }
        }
    }
    ;
    ASSetPropFlags(__reg1, null, 1);
    __reg0.SymbolName = "__Packages.com.cegg.game.mahjong.KansenManager";
    __reg0.SymbolOwner = com.cegg.game.mahjong.KansenManager;
    __reg0.SymbolLinked = Object.registerClass(com.cegg.game.mahjong.KansenManager.SymbolName, com.cegg.game.mahjong.KansenManager.SymbolOwner);
    __reg0.sock = _root;
}#endinitclip

//子图形 22
//  初始化剪辑
#initclip 0

if (!com.cegg.game.mahjong.LobbyMain) 
{
    if (!com) 
    {
        _global.com = new Object();
    }
    if (!com.cegg) 
    {
        _global.com.cegg = new Object();
    }
    if (!com.cegg.game) 
    {
        _global.com.cegg.game = new Object();
    }
    if (!com.cegg.game.mahjong) 
    {
        _global.com.cegg.game.mahjong = new Object();
    }
    (_global.com.cegg.game.mahjong.LobbyMain = function ()
    {
        super();
        this.lobby_id = 0;
        _root.Main.setMenuBottom(false);
        this.join = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0];
        this.skipEnterLobbyCancelCount = 0;
        this.tabsel = ["", "", "", ""];
        this.takusel = "taku0";
        var __reg3 = com.cegg.game.mahjong.SaveData.MJINFO().data.tabsel.split(",");
        if (__reg3.length > 0) 
        {
            this.tabsel[0] = __reg3[0];
        }
        if (__reg3.length > 1) 
        {
            this.tabsel[1] = __reg3[1];
        }
        if (__reg3.length > 2) 
        {
            this.tabsel[2] = __reg3[2];
        }
        if (__reg3.length > 3) 
        {
            this.tabsel[3] = __reg3[3];
        }
    }
    ).prototype.__proto__ = com.cegg.game.mahjong.LobbyBase.prototype;
    __reg0.prototype.__constructor__ = com.cegg.game.mahjong.LobbyBase;
    var __reg1 = __reg0.prototype;
    __reg1.onLoad = function ()
    {
        _global.clearInterval(this.idTimerWG);
        this.idTimerWG = undefined;
    }
    ;
    __reg1.onUnload = function ()
    {
        if (this.tab) 
        {
            var __reg2 = com.cegg.game.mahjong.SaveData.MJINFO();
            __reg2.data.tabsel = this.tabsel.join(",");
            __reg2.flush();
        }
        _global.clearInterval(this.idTimerWG);
        this.idTimerWG = undefined;
    }
    ;
    __reg1.removeMovieClip = function ()
    {
        this.Prof.removeMovieClip();
        this.onUnload();
        super.removeMovieClip();
    }
    ;
    __reg1.init = function ()
    {
        var __reg2 = 26;
        var __reg3 = 0;
        this.createEmptyMovieClip("caption", __reg3++);
        this.createTextField("tfTitle", __reg3++, 0, __reg2, com.cegg.game.mahjong.LobbyMain.cx, 0);
        with (this.tfTitle)
        {
            autoSize = "center";
        }
        var __reg4 = new TextFormat();
        __reg4.size = 16;
        __reg4.bold = true;
        this.tfTitle.setNewTextFormat(__reg4);
        this.tfTitle.text = "- - -";
        __reg2 = __reg2 + (this.tfTitle._height + 14);
        this.createTextField("tfStat", __reg3++, 0, __reg2, com.cegg.game.mahjong.LobbyMain.cx, 22);
        com.cegg.GButton.createTextButton("MENU", com.cegg.game.mahjong.Res.T_MENU, __reg3++, this, (new XML(com.cegg.game.mahjong.Res.T_LOBBYMENU[0])).firstChild);
        com.cegg.GButton.createTextButton("SINGLE", com.cegg.game.mahjong.Res.T_SINGLE, __reg3++, this, (new XML(com.cegg.game.mahjong.Res.T_SINGLEMENU)).firstChild);
        com.cegg.GButton.createTextButton("CANCEL", com.cegg.game.mahjong.Res.T_CANCEL, __reg3++, this);
        this.attachMovie(com.cegg.MCTab.SymbolName, "tab", __reg3++, {_x: 10, cx: com.cegg.game.mahjong.LobbyMain.cx - 10});
        this.tab.onChanged = function (sel)
        {
            this._parent.onTabChanged(sel);
        }
        ;
        this.tab._y = __reg2 + 16;
        __reg2 = __reg2 + 275;
        with (this.tfStat)
        {
            autoSize = "center";
        }
        this.tfStat.text = com.cegg.game.mahjong.Res.T_USERNUM + " - " + com.cegg.game.mahjong.Res.T_NIN + "    " + com.cegg.game.mahjong.Res.T_LOBBYNUM + " - " + com.cegg.game.mahjong.Res.T_NIN + "    " + com.cegg.game.mahjong.Res.T_OHRASUNUM + " - " + com.cegg.game.mahjong.Res.T_NIN;
        this.tfStat._y = this.tfStat._y - int(this.tfStat._height / 2);
        this.MENU._x = int((com.cegg.game.mahjong.LobbyMain.cx - (this.MENU._width + this.SINGLE._width + this.CANCEL._width)) / 2);
        this.SINGLE._x = this.MENU._x + this.MENU._width;
        this.CANCEL._x = this.SINGLE._x + this.SINGLE._width;
        this.MENU._y = this.SINGLE._y = this.CANCEL._y = __reg2;
        var __reg5 = com.cegg.game.mahjong.LobbyMain.cx + com.cegg.game.mahjong.Prof2.cx;
        this.Prof._x = com.cegg.game.mahjong.LobbyMain.cx;
        this.cy = this.CANCEL._y + this.CANCEL._height + 15;
        com.cegg.LGraphics.drawCaption(this.caption, __reg5, 12);
        com.cegg.LGraphics.drawFrame(this, 0, 0, __reg5, this.cy, 16777215);
        com.cegg.LGraphics.drawShadow(this, 0, 0, __reg5, this.cy, 4);
        this.lineStyle(1, 14540253, 100);
        this.moveTo(com.cegg.game.mahjong.LobbyMain.cx - 1, 0);
        this.lineTo(com.cegg.game.mahjong.LobbyMain.cx - 1, this.cy);
        this.moveTo(10, this.SINGLE._y - 12);
        this.lineTo(com.cegg.game.mahjong.LobbyMain.cx, this.SINGLE._y - 12);
        this.moveTo(20, this.tfStat._y - 3);
        this.lineTo(com.cegg.game.mahjong.LobbyMain.cx - 20, this.tfStat._y - 3);
        this.lineStyle(1, 13421772, 100);
        this.tab.initTab(com.cegg.game.mahjong.Res.T_TAB[0]);
        this.moveTo(10, this.tab._y + this.tab._height - 1);
        this.lineTo(com.cegg.game.mahjong.LobbyMain.cx, this.tab._y + this.tab._height - 1);
        this.caption._focusrect = false;
        this.caption.onPress = function ()
        {
            this._parent.startDrag();
        }
        ;
        this.caption.onMouseUp = this.caption.onRelease = function ()
        {
            this._parent.stopDrag();
        }
        ;
        this.CANCEL.setEnable(false);
        this.onChangeLobby();
        if (_root.lb.length == 4) 
        {
            _root.send("<CHAT text=\"" + _global.escape("/lobby " + _root.lb) + "\" />");
        }
    }
    ;
    __reg0.createTaku = function (cx, mc, tabsel, fShow, join)
    {
        var __reg7 = {left: 10, top: 2};
        var __reg8 = 0;
        if (tabsel != "pane2") 
        {
            com.cegg.game.mahjong.Util.createTextFieldTACS(mc, "tfTon", __reg8++, __reg7.left + 95, __reg7.top + 27, 0, 22, com.cegg.game.mahjong.Res.T_RULEDISP[tabsel == "pane0" ? 7 : 9], "left", 0, false);
            com.cegg.game.mahjong.Util.createTextFieldTACS(mc, "tfNan", __reg8++, __reg7.left + 185, __reg7.top + 27, 0, 22, com.cegg.game.mahjong.Res.T_RULEDISP[8], "left", 0, false);
        }
        var __reg9 = __reg7.top + 49 + 26 * 0;
        var __reg10 = __reg7.left + 15;
        var __reg11 = __reg7.left + 140;
        var __reg12 = __reg7.left + 230;
        com.cegg.game.mahjong.Util.createTextFieldTACS(mc, "tfRule0", __reg8++, __reg10, __reg9, 0, 22, com.cegg.game.mahjong.Res.T_RULEDISP[tabsel == "pane2" ? 14 : (tabsel == "pane0" ? 0 : 10)], "left", 0, false);
        com.cegg.game.mahjong.Util.createTextFieldTACS(mc, "tfNum0", __reg8++, __reg11, __reg9, 0, 22, "-:-", "left", 0, false);
        if (tabsel != "pane2") 
        {
            com.cegg.game.mahjong.Util.createTextFieldTACS(mc, "tfNum1", __reg8++, __reg12, __reg9, 0, 22, "-:-", "left", 0, false);
            __reg9 = __reg9 + 26;
            com.cegg.game.mahjong.Util.createTextFieldTACS(mc, "tfRule1", __reg8++, __reg10, __reg9, 0, 22, com.cegg.game.mahjong.Res.T_RULEDISP[tabsel == "pane0" ? 2 : 11], "left", 0, false);
            com.cegg.game.mahjong.Util.createTextFieldTACS(mc, "tfNum2", __reg8++, __reg11, __reg9, 0, 22, "-:-", "left", 0, false);
            com.cegg.game.mahjong.Util.createTextFieldTACS(mc, "tfNum3", __reg8++, __reg12, __reg9, 0, 22, "-:-", "left", 0, false);
            __reg9 = __reg9 + 26;
            com.cegg.game.mahjong.Util.createTextFieldTACS(mc, "tfRule2", __reg8++, __reg10, __reg9, 0, 22, com.cegg.game.mahjong.Res.T_RULEDISP[tabsel == "pane0" ? 3 : 12], "left", 0, false);
            com.cegg.game.mahjong.Util.createTextFieldTACS(mc, "tfNum4", __reg8++, __reg11, __reg9, 0, 22, "-:-", "left", 0, false);
            com.cegg.game.mahjong.Util.createTextFieldTACS(mc, "tfNum5", __reg8++, __reg12, __reg9, 0, 22, "-:-", "left", 0, false);
            __reg9 = __reg9 + (26 + (tabsel == "pane1" ? 5 : 0));
            com.cegg.game.mahjong.Util.createTextFieldTACS(mc, "tfRule3", __reg8++, __reg10, __reg9, 0, 22, com.cegg.game.mahjong.Res.T_RULEDISP[tabsel == "pane0" ? 4 : 13], "left", 0, false);
            com.cegg.game.mahjong.Util.createTextFieldTACS(mc, "tfNum6", __reg8++, __reg11, __reg9, 0, 22, "-:-", "left", 0, false);
            com.cegg.game.mahjong.Util.createTextFieldTACS(mc, "tfNum7", __reg8++, __reg12, __reg9, 0, 22, "-:-", "left", 0, false);
            __reg9 = __reg9 + (26 + (tabsel == "pane0" ? 5 : 0));
        }
        if (tabsel == "pane0") 
        {
            com.cegg.game.mahjong.Util.createTextFieldTACS(mc, "tfRule4", __reg8++, __reg10, __reg9, 0, 22, com.cegg.game.mahjong.Res.T_RULEDISP[5], "left", 0, false);
            com.cegg.game.mahjong.Util.createTextFieldTACS(mc, "tfNum8", __reg8++, __reg11, __reg9, 0, 22, "-:-", "left", 0, false);
            com.cegg.game.mahjong.Util.createTextFieldTACS(mc, "tfNum9", __reg8++, __reg12, __reg9, 0, 22, "-:-", "left", 0, false);
            __reg9 = __reg9 + 26;
            com.cegg.game.mahjong.Util.createTextFieldTACS(mc, "tfRule5", __reg8++, __reg10, __reg9, 0, 22, com.cegg.game.mahjong.Res.T_RULEDISP[6], "left", 0, false);
            com.cegg.game.mahjong.Util.createTextFieldTACS(mc, "tfNum10", __reg8++, __reg11, __reg9, 0, 22, "-:-", "left", 0, false);
            com.cegg.game.mahjong.Util.createTextFieldTACS(mc, "tfNum11", __reg8++, __reg12, __reg9, 0, 22, "-:-", "left", 0, false);
            __reg9 = __reg9 + 26;
        }
        var __reg13 = 0;
        if (__reg13 < 12) 
        {
            for (;;) 
            {
                ++__reg13;
                if (__reg13 >= 12) 
                {
                    break;
                }
                if (mc["tfNum" + __reg13]) 
                {
                    var __reg14 = mc["tfNum" + __reg13]._x;
                    var __reg15 = mc["tfRule" + int(__reg13 / 2)]._y;
                    if (fShow & 1 << __reg13) 
                    {
                        var __reg16 = com.cegg.GButton.createTextButton("JOIN" + __reg13, com.cegg.game.mahjong.Res.T_JOIN, __reg8++, mc);
                        __reg16._x = __reg14 - 47;
                        __reg16._y = __reg15;
                        if (join & 1 << __reg13) 
                        {
                            __reg16.setEnable(false);
                            com.cegg.game.mahjong.LobbyMain.setBold(mc["tfNum" + __reg13], true);
                        }
                    }
                    else 
                    {
                        com.cegg.game.mahjong.Util.createTextFieldTACS(mc, "NOJOIN" + __reg13, __reg8++, __reg14 - 24, __reg15, 0, 22, com.cegg.game.mahjong.Res.T_BATSU, "center", 8947848, false);
                    }
                }
            }
        }
        if (tabsel == "pane1" && !fShow) 
        {
            com.cegg.game.mahjong.Util.createTextFieldTACS(mc, "tfMessage", __reg8++, 0, 175, cx, 22, com.cegg.game.mahjong.Res.T_LOBBYTXT[7], "center", 4473924, false);
        }
    }
    ;
    __reg0.setBold = function (tf, ok)
    {
        var __reg4 = tf.getTextTextFormat();
        if (__reg4 == undefined) 
        {
            __reg4 = new TextFormat();
        }
        __reg4.bold = ok;
        tf.setTextFormat(__reg4);
        tf.setNewTextFormat(__reg4);
    }
    ;
    __reg1.onTabChanged = function (sel)
    {
        this.tabsel[0] = sel;
        this.pane.removeMovieClip();
        if (sel == "pwg") 
        {
            if (this.pwg) 
            {
                this.pwg._visible = true;
            }
            else 
            {
                var __reg3 = this.tab.getDepth() + 2;
                this.createEmptyMovieClip("pwg", __reg3);
                var __reg4 = this.pwg;
                __reg4._y = this.tab._y + this.tab._height + 2;
                __reg4.onCommand = function (msg)
                {
                    this._parent.onCommand(msg);
                }
                ;
                __reg4.createTextField("tf", __reg3++, 5, 0, com.cegg.game.mahjong.LobbyMain.cx - 5, 220);
                __reg4.tf.html = true;
                __reg4.tf.htmlText = com.cegg.game.mahjong.Res.T_ERRTXT.E1013;
                com.cegg.GScrollVert.createScrollBar("SB_VERT", __reg4.tf, __reg3++);
                __reg4.SB_VERT._alpha = 50;
                __reg4.startwg = function (args)
                {
                    if (this._parent.CANCEL.isEnable()) 
                    {
                        _root.onXMLNode((new XML("<ERR code=\"1018\"/>")).firstChild);
                        return;
                    }
                    var __reg3 = args.split(",");
                    _root.tw = int(__reg3[1]);
                    _root.send("<CHAT text=\"" + _global.escape("/wg " + __reg3[0]) + "\" />");
                }
                ;
            }
            this.onIntervalWG();
        }
        else 
        {
            if (this.pwg) 
            {
                this.pwg._visible = false;
            }
            var __reg5 = this.tab.getDepth() + 1;
            this.createEmptyMovieClip("pane", __reg5);
            this.pane._y = this.tab._y + this.tab._height + 3;
        }
        if (sel == "plog") 
        {
            if (this.plog) 
            {
                this.plog._visible = true;
            }
            else 
            {
                var __reg6 = this.tab.getDepth() + 2;
                this.createEmptyMovieClip("plog", __reg6);
                var __reg7 = this.plog;
                __reg7._y = this.tab._y + this.tab._height + 2;
                __reg7.onCommand = function (msg)
                {
                    this._parent.onCommand(msg);
                }
                ;
                __reg7.createTextField("tf", __reg6++, 5, 0, com.cegg.game.mahjong.LobbyMain.cx - 5, 217);
                __reg7.tf.html = true;
                __reg7.tf.htmlText = com.cegg.game.mahjong.LobbyBase.CompileLOG();
                __reg7.tf.scroll = __reg7.tf.maxscroll;
                com.cegg.GScrollVert.createScrollBar("SB_VERT", __reg7.tf, __reg6++);
                __reg7.SB_VERT._alpha = 50;
                __reg7.openlog = function (args)
                {
                    var __reg3 = new LoadVars();
                    __reg3.onData(args);
                    this._parent.onCommand({cmd: "LOGVIEWER", log: __reg3.log, tw: __reg3.tw, ts: undefined});
                }
                ;
            }
        }
        else if (this.plog) 
        {
            this.plog._visible = false;
        }
        if (sel == "pane0" || (sel == "pane1" || sel == "pane2")) 
        {
            var __reg8 = 0;
            this.pane.attachMovie(com.cegg.MCTab.SymbolName, "tab", __reg8++, {_x: 20, cx: com.cegg.game.mahjong.LobbyMain.cx - 20});
            this.pane.tab.onChanged = function (_sel)
            {
                this._parent._parent.onTabGameChanged(_sel);
            }
            ;
            if (this.lobby_id) 
            {
                com.cegg.game.mahjong.Res.T_TAB[3][0][1] = com.cegg.game.mahjong.Res.T_TAB[3][0][1].substr(0, 2) + "L" + this.lobby_id;
                this.pane.tab.initTab(com.cegg.game.mahjong.Res.T_TAB[3]);
                this.pane.tab.selectTab(com.cegg.game.mahjong.Res.T_TAB[3][0][0]);
            }
            else if (sel == "pane0") 
            {
                this.pane.tab.initTab(com.cegg.game.mahjong.Res.T_TAB[2]);
                this.pane.tab.selectTab(this.tabsel[1]);
            }
            else if (sel == "pane1") 
            {
                this.pane.tab.initTab(com.cegg.game.mahjong.Res.T_TAB[7]);
                this.pane.tab.selectTab(this.tabsel[2]);
            }
            else if (sel == "pane2") 
            {
                this.pane.tab.initTab(com.cegg.game.mahjong.Res.T_TAB[8]);
                this.pane.tab.selectTab(this.tabsel[3]);
            }
            this.pane.lineStyle(1, 13421772, 100);
            this.pane.moveTo(20, this.pane.tab._y + this.pane.tab._height - 3);
            this.pane.lineTo(com.cegg.game.mahjong.LobbyMain.cx - 10, this.pane.tab._y + this.pane.tab._height - 3);
        }
        else if (sel == "hlp") 
        {
            var __reg9 = 0;
            var __reg10 = this.pane;
            __reg10.attachMovie("hai4", "img", __reg9++);
            __reg10.img._x = int((com.cegg.game.mahjong.LobbyMain.cx - 120) / 2);
            __reg10.img._y = 30 + 10;
            __reg10.createTextField("tfLink", __reg9++, 0, __reg10.img._y + __reg10.img._height + 2, com.cegg.game.mahjong.LobbyMain.cx, 22);
            __reg10.createTextField("tf", __reg9++, 0, __reg10.img._y + __reg10.img._height + 22, com.cegg.game.mahjong.LobbyMain.cx, 22);
            with (__reg10.tfLink)
            {
                autoSize = "center";
                selectable = false;
                html = true;
            }
            with (__reg10.tf)
            {
                autoSize = "center";
                selectable = false;
                textColor = 4473924;
            }
            __reg10.tfLink.htmlText = com.cegg.game.mahjong.Res.T_LOBBYTXT[3];
            __reg10.tf.text = "TENHOU (C)C-EGG";
        }
        this.Prof.onTabChanged(this.lobby_id, sel, this.takusel);
    }
    ;
    __reg1.onTabGameChanged = function (sel)
    {
        this.pane.taku.removeMovieClip();
        this.pane.createEmptyMovieClip("taku", this.pane.tab.getDepth() + 1);
        this.pane.taku.onCommand = function (msg)
        {
            this._parent._parent.onCommand(msg);
        }
        ;
        this.pane.taku.onButtonRollOver = function (name)
        {
            this._parent._parent.onUpdateCondition(name);
        }
        ;
        this.pane.taku.onButtonRollOut = function (name)
        {
            this._parent._parent.onUpdateCondition("HIDE");
        }
        ;
        this.takusel = sel;
        if (!this.lobby_id && this.tabsel[0] == "pane0") 
        {
            this.tabsel[1] = sel;
            if (!com.cegg.game.mahjong.UtilBase.bPremiumVersion && sel == "taku3") 
            {
                com.cegg.game.mahjong.Util.createTextFieldTACS(this.pane.taku, "tf", 0, 0, 85, com.cegg.game.mahjong.LobbyMain.cx, 22, com.cegg.game.mahjong.Res.T_LOBBYTXT[6], "center", 4473924, true);
            }
            else if (sel == "taku1" && (com.cegg.game.mahjong.UtilBase.nExpireDays < 60 && (this.dan4 < 9 && this.dan3 < 9))) 
            {
                com.cegg.game.mahjong.LobbyMain.showPaymentInfo(this.pane.taku, 1);
            }
            else 
            {
                var __reg3 = false;
                var __reg4 = false;
                var __reg5 = 0;
                if ((__reg0 = sel) === "taku0") 
                {
                    __reg5 = this.join[0];
                    __reg3 = true;
                    __reg4 = true;
                }
                else if (__reg0 === "taku1") 
                {
                    __reg5 = this.join[1];
                    __reg3 = this.dan4 >= 9 || com.cegg.game.mahjong.UtilBase.nExpireDays >= 60;
                    __reg4 = this.dan3 >= 9 || com.cegg.game.mahjong.UtilBase.nExpireDays >= 60;
                }
                else if (__reg0 === "taku2") 
                {
                    __reg5 = this.join[2];
                    __reg3 = this.dan4 >= 13 && this.rate4 >= 1800;
                    __reg4 = this.dan3 >= 13 && this.rate3 >= 1800;
                }
                else if (__reg0 === "taku3") 
                {
                    __reg5 = this.join[3];
                    __reg3 = this.dan4 >= 16 && this.rate4 >= 2000;
                    __reg4 = this.dan3 >= 16 && this.rate3 >= 2000;
                }
                if (!__reg3 && !__reg4) 
                {
                    com.cegg.game.mahjong.Util.createTextFieldTACS(this.pane.taku, "tfMessage", 0, 0, 110, com.cegg.game.mahjong.LobbyMain.cx, 22, com.cegg.game.mahjong.Res.T_LOBBYTXT[2], "center", 4473924, false);
                }
                else if (com.cegg.game.mahjong.UtilBase.bPremiumVersion && (!com.cegg.game.mahjong.UtilBase.nExpireDays && sel == "taku3")) 
                {
                    com.cegg.game.mahjong.LobbyMain.showPaymentInfo(this.pane.taku, 0);
                }
                else 
                {
                    if (sel == "taku0" && (this.dan4 >= 13 && this.rate4 >= 1800)) 
                    {
                        __reg3 = false;
                    }
                    if (sel == "taku0" && (this.dan3 >= 13 && this.rate3 >= 1800)) 
                    {
                        __reg4 = false;
                    }
                    if (sel == "taku1" && (this.dan4 >= 16 && this.rate4 >= 2000)) 
                    {
                        __reg3 = false;
                    }
                    if (sel == "taku1" && (this.dan3 >= 16 && this.rate3 >= 2000)) 
                    {
                        __reg4 = false;
                    }
                    com.cegg.game.mahjong.LobbyMain.createTaku(com.cegg.game.mahjong.LobbyMain.cx, this.pane.taku, this.tabsel[0], (__reg3 ? 255 : 0) | (__reg4 ? 3840 : 0), __reg5);
                }
                this.updateLN();
            }
        }
        else if (!this.lobby_id && this.tabsel[0] == "pane1") 
        {
            this.tabsel[2] = sel;
            if (!com.cegg.game.mahjong.UtilBase.bPremiumVersion && (sel == "taku2" || sel == "taku3")) 
            {
                com.cegg.game.mahjong.Util.createTextFieldTACS(this.pane.taku, "tf", 0, 0, 85, com.cegg.game.mahjong.LobbyMain.cx, 22, com.cegg.game.mahjong.Res.T_LOBBYTXT[6], "center", 4473924, true);
            }
            else 
            {
                var __reg6 = 0;
                if ((__reg0 = sel) === "taku0") 
                {
                    __reg6 = this.join[4];
                }
                else if (__reg0 === "taku1") 
                {
                    __reg6 = this.join[5];
                }
                else if (__reg0 === "taku2") 
                {
                    __reg6 = this.join[6];
                }
                else if (__reg0 === "taku3") 
                {
                    __reg6 = this.join[7];
                }
                var __reg7 = this.Prof.GetJoinOk(this.lobby_id, this.tabsel[0], sel);
                if (sel == "taku2" || sel == "taku3") 
                {
                    com.cegg.game.mahjong.Util.createTextFieldTACS(this.pane.taku, "tfMessage", 0, 0, 110, com.cegg.game.mahjong.LobbyMain.cx, 22, com.cegg.game.mahjong.Res.T_LOBBYTXT[7], "center", 4473924, false);
                }
                else if (__reg7) 
                {
                    if (sel == "taku1" && (com.cegg.game.mahjong.UtilBase.bPremiumVersion && !com.cegg.game.mahjong.UtilBase.nExpireDays)) 
                    {
                        com.cegg.game.mahjong.LobbyMain.showPaymentInfo(this.pane.taku, 0);
                    }
                    else 
                    {
                        com.cegg.game.mahjong.LobbyMain.createTaku(com.cegg.game.mahjong.LobbyMain.cx, this.pane.taku, this.tabsel[0], __reg7, __reg6);
                    }
                }
                else 
                {
                    com.cegg.game.mahjong.Util.createTextFieldTACS(this.pane.taku, "tfMessage", 0, 0, 110, com.cegg.game.mahjong.LobbyMain.cx, 22, com.cegg.game.mahjong.Res.T_LOBBYTXT[2], "center", 4473924, false);
                }
                this.updateLN();
            }
        }
        else if (!this.lobby_id && this.tabsel[0] == "pane2") 
        {
            this.tabsel[3] = sel;
            var __reg8 = 0;
            if ((__reg0 = sel) === "taku0") 
            {
                __reg8 = this.join[8];
            }
            else if (__reg0 === "taku1") 
            {
                __reg8 = this.join[9];
            }
            else if (__reg0 === "taku2") 
            {
                __reg8 = this.join[10];
            }
            else if (__reg0 === "taku3") 
            {
                __reg8 = this.join[11];
            }
            var __reg9 = this.Prof.GetJoinOk(this.lobby_id, this.tabsel[0], sel);
            if (__reg9) 
            {
                com.cegg.game.mahjong.LobbyMain.createTaku(com.cegg.game.mahjong.LobbyMain.cx, this.pane.taku, this.tabsel[0], __reg9, __reg8);
            }
            else 
            {
                com.cegg.game.mahjong.Util.createTextFieldTACS(this.pane.taku, "tfMessage", 0, 0, 110, com.cegg.game.mahjong.LobbyMain.cx, 22, com.cegg.game.mahjong.Res.T_LOBBYTXT[2], "center", 4473924, false);
            }
            this.updateLN();
        }
        else if (sel == "taku0") 
        {
            com.cegg.game.mahjong.LobbyMain.createTaku(com.cegg.game.mahjong.LobbyMain.cx, this.pane.taku, this.tabsel[0], 4095, this.join[0]);
            this.updateLN();
        }
        this.Prof.onTabChanged(this.lobby_id, this.tabsel[0], sel);
    }
    ;
    __reg1.onChangeLobby = function ()
    {
        this.MENU.subMenu = (new XML(com.cegg.game.mahjong.Res.T_LOBBYMENU[com.cegg.game.mahjong.UtilBase.bExternalID ? 2 : (_root.lb ? 1 : 0)])).firstChild;
        this.tfTitle.text = this.lobby_id ? com.cegg.game.mahjong.Res.T_LOBBYTXT[1] + "L" + this.lobby_id : com.cegg.game.mahjong.Res.T_LOBBYTXT[4];
        this.tab.initTab(com.cegg.game.mahjong.Res.T_TAB[this.lobby_id ? 1 : 0]);
        this.pane.removeMovieClip();
        this.pwg.removeMovieClip();
        this.onEnterFrame = this.onEnterFrame_onChangeLobby;
    }
    ;
    __reg1.onEnterFrame_onChangeLobby = function ()
    {
        if (this.lobby_id) 
        {
            delete this.onEnterFrame;
        }
        else 
        {
            this.onEnterFrame = this.onEnterFrame_L0000;
        }
        this.tab.selectTab(this.tabsel[0]);
    }
    ;
    __reg1.onEnterFrame_L0000 = function ()
    {
        if (this.iConditionCount) 
        {
            if (this.iConditionCount == 1) 
            {
                this.onUpdateCondition("TICK");
            }
            --this.iConditionCount;
        }
    }
    ;
    __reg1.onCommand = function (msg)
    {
        if ((__reg0 = msg.cmd) === "JOIN0") 
        {
            var __reg3 = com.cegg.game.mahjong.LobbyMain.Join2GameType(this.tabsel[0], this.takusel, msg.cmd);
            if (!com.cegg.game.mahjong.UtilBase.nExpireDays && (com.cegg.game.mahjong.Res.GT_ISTECH(__reg3) && 80 <= this.nGamePlaying112)) 
            {
                com.cegg.GDialog.messageBox(_root.Main, com.cegg.game.mahjong.Res.T_LOBBYTXT[10]);
                return;
            }
            var __reg4 = int(msg.cmd.substr(4));
            var __reg5 = int(this.takusel.substr(4)) + (this.tabsel[0] == "pane1" ? 4 : 0) + (this.tabsel[0] == "pane2" ? 8 : 0);
            this.join[__reg5] = this.join[__reg5] | 1 << __reg4;
            _root.send("<JOIN t=\"" + this.lobby_id + "," + __reg3 + "\" />");
            this.pane.taku["JOIN" + __reg4].setEnable(false);
            com.cegg.game.mahjong.LobbyMain.setBold(this.pane.taku["tfNum" + __reg4], true);
            this.SINGLE.setEnable(false);
            this.CANCEL.setEnable(true);
            return;
        }
        else if (__reg0 === "JOIN1") 
        {
            __reg3 = com.cegg.game.mahjong.LobbyMain.Join2GameType(this.tabsel[0], this.takusel, msg.cmd);
            if (!com.cegg.game.mahjong.UtilBase.nExpireDays && (com.cegg.game.mahjong.Res.GT_ISTECH(__reg3) && 80 <= this.nGamePlaying112)) 
            {
                com.cegg.GDialog.messageBox(_root.Main, com.cegg.game.mahjong.Res.T_LOBBYTXT[10]);
                return;
            }
            __reg4 = int(msg.cmd.substr(4));
            __reg5 = int(this.takusel.substr(4)) + (this.tabsel[0] == "pane1" ? 4 : 0) + (this.tabsel[0] == "pane2" ? 8 : 0);
            this.join[__reg5] = this.join[__reg5] | 1 << __reg4;
            _root.send("<JOIN t=\"" + this.lobby_id + "," + __reg3 + "\" />");
            this.pane.taku["JOIN" + __reg4].setEnable(false);
            com.cegg.game.mahjong.LobbyMain.setBold(this.pane.taku["tfNum" + __reg4], true);
            this.SINGLE.setEnable(false);
            this.CANCEL.setEnable(true);
            return;
        }
        else if (__reg0 === "JOIN2") 
        {
            __reg3 = com.cegg.game.mahjong.LobbyMain.Join2GameType(this.tabsel[0], this.takusel, msg.cmd);
            if (!com.cegg.game.mahjong.UtilBase.nExpireDays && (com.cegg.game.mahjong.Res.GT_ISTECH(__reg3) && 80 <= this.nGamePlaying112)) 
            {
                com.cegg.GDialog.messageBox(_root.Main, com.cegg.game.mahjong.Res.T_LOBBYTXT[10]);
                return;
            }
            __reg4 = int(msg.cmd.substr(4));
            __reg5 = int(this.takusel.substr(4)) + (this.tabsel[0] == "pane1" ? 4 : 0) + (this.tabsel[0] == "pane2" ? 8 : 0);
            this.join[__reg5] = this.join[__reg5] | 1 << __reg4;
            _root.send("<JOIN t=\"" + this.lobby_id + "," + __reg3 + "\" />");
            this.pane.taku["JOIN" + __reg4].setEnable(false);
            com.cegg.game.mahjong.LobbyMain.setBold(this.pane.taku["tfNum" + __reg4], true);
            this.SINGLE.setEnable(false);
            this.CANCEL.setEnable(true);
            return;
        }
        else if (__reg0 === "JOIN3") 
        {
            __reg3 = com.cegg.game.mahjong.LobbyMain.Join2GameType(this.tabsel[0], this.takusel, msg.cmd);
            if (!com.cegg.game.mahjong.UtilBase.nExpireDays && (com.cegg.game.mahjong.Res.GT_ISTECH(__reg3) && 80 <= this.nGamePlaying112)) 
            {
                com.cegg.GDialog.messageBox(_root.Main, com.cegg.game.mahjong.Res.T_LOBBYTXT[10]);
                return;
            }
            __reg4 = int(msg.cmd.substr(4));
            __reg5 = int(this.takusel.substr(4)) + (this.tabsel[0] == "pane1" ? 4 : 0) + (this.tabsel[0] == "pane2" ? 8 : 0);
            this.join[__reg5] = this.join[__reg5] | 1 << __reg4;
            _root.send("<JOIN t=\"" + this.lobby_id + "," + __reg3 + "\" />");
            this.pane.taku["JOIN" + __reg4].setEnable(false);
            com.cegg.game.mahjong.LobbyMain.setBold(this.pane.taku["tfNum" + __reg4], true);
            this.SINGLE.setEnable(false);
            this.CANCEL.setEnable(true);
            return;
        }
        else if (__reg0 === "JOIN4") 
        {
            __reg3 = com.cegg.game.mahjong.LobbyMain.Join2GameType(this.tabsel[0], this.takusel, msg.cmd);
            if (!com.cegg.game.mahjong.UtilBase.nExpireDays && (com.cegg.game.mahjong.Res.GT_ISTECH(__reg3) && 80 <= this.nGamePlaying112)) 
            {
                com.cegg.GDialog.messageBox(_root.Main, com.cegg.game.mahjong.Res.T_LOBBYTXT[10]);
                return;
            }
            __reg4 = int(msg.cmd.substr(4));
            __reg5 = int(this.takusel.substr(4)) + (this.tabsel[0] == "pane1" ? 4 : 0) + (this.tabsel[0] == "pane2" ? 8 : 0);
            this.join[__reg5] = this.join[__reg5] | 1 << __reg4;
            _root.send("<JOIN t=\"" + this.lobby_id + "," + __reg3 + "\" />");
            this.pane.taku["JOIN" + __reg4].setEnable(false);
            com.cegg.game.mahjong.LobbyMain.setBold(this.pane.taku["tfNum" + __reg4], true);
            this.SINGLE.setEnable(false);
            this.CANCEL.setEnable(true);
            return;
        }
        else if (__reg0 === "JOIN5") 
        {
            __reg3 = com.cegg.game.mahjong.LobbyMain.Join2GameType(this.tabsel[0], this.takusel, msg.cmd);
            if (!com.cegg.game.mahjong.UtilBase.nExpireDays && (com.cegg.game.mahjong.Res.GT_ISTECH(__reg3) && 80 <= this.nGamePlaying112)) 
            {
                com.cegg.GDialog.messageBox(_root.Main, com.cegg.game.mahjong.Res.T_LOBBYTXT[10]);
                return;
            }
            __reg4 = int(msg.cmd.substr(4));
            __reg5 = int(this.takusel.substr(4)) + (this.tabsel[0] == "pane1" ? 4 : 0) + (this.tabsel[0] == "pane2" ? 8 : 0);
            this.join[__reg5] = this.join[__reg5] | 1 << __reg4;
            _root.send("<JOIN t=\"" + this.lobby_id + "," + __reg3 + "\" />");
            this.pane.taku["JOIN" + __reg4].setEnable(false);
            com.cegg.game.mahjong.LobbyMain.setBold(this.pane.taku["tfNum" + __reg4], true);
            this.SINGLE.setEnable(false);
            this.CANCEL.setEnable(true);
            return;
        }
        else if (__reg0 === "JOIN6") 
        {
            __reg3 = com.cegg.game.mahjong.LobbyMain.Join2GameType(this.tabsel[0], this.takusel, msg.cmd);
            if (!com.cegg.game.mahjong.UtilBase.nExpireDays && (com.cegg.game.mahjong.Res.GT_ISTECH(__reg3) && 80 <= this.nGamePlaying112)) 
            {
                com.cegg.GDialog.messageBox(_root.Main, com.cegg.game.mahjong.Res.T_LOBBYTXT[10]);
                return;
            }
            __reg4 = int(msg.cmd.substr(4));
            __reg5 = int(this.takusel.substr(4)) + (this.tabsel[0] == "pane1" ? 4 : 0) + (this.tabsel[0] == "pane2" ? 8 : 0);
            this.join[__reg5] = this.join[__reg5] | 1 << __reg4;
            _root.send("<JOIN t=\"" + this.lobby_id + "," + __reg3 + "\" />");
            this.pane.taku["JOIN" + __reg4].setEnable(false);
            com.cegg.game.mahjong.LobbyMain.setBold(this.pane.taku["tfNum" + __reg4], true);
            this.SINGLE.setEnable(false);
            this.CANCEL.setEnable(true);
            return;
        }
        else if (__reg0 === "JOIN7") 
        {
            __reg3 = com.cegg.game.mahjong.LobbyMain.Join2GameType(this.tabsel[0], this.takusel, msg.cmd);
            if (!com.cegg.game.mahjong.UtilBase.nExpireDays && (com.cegg.game.mahjong.Res.GT_ISTECH(__reg3) && 80 <= this.nGamePlaying112)) 
            {
                com.cegg.GDialog.messageBox(_root.Main, com.cegg.game.mahjong.Res.T_LOBBYTXT[10]);
                return;
            }
            __reg4 = int(msg.cmd.substr(4));
            __reg5 = int(this.takusel.substr(4)) + (this.tabsel[0] == "pane1" ? 4 : 0) + (this.tabsel[0] == "pane2" ? 8 : 0);
            this.join[__reg5] = this.join[__reg5] | 1 << __reg4;
            _root.send("<JOIN t=\"" + this.lobby_id + "," + __reg3 + "\" />");
            this.pane.taku["JOIN" + __reg4].setEnable(false);
            com.cegg.game.mahjong.LobbyMain.setBold(this.pane.taku["tfNum" + __reg4], true);
            this.SINGLE.setEnable(false);
            this.CANCEL.setEnable(true);
            return;
        }
        else if (__reg0 === "JOIN8") 
        {
            __reg3 = com.cegg.game.mahjong.LobbyMain.Join2GameType(this.tabsel[0], this.takusel, msg.cmd);
            if (!com.cegg.game.mahjong.UtilBase.nExpireDays && (com.cegg.game.mahjong.Res.GT_ISTECH(__reg3) && 80 <= this.nGamePlaying112)) 
            {
                com.cegg.GDialog.messageBox(_root.Main, com.cegg.game.mahjong.Res.T_LOBBYTXT[10]);
                return;
            }
            __reg4 = int(msg.cmd.substr(4));
            __reg5 = int(this.takusel.substr(4)) + (this.tabsel[0] == "pane1" ? 4 : 0) + (this.tabsel[0] == "pane2" ? 8 : 0);
            this.join[__reg5] = this.join[__reg5] | 1 << __reg4;
            _root.send("<JOIN t=\"" + this.lobby_id + "," + __reg3 + "\" />");
            this.pane.taku["JOIN" + __reg4].setEnable(false);
            com.cegg.game.mahjong.LobbyMain.setBold(this.pane.taku["tfNum" + __reg4], true);
            this.SINGLE.setEnable(false);
            this.CANCEL.setEnable(true);
            return;
        }
        else if (__reg0 === "JOIN9") 
        {
            __reg3 = com.cegg.game.mahjong.LobbyMain.Join2GameType(this.tabsel[0], this.takusel, msg.cmd);
            if (!com.cegg.game.mahjong.UtilBase.nExpireDays && (com.cegg.game.mahjong.Res.GT_ISTECH(__reg3) && 80 <= this.nGamePlaying112)) 
            {
                com.cegg.GDialog.messageBox(_root.Main, com.cegg.game.mahjong.Res.T_LOBBYTXT[10]);
                return;
            }
            __reg4 = int(msg.cmd.substr(4));
            __reg5 = int(this.takusel.substr(4)) + (this.tabsel[0] == "pane1" ? 4 : 0) + (this.tabsel[0] == "pane2" ? 8 : 0);
            this.join[__reg5] = this.join[__reg5] | 1 << __reg4;
            _root.send("<JOIN t=\"" + this.lobby_id + "," + __reg3 + "\" />");
            this.pane.taku["JOIN" + __reg4].setEnable(false);
            com.cegg.game.mahjong.LobbyMain.setBold(this.pane.taku["tfNum" + __reg4], true);
            this.SINGLE.setEnable(false);
            this.CANCEL.setEnable(true);
            return;
        }
        else if (__reg0 === "JOIN10") 
        {
            __reg3 = com.cegg.game.mahjong.LobbyMain.Join2GameType(this.tabsel[0], this.takusel, msg.cmd);
            if (!com.cegg.game.mahjong.UtilBase.nExpireDays && (com.cegg.game.mahjong.Res.GT_ISTECH(__reg3) && 80 <= this.nGamePlaying112)) 
            {
                com.cegg.GDialog.messageBox(_root.Main, com.cegg.game.mahjong.Res.T_LOBBYTXT[10]);
                return;
            }
            __reg4 = int(msg.cmd.substr(4));
            __reg5 = int(this.takusel.substr(4)) + (this.tabsel[0] == "pane1" ? 4 : 0) + (this.tabsel[0] == "pane2" ? 8 : 0);
            this.join[__reg5] = this.join[__reg5] | 1 << __reg4;
            _root.send("<JOIN t=\"" + this.lobby_id + "," + __reg3 + "\" />");
            this.pane.taku["JOIN" + __reg4].setEnable(false);
            com.cegg.game.mahjong.LobbyMain.setBold(this.pane.taku["tfNum" + __reg4], true);
            this.SINGLE.setEnable(false);
            this.CANCEL.setEnable(true);
            return;
        }
        else if (__reg0 === "JOIN11") 
        {
            __reg3 = com.cegg.game.mahjong.LobbyMain.Join2GameType(this.tabsel[0], this.takusel, msg.cmd);
            if (!com.cegg.game.mahjong.UtilBase.nExpireDays && (com.cegg.game.mahjong.Res.GT_ISTECH(__reg3) && 80 <= this.nGamePlaying112)) 
            {
                com.cegg.GDialog.messageBox(_root.Main, com.cegg.game.mahjong.Res.T_LOBBYTXT[10]);
                return;
            }
            __reg4 = int(msg.cmd.substr(4));
            __reg5 = int(this.takusel.substr(4)) + (this.tabsel[0] == "pane1" ? 4 : 0) + (this.tabsel[0] == "pane2" ? 8 : 0);
            this.join[__reg5] = this.join[__reg5] | 1 << __reg4;
            _root.send("<JOIN t=\"" + this.lobby_id + "," + __reg3 + "\" />");
            this.pane.taku["JOIN" + __reg4].setEnable(false);
            com.cegg.game.mahjong.LobbyMain.setBold(this.pane.taku["tfNum" + __reg4], true);
            this.SINGLE.setEnable(false);
            this.CANCEL.setEnable(true);
            return;
        }
        else if (__reg0 === "SINGLE") 
        {
            this.join = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0];
            var __reg6 = 0;
            if (__reg6 < 12) 
            {
                for (;;) 
                {
                    ++__reg6;
                    if (__reg6 >= 12) 
                    {
                        break;
                    }
                    this.pane.taku["JOIN" + __reg6].setEnable(false);
                }
            }
            this.SINGLE.setEnable(false);
            this.CANCEL.setEnable(false);
            _root.send("<JOIN t=\"" + this.lobby_id + "," + msg.type + "\" />");
            return;
        }
        else if (__reg0 === "CANCEL") 
        {
            if (this.skipEnterLobbyCancelCount) 
            {
                return;
            }
            if (!this.CANCEL.isEnable()) 
            {
                return;
            }
            this.join = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0];
            var __reg7 = 0;
            if (__reg7 < 12) 
            {
                for (;;) 
                {
                    ++__reg7;
                    if (__reg7 >= 12) 
                    {
                        break;
                    }
                    this.pane.taku["JOIN" + __reg7].setEnable(true);
                    com.cegg.game.mahjong.LobbyMain.setBold(this.pane.taku["tfNum" + __reg7], false);
                }
            }
            this.SINGLE.setEnable(true);
            this.CANCEL.setEnable(false);
            _root.send("<JOIN />");
            return;
        }
        else if (__reg0 === "REJOIN_ALL") 
        {
            _root.send("<CHAT text=\"" + _global.escape("/lobby " + this.lobby_id) + "\" />");
            _root.send("<CHAT text=\"%2Fchat%20off\" />");
            this.skipEnterLobbyCancelCount = 1;
            var __reg8 = 0;
            if (__reg8 < 4) 
            {
                for (;;) 
                {
                    ++__reg8;
                    if (__reg8 >= 4) 
                    {
                        break;
                    }
                    var __reg9 = 0;
                    if (__reg9 < 12) 
                    {
                        for (;;) 
                        {
                            ++__reg9;
                            if (__reg9 >= 12) 
                            {
                                break;
                            }
                            if (this.join[__reg8 + 0] ^ -1 & 1 << __reg9) 
                            {
                                continue;
                            }
                            var __reg10 = com.cegg.game.mahjong.LobbyMain.Join2GameType("pane0", "taku" + __reg8, "JOIN" + __reg9);
                            _root.send("<JOIN t=\"" + this.lobby_id + "," + __reg10 + "\" />");
                        }
                    }
                    __reg9 = 0;
                    if (__reg9 < 8) 
                    {
                        for (;;) 
                        {
                            ++__reg9;
                            if (__reg9 >= 8) 
                            {
                                break;
                            }
                            if (this.join[__reg8 + 4] ^ -1 & 1 << __reg9) 
                            {
                                continue;
                            }
                            var __reg11 = com.cegg.game.mahjong.LobbyMain.Join2GameType("pane1", "taku" + __reg8, "JOIN" + __reg9);
                            _root.send("<JOIN t=\"" + this.lobby_id + "," + __reg11 + "\" />");
                        }
                    }
                }
            }
            return;
        }
        else if (__reg0 === "CHANGELOBBY_FREE") 
        {
            _root.send("<CHAT text=\"%2Flobby%20" + 0 + "\" />");
            return;
        }
        else if (__reg0 === "CHANGELOBBY_PRIVATE") 
        {
            _root.send("<CHAT text=\"%2Flobby%20" + _root.lb + "\" />");
            return;
        }
        else if (__reg0 === "CHAT_ON") 
        {
            _root.send("<CHAT text=\"%2Fchat%20on\" />");
            return;
        }
        else if (__reg0 === "CHAT_OFF") 
        {
            _root.send("<CHAT text=\"%2Fchat%20off\" />");
            return;
        }
        _root.onCommand(msg);
        return;
    }
    ;
    __reg1.onXMLNode = function (n)
    {
        var __reg3 = n.attributes;
        if ((__reg0 = n.nodeName) === "CHAT") 
        {
            if (__reg3.lobby.length) 
            {
                this.onCommand({cmd: "CANCEL"});
                if (this.skipEnterLobbyCancelCount) 
                {
                    --this.skipEnterLobbyCancelCount;
                    _root.Main.View.Chat.chatOut("#REFRESH LOBBY " + __reg3.lobby + "\n");
                }
                else 
                {
                    _root.Main.View.Chat.chatOut("#ENTER LOBBY " + __reg3.lobby + "\n");
                }
                this.lobby_id = int(__reg3.lobby);
                this.onChangeLobby();
            }
            else 
            {
                if (__reg3.uname.length) 
                {
                    _root.Main.View.Chat.chatOut(_global.unescape(__reg3.uname) + ": ");
                }
                _root.Main.View.Chat.chatOut(_global.unescape(__reg3.text) + "\n");
            }
            return;
        }
        else if (__reg0 === "LN") 
        {
            this.LN = __reg3;
            this.updateLN();
            return;
        }
        else if (__reg0 === "WG") 
        {
            if (!this.pwg) 
            {
                return;
            }
            this.pwg.tf.htmlText = (this.lobby_id ? "" : com.cegg.game.mahjong.Res.T_WG0000) + com.cegg.game.mahjong.LobbyBase.CompileWG(__reg3);
            return;
        }
        else if (__reg0 !== "RANKING") 
        {
            return;
        }
        this.Prof.onXMLNode(n);
        return;
    }
    ;
    __reg1.updateLN = function ()
    {
        var __reg2 = com.cegg.game.mahjong.Util.csv_intZA(this.LN.n).split(",");
        var __reg3 = com.cegg.game.mahjong.Util.csv_intZA(this.LN.j).split(",");
        var __reg4 = com.cegg.game.mahjong.Util.csv_intZA(this.LN.g).split(",");
        this.tfStat.text = com.cegg.game.mahjong.Res.T_USERNUM + " " + int(__reg2[0]) + com.cegg.game.mahjong.Res.T_NIN + "    " + com.cegg.game.mahjong.Res.T_LOBBYNUM + " " + int(__reg2[2]) + com.cegg.game.mahjong.Res.T_NIN + "    " + com.cegg.game.mahjong.Res.T_OHRASUNUM + " " + int(__reg2[3]) + com.cegg.game.mahjong.Res.T_NIN;
        if (this.tabsel[0] == "pane0") 
        {
            if ((__reg0 = this.takusel) === "taku0") 
            {
                __reg5 = [3, 7, 1, 5, 0, 4, 8, 12, 64 + 0, 64 + 1, 64 + 8, 64 + 9];
            }
            else if (__reg0 === "taku1") 
            {
                __reg5 = [16 + 3, 16 + 7, 16 + 1, 16 + 5, 16 + 0, 16 + 4, 16 + 8, 16 + 12, 64 + 2, 64 + 3, 64 + 10, 64 + 11];
            }
            else if (__reg0 === "taku2") 
            {
                __reg5 = [32 + 3, 32 + 7, 32 + 1, 32 + 5, 32 + 0, 32 + 4, 32 + 8, 32 + 12, 64 + 4, 64 + 5, 64 + 12, 64 + 13];
            }
            else if (__reg0 === "taku3") 
            {
                __reg5 = [48 + 3, 48 + 7, 48 + 1, 48 + 5, 48 + 0, 48 + 4, 48 + 8, 48 + 12, 64 + 6, 64 + 7, 64 + 14, 64 + 15];
            }
        }
        else if (this.tabsel[0] == "pane1") 
        {
            if ((__reg0 = this.takusel) === "taku0") 
            {
                __reg5 = [80 + 0 * 8 + 0, 80 + 0 * 8 + 1, 80 + 0 * 8 + 2, 80 + 0 * 8 + 3, 80 + 0 * 8 + 4, 80 + 0 * 8 + 5, 80 + 0 * 8 + 6, 80 + 0 * 8 + 7];
            }
            else if (__reg0 === "taku1") 
            {
                __reg5 = [80 + 1 * 8 + 0, 80 + 1 * 8 + 1, 80 + 1 * 8 + 2, 80 + 1 * 8 + 3, 80 + 1 * 8 + 4, 80 + 1 * 8 + 5, 80 + 1 * 8 + 6, 80 + 1 * 8 + 7];
            }
            else if (__reg0 === "taku2") 
            {
                __reg5 = [80 + 2 * 8 + 0, 80 + 2 * 8 + 1, 80 + 2 * 8 + 2, 80 + 2 * 8 + 3, 80 + 2 * 8 + 4, 80 + 2 * 8 + 5, 80 + 2 * 8 + 6, 80 + 2 * 8 + 7];
            }
            else if (__reg0 === "taku3") 
            {
                __reg5 = [80 + 3 * 8 + 0, 80 + 3 * 8 + 1, 80 + 3 * 8 + 2, 80 + 3 * 8 + 3, 80 + 3 * 8 + 4, 80 + 3 * 8 + 5, 80 + 3 * 8 + 6, 80 + 3 * 8 + 7];
            }
        }
        else if (this.tabsel[0] == "pane2") 
        {
            if ((__reg0 = this.takusel) === "taku0") 
            {
                var __reg5 = [112 + 0];
            }
        }
        var __reg6 = 0;
        if (__reg6 < __reg5.length) 
        {
            for (;;) 
            {
                ++__reg6;
                if (__reg6 >= __reg5.length) 
                {
                    break;
                }
                this.pane.taku["tfNum" + __reg6].text = int(__reg3[__reg5[__reg6]]) + ":" + int(__reg4[__reg5[__reg6]]);
            }
        }
        this.nGamePlaying112 = int(__reg4[112 + 0]);
    }
    ;
    __reg1.onIntervalWG = function ()
    {
        if (this.pwg && this.pwg._visible) 
        {
            if (this.idTimerWG == undefined) 
            {
                this.idTimerWG = _global.setInterval(this, "onIntervalWG", 60 * 1000);
            }
            _root.send("<CHAT text=\"" + _global.escape("/wg") + "\" />");
            return;
        }
        if (this.idTimerWG != undefined) 
        {
            _global.clearInterval(this.idTimerWG);
            this.idTimerWG = undefined;
        }
    }
    ;
    __reg0.Join2GameType = function (tabsel, takusel, joinsel)
    {
        var __reg5 = com.cegg.game.mahjong.Res.GT_MULTI;
        if ((__reg0 = takusel) === "taku0") 
        {
            __reg5 = __reg5 | 0;
        }
        else if (__reg0 === "taku1") 
        {
            __reg5 = __reg5 | com.cegg.game.mahjong.Res.GT_HIGH;
        }
        else if (__reg0 === "taku2") 
        {
            __reg5 = __reg5 | com.cegg.game.mahjong.Res.GT_TOKU;
        }
        else if (__reg0 === "taku3") 
        {
            __reg5 = __reg5 | com.cegg.game.mahjong.Res.GT_HOUO;
        }
        if (tabsel == "pane0") 
        {
            if ((__reg0 = joinsel) === "JOIN0") 
            {
                __reg5 = __reg5 | com.cegg.game.mahjong.Res.GT_NOAKA | com.cegg.game.mahjong.Res.GT_NOKUI;
            }
            else if (__reg0 === "JOIN1") 
            {
                __reg5 = __reg5 | com.cegg.game.mahjong.Res.GT_NAN | com.cegg.game.mahjong.Res.GT_NOAKA | com.cegg.game.mahjong.Res.GT_NOKUI;
            }
            else if (__reg0 === "JOIN2") 
            {
                __reg5 = __reg5 | com.cegg.game.mahjong.Res.GT_NOAKA;
            }
            else if (__reg0 === "JOIN3") 
            {
                __reg5 = __reg5 | com.cegg.game.mahjong.Res.GT_NAN | com.cegg.game.mahjong.Res.GT_NOAKA;
            }
            else if (__reg0 === "JOIN4") 
            {
                __reg5 = __reg5 | 0;
            }
            else if (__reg0 === "JOIN5") 
            {
                __reg5 = __reg5 | com.cegg.game.mahjong.Res.GT_NAN;
            }
            else if (__reg0 === "JOIN6") 
            {
                __reg5 = __reg5 | com.cegg.game.mahjong.Res.GT_SAKU;
            }
            else if (__reg0 === "JOIN7") 
            {
                __reg5 = __reg5 | com.cegg.game.mahjong.Res.GT_NAN | com.cegg.game.mahjong.Res.GT_SAKU;
            }
            else if (__reg0 === "JOIN8") 
            {
                __reg5 = __reg5 | com.cegg.game.mahjong.Res.GT_SANMA;
            }
            else if (__reg0 === "JOIN9") 
            {
                __reg5 = __reg5 | com.cegg.game.mahjong.Res.GT_NAN | com.cegg.game.mahjong.Res.GT_SANMA;
            }
            else if (__reg0 === "JOIN10") 
            {
                __reg5 = __reg5 | com.cegg.game.mahjong.Res.GT_SANMA | com.cegg.game.mahjong.Res.GT_SAKU;
            }
            else if (__reg0 === "JOIN11") 
            {
                __reg5 = __reg5 | com.cegg.game.mahjong.Res.GT_NAN | com.cegg.game.mahjong.Res.GT_SANMA | com.cegg.game.mahjong.Res.GT_SAKU;
            }
        }
        else if (tabsel == "pane1") 
        {
            if ((__reg0 = joinsel) === "JOIN0") 
            {
                __reg5 = __reg5 | com.cegg.game.mahjong.Res.GT_JANS;
            }
            else if (__reg0 === "JOIN1") 
            {
                __reg5 = __reg5 | com.cegg.game.mahjong.Res.GT_NAN | com.cegg.game.mahjong.Res.GT_JANS;
            }
            else if (__reg0 === "JOIN2") 
            {
                __reg5 = __reg5 | com.cegg.game.mahjong.Res.GT_CHIP;
            }
            else if (__reg0 === "JOIN3") 
            {
                __reg5 = __reg5 | com.cegg.game.mahjong.Res.GT_NAN | com.cegg.game.mahjong.Res.GT_CHIP;
            }
            else if (__reg0 === "JOIN4") 
            {
                __reg5 = __reg5 | com.cegg.game.mahjong.Res.GT_CHIP5;
            }
            else if (__reg0 === "JOIN5") 
            {
                __reg5 = __reg5 | com.cegg.game.mahjong.Res.GT_NAN | com.cegg.game.mahjong.Res.GT_CHIP5;
            }
            else if (__reg0 === "JOIN6") 
            {
                __reg5 = __reg5 | com.cegg.game.mahjong.Res.GT_SANMA | com.cegg.game.mahjong.Res.GT_CHIP5;
            }
            else if (__reg0 === "JOIN7") 
            {
                __reg5 = __reg5 | com.cegg.game.mahjong.Res.GT_NAN | com.cegg.game.mahjong.Res.GT_SANMA | com.cegg.game.mahjong.Res.GT_CHIP5;
            }
        }
        else if (tabsel == "pane2") 
        {
            if ((__reg0 = joinsel) === "JOIN0") 
            {
                __reg5 = __reg5 | com.cegg.game.mahjong.Res.GT_TECH | com.cegg.game.mahjong.Res.GT_SAKU;
            }
        }
        return __reg5;
    }
    ;
    __reg1.onUpdateCondition = function (name)
    {
        if (name == "TICK") 
        {
            if (this.mcRule) 
            {
                com.cegg.game.mahjong.LobbyMain.nameHover = undefined;
                this.mcRule.removeMovieClip();
                this.Prof._visible = true;
            }
            else 
            {
                this.showRuleInfo();
            }
            return;
        }
        if (name == "HIDE") 
        {
            com.cegg.game.mahjong.LobbyMain.nameHover = undefined;
            this.iConditionCount = 10;
            return;
        }
        if (this.mcRule) 
        {
            com.cegg.game.mahjong.LobbyMain.nameHover = name;
            this.showRuleInfo();
            this.iConditionCount = 0;
            return;
        }
        com.cegg.game.mahjong.LobbyMain.nameHover = name;
        this.iConditionCount = 10;
    }
    ;
    __reg1.showRuleInfo = function ()
    {
        if (com.cegg.game.mahjong.LobbyMain.nameHover != undefined) 
        {
            this.createEmptyMovieClip("mcRule", 1001);
            var __reg2 = this.mcRule;
            __reg2.clear();
            __reg2._x = com.cegg.game.mahjong.LobbyMain.cx + 10;
            __reg2._y = this.caption._height;
            var __reg3 = com.cegg.game.mahjong.Prof2.cx - 20;
            var __reg4 = this.cy - __reg2._y;
            var __reg5 = com.cegg.game.mahjong.LobbyMain.Join2GameType(this.tabsel[0], this.takusel, com.cegg.game.mahjong.LobbyMain.nameHover);
            var __reg6 = com.cegg.game.mahjong.Res.GameTypeToInfo(__reg5, this.dan4, this.dan3);
            var __reg8 = 0;
            var __reg9 = 0;
            __reg2.lineStyle(1, 14540253, 100);
            var __reg7 = 0;
            if (__reg7 < __reg6.length) 
            {
                for (;;) 
                {
                    __reg7 = __reg7 + 2;
                    if (__reg7 >= __reg6.length) 
                    {
                        break;
                    }
                    com.cegg.game.mahjong.Util.createTextFieldTACS(__reg2, "tf" + (__reg7 + 0), __reg9++, 0, __reg8, 0, 22, __reg6[__reg7 + 0], "left", 0, true);
                    __reg8 = __reg8 + (__reg2["tf" + (__reg7 + 0)]._height - 3);
                    __reg2.moveTo(0, __reg8);
                    __reg2.lineTo(__reg3, __reg8);
                    com.cegg.game.mahjong.Util.createTextFieldTACS(__reg2, "tf" + (__reg7 + 1), __reg9++, 0, __reg8, 0, 22, __reg6[__reg7 + 1], "left", 0, true);
                    __reg8 = __reg8 + (__reg2["tf" + (__reg7 + 1)]._height - 3 + 5);
                }
            }
            __reg2._y = __reg2._y + int((__reg4 - __reg2._height) / 2);
            this.Prof._visible = false;
        }
    }
    ;
    __reg0.showPaymentInfo = function (mc, nt)
    {
        mc.createTextField("tf", 0, 0, 45, com.cegg.game.mahjong.LobbyMain.cx, 22);
        with (mc.tf)
        {
            autoSize = "center";
            multiline = true;
            html = true;
        }
        var __reg4 = "ID00000000";
        if (_root.uname.substr(0, 2) == "ID") 
        {
            __reg4 = _root.uname.substr(0, 10);
        }
        mc.tf.htmlText = com.cegg.game.mahjong.Res.T_LOBBYEXPIRED[nt].split("%ID%").join(__reg4);
    }
    ;
    ASSetPropFlags(__reg1, null, 1);
    __reg0.SymbolName = "__Packages.com.cegg.game.mahjong.LobbyMain";
    __reg0.SymbolOwner = com.cegg.game.mahjong.LobbyMain;
    __reg0.SymbolLinked = Object.registerClass(com.cegg.game.mahjong.LobbyMain.SymbolName, com.cegg.game.mahjong.LobbyMain.SymbolOwner);
    __reg0.cx = 290;
    __reg1.cy = 0;
    __reg1.nGamePlaying112 = 80;
    __reg0.nameHover = undefined;
}#endinitclip

//子图形 23
//  初始化剪辑
#initclip 0

if (!com.cegg.game.shanghai.ShanghaiMain) 
{
    if (!com) 
    {
        _global.com = new Object();
    }
    if (!com.cegg) 
    {
        _global.com.cegg = new Object();
    }
    if (!com.cegg.game) 
    {
        _global.com.cegg.game = new Object();
    }
    if (!com.cegg.game.shanghai) 
    {
        _global.com.cegg.game.shanghai = new Object();
    }
    (_global.com.cegg.game.shanghai.ShanghaiMain = function ()
    {
        super();
        var __reg3 = 136 * 2;
        this.createTextField("tf", __reg3++, 0, 0, 100, 20);
        com.cegg.GButton.createTextButton("HINT", com.cegg.game.mahjong.Res.T_HINT, __reg3++, this);
        com.cegg.GButton.createTextButton("RETRY", com.cegg.game.mahjong.Res.T_RETRY, __reg3++, this);
        com.cegg.GButton.createTextButton("EDIT", com.cegg.game.mahjong.Res.T_EDIT, __reg3++, this);
        com.cegg.GButton.createTextButton("CLOSE", com.cegg.game.mahjong.Res.T_CLOSE, __reg3++, this);
        var __reg4 = "";
        __reg4 = __reg4 + "<menu>";
        var __reg5 = 1;
        if (__reg5 < com.cegg.game.shanghai.ShanghaiMain.ground_base.length) 
        {
            for (;;) 
            {
                ++__reg5;
                if (__reg5 >= com.cegg.game.shanghai.ShanghaiMain.ground_base.length) 
                {
                    break;
                }
                __reg4 = __reg4 + ("<item disp=\"" + __reg5 + "\" cmd=\"LEVELOK\" level=\"" + __reg5 + "\"/>");
                if (!(__reg5 % 5)) 
                {
                    __reg4 = __reg4 + "<br/>";
                }
            }
        }
        __reg4 = __reg4 + "</menu>";
        com.cegg.GButton.createTextButton("LEVEL", "Level", __reg3++, this, (new XML(__reg4)).firstChild);
        this.HINT._visible = this.RETRY._visible = this.EDIT._visible = this.LEVEL._visible = this.CLOSE._visible = false;
        with (this.tf)
        {
            autoSize = "left";
            selectable = false;
            textColor = 16777215;
        }
        this.init();
    }
    ).prototype.__proto__ = MovieClip.prototype;
    __reg0.prototype.__constructor__ = MovieClip;
    var __reg1 = __reg0.prototype;
    __reg1.init = function ()
    {
        this.hintUsed = false;
        this.haiSel = undefined;
        var __reg2 = 0;
        if (__reg2 < 136) 
        {
            for (;;) 
            {
                ++__reg2;
                if (__reg2 >= 136) 
                {
                    break;
                }
                this[__reg2].removeMovieClip();
            }
        }
        this.onEnterFrame = this.onEnterFrame_AsyncInit;
    }
    ;
    __reg1.onEnterFrame_AsyncInit = function ()
    {
        delete this.onEnterFrame;
        this.ground = [];
        var __reg3 = com.cegg.game.shanghai.ShanghaiMain.ground_base[com.cegg.game.shanghai.ShanghaiMain.level].split("\r\n").join("\n");
        var __reg2 = 0;
        if (__reg2 < __reg3.length) 
        {
            for (;;) 
            {
                ++__reg2;
                if (__reg2 >= __reg3.length) 
                {
                    break;
                }
                if (__reg3.charCodeAt(__reg2) == 13) 
                {
                    __reg3 = __reg3.substr(0, __reg2) + "\n" + __reg3.substr(__reg2 + 1);
                }
            }
        }
        var __reg4 = __reg3.split("\n\n");
        while (!__reg4[0].length) 
        {
            __reg4.shift();
        }
        while (!__reg4[__reg4.length - 1].length) 
        {
            __reg4.pop();
        }
        __reg2 = 0;
        if (__reg2 < __reg4.length) 
        {
            for (;;) 
            {
                ++__reg2;
                if (__reg2 >= __reg4.length) 
                {
                    break;
                }
                var __reg5 = __reg4[__reg2].split("\n");
                while (!__reg5[0].length) 
                {
                    __reg5.shift();
                }
                while (!__reg5[__reg5.length - 1].length) 
                {
                    __reg5.pop();
                }
                this.ground.push(__reg5);
            }
        }
        var __reg6 = [];
        var __reg7 = 0;
        var __reg8 = 0;
        var __reg9 = 0;
        __reg2 = 0;
        if (__reg2 < this.ground.length) 
        {
            for (;;) 
            {
                ++__reg2;
                if (__reg2 >= this.ground.length) 
                {
                    break;
                }
                var __reg12 = this.ground[__reg2];
                if (__reg9 < __reg12.length) 
                {
                    __reg9 = __reg12.length;
                }
                var __reg11 = 0;
                if (__reg11 < __reg12.length) 
                {
                    for (;;) 
                    {
                        ++__reg11;
                        if (__reg11 >= __reg12.length) 
                        {
                            break;
                        }
                        var __reg13 = __reg12[__reg11];
                        if (__reg8 < __reg13.length) 
                        {
                            __reg8 = __reg13.length;
                        }
                        var __reg10 = 0;
                        if (__reg10 < __reg13.length) 
                        {
                            for (;;) 
                            {
                                ++__reg10;
                                if (__reg10 >= __reg13.length) 
                                {
                                    break;
                                }
                                if (__reg13.charCodeAt(__reg10) != 46) 
                                {
                                    ++__reg7;
                                }
                            }
                        }
                    }
                }
            }
        }
        com.cegg.Trace.out("max_x=" + __reg8 + " max_y=" + __reg9 + " n=" + __reg7 + "\n", "com.cegg.game.shanghai.ShanghaiMain::onEnterFrame_AsyncInit", "K:\\dev\\mahjong5\\swf\\mtasc-1.11/std/com/cegg/game/shanghai/ShanghaiMain.as", 93);
        if (__reg7 % 4 || __reg7 > 136) 
        {
            com.cegg.GDialog.messageBox(_root.Main, com.cegg.game.mahjong.Res.T_ERRORSHANGHAI + "(" + __reg7 + ")");
            return undefined;
        }
        var __reg14 = [];
        __reg2 = 0;
        if (__reg2 < 34) 
        {
            for (;;) 
            {
                ++__reg2;
                if (__reg2 >= 34) 
                {
                    break;
                }
                __reg14.push(__reg2);
            }
        }
        var __reg15 = [];
        __reg2 = 0;
        if (__reg2 < __reg7) 
        {
            for (;;) 
            {
                __reg2 = __reg2 + 4;
                if (__reg2 >= __reg7) 
                {
                    break;
                }
                var __reg16 = __reg14.splice(random(__reg14.length), 1)[0];
                __reg15.push(__reg16 * 4 + 0);
                __reg15.push(__reg16 * 4 + 1);
                __reg15.push(__reg16 * 4 + 2);
                __reg15.push(__reg16 * 4 + 3);
            }
        }
        while (__reg15.length) 
        {
            __reg6[__reg15.length - 1] = __reg15.splice(random(__reg15.length), 1)[0];
        }
        var __reg20 = (__reg8 >= __reg9 ? __reg8 : __reg9) * 2;
        __reg7 = 0;
        __reg2 = 0;
        if (__reg2 < this.ground.length) 
        {
            for (;;) 
            {
                ++__reg2;
                if (__reg2 >= this.ground.length) 
                {
                    break;
                }
                var __reg17 = 0;
                if (__reg17 < __reg20) 
                {
                    for (;;) 
                    {
                        ++__reg17;
                        if (__reg17 >= __reg20) 
                        {
                            break;
                        }
                        var __reg18 = 0;
                        if (__reg18 < __reg20) 
                        {
                            for (;;) 
                            {
                                ++__reg18;
                                if (__reg18 >= __reg20) 
                                {
                                    break;
                                }
                                if (__reg17 >= __reg18) 
                                {
                                    var __reg19 = __reg17 - __reg18;
                                    var __reg21 = this.ground[__reg2][__reg19];
                                    if (__reg21 != undefined) 
                                    {
                                        if (__reg18 < __reg21.length) 
                                        {
                                            if (__reg21.charCodeAt(__reg18) != 46) 
                                            {
                                                this.attachMovie("kawa_sdw0s", "sx" + __reg18 + "y" + __reg19 + "i" + __reg2, __reg7, {_x: int(__reg18 * com.cegg.game.mahjong.Hai.X0 / 2) - 6, _y: int(__reg19 * com.cegg.game.mahjong.Hai.Y0 / 2 - __reg2 * com.cegg.game.mahjong.Hai.Y0T) - 7, _visible: false});
                                                ++__reg7;
                                            }
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
                __reg17 = 0;
                if (__reg17 < __reg20) 
                {
                    for (;;) 
                    {
                        ++__reg17;
                        if (__reg17 >= __reg20) 
                        {
                            break;
                        }
                        __reg18 = 0;
                        if (__reg18 < __reg20) 
                        {
                            for (;;) 
                            {
                                ++__reg18;
                                if (__reg18 >= __reg20) 
                                {
                                    break;
                                }
                                if (__reg17 >= __reg18) 
                                {
                                    __reg19 = __reg17 - __reg18;
                                    var __reg22 = this.ground[__reg2][__reg19];
                                    if (__reg22 != undefined) 
                                    {
                                        if (__reg18 < __reg22.length) 
                                        {
                                            if (__reg22.charCodeAt(__reg18) != 46) 
                                            {
                                                var __reg23 = int(__reg6.pop());
                                                this.attachMovie(com.cegg.game.mahjong.Hai.SymbolName, String(__reg23), __reg7, {hai34: int(__reg23 / 4), x: __reg18, y: __reg19, i: __reg2, sdw: this["sx" + __reg18 + "y" + __reg19 + "i" + __reg2], _x: int(__reg18 * com.cegg.game.mahjong.Hai.X0 / 2), _y: int(__reg19 * com.cegg.game.mahjong.Hai.Y0 / 2 - __reg2 * com.cegg.game.mahjong.Hai.Y0T), _visible: false, onRollOver: function ()
                                                {
                                                    this._parent.onRollOverHai(this);
                                                }
                                                , onRollOut: function ()
                                                {
                                                    this._parent.onRollOutHai(this);
                                                }
                                                , onRelease: function ()
                                                {
                                                    this._parent.onReleaseHai(this);
                                                }
                                                , onReleaseOutside: function ()
                                                {
                                                    this._parent.onRollOutHai(this);
                                                }
                                                , onUnload: function ()
                                                {
                                                    this.sdw.removeMovieClip();
                                                }
                                                , c: int((__reg18 + __reg19) / 2)});
                                                this[__reg23].setImage(__reg23, 0, false);
                                                this[__reg23][0].removeMovieClip();
                                                this[__reg23].onEnterFrame = function ()
                                                {
                                                    if (this.c == 1) 
                                                    {
                                                        _root.SE.play("SE_KACHI");
                                                    }
                                                    if (this.c--) 
                                                    {
                                                        return undefined;
                                                    }
                                                    this._visible = this.sdw._visible = true;
                                                    delete this.onEnterFrame;
                                                }
                                                ;
                                                ++__reg7;
                                            }
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }
        this.tf.text = "Level  " + com.cegg.game.shanghai.ShanghaiMain.level;
        this.HINT._visible = this.RETRY._visible = this.EDIT._visible = this.LEVEL._visible = this.CLOSE._visible = true;
        this.HINT._x = int((com.cegg.game.mahjong.Hai.X0 * __reg8 / 2 - this.HINT._width - this.RETRY._width - this.EDIT._width - this.LEVEL._width - this.CLOSE._width) / 2);
        this.RETRY._x = this.HINT._x + this.HINT._width;
        this.EDIT._x = this.RETRY._x + this.RETRY._width;
        this.LEVEL._x = this.EDIT._x + this.EDIT._width;
        this.CLOSE._x = this.LEVEL._x + this.LEVEL._width;
        this.HINT._y = this.RETRY._y = this.EDIT._y = this.LEVEL._y = this.CLOSE._y = com.cegg.game.mahjong.Hai.Y0 * (__reg9 / 2 + 1);
        this.tf._y = 0 - this.tf._height;
        this._x = int((Stage.width - com.cegg.game.mahjong.Hai.X0 * __reg8 / 2) / 2);
        this._y = Stage.height - (this.HINT._y + this.HINT._height);
    }
    ;
    __reg1.onRollOverHai = function (mc)
    {
        var __reg3 = mc.hai34 * 4;
        this[__reg3 + 0].setColor(1);
        this[__reg3 + 1].setColor(1);
        this[__reg3 + 2].setColor(1);
        this[__reg3 + 3].setColor(1);
        this.haiSel.setColor(2);
    }
    ;
    __reg1.onRollOutHai = function (mc)
    {
        var __reg3 = mc.hai34 * 4;
        this[__reg3 + 0].setColor(0);
        this[__reg3 + 1].setColor(0);
        this[__reg3 + 2].setColor(0);
        this[__reg3 + 3].setColor(0);
        this.haiSel.setColor(2);
    }
    ;
    __reg1.onReleaseHai = function (hai)
    {
        if (this.haiSel) 
        {
            this.onRollOutHai(hai);
            if (this.findPath(this.haiSel, hai)) 
            {
                _root.SE.play("SE_PON");
                var __reg3 = this.ground[this.haiSel.i][this.haiSel.y];
                this.ground[this.haiSel.i][this.haiSel.y] = __reg3.substr(0, this.haiSel.x) + "." + __reg3.substr(this.haiSel.x + 1);
                __reg3 = this.ground[hai.i][hai.y];
                this.ground[hai.i][hai.y] = __reg3.substr(0, hai.x) + "." + __reg3.substr(hai.x + 1);
                this.haiSel.removeMovieClip();
                hai.removeMovieClip();
                delete this.haiSel;
                this.onEnterFrame = this.onEnterFrame_AsyncCompleteCheck;
            }
            else 
            {
                _root.SE.play("SE_KACHI");
                hai = this.haiSel;
                delete this.haiSel;
                this.onRollOutHai(hai);
            }
            return;
        }
        if (this.isRemovable(hai)) 
        {
            this.haiSel = hai;
            this.onRollOverHai(hai);
        }
    }
    ;
    __reg1.onEnterFrame_AsyncCompleteCheck = function ()
    {
        delete this.onEnterFrame;
        if (this.isComplete()) 
        {
            if (com.cegg.game.shanghai.ShanghaiMain.level == com.cegg.game.shanghai.ShanghaiMain.ground_base.length - 1 && !this.hintUsed) 
            {
                com.cegg.GDialog.messageBox(_root.Main, "Complete !!");
            }
            else 
            {
                if (!this.hintUsed) 
                {
                    ++com.cegg.game.shanghai.ShanghaiMain.level;
                }
                this.init();
            }
            return;
        }
        if (this.showHint(false)) 
        {
            return;
        }
        com.cegg.GDialog.messageBox(_root.Main, "Dead lock !!");
    }
    ;
    __reg1.isComplete = function ()
    {
        var __reg2 = 0;
        if (__reg2 < 136) 
        {
            for (;;) 
            {
                ++__reg2;
                if (__reg2 >= 136) 
                {
                    break;
                }
                if (this[__reg2]) 
                {
                    return false;
                }
            }
        }
        return true;
    }
    ;
    __reg1.showHint = function (hilite)
    {
        var __reg3 = 0;
        if (__reg3 < 34) 
        {
            for (;;) 
            {
                ++__reg3;
                if (__reg3 >= 34) 
                {
                    break;
                }
                var __reg4 = 0;
                if (__reg4 < 6) 
                {
                    for (;;) 
                    {
                        ++__reg4;
                        if (__reg4 >= 6) 
                        {
                            break;
                        }
                        var __reg5 = this[__reg3 * 4 + com.cegg.game.shanghai.ShanghaiMain.comp_a[__reg4][0]];
                        var __reg6 = this[__reg3 * 4 + com.cegg.game.shanghai.ShanghaiMain.comp_a[__reg4][1]];
                        if (this.findPath(__reg5, __reg6)) 
                        {
                            if (hilite) 
                            {
                                __reg5.setColor(3);
                                __reg6.setColor(3);
                            }
                            return true;
                        }
                    }
                }
            }
        }
        return false;
    }
    ;
    __reg1.findPath = function (h0, h1)
    {
        if (h0 == h1) 
        {
            return false;
        }
        if (h0.hai34 != h1.hai34) 
        {
            return false;
        }
        return this.isRemovable(h0) && this.isRemovable(h1);
    }
    ;
    __reg1.isRemovable = function (hai)
    {
        var __reg3 = hai.x;
        var __reg4 = hai.y;
        var __reg5 = hai.i;
        var __reg6 = this.ground[__reg5 + 1];
        if (__reg6 != undefined) 
        {
            var __reg7 = __reg6[__reg4 - 1];
            if (__reg7 != undefined && __reg3 < __reg7.length) 
            {
                if (__reg3 && __reg7.charCodeAt(__reg3 - 1) != 46) 
                {
                    return false;
                }
                if (__reg7.charCodeAt(__reg3) != 46) 
                {
                    return false;
                }
                if (__reg3 < __reg7.length - 2 && __reg7.charCodeAt(__reg3 + 1) != 46) 
                {
                    return false;
                }
            }
            __reg7 = __reg6[__reg4];
            if (__reg7 != undefined && __reg3 < __reg7.length) 
            {
                if (__reg3 && __reg7.charCodeAt(__reg3 - 1) != 46) 
                {
                    return false;
                }
                if (__reg7.charCodeAt(__reg3) != 46) 
                {
                    return false;
                }
                if (__reg3 < __reg7.length - 2 && __reg7.charCodeAt(__reg3 + 1) != 46) 
                {
                    return false;
                }
            }
            __reg7 = __reg6[__reg4 + 1];
            if (__reg7 != undefined && __reg3 < __reg7.length) 
            {
                if (__reg3 && __reg7.charCodeAt(__reg3 - 1) != 46) 
                {
                    return false;
                }
                if (__reg7.charCodeAt(__reg3) != 46) 
                {
                    return false;
                }
                if (__reg3 < __reg7.length - 2 && __reg7.charCodeAt(__reg3 + 1) != 46) 
                {
                    return false;
                }
            }
        }
        __reg6 = this.ground[__reg5];
        if (__reg3 < 2) 
        {
            return true;
        }
        if (__reg6[__reg4].length - 3 < __reg3) 
        {
            return true;
        }
        if (__reg6[__reg4].charCodeAt(__reg3 - 2) == 46 && ((__reg6[__reg4 - 1] == undefined || (__reg6[__reg4 - 1].length - 3 < __reg3 || __reg6[__reg4 - 1].charCodeAt(__reg3 - 2) == 46)) && (__reg6[__reg4 + 1] == undefined || (__reg6[__reg4 + 1].length - 3 < __reg3 || __reg6[__reg4 + 1].charCodeAt(__reg3 - 2) == 46)))) 
        {
            return true;
        }
        if (__reg6[__reg4].charCodeAt(__reg3 + 2) == 46 && ((__reg6[__reg4 - 1] == undefined || (__reg6[__reg4 - 1].length - 3 < __reg3 || __reg6[__reg4 - 1].charCodeAt(__reg3 + 2) == 46)) && (__reg6[__reg4 + 1] == undefined || (__reg6[__reg4 + 1].length - 3 < __reg3 || __reg6[__reg4 + 1].charCodeAt(__reg3 + 2) == 46)))) 
        {
            return true;
        }
        return false;
    }
    ;
    __reg1.onCommand = function (msg)
    {
        if ((__reg0 = msg.cmd) === "RETRY") 
        {
            this.init();
            return;
        }
        else if (__reg0 === "HINT") 
        {
            this.hintUsed = true;
            this.showHint(true);
            return;
        }
        else if (__reg0 === "EDIT") 
        {
            com.cegg.GDialog.textBox(this, com.cegg.game.shanghai.ShanghaiMain.ground_base[com.cegg.game.shanghai.ShanghaiMain.level], com.cegg.game.mahjong.Res.T_SHANGHAIEDIT, true, "EDITOK");
            return;
        }
        else if (__reg0 === "EDITOK") 
        {
            com.cegg.game.shanghai.ShanghaiMain.ground_base[com.cegg.game.shanghai.ShanghaiMain.level] = msg.text;
            this.init();
            return;
        }
        else if (__reg0 === "LEVELOK") 
        {
            com.cegg.game.shanghai.ShanghaiMain.level = msg.level;
            this.init();
            return;
        }
        else if (__reg0 !== "CLOSE") 
        {
            return;
        }
        this.removeMovieClip();
        return;
    }
    ;
    ASSetPropFlags(__reg1, null, 1);
    __reg0.SymbolName = "__Packages.com.cegg.game.shanghai.ShanghaiMain";
    __reg0.SymbolOwner = com.cegg.game.shanghai.ShanghaiMain;
    __reg0.SymbolLinked = Object.registerClass(com.cegg.game.shanghai.ShanghaiMain.SymbolName, com.cegg.game.shanghai.ShanghaiMain.SymbolOwner);
    __reg0.level = 1;
    __reg1.hintUsed = false;
    __reg0.comp_a = [[0, 1], [0, 2], [0, 3], [1, 2], [1, 3], [2, 3]];
    __reg0.ground_base = ["", "\n...o...\n.......\n..o.o..\no.....o\n..o.o..\n.......\n...o...\n\n.......\n.......\n..o.o..\n.......\n..o.o..\n.......\n.......\n", "\no.o.o.o\n.......\no.o.o.o\n.......\no.o.o.o\n.......\no.o.o.o\n\n.......\n.......\n..o.o..\n.......\n..o.o..\n.......\n.......\n", "\no.o.o.o.o.o\n...........\n..o.o.o.o..\n...........\n..o.o.o.o..\no.........o\n..o.o.o.o..\n...........\n..o.o.o.o..\n...........\no.o.o.o.o.o\n\n...........\n...........\n....o.o....\n...........\n....o.o....\n..o.....o..\n....o.o....\n...........\n....o.o....\n...........\n...........\n\n...........\n...........\n...........\n...........\n....o.o....\n...........\n....o.o....\n...........\n...........\n...........\n...........\n", "\no.o.o.o.o.o.o.o\n...............\n..o.o.o.o.o.o..\n...............\n....o.o.o.o....\n..o.........o.\no...o.o.o.o...o\n..o.........o..\no...o.o.o.o...o\n..o.........o..\n....o.o.o.o....\n...............\n..o.o.o.o.o.o..\n...............\no.o.o.o.o.o.o.o\n\n...............\n...............\n.....o.o.o.....\n...............\n....o.o.o.o....\n..o.........o..\n....o.o.o.o....\n..o.........o..\n....o.o.o.o....\n...............\n....o.o.o.o....\n...............\n.....o.o.o.....\n...............\n...............\n\n...............\n...............\n...............\n...............\n.......o.......\n...............\n......o.o......\n....o.....o....\n......o.o......\n...............\n.......o.......\n...............\n...............\n...............\n...............\n", "\n....o.o.o.o.o.o.o.o.o.o....\n...........................\n......o.o.o.o.o.o.o.o......\n...........................\n....o.o.o.o.o.o.o.o.o.o....\n...........................\n..o.o.o.o.o.o.o.o.o.o.o.o..\no.........................o.o\n..o.o.o.o.o.o.o.o.o.o.o.o..\n...........................\n....o.o.o.o.o.o.o.o.o.o....\n...........................\n......o.o.o.o.o.o.o.o......\n...........................\n....o.o.o.o.o.o.o.o.o.o....\n\n...........................\n...........................\n..........o.o.o.o..........\n...........................\n........o.o.o.o.o.o........\n...........................\n........o.o.o.o.o.o........\n...........................\n........o.o.o.o.o.o........\n...........................\n........o.o.o.o.o.o........\n...........................\n..........o.o.o.o..........\n...........................\n...........................\n\n...........................\n...........................\n...........................\n...........................\n..........o.o.o.o..........\n...........................\n..........o.o.o.o..........\n...........................\n..........o.o.o.o..........\n...........................\n..........o.o.o.o..........\n...........................\n...........................\n...........................\n...........................\n\n...........................\n...........................\n...........................\n...........................\n...........................\n...........................\n............o.o............\n...........................\n............o.o............\n...........................\n...........................\n...........................\n...........................\n...........................\n...........................\n\n\n...........................\n...........................\n...........................\n...........................\n...........................\n...........................\n...........................\n.............o.............\n...........................\n...........................\n...........................\n...........................\n...........................\n...........................\n...........................\n"];
}#endinitclip

//子图形 24
//  初始化剪辑
#initclip 0

if (!com.cegg.game.mahjong.Hai) 
{
    if (!com) 
    {
        _global.com = new Object();
    }
    if (!com.cegg) 
    {
        _global.com.cegg = new Object();
    }
    if (!com.cegg.game) 
    {
        _global.com.cegg.game = new Object();
    }
    if (!com.cegg.game.mahjong) 
    {
        _global.com.cegg.game.mahjong = new Object();
    }
    (_global.com.cegg.game.mahjong.Hai = function ()
    {
        super();
        this._focusrect = false;
        this.createEmptyMovieClip("anim", 1);
    }
    ).prototype.__proto__ = MovieClip.prototype;
    __reg0.prototype.__constructor__ = MovieClip;
    var __reg1 = __reg0.prototype;
    __reg1.setImage = function (_hai136, who, tehai)
    {
        this.hai136 = _hai136;
        who = who % 4;
        if (tehai && (_hai136 != undefined && who)) 
        {
            tehai = false;
        }
        if (tehai) 
        {
            this.attachMovie("tehai_sdw" + who, "0", 0, {_y: com.cegg.game.mahjong.Hai.YT - 60});
            if (who) 
            {
                this.anim.attachMovie("tehai" + who + "b", "0", 0);
                this.anim.attachMovie("tehai" + who + "c", "2", 2);
                this.anim[1].removeMovieClip();
                if (who == 1) 
                {
                    this[0]._x = this.anim["0"]._x = this.anim["2"]._x = 18;
                }
                if (who == 1 || who == 3) 
                {
                    this[0]._y = this.anim["0"]._y = this.anim["2"]._y = 10;
                }
            }
            else 
            {
                this.anim.attachMovie("tehai_cap0b", "1", 1);
                this.anim.attachMovie("tehai_cap0c", "2", 2);
                this.anim.attachMovie("tehai0" + com.cegg.game.mahjong.Hai.hai2bmp(this.hai136), "0", 0, {_y: this.anim[1]._height});
            }
        }
        else 
        {
            this.attachMovie("kawa_sdw" + who % 2, "0", 0, {_y: (who & 1 ? com.cegg.game.mahjong.Hai.Y1T : com.cegg.game.mahjong.Hai.Y0T) - 9});
            if (this.hai136 == undefined) 
            {
                this.anim.attachMovie("yama" + who % 2 + "b", "0", 0);
                this.anim.attachMovie("yama" + who % 2 + "c", "2", 2);
                this.anim[1].removeMovieClip();
            }
            else 
            {
                this.anim.attachMovie("kawa" + who + com.cegg.game.mahjong.Hai.hai2bmp(this.hai136), "0", 0);
                this.anim.attachMovie("kawa_cap" + who % 2 + "b", "1", 1, {_y: this.anim[0]._height});
                this.anim.attachMovie("kawa_cap" + who % 2 + "c", "2", 2, {_y: this.anim[0]._height});
            }
        }
        if (this.anim[2]) 
        {
            this.ccol = new Color(this.anim[2]);
            this.ccol.setTransform(com.cegg.game.mahjong.Hai.ct);
        }
    }
    ;
    __reg1.setColor = function (type, y)
    {
        if ((__reg0 = type) === 0) 
        {
            if (this.col) 
            {
                this.col.setTransform({ra: 100, rb: 0, ga: 100, gb: 0, ba: 100, bb: 0, aa: 100, ab: 0});
                delete this.col;
                this.col = undefined;
            }
        }
        else if (__reg0 === 1) 
        {
            if (!this.col) 
            {
                this.col = new Color(this.anim);
            }
            this.col.setTransform({ra: 100, rb: 0, ga: 50, gb: 128, ba: 75, bb: 64, aa: 100, ab: 0});
        }
        else if (__reg0 === 2) 
        {
            if (!this.col) 
            {
                this.col = new Color(this.anim);
            }
            this.col.setTransform({ra: 50, rb: 128, ga: 100, gb: 0, ba: 100, bb: 0, aa: 100, ab: 0});
        }
        else if (__reg0 === 3) 
        {
            if (!this.col) 
            {
                this.col = new Color(this.anim);
            }
            this.col.setTransform({ra: 100, rb: 0, ga: 100, gb: 0, ba: 0, bb: 255, aa: 100, ab: 0});
        }
        else if (__reg0 === 4) 
        {
            if (!this.col) 
            {
                this.col = new Color(this.anim);
            }
            this.col.setTransform({ra: 88, rb: 0, ga: 88, gb: 0, ba: 88, bb: 0, aa: 100, ab: 0});
        }
        else if (__reg0 === 5) 
        {
            if (!this.col) 
            {
                this.col = new Color(this.anim);
            }
            this.col.setTransform({ra: 75, rb: 0, ga: 75, gb: 0, ba: 75, bb: 0, aa: 100, ab: 0});
        }
        if (y != undefined) 
        {
            this.anim._y = y;
            this.nakis._y = y;
        }
    }
    ;
    __reg0.hai2bmp = function (i)
    {
        if (i == undefined) 
        {
            return 37;
        }
        if (com.cegg.game.mahjong.Hai.aka) 
        {
            if (i == (9 * 0 + 4) * 4 + 0) 
            {
                return 0;
            }
            if (i == (9 * 1 + 4) * 4 + 0) 
            {
                return 10;
            }
            if (i == (9 * 2 + 4) * 4 + 0) 
            {
                return 20;
            }
        }
        i = int(i / 4);
        if (i < 27) 
        {
            return int(i / 9) * 10 + i % 9 + 1;
        }
        return 30 + i % 9;
    }
    ;
    ASSetPropFlags(__reg1, null, 1);
    __reg0.SymbolName = "__Packages.com.cegg.game.mahjong.Hai";
    __reg0.SymbolOwner = com.cegg.game.mahjong.Hai;
    __reg0.SymbolLinked = Object.registerClass(com.cegg.game.mahjong.Hai.SymbolName, com.cegg.game.mahjong.Hai.SymbolOwner);
    __reg0.aka = true;
    __reg0.X0 = 31;
    __reg0.Y0 = 35;
    __reg0.Y0T = 9;
    __reg0.X1 = 40;
    __reg0.Y1 = 25;
    __reg0.Y1T = 9;
    __reg0.XT = 42;
    __reg0.YT = 60;
    __reg0.ct = {ra: 0, rb: 0, ga: 0, gb: 0, ba: 100, bb: 0, aa: 100, ab: 0};
}#endinitclip

//子图形 25
//  初始化剪辑
#initclip 0

if (!com.cegg.game.mahjong.CountDown) 
{
    if (!com) 
    {
        _global.com = new Object();
    }
    if (!com.cegg) 
    {
        _global.com.cegg = new Object();
    }
    if (!com.cegg.game) 
    {
        _global.com.cegg.game = new Object();
    }
    if (!com.cegg.game.mahjong) 
    {
        _global.com.cegg.game.mahjong = new Object();
    }
    (_global.com.cegg.game.mahjong.CountDown = function ()
    {
        super();
        if (this.useex) 
        {
            this.count = com.cegg.game.mahjong.CountDown.exinit;
        }
        if (this.count == undefined && com.cegg.game.mahjong.CountDown.excount < com.cegg.game.mahjong.CountDown.excountinit) 
        {
            com.cegg.game.mahjong.CountDown.excount = com.cegg.game.mahjong.CountDown.excount + 1000;
        }
        this.isEscapeDown = Key.isDown(Key.ESCAPE);
    }
    ).prototype.__proto__ = MovieClip.prototype;
    __reg0.prototype.__constructor__ = MovieClip;
    var __reg1 = __reg0.prototype;
    __reg1.onLoad = function ()
    {
        if (_root.Main.View.LogViewer == undefined) 
        {
            this.id = _global.setInterval(this, "onInterval", 1000);
        }
    }
    ;
    __reg1.onUnload = function ()
    {
        if (this.exadd && this.count == com.cegg.game.mahjong.CountDown.exinit) 
        {
            if (com.cegg.game.mahjong.CountDown.excount < com.cegg.game.mahjong.CountDown.excountinit) 
            {
                com.cegg.game.mahjong.CountDown.excount = com.cegg.game.mahjong.CountDown.excount + 1000;
            }
            this.count = 0;
        }
        if (this.id != undefined) 
        {
            _global.clearInterval(this.id);
            this.id = undefined;
        }
    }
    ;
    __reg1.removeMovieClip = function ()
    {
        this.onUnload();
        super.removeMovieClip();
    }
    ;
    __reg1.onEnterFrame = function ()
    {
        if (_root.Main.PopupMenu) 
        {
            return undefined;
        }
        if (!this.noescape && Key.isDown(Key.ESCAPE)) 
        {
            if (!this.isEscapeDown) 
            {
                this.onDoubleClick();
            }
            this.isEscapeDown = true;
            return;
        }
        this.isEscapeDown = false;
    }
    ;
    __reg1.onInterval = function ()
    {
        this.count = this.count - 1000;
        if (this.usesound && this.count > 0) 
        {
            _root.SE.play("SE_CLOCK", true, 0);
        }
        if (this.useex && (this.count < 0 && com.cegg.game.mahjong.CountDown.excount > 0)) 
        {
            com.cegg.game.mahjong.CountDown.excount = com.cegg.game.mahjong.CountDown.excount + this.count;
            this.count = 0;
        }
        if (this.count < 10 * 1000) 
        {
            this.createEmptyMovieClip("dg", 0);
            var __reg2 = this.count >= 0 ? String(int(this.count / 1000)) : "0";
            if (this.useex && com.cegg.game.mahjong.CountDown.excount > 0) 
            {
                __reg2 = __reg2 + (":" + String(int(com.cegg.game.mahjong.CountDown.excount / 1000)));
            }
            com.cegg.game.mahjong.Util.printDigit(this.dg, "tendigit", 6, __reg2);
        }
        if (this.useex && (this.count >= 0 && this.count + com.cegg.game.mahjong.CountDown.excount < 1000 * 3)) 
        {
            _root.SE.play("SE_TICK", true, 0);
        }
        if (this.count < 0) 
        {
            this.onDoubleClick();
        }
    }
    ;
    __reg1.clearDoubleClick = function ()
    {
        _global.clearInterval(this.intervalDCID);
        delete this.intervalDCID;
        delete (this.ptDown);
    }
    ;
    __reg1.onMouseDown = function ()
    {
        if (this.nodblclk) 
        {
            return undefined;
        }
        if (!_root._xmouse || !_root._ymouse) 
        {
            this.onDoubleClick();
            this.clearDoubleClick();
            return;
        }
        if (this.intervalDCID == undefined) 
        {
            this.ptDown = {x: this._xmouse, y: this._ymouse};
            this.intervalDCID = _global.setInterval(this, "clearDoubleClick", 500);
            return;
        }
        if (Math.abs(this._xmouse - this.ptDown.x) < 2 && Math.abs(this._ymouse - this.ptDown.y) < 2) 
        {
            this.onDoubleClick();
        }
        this.clearDoubleClick();
    }
    ;
    __reg1.onDoubleClick = function ()
    {
        if (this.press && this.press.onPress == undefined) 
        {
            return undefined;
        }
        if (this.release && this.release.onRelease == undefined) 
        {
            return undefined;
        }
        if (this.press) 
        {
            this.press.onPress();
        }
        if (this.release) 
        {
            this.release.onRelease();
        }
        if (this.command.length) 
        {
            this._parent.onCommand({cmd: this.command});
        }
        this.removeMovieClip();
    }
    ;
    ASSetPropFlags(__reg1, null, 1);
    __reg0.SymbolName = "__Packages.com.cegg.game.mahjong.CountDown";
    __reg0.SymbolOwner = com.cegg.game.mahjong.CountDown;
    __reg0.SymbolLinked = Object.registerClass(com.cegg.game.mahjong.CountDown.SymbolName, com.cegg.game.mahjong.CountDown.SymbolOwner);
    __reg0.excountinit = 0;
    __reg0.excount = com.cegg.game.mahjong.CountDown.excountinit;
    __reg0.exinit = 1000 * 7;
    __reg1.nodblclk = false;
    __reg1.noescape = false;
    __reg1.isEscapeDown = false;
    __reg1.intervalDCID = undefined;
    __reg1.ptDown = undefined;
}#endinitclip

//子图形 26
//  初始化剪辑
#initclip 0

if (!com.cegg.game.mahjong.AgariBox) 
{
    if (!com) 
    {
        _global.com = new Object();
    }
    if (!com.cegg) 
    {
        _global.com.cegg = new Object();
    }
    if (!com.cegg.game) 
    {
        _global.com.cegg.game = new Object();
    }
    if (!com.cegg.game.mahjong) 
    {
        _global.com.cegg.game.mahjong = new Object();
    }
    (_global.com.cegg.game.mahjong.AgariBox = function ()
    {
        super();
        if (this.attr) 
        {
            this.type = this.attr.type;
            this.msg = this.attr.msg;
            this.hai = this.attr.hai.length ? this.attr.hai.split(",") : undefined;
            this.mentsu136 = this.attr.m.length ? this.attr.m.split(",") : undefined;
            this.machi136 = int(this.attr.machi);
            this.ten = this.attr.ten.split(",");
            this.yaku = this.attr.yaku.length ? this.attr.yaku.split(",") : undefined;
            this.yakuman = this.attr.yakuman.length ? this.attr.yakuman.split(",") : undefined;
            this.chip = this.attr.chip.length ? this.attr.chip.split(",") : undefined;
            this.doraHai = this.attr.doraHai.length ? this.attr.doraHai.split(",") : undefined;
            this.doraHaiUra = this.attr.doraHaiUra.length ? this.attr.doraHaiUra.split(",") : undefined;
            this.score = this.attr.sc.length ? this.attr.sc.split(",") : undefined;
            this.honbanagare = this.attr.ba.length ? this.attr.ba.split(",") : undefined;
            this.owari = this.attr.owari.length ? this.attr.owari.split(",") : undefined;
            this.ratio = this.attr.ratio.length ? this.attr.ratio.split(",") : undefined;
        }
        if ((__reg0 = this.mode) === "TAIKYOKU") 
        {
            this.sleep = 0;
            return;
        }
        else if (__reg0 === "SAIKAI") 
        {
            this.sleep = 0;
            return;
        }
        else if (__reg0 === "KANSEN") 
        {
            this.sleep = 0;
            return;
        }
        this.sleep = 24;
        return;
    }
    ).prototype.__proto__ = MovieClip.prototype;
    __reg0.prototype.__constructor__ = MovieClip;
    var __reg1 = __reg0.prototype;
    __reg1.onEnterFrame = function ()
    {
        if (!this.sleep) 
        {
            this.show();
            this.onEnterFrame = undefined;
        }
        --this.sleep;
    }
    ;
    __reg1.show = function ()
    {
        var __reg2 = 460;
        var __reg3 = 0;
        this.createEmptyMovieClip("bg", __reg3++);
        this.createEmptyMovieClip("tehai", __reg3++);
        this.createEmptyMovieClip("yakutxt", __reg3++);
        this.createEmptyMovieClip("tentxt", __reg3++);
        this.createEmptyMovieClip("dora", __reg3++);
        this.createEmptyMovieClip("doraUra", __reg3++);
        this.createEmptyMovieClip("sc", __reg3++);
        this.createEmptyMovieClip("ba", __reg3++);
        this.createEmptyMovieClip("mcgt", __reg3++);
        var __reg4 = " OK ";
        if (this.owari) 
        {
            __reg4 = "END";
        }
        if (this.mode == "SAIKAI") 
        {
            __reg4 = com.cegg.game.mahjong.Res.T_WAITAMOMENT;
        }
        if (this.mode == "KANSEN") 
        {
            __reg4 = _global.unescape(this.msg);
        }
        com.cegg.GButton.createTextButton("OK", __reg4, __reg3++, this);
        com.cegg.GButton.createTextButton("CONTINUE", "CONTINUE", __reg3++, this);
        if (this.mode == "SAIKAI" || this.mode == "KANSEN") 
        {
            this.OK.setEnable(false);
        }
        var __reg6 = 30;
        if (this.mode == "AGARI") 
        {
            if (!com.cegg.game.mahjong.UtilBase.bPremiumVersion || (_root.Main.View.LogViewer || !this.yakuman.length)) 
            {
                _root.SE.play("SE_AGARI");
            }
            var __reg8 = 0;
            var __reg9 = 0;
            var __reg5 = 0;
            if (__reg5 < this.hai.length) 
            {
                for (;;) 
                {
                    ++__reg5;
                    if (__reg5 >= this.hai.length) 
                    {
                        break;
                    }
                    if (this.hai[__reg5] != this.machi136) 
                    {
                        __reg9 = this.createTehai(__reg9, __reg8++, this.hai[__reg5], 0);
                    }
                }
            }
            __reg9 = __reg9 + 1;
            __reg9 = this.createTehai(__reg9, __reg8++, this.machi136, 0);
            __reg9 = __reg9 + 2;
            __reg5 = 0;
            if (__reg5 < this.mentsu136.length) 
            {
                for (;;) 
                {
                    ++__reg5;
                    if (__reg5 >= this.mentsu136.length) 
                    {
                        break;
                    }
                    var __reg10 = new com.cegg.game.mahjong.Mentsu136(this.mentsu136[__reg5]);
                    if ((__reg0 = __reg10.type) === 1) 
                    {
                        __reg9 = this.createTehai(__reg9, __reg8++, __reg10.hai0, __reg10.kui == 3 ? 1 : 0);
                        __reg9 = this.createTehai(__reg9, __reg8++, __reg10.hai1, __reg10.kui == 2 ? 1 : 0);
                        __reg9 = this.createTehai(__reg9, __reg8++, __reg10.hai2, __reg10.kui == 1 ? 3 : 0);
                    }
                    else if (__reg0 === 2) 
                    {
                        __reg9 = this.createTehai(__reg9, __reg8++, __reg10.hai0, __reg10.kui == 3 ? 1 : 0);
                        __reg9 = this.createTehai(__reg9, __reg8++, __reg10.hai1, 0);
                        __reg9 = this.createTehai(__reg9, __reg8++, __reg10.hai2, __reg10.kui == 2 ? 1 : 0);
                        __reg9 = this.createTehai(__reg9, __reg8++, __reg10.hai3, __reg10.kui == 1 ? 3 : 0);
                    }
                    else if (__reg0 === 3) 
                    {
                        __reg9 = this.createTehai(__reg9, __reg8++, __reg10.hai0, __reg10.kui == 3 ? 1 : 0);
                        __reg9 = this.createTehai(__reg9, __reg8++, __reg10.hai1, 0);
                        __reg9 = this.createTehai(__reg9, __reg8++, __reg10.hai2, 0);
                    }
                    else if (__reg0 === 4) 
                    {
                        __reg9 = this.createTehai(__reg9, __reg8++, undefined, 0);
                        __reg9 = this.createTehai(__reg9, __reg8++, __reg10.hai1, 0);
                        __reg9 = this.createTehai(__reg9, __reg8++, __reg10.hai2, 0);
                        __reg9 = this.createTehai(__reg9, __reg8++, undefined, 0);
                    }
                    else if (__reg0 === 5) 
                    {
                        __reg9 = this.createTehai(__reg9, __reg8, __reg10.hai1, __reg10.kui == 3 ? 1 : 0, __reg10.hai0);
                        __reg8 = __reg8 + (__reg10.kui == 3 ? 2 : 1);
                        __reg9 = this.createTehai(__reg9, __reg8, __reg10.hai2, __reg10.kui == 2 ? 1 : 0, __reg10.hai0);
                        __reg8 = __reg8 + (__reg10.kui == 2 ? 2 : 1);
                        __reg9 = this.createTehai(__reg9, __reg8, __reg10.hai3, __reg10.kui == 1 ? 3 : 0, __reg10.hai0);
                        __reg8 = __reg8 + (__reg10.kui == 1 ? 2 : 1);
                    }
                    else if (__reg0 === 10) 
                    {
                        __reg9 = this.createTehai(__reg9, __reg8++, __reg10.hai0, 0);
                    }
                }
            }
            if (__reg2 < __reg9 + 40) 
            {
                __reg2 = __reg9 + 40;
            }
            this.tehai._x = int((__reg2 - this.tehai._width) / 2);
            this.tehai._y = __reg6;
            __reg6 = __reg6 + 60;
            if (this.doraHai) 
            {
                __reg5 = 0;
                if (__reg5 < 7) 
                {
                    for (;;) 
                    {
                        ++__reg5;
                        if (__reg5 >= 7) 
                        {
                            break;
                        }
                        this.dora.attachMovie(com.cegg.game.mahjong.Hai.SymbolName, String(__reg5), __reg5, {_x: __reg5 * 31});
                        this.dora[__reg5].setImage(this.doraHai[__reg5 - 2], 0);
                    }
                }
                this.dora._x = int((__reg2 - this.dora._width) / 2);
                this.dora._y = __reg6;
                __reg6 = __reg6 + (this.dora._height + 10);
            }
            if (this.yaku.length || this.yakuman.length) 
            {
                this.sc._visible = false;
                this.ba._visible = false;
                this.OK.setEnable(false);
                this.CONTINUE.setEnable(false);
                if (this.yakuman.length) 
                {
                    __reg5 = 0;
                    if (__reg5 < this.yakuman.length) 
                    {
                        for (;;) 
                        {
                            ++__reg5;
                            if (__reg5 >= this.yakuman.length) 
                            {
                                break;
                            }
                            var __reg11 = __reg5 * 2 >= this.chip.length ? undefined : this.chip[__reg5 * 2 + 1];
                            this.sleep = this.sleep + 20;
                            this.createYaku(__reg5, __reg5, int(this.yakuman[__reg5]), undefined, __reg11, this.sleep, 30, com.cegg.game.mahjong.UtilBase.bPremiumVersion && __reg5 == 0);
                            this.sleep = this.sleep + 30;
                        }
                    }
                    __reg5 = __reg5 * 2;
                    if (__reg5 < this.chip.length) 
                    {
                        for (;;) 
                        {
                            __reg5 = __reg5 + 2;
                            if (__reg5 >= this.chip.length) 
                            {
                                break;
                            }
                            this.sleep = this.sleep + (this.chip[__reg5] == 53 ? 40 : 15);
                            this.createYaku(int(__reg5 / 2), int(__reg5 / 2), int(this.chip[__reg5 + 0]), undefined, int(this.chip[__reg5 + 1]), this.sleep, 6);
                        }
                    }
                }
                else 
                {
                    var __reg12 = 0;
                    __reg5 = 0;
                    if (__reg5 < this.yaku.length) 
                    {
                        for (;;) 
                        {
                            __reg5 = __reg5 + 2;
                            if (__reg5 >= this.yaku.length) 
                            {
                                break;
                            }
                            this.sleep = this.sleep + (this.yaku[__reg5] == 53 ? 40 : 15);
                            var __reg13 = undefined;
                            if (__reg12 < this.chip.length && this.yaku[__reg5 + 0] == this.chip[__reg12 + 0]) 
                            {
                                __reg13 = this.chip[__reg12 + 1];
                                __reg12 = __reg12 + 2;
                            }
                            this.createYaku(int(__reg5 / 2), int(__reg5 / 2), int(this.yaku[__reg5 + 0]), int(this.yaku[__reg5 + 1]), __reg13, this.sleep, 6);
                        }
                    }
                }
                this.yakutxt._x = int(__reg2 / 2) - 110;
                this.yakutxt._y = __reg6;
                __reg6 = __reg6 + (this.yakutxt._height + 10);
            }
            if (this.doraHaiUra) 
            {
                __reg5 = 0;
                if (__reg5 < 7) 
                {
                    for (;;) 
                    {
                        ++__reg5;
                        if (__reg5 >= 7) 
                        {
                            break;
                        }
                        this.doraUra.attachMovie(com.cegg.game.mahjong.Hai.SymbolName, String(__reg5), __reg5, {_x: __reg5 * 31});
                        this.doraUra[__reg5].setImage(this.doraHaiUra[__reg5 - 2], 0);
                    }
                }
                this.doraUra._x = int((__reg2 - this.doraUra._width) / 2);
                this.doraUra._y = __reg6 - 5;
                __reg6 = __reg6 + (this.doraUra._height + 10);
            }
            var __reg14 = 0;
            __reg5 = 1;
            if (__reg5 < this.chip.length) 
            {
                for (;;) 
                {
                    __reg5 = __reg5 + 2;
                    if (__reg5 >= this.chip.length) 
                    {
                        break;
                    }
                    __reg14 = __reg14 + int(this.chip[__reg5]);
                }
            }
            if (this.yakuman.length) 
            {
                this.tentxt.createEmptyMovieClip("dg", 0);
                this.tentxt.createEmptyMovieClip("mg", 1);
                com.cegg.game.mahjong.Util.printDigit(this.tentxt.dg, "yakudigit", 20, this.ten[1] + "<" + (__reg14 ? " " + __reg14 + "=" : ""));
                this.tentxt.mg.attachMovie("mangan5", "0", 0);
                this.tentxt.dg._x = this.tentxt.mg._width;
                this.tentxt.speed = 20;
            }
            else 
            {
                var __reg15 = 0;
                __reg5 = 1;
                if (__reg5 < this.yaku.length) 
                {
                    for (;;) 
                    {
                        __reg5 = __reg5 + 2;
                        if (__reg5 >= this.yaku.length) 
                        {
                            break;
                        }
                        __reg15 = __reg15 + int(this.yaku[__reg5]);
                    }
                }
                this.tentxt.speed = 15;
                if (int(this.ten[2])) 
                {
                    this.tentxt.createEmptyMovieClip("d0", 0);
                    this.tentxt.createEmptyMovieClip("d1", 1);
                    this.tentxt.createEmptyMovieClip("mg", 2);
                    com.cegg.game.mahjong.Util.printDigit(this.tentxt.d0, "yakudigit", 20, this.ten[0] + ";" + __reg15 + ":");
                    com.cegg.game.mahjong.Util.printDigit(this.tentxt.d1, "yakudigit", 20, this.ten[1] + "<" + (__reg14 ? " " + __reg14 + "=" : ""));
                    this.tentxt.mg.attachMovie("mangan" + this.ten[2], "0", 0);
                    this.tentxt.mg._x = this.tentxt.d0._width + 14;
                    this.tentxt.d1._x = this.tentxt.mg._x + this.tentxt.mg._width;
                }
                else 
                {
                    com.cegg.game.mahjong.Util.printDigit(this.tentxt, "yakudigit", 20, this.ten[0] + ";" + __reg15 + ": " + this.ten[1] + "<" + (__reg14 ? " " + __reg14 + "=" : ""));
                }
            }
            this.tentxt._x = int((__reg2 - this.tentxt._width) / 2);
            this.tentxt._y = __reg6;
            if (_root.Main.View.LogViewer) 
            {
                this.OK.setEnable(true);
                this.sc._visible = true;
                this.ba._visible = true;
            }
            else 
            {
                this.doraUra._alpha = 0;
                this.tentxt.sleep = this.sleep;
                this.tentxt._alpha = 0;
                this.tentxt.onEnterFrame = function ()
                {
                    if (this.sleep) 
                    {
                        --this.sleep;
                        return;
                    }
                    this._alpha = this._alpha + 100 / this.speed;
                    if (this._alpha > 100) 
                    {
                        this._alpha = 100;
                    }
                    this._parent.doraUra._alpha = this._alpha;
                    if (this._alpha >= 100) 
                    {
                        var __reg2 = this._parent;
                        __reg2.OK.setEnable(true);
                        __reg2.CONTINUE.setEnable(true);
                        __reg2.sc._visible = true;
                        __reg2.ba._visible = true;
                        delete this.onEnterFrame;
                    }
                }
                ;
            }
            __reg6 = __reg6 + (this.tentxt._height + 10);
        }
        else 
        {
            __reg6 = __reg6 + 50;
            var __reg7 = "ryuukyoku";
            if (this.mode == "RYUUKYOKU" && this.type.length) 
            {
                __reg7 = "ryuukyoku_" + this.type;
            }
            if (this.mode == "TAIKYOKU") 
            {
                __reg7 = "taikyoku";
            }
            if (this.mode == "SAIKAI") 
            {
                __reg7 = "saikai";
            }
            if (this.mode == "KANSEN") 
            {
                __reg7 = "kansen";
            }
            this.yakutxt.attachMovie(__reg7, "0", 0);
            this.yakutxt._x = int((__reg2 - this.yakutxt._width) / 2);
            this.yakutxt._y = __reg6;
            this.yakutxt._alpha = 0;
            this.yakutxt.onEnterFrame = function ()
            {
                this._alpha = this._alpha + 4;
                if (this._alpha >= 100) 
                {
                    delete (this.onEnterFrame);
                }
            }
            ;
            __reg6 = __reg6 + (this.yakutxt._height + 50);
        }
        var __reg16 = [3, 2, 0, 1];
        if (this.score != undefined) 
        {
            __reg5 = 0;
            if (__reg5 < 8) 
            {
                for (;;) 
                {
                    ++__reg5;
                    if (__reg5 >= 8) 
                    {
                        break;
                    }
                    this.score[__reg5] = this.score[__reg5] * 100;
                }
            }
            var __reg17 = 0;
            if (this.score[5] == 0) 
            {
                __reg16[2] = __reg17++;
            }
            if (this.score[7] == 0) 
            {
                __reg16[3] = __reg17++;
            }
            if (this.score[3] == 0) 
            {
                __reg16[1] = __reg17++;
            }
            if (this.score[1] == 0) 
            {
                __reg16[0] = __reg17++;
            }
            if (this.score[5] < 0) 
            {
                __reg16[2] = __reg17++;
            }
            if (this.score[7] < 0) 
            {
                __reg16[3] = __reg17++;
            }
            if (this.score[3] < 0) 
            {
                __reg16[1] = __reg17++;
            }
            if (this.score[1] < 0) 
            {
                __reg16[0] = __reg17++;
            }
            if (this.score[5] > 0) 
            {
                __reg16[2] = __reg17++;
            }
            if (this.score[7] > 0) 
            {
                __reg16[3] = __reg17++;
            }
            if (this.score[3] > 0) 
            {
                __reg16[1] = __reg17++;
            }
            if (this.score[1] > 0) 
            {
                __reg16[0] = __reg17++;
            }
        }
        if (this.uname[0].length > 0) 
        {
            this.createPlayerInfo(0, __reg16[0], this.uname[0], int(__reg2 / 2), int(__reg2 / 4 + 30));
        }
        if (this.uname[1].length > 0) 
        {
            this.createPlayerInfo(1, __reg16[1], this.uname[1], int(__reg2 / 4 * 3) + 15, int(__reg2 / 4 + 30));
        }
        if (this.uname[2].length > 0) 
        {
            this.createPlayerInfo(2, __reg16[2], this.uname[2], int(__reg2 / 2), int(__reg2 / 4 + 30));
        }
        if (this.uname[3].length > 0) 
        {
            this.createPlayerInfo(3, __reg16[3], this.uname[3], int(__reg2 / 4 * 1) - 15, int(__reg2 / 4 + 30));
        }
        var __reg18 = int(this.sc[1]._height / 2);
        if (__reg18 < this.sc[2]._height) 
        {
            __reg18 = this.sc[2]._height;
        }
        this.sc[0]._y = __reg6 + __reg18 + 14;
        this.sc[2]._y = __reg6;
        this.sc[1]._y = __reg6 + int((this.sc[0]._height + __reg18 + 14) / 2) - int(this.sc[1]._height / 2);
        this.sc[3]._y = __reg6 + int((this.sc[0]._height + __reg18 + 14) / 2) - int(this.sc[3]._height / 2);
        if (this.honbanagare != undefined) 
        {
            this.ba.createEmptyMovieClip("b1", 2);
            this.ba.createEmptyMovieClip("b3", 4);
            this.ba.attachMovie("badigit10", "b0", 1);
            this.ba.attachMovie("badigit11", "b2", 3);
            com.cegg.game.mahjong.Util.printDigit(this.ba.b1, "badigit", 7, String(this.honbanagare[0]));
            com.cegg.game.mahjong.Util.printDigit(this.ba.b3, "badigit", 7, String(this.honbanagare[1]));
            var __reg19 = 0 - int((this.ba.b0._width + this.ba.b1._width + this.ba.b2._width + this.ba.b3._width) / 2);
            this.ba.b0._x = __reg19;
            __reg19 = __reg19 + this.ba.b0._width;
            this.ba.b1._x = __reg19;
            __reg19 = __reg19 + this.ba.b1._width;
            this.ba.b2._x = __reg19;
            __reg19 = __reg19 + this.ba.b2._width;
            this.ba.b3._x = __reg19;
            __reg19 = __reg19 + this.ba.b3._width;
            this.ba.b1._y = 1;
            this.ba.b3._y = 1;
            this.ba._x = int(__reg2 / 2);
            this.ba._y = __reg6 + __reg18 + 1;
        }
        __reg6 = __reg6 + (this.sc._height + 5);
        __reg6 = __reg6 + 20;
        this.OK._y = this.CONTINUE._y = __reg6;
        if (com.cegg.game.mahjong.Res.GT_ISTECH(this.dw_GameType) && (!_root.Main.View.LogViewer && (this.mode != "KANSEN" && this.owari))) 
        {
            this.OK._x = int((__reg2 - this.OK._width - 15 - this.CONTINUE._width) / 2);
            this.CONTINUE._x = int((__reg2 + this.OK._width + 15 - this.CONTINUE._width) / 2);
        }
        else 
        {
            this.OK._x = int((__reg2 - this.OK._width) / 2);
            this.CONTINUE._visible = false;
        }
        if (com.cegg.game.mahjong.Res.GT_ISTECH(this.dw_GameType) && (this.dw_GameType & com.cegg.game.mahjong.Res.GT_MULTI && (!_root.Main.View.LogViewer && ((this.mode == "AGARI" || this.mode == "RYUUKYOKU") && (this.ratio.length == 2 && (this.owari.length == 8 || this.owari.length == 16)))))) 
        {
            var __reg20 = 0;
            var lGoldFrom = int(this.gold[__reg20]);
            this.mcgt._x = this.CONTINUE._x + this.CONTINUE._width;
            this.mcgt._y = this.CONTINUE._y;
            this.mcgt.createTextField("tf", __reg3++, 0, 0, __reg2 - this.mcgt._x, 0);
            this.mcgt.tf.text = com.cegg.game.mahjong.Util.gold2string(lGoldFrom, ",") + "G";
            with (this.mcgt.tf)
            {
                autoSize = "center";
                textColor = 10066329;
                selectable = false;
            }
            var __reg21 = __reg2 - this.mcgt._x;
            var __reg22 = this.CONTINUE._height;
            var __reg23 = [1118481, 2236962, 1118481];
            var __reg24 = [100, 100, 100];
            var __reg25 = [0, 128, 255];
            var __reg26 = {a: __reg21, b: 0, c: 0, d: 0, e: 0 - __reg21, f: 0, g: int(__reg21 / 2), h: 0, i: 1};
            this.mcgt.beginGradientFill("linear", __reg23, __reg24, __reg25, __reg26);
            this.mcgt.moveTo(0, 0);
            this.mcgt.lineTo(0, __reg22);
            this.mcgt.lineTo(__reg21, __reg22);
            this.mcgt.lineTo(__reg21, 0);
            this.mcgt.endFill();
            var __reg27 = this.owari[0 + __reg20 * 2 + 1];
            if (this.owari.length == 8) 
            {
                __reg27 = this.owari[0 + __reg20 * 2 + 1] * 10 * this.ratio[1];
            }
            if (this.owari.length == 16) 
            {
                __reg27 = (this.owari[0 + __reg20 * 2 + 1] * 1000 + this.owari[8 + __reg20 * 2 + 0] * this.ratio[0]) * this.ratio[1] / 100;
            }
            var lGoldTo = lGoldFrom + int(Math.ceil(__reg27 + (6400 * 20 - lGoldFrom) / 6400));
            if (lGoldTo < 0) 
            {
                lGoldTo = 0;
            }
            this.mcgt.onEnterFrame = function ()
            {
                if (this._parent.OK.isEnable()) 
                {
                    if (lGoldFrom == lGoldTo) 
                    {
                        delete (this.onEnterFrame);
                        return;
                    }
                    lGoldFrom >= lGoldTo ? --lGoldFrom : ++lGoldFrom;
                    this.tf.text = com.cegg.game.mahjong.Util.gold2string(lGoldFrom, ",") + "G";
                }
            }
            ;
        }
        __reg6 = __reg6 + (this.OK._height + 30);
        if (!this.owari && (this.mode != "SAIKAI" && this.mode != "KANSEN")) 
        {
            this.attachMovie(com.cegg.game.mahjong.CountDown.SymbolName, "ct", 101, {_x: this.OK._x + this.OK._width, _y: this.OK._y, release: this.OK, count: this.sleep * 50 + (this.mode == "TAIKYOKU" ? 10 : (this.smallwait ? 5 : 12)) * 1000, usesound: this.mode == "TAIKYOKU", useex: false});
        }
        com.cegg.LGraphics.drawFrame(this.bg, 0, 0, __reg2, __reg6, 0);
        com.cegg.LGraphics.drawShadow(this.bg, 0, 0, __reg2, __reg6, 4);
        this.bg._alpha = 85;
        this._x = int((Stage.width - __reg2) / 2);
        this._y = int((Stage.height - __reg6) / 2);
    }
    ;
    __reg1.onCommand = function (msg)
    {
        if ((__reg0 = msg.cmd) === "OK") 
        {
            this.OK.setEnable(false);
            if (this.mode == "SAIKAI") 
            {
                return;
            }
            if (this.mode == "KANSEN") 
            {
                return;
            }
            if (this.owari) 
            {
                if (com.cegg.game.mahjong.Res.GT_ISTECH(this.dw_GameType)) 
                {
                    _root.onCommand({cmd: "CLOSEXMLSOCKET"});
                    _root.onCommand({cmd: "GOLOBBYFADEOUT"});
                }
                else 
                {
                    this._parent.onCommand({cmd: "OWARI", un: this.uname, sc: this.owari, ratio: this.ratio});
                    this.removeMovieClip();
                }
            }
            else 
            {
                this._parent.onCommand({cmd: "AGARIBOX_OK"});
            }
            return;
        }
        else if (__reg0 !== "CONTINUE") 
        {
            return;
        }
        this.CONTINUE.setEnable(false);
        com.cegg.game.mahjong.UtilBase.xmlWantNextJoin = "<JOIN t=\"" + this.dw_LobbyID + "," + this.dw_GameType + "\" />";
        _root.onCommand({cmd: "GOLOBBY"});
        return;
    }
    ;
    __reg1.createPlayerInfo = function (who, depth, name, x, w)
    {
        this.sc.createEmptyMovieClip(String(who), depth);
        var __reg7 = this.sc[who];
        var __reg8 = this.score[who * 2 + 0];
        var __reg9 = this.score[who * 2 + 1];
        depth = 0;
        depth++;
        __reg7.attachMovie("kaze" + (this.kaze[who] * 2 + (__reg9 <= 0 ? 0 : 1)), "kaze", undefined);
        __reg7.kaze._alpha = 75;
        depth++;
        __reg7.createTextField("tf", 0, 0, 0, 0, undefined);
        depth++;
        __reg7.createEmptyMovieClip("info", undefined);
        depth++;
        __reg7.createTextField("attr", 0, 0, 0, 0, undefined);
        var __reg10 = __reg7.tf;
        with (__reg10)
        {
            autoSize = "left";
            textColor = 16777215;
            selectable = false;
        }
        with (__reg7.attr)
        {
            autoSize = "left";
            textColor = 16777215;
            selectable = false;
        }
        __reg10.text = name;
        if (this.score == undefined) 
        {
            var __reg14 = com.cegg.game.mahjong.Res.GameTypeToProfIndex(this.dw_LobbyID == 0 ? this.dw_GameType : this.dw_GameType & com.cegg.game.mahjong.Res.GT_SANMA);
            var __reg15 = com.cegg.game.mahjong.Res.RatingConvFronProfIndex(__reg14, this.rate[who]);
            if (this.dw_LobbyID == 0 && com.cegg.game.mahjong.Res.GT_ISTECH(this.dw_GameType)) 
            {
                var __reg16 = com.cegg.game.mahjong.Util.GoldToClass(int(this.gold[who]));
                __reg7.info.attachMovie("rc" + __reg16.substr(0, 1), "dan", 0, {_y: 2});
                __reg7.info.dan.attachMovie("rc" + __reg16.substr(1, 1), "dan", 0, {_x: 9});
            }
            else if (this.dw_LobbyID == 0 && com.cegg.game.mahjong.Res.GT_ISJANS(this.dw_GameType)) 
            {
                var __reg17 = com.cegg.game.mahjong.Util.RatingClassDisp(this.rc[who], "");
                __reg7.info.attachMovie("rc" + __reg17.substr(0, 1), "dan", 0, {_y: 2});
                __reg7.info.dan.attachMovie("rc" + __reg17.substr(1, 1), "dan", 0, {_x: 9});
            }
            else 
            {
                __reg7.info.attachMovie("dan" + this.dan[who], "dan", 0);
            }
            if (__reg15 >= (this.dw_LobbyID == 0 && com.cegg.game.mahjong.Res.GT_ISDAN(this.dw_GameType) ? 1800 : 1600)) 
            {
                __reg7.info.createEmptyMovieClip("rate", 1);
                com.cegg.game.mahjong.Util.printDigit(__reg7.info.rate, "tendigit", 6, "=" + __reg15);
                if (__reg7.info.dan) 
                {
                    __reg7.info.dan._x = 0 - __reg7.info.dan._width - 4;
                    __reg7.info.rate._y = int((__reg7.info.dan._height - __reg7.info.rate._height) / 2) + 2;
                }
                else 
                {
                    __reg7.info.rate._x = 0 - int(__reg7.info.rate._width / 2);
                }
            }
            else 
            {
                __reg7.info.dan._x = 0 - int(__reg7.info.dan._width / 2);
            }
            if (__reg15 >= 2000) 
            {
                __reg7.info.rate._alpha = 0;
                __reg7.info.rate.onEnterFrame = function ()
                {
                    if (this._alpha < 100) 
                    {
                        this._alpha = this._alpha + 2;
                        return;
                    }
                    this._alpha = 100;
                    delete (this.onEnterFrame);
                }
                ;
            }
        }
        else 
        {
            __reg7.info.createEmptyMovieClip("score", 0);
            if (com.cegg.game.mahjong.Res.GT_ISTECH(this.dw_GameType) && this.owari) 
            {
                __reg8 = this.owari[0 + who * 2 + 1];
                var __reg11 = com.cegg.game.mahjong.Util.ffmt(__reg8, 1, false, "+");
                if (this.ratio.length == 2 && this.owari.length == 8) 
                {
                    __reg8 = this.owari[0 + who * 2 + 1] * 10 * this.ratio[1];
                    __reg11 = (__reg8 <= 0 ? (__reg8 >= 0 ? "0" : __reg8) : "+" + __reg8) + "A";
                }
                if (this.ratio.length == 2 && this.owari.length == 16) 
                {
                    __reg8 = (this.owari[0 + who * 2 + 1] * 1000 + this.owari[8 + who * 2 + 0] * this.ratio[0]) * this.ratio[1] / 100;
                    __reg11 = (__reg8 <= 0 ? (__reg8 >= 0 ? "0" : __reg8) : "+" + __reg8) + "A";
                }
                com.cegg.game.mahjong.Util.printDigit(__reg7.info.score, "tendigit", 6, __reg11.split("+").join(":").split("-").join(";").split(".").join("@"));
                if (__reg8) 
                {
                    __reg7.c = new Color(__reg7.info.score);
                    __reg7.c.setTransform(__reg8 >= 0 ? {ra: 0, rb: 0, ga: 65, gb: 64, ba: 65, bb: 64, aa: 100, ab: 0} : {ra: 75, rb: 64, ga: 0, gb: 0, ba: 0, bb: 0, aa: 100, ab: 0});
                }
            }
            else 
            {
                com.cegg.game.mahjong.Util.printDigit(__reg7.info.score, "tendigit", 6, __reg8 >= 0 ? String(__reg8) : ";" + (0 - __reg8));
                if (__reg9) 
                {
                    __reg7.info.score.createEmptyMovieClip("diff", 1000);
                    __reg7.info.score.diff._x = __reg7.info.score._width + 5;
                    com.cegg.game.mahjong.Util.printDigit(__reg7.info.score.diff, "tendigit", 6, __reg9 <= 0 ? (__reg9 >= 0 ? "0" : ";" + (0 - __reg9)) : ":" + __reg9);
                    __reg7.c = new Color(__reg7.info.score.diff);
                    __reg7.c.setTransform(__reg9 >= 0 ? {ra: 0, rb: 0, ga: 65, gb: 64, ba: 65, bb: 64, aa: 100, ab: 0} : {ra: 75, rb: 64, ga: 0, gb: 0, ba: 0, bb: 0, aa: 100, ab: 0});
                }
            }
            __reg7.info.score._x = 0 - int(__reg7.info.score._width / 2);
            if (this.score.length == 16) 
            {
                var __reg12 = this.score[8 + who * 2 + 0];
                var __reg13 = this.score[8 + who * 2 + 1];
                __reg7.info.createEmptyMovieClip("chip", 2);
                com.cegg.game.mahjong.Util.printDigit(__reg7.info.chip, "tendigit", 6, (__reg12 >= 0 ? String(__reg12) : ";" + (0 - __reg12)) + ">?");
                if (__reg13) 
                {
                    __reg7.info.chip.createEmptyMovieClip("diff", 1000);
                    __reg7.info.chip.diff._x = __reg7.info.chip._width + 5;
                    com.cegg.game.mahjong.Util.printDigit(__reg7.info.chip.diff, "tendigit", 6, (__reg13 <= 0 ? (__reg13 >= 0 ? "0" : ";" + (0 - __reg13)) : ":" + __reg13) + ">?");
                    __reg7.cc = new Color(__reg7.info.chip.diff);
                    __reg7.cc.setTransform(__reg13 >= 0 ? {ra: 0, rb: 0, ga: 65, gb: 64, ba: 65, bb: 64, aa: 100, ab: 0} : {ra: 75, rb: 64, ga: 0, gb: 0, ba: 0, bb: 0, aa: 100, ab: 0});
                }
                __reg7.info.chip._x = 0 - int(__reg7.info.chip._width / 2);
                __reg7.info.chip._y = 11;
            }
        }
        var __reg18 = __reg7.info._width;
        if (__reg18 < __reg10._width) 
        {
            __reg18 = __reg10._width;
        }
        if (__reg18 < w) 
        {
            __reg18 = w;
        }
        __reg7.kaze._x = 5;
        __reg10._x = 5 + __reg7.kaze._width + int((__reg18 - 5 * 2 - __reg7.kaze._width - __reg10._width) / 2);
        __reg7.attr._x = 5 + __reg7.kaze._width + int((__reg18 - 5 * 2 - __reg7.kaze._width - __reg7.attr._width) / 2);
        if (__reg7.info._height) 
        {
            __reg7.info._x = 5 + __reg7.kaze._width + int((__reg18 - 5 * 2 - __reg7.kaze._width) / 2);
            __reg7.info._y = __reg10._height;
        }
        else 
        {
            __reg10._y = int((__reg7._height - __reg10._height) / 2);
        }
        __reg7.attr._y = __reg10._height + __reg7.info._height;
        __reg7.kaze._y = int((__reg7._height - __reg7.kaze._height) / 2);
        var __reg19 = __reg7._height;
        var __reg20 = [3355443, 1579032];
        var __reg21 = __reg9 ? [80, 80] : [40, 40];
        var __reg22 = [0, 255];
        var __reg23 = {a: 0, b: __reg19, c: 0, d: 0 - __reg19, e: 0, f: 0, g: 0, h: int(__reg19 / 2), i: 1};
        if (this.score == undefined) 
        {
            __reg21 = [40, 40];
        }
        __reg7.beginGradientFill("linear", __reg20, __reg21, __reg22, __reg23);
        __reg7.moveTo(0, 0);
        __reg7.lineTo(0, __reg19);
        __reg7.lineTo(__reg18, __reg19);
        __reg7.lineTo(__reg18, 0);
        __reg7.endFill();
        __reg7._x = x - int(__reg7._width / 2);
    }
    ;
    __reg1.createYaku = function (row, depth, type, han, chip, sleep, speed, dora)
    {
        this.yakutxt.createEmptyMovieClip(String(row), depth);
        var __reg9 = this.yakutxt[row];
        __reg9._y = row * 24;
        __reg9.attachMovie("yaku" + type, "anim", 0);
        __reg9 = __reg9.anim;
        __reg9.createEmptyMovieClip("digit", 1);
        var __reg10 = "";
        if (han != undefined) 
        {
            __reg10 = __reg10 + (han + ":");
        }
        if (chip != undefined) 
        {
            __reg10 = __reg10 + (chip + "=");
        }
        com.cegg.game.mahjong.Util.printDigit(__reg9.digit, "yakudigit", 20, __reg10);
        __reg9.digit._x = 170;
        __reg9.sleep = sleep;
        __reg9.speed = speed;
        __reg9.type = type;
        if (_root.Main.View.LogViewer) 
        {
            return undefined;
        }
        __reg9._alpha = 0;
        __reg9.onEnterFrame = function ()
        {
            if (this.sleep) 
            {
                --this.sleep;
                if (!this.sleep) 
                {
                    if (dora) 
                    {
                        _root.SE.play("SE_DORA");
                    }
                    _root.SE.play("SE_YAKU", true);
                }
                return;
            }
            this._alpha = this._alpha + 100 / this.speed;
            if (this._alpha > 100) 
            {
                this._alpha = 100;
            }
            this._xscale = 100 + (100 - this._alpha) * 1.10000002384;
            this._yscale = 100 + (100 - this._alpha) * 1.10000002384;
            if (this._xscale < 100) 
            {
                this._xscale = 100;
            }
            if (this._yscale < 100) 
            {
                this._yscale = 100;
            }
            this._x = this._width * (100 / this._xscale - 1) / 2;
            this._y = this._height * (100 / this._yscale - 1) / 2;
            if (this._alpha >= 100) 
            {
                delete (this.onEnterFrame);
            }
        }
        ;
    }
    ;
    __reg1.createTehai = function (x, depth, hai136, yoko, chahai)
    {
        if (yoko && chahai != undefined) 
        {
            this.tehai.attachMovie(com.cegg.game.mahjong.Hai.SymbolName, String(depth), depth, {_x: x, _y: com.cegg.game.mahjong.Hai.Y0 - com.cegg.game.mahjong.Hai.Y1 * 2});
            this.tehai[depth].setImage(chahai, yoko);
            ++depth;
        }
        this.tehai.attachMovie(com.cegg.game.mahjong.Hai.SymbolName, String(depth), depth, {_x: x, _y: yoko ? com.cegg.game.mahjong.Hai.Y0 - com.cegg.game.mahjong.Hai.Y1 : (hai136 == this.machi136 ? -5 : 0)});
        this.tehai[depth].setImage(hai136, yoko);
        return x + (yoko ? 40 : 31);
    }
    ;
    ASSetPropFlags(__reg1, null, 1);
    __reg0.SymbolName = "__Packages.com.cegg.game.mahjong.AgariBox";
    __reg0.SymbolOwner = com.cegg.game.mahjong.AgariBox;
    __reg0.SymbolLinked = Object.registerClass(com.cegg.game.mahjong.AgariBox.SymbolName, com.cegg.game.mahjong.AgariBox.SymbolOwner);
    __reg1.sleep = 0;
}#endinitclip

//子图形 27
//  初始化剪辑
#initclip 0

if (!com.cegg.GClipper) 
{
    if (!com) 
    {
        _global.com = new Object();
    }
    if (!com.cegg) 
    {
        _global.com.cegg = new Object();
    }
    (_global.com.cegg.GClipper = function ()
    {
        super();
        com.cegg.LCoordinate.globalScale(this);
        this.useHandCursor = false;
        this.tabChildren = false;
        this.tabEnabled = false;
    }
    ).prototype.__proto__ = MovieClip.prototype;
    __reg0.prototype.__constructor__ = MovieClip;
    var __reg1 = __reg0.prototype;
    __reg1.onLoad = function ()
    {
    }
    ;
    __reg1.onUnload = function ()
    {
    }
    ;
    __reg0.create = function (name, depth, parent, color, alpha)
    {
        var __reg7 = parent.attachMovie(com.cegg.GClipper.SymbolName, name, depth);
        __reg7.beginFill(color, alpha);
        __reg7.moveTo(-2000, -2000);
        __reg7.lineTo(-2000, 2000);
        __reg7.lineTo(2000, 2000);
        __reg7.lineTo(2000, -2000);
        __reg7.endFill();
        return __reg7;
    }
    ;
    __reg1.onRelease = function ()
    {
    }
    ;
    ASSetPropFlags(__reg1, null, 1);
    __reg0.SymbolName = "__Packages.com.cegg.GClipper";
    __reg0.SymbolOwner = com.cegg.GClipper;
    __reg0.SymbolLinked = Object.registerClass(com.cegg.GClipper.SymbolName, com.cegg.GClipper.SymbolOwner);
}#endinitclip

//子图形 28
//  初始化剪辑
#initclip 0

if (!com.cegg.LDrag) 
{
    if (!com) 
    {
        _global.com = new Object();
    }
    if (!com.cegg) 
    {
        _global.com.cegg = new Object();
    }
    var __reg1 = (_global.com.cegg.LDrag = function (mc)
    {
        this._owner = mc;
        this.c = new Color(this._owner);
    }
    ).prototype;
    __reg0.enableDrag = function (mc)
    {
        mc._focusrect = false;
        mc.tabEnabled = false;
        mc.tabChildren = false;
        var d = new com.cegg.LDrag(mc);
        mc.onPress = function ()
        {
            d.onPress();
        }
        ;
        mc.onRelease = function ()
        {
            d.onRelease();
        }
        ;
        mc.onRollOver = function ()
        {
            d.onRollOver();
        }
        ;
        mc.onRollOut = function ()
        {
            d.onRollOut();
        }
        ;
        mc.onDragOver = function ()
        {
            d.onDragOver();
        }
        ;
        mc.onDragOut = function ()
        {
            d.onDragOut();
        }
        ;
        mc.onMouseMove = function ()
        {
            d.onMouseMove();
        }
        ;
        mc.onReleaseOutside = function ()
        {
            d.onReleaseOutside();
        }
        ;
    }
    ;
    __reg1.onPress = function ()
    {
        this.ptDown.x = this._owner._xmouse;
        this.ptDown.y = this._owner._ymouse;
        this.bDown = true;
    }
    ;
    __reg1.onRelease = function ()
    {
        this.bDown = false;
    }
    ;
    __reg1.onReleaseOutside = function ()
    {
        this.bDown = false;
        this.onRollOut();
    }
    ;
    __reg1.onRollOver = function ()
    {
        this.c.setTransform({ra: 100, rb: 0, ga: 100, gb: 40, ba: 100, bb: 56, aa: 100, ab: 0});
    }
    ;
    __reg1.onRollOut = function ()
    {
        if (this.bDown) 
        {
            return undefined;
        }
        this.c.setTransform({ra: 100, rb: 0, ga: 100, gb: 0, ba: 100, bb: 0, aa: 100, ab: 0});
    }
    ;
    __reg1.onDragOver = function ()
    {
        this.onRollOver();
    }
    ;
    __reg1.onDragOut = function ()
    {
        this.onRollOut();
    }
    ;
    __reg1.onMouseMove = function ()
    {
        if (this.bDown) 
        {
            var __reg2 = {x: _root._xmouse - this.ptDown.x, y: _root._ymouse - this.ptDown.y};
            this._owner._parent.globalToLocal(__reg2);
            this._owner.onSetPos(__reg2.x, __reg2.y);
        }
    }
    ;
    ASSetPropFlags(__reg1, null, 1);
    __reg1._owner = undefined;
    __reg1.bDown = false;
    __reg1.ptDown = {x: 0, y: 0};
    __reg1.c = undefined;
}#endinitclip

//子图形 29
//  初始化剪辑
#initclip 0

if (!com.cegg.game.mahjong.WelcomeMain) 
{
    if (!com) 
    {
        _global.com = new Object();
    }
    if (!com.cegg) 
    {
        _global.com.cegg = new Object();
    }
    if (!com.cegg.game) 
    {
        _global.com.cegg.game = new Object();
    }
    if (!com.cegg.game.mahjong) 
    {
        _global.com.cegg.game.mahjong = new Object();
    }
    (_global.com.cegg.game.mahjong.WelcomeMain = function ()
    {
        super();
        com.cegg.game.mahjong.UtilBase.bWBPopup = true;
        _root.Main.setMenuBottom(false);
        var __reg3 = 560;
        var __reg4 = 0;
        var __reg5 = {left: 30, top: 35, right: 30, bottom: 30};
        var __reg6 = __reg3 - __reg5.left - __reg5.right;
        this.createEmptyMovieClip("caption", __reg4++);
        this.attachMovie("title", "title", __reg4++, {_x: 0, _y: 50});
        this.createTextField("tfNews", __reg4++, __reg5.left + int((__reg3 - __reg5.left - __reg5.right) / 2), __reg5.top + 135, 0, 0);
        this.createTextField("tfUserName", __reg4++, 0, 0, __reg3, 22);
        this.createTextField("tfInput", __reg4++, __reg5.left, 0, 160, 20);
        com.cegg.GButton.createTextButton("REGID", com.cegg.game.mahjong.Res.T_REGID, __reg4++, this);
        com.cegg.GButton.createTextButton("LOGIN", "OK", __reg4++, this);
        com.cegg.GButton.createTextButton("SEXUALITY", undefined, __reg4++, this, (new XML(com.cegg.game.mahjong.Res.T_SEXUALITY)).firstChild);
        com.cegg.GButton.createTextButton("CLIENTMODE", undefined, __reg4++, this, (new XML(com.cegg.game.mahjong.Res.T_CLIENTMODE)).firstChild);
        if (_root.lb.length == 9 || _root.lb.length == 17) 
        {
            this.CLIENTMODE.setEnable(false);
        }
        with (this.tfNews)
        {
            autoSize = "center";
            html = true;
        }
        with (this.tfUserName)
        {
            selectable = false;
            autoSize = "center";
            html = true;
            htmlText = com.cegg.game.mahjong.Res.T_USERNAME;
        }
        with (this.tfInput)
        {
            border = true;
            borderColor = 8421504;
            background = true;
            backgroundColor = 16777215;
            type = "input";
        }
        var __reg7 = com.cegg.game.mahjong.SaveData.MJINFO();
        if (__reg7.data.hiddenid) 
        {
            this.tfInput.text = "ID########-########";
        }
        else 
        {
            this.tfInput.text = _root.uname.length <= 0 ? "NoName" : _root.uname;
        }
        this.tfNews.htmlText = "Flash" + (com.cegg.game.mahjong.UtilBase.bPremiumVersion ? "Premium" : "Economy") + com.cegg.game.mahjong.Res.T_VERSION + " | " + (_root.lb.length == 4 ? com.cegg.game.mahjong.Res.T_LOBBYTXT[1] + "L" + _root.lb : (_root.lb.length <= 0 ? com.cegg.game.mahjong.Res.T_LOBBYTXT[0] : com.cegg.game.mahjong.Res.T_LOBBYTXT[1] + _root.lb.substr(0, 5))) + " | " + com.cegg.game.mahjong.Res.T_WELCOME;
        var __reg8 = com.cegg.game.mahjong.SaveData.MJINFO().data.sx;
        if (__reg8 != "F") 
        {
            __reg8 = "M";
        }
        this.SEXUALITY.selectValue(__reg8);
        this.CLIENTMODE.selectValue(com.cegg.game.mahjong.UtilBase.bPremiumVersion ? "PREMIUM" : "ECONOMY");
        this.tfUserName._y = this.tfNews._y + this.tfNews._height + 10;
        this.tfInput._y = this.tfUserName._y + this.tfUserName._height + 5;
        this.title._x = int((__reg3 - this.title._width - 40) / 2);
        this.REGID._x = int((__reg3 - this.REGID._width - this.tfInput._width - this.SEXUALITY._width - this.CLIENTMODE._width - this.LOGIN._width - 20) / 2);
        this.tfInput._x = this.REGID._x + this.REGID._width + 3;
        this.SEXUALITY._x = this.tfInput._x + this.tfInput._width + 3;
        this.CLIENTMODE._x = this.SEXUALITY._x + this.SEXUALITY._width;
        this.LOGIN._x = this.CLIENTMODE._x + this.CLIENTMODE._width + 4;
        this.REGID._y = this.CLIENTMODE._y = this.SEXUALITY._y = this.LOGIN._y = this.tfInput._y + int((this.tfInput._height - this.LOGIN._height) / 2) + 1;
        var __reg9 = this.LOGIN._y + this.LOGIN._height + __reg5.bottom;
        com.cegg.LGraphics.drawCaption(this.caption, __reg3, 12);
        com.cegg.LGraphics.drawFrame(this, 0, 0, __reg3, __reg9, 16777215);
        com.cegg.LGraphics.drawShadow(this, 0, 0, __reg3, __reg9, 4);
        this.lineStyle(1, 14540253, 100);
        this.moveTo(__reg5.left, this.tfNews._y + this.tfNews._height + 5);
        this.lineTo(__reg3 - __reg5.right, this.tfNews._y + this.tfNews._height + 5);
        this.caption._focusrect = false;
        this.caption.onPress = function ()
        {
            this._parent.startDrag();
        }
        ;
        this.caption.onMouseUp = this.caption.onRelease = function ()
        {
            this._parent.stopDrag();
        }
        ;
        this.tfInput.addListener(this);
        this.tfInput.maxChars = 19;
        this._x = int((Stage.width - __reg3) / 2);
        this._y = int((Stage.height - __reg9) / 2);
        Selection.setFocus(this.tfInput);
        this.updateInputField();
    }
    ).prototype.__proto__ = MovieClip.prototype;
    __reg0.prototype.__constructor__ = MovieClip;
    var __reg1 = __reg0.prototype;
    __reg1.onLoad = function ()
    {
        Key.addListener(this);
    }
    ;
    __reg1.onUnload = function ()
    {
        Key.removeListener(this);
        this.tfInput.removeListener(this);
    }
    ;
    __reg1.removeMovieClip = function ()
    {
        this.onUnload();
        super.removeMovieClip();
    }
    ;
    __reg1.onChanged = function (tf)
    {
        this.updateInputField();
    }
    ;
    __reg1.updateInputField = function ()
    {
        var __reg2 = this.tfInput.text;
        var __reg3 = __reg2.substr(0, 2) == "ID" ? 19 : 8;
        if (this.tfInput.text.length > __reg3) 
        {
            this.tfInput.text = this.tfInput.text.substr(0, __reg3);
        }
    }
    ;
    __reg1.onKeyDown = function ()
    {
        if (_global.numPopup) 
        {
            return undefined;
        }
        if (Key.getCode() == Key.ENTER) 
        {
            this.onCommand({cmd: "LOGIN"});
        }
    }
    ;
    __reg1.onCommand = function (msg)
    {
        com.cegg.Trace.out("WelcomeMain onCommand " + msg.cmd + "\n", "com.cegg.game.mahjong.WelcomeMain::onCommand", "K:\\dev\\mahjong5\\swf\\mtasc-1.11/std/com/cegg/game/mahjong/WelcomeMain.as", 142);
        if ((__reg0 = msg.cmd) === "REGID") 
        {
            com.cegg.GDialog.messageBox(this, com.cegg.game.mahjong.Res.T_REGISTPLAYER_NOTICE, "REGIDSTART", "Yes", "NO", "No");
            return;
        }
        else if (__reg0 === "REGIDSTART") 
        {
            this.onEnterFrame = function ()
            {
                delete this.onEnterFrame;
                this.registPlayer();
            }
            ;
            return;
        }
        else if (__reg0 === "LOGIN") 
        {
            with (this.tfInput)
            {
                selectable = false;
                type = "dynamic";
                borderColor = 13421772;
                textColor = 13421772;
            }
            this.LOGIN.setEnable(false);
            this.SEXUALITY.setEnable(false);
            this.CLIENTMODE.setEnable(false);
            var __reg3 = this.tfInput.text;
            if (__reg3 == "ID########-########") 
            {
                __reg3 = _root.uname;
            }
            else 
            {
                _root.uname = this.tfInput.text;
            }
            var __reg4 = com.cegg.game.mahjong.UtilBase.bPremiumVersion ? "f0" : "0000";
            var __reg5 = String(com.cegg.game.mahjong.SaveData.MJINFO().data.sx).substr(0, 1);
            if (__reg5 != "F") 
            {
                __reg5 = "M";
            }
            _root.send("<HELO" + " name=\"" + _global.escape(__reg3) + "\"" + " tid=\"" + __reg4 + "\"" + " sx=\"" + __reg5 + "\"" + " />");
            return;
        }
        else if (__reg0 === "SEXUALITY") 
        {
            this.SEXUALITY.setText(msg.disp);
            var __reg6 = msg.value;
            var __reg7 = com.cegg.game.mahjong.SaveData.MJINFO();
            if (__reg7.data.sx == __reg6) 
            {
                return;
            }
            __reg7.data.sx = __reg6;
            __reg7.flush();
            return;
        }
        else if (__reg0 === "CLIENTMODE") 
        {
            this.CLIENTMODE.setText(msg.disp);
            var __reg8 = msg.value == "PREMIUM" ? "yes" : "no_20080910";
            var __reg9 = com.cegg.game.mahjong.SaveData.MJINFO();
            if (__reg9.data.premium == __reg8) 
            {
                return;
            }
            __reg9.data.premium = __reg8;
            __reg9.flush();
            _root.onCommand({cmd: "RELOAD"});
            return;
        }
        else if (__reg0 === "REGISTUNAMEQ") 
        {
            var _this = this;
            var __reg10 = new LoadVars();
            __reg10.onLoad = function (ok)
            {
                if (ok) 
                {
                    _this.onLoadVars(this);
                }
            }
            ;
            __reg10.load(com.cegg.game.mahjong.UtilBase.resolveAsFunctionalRootURL("regid?q=1&uname=" + _global.escape(msg.text)));
            return;
        }
        else if (__reg0 === "REGISTUNAME") 
        {
            var _this = this;
            var __reg11 = new LoadVars();
            __reg11.onLoad = function (ok)
            {
                if (ok) 
                {
                    _this.onLoadVars(this);
                }
            }
            ;
            __reg11.load(com.cegg.game.mahjong.UtilBase.resolveAsFunctionalRootURL("regid?uname=" + _global.escape(msg.value)));
            return;
        }
        else if (__reg0 === "SETHIDDENID") 
        {
            var __reg12 = com.cegg.game.mahjong.SaveData.MJINFO();
            __reg12.data.hiddenid = true;
            __reg12.flush();
            this.tfInput.text = "ID########-########";
            return;
        }
        else if (__reg0 !== "RESETHIDDENID") 
        {
            return;
        }
        var __reg13 = com.cegg.game.mahjong.SaveData.MJINFO();
        delete __reg13.data.hiddenid;
        __reg13.flush();
        this.tfInput.text = _root.uname;
        return;
    }
    ;
    __reg1.onLoadVars = function (v)
    {
        if ((__reg0 = int(v.res)) === 0) 
        {
            com.cegg.GDialog.messageBox(this, com.cegg.game.mahjong.Res.T_REGISTPLAYERQ + v.uname, "REGISTUNAME", "Yes", "NO", "No", v.uname);
            return;
        }
        else if (__reg0 === 1012) 
        {
            var __reg3 = com.cegg.game.mahjong.SaveData.MJINFO();
            __reg3.data.uname = v.id;
            __reg3.flush();
            this.tfInput.text = v.id;
            this.updateInputField();
            this.tfInput.text = v.id;
            com.cegg.GDialog.textBox(this, v.id, com.cegg.game.mahjong.Res.T_REGISTPLAYEROK, false);
            return;
        }
        else 
        {
            __reg0 === 1009;
        }
        _root.onXMLNode((new XML("<ERR code=\"" + v.res + "\"/>")).firstChild);
        return;
    }
    ;
    __reg1.onXMLNode = function (n)
    {
        var __reg3 = n.attributes;
        if ((__reg0 = n.nodeName) === "ERR") 
        {
            this.LOGIN.setEnable(true);
            this.SEXUALITY.setEnable(true);
            this.CLIENTMODE.setEnable(true);
            with (this.tfInput)
            {
                borderColor = 8421504;
                textColor = 0;
                type = "input";
                selectable = true;
            }
            if (!this._visible) 
            {
                this._visible = true;
                _root.onCommand({cmd: "GOWELCOME"});
            }
            return;
        }
    }
    ;
    __reg1.registPlayer = function ()
    {
        var __reg2 = this.tfInput.text;
        if (__reg2.substr(0, 2) == "ID") 
        {
            __reg2 = "";
        }
        __reg2 = __reg2.substr(0, 8);
        com.cegg.GDialog.textBox(this, __reg2, com.cegg.game.mahjong.Res.T_REGISTPLAYER, false, "REGISTUNAMEQ", 8);
    }
    ;
    __reg1.aboutPlayerID = function ()
    {
        com.cegg.GDialog.messageBox(this, com.cegg.game.mahjong.Res.T_ABOUTPLAYERID);
    }
    ;
    __reg1.setHiddenID = function ()
    {
        com.cegg.GDialog.messageBox(this, com.cegg.game.mahjong.Res.T_SETHIDDENID, "SETHIDDENID", com.cegg.game.mahjong.Res.T_SETHIDDEN, "RESETHIDDENID", com.cegg.game.mahjong.Res.T_RESETHIDDEN);
    }
    ;
    ASSetPropFlags(__reg1, null, 1);
    __reg0.SymbolName = "__Packages.com.cegg.game.mahjong.WelcomeMain";
    __reg0.SymbolOwner = com.cegg.game.mahjong.WelcomeMain;
    __reg0.SymbolLinked = Object.registerClass(com.cegg.game.mahjong.WelcomeMain.SymbolName, com.cegg.game.mahjong.WelcomeMain.SymbolOwner);
}#endinitclip

//子图形 30
//  初始化剪辑
#initclip 0

if (!com.cegg.game.mahjong.Prof2) 
{
    if (!com) 
    {
        _global.com = new Object();
    }
    if (!com.cegg) 
    {
        _global.com.cegg = new Object();
    }
    if (!com.cegg.game) 
    {
        _global.com.cegg.game = new Object();
    }
    if (!com.cegg.game.mahjong) 
    {
        _global.com.cegg.game.mahjong = new Object();
    }
    (_global.com.cegg.game.mahjong.Prof2 = function ()
    {
        super();
        this.bRankingRateAvailable = false;
        this.sel.load();
        var __reg3 = 0;
        com.cegg.GButton.createTextButton("MENUPROF", undefined, __reg3++, this, (new XML(com.cegg.game.mahjong.Res.T_MENUPROF)).firstChild);
        com.cegg.GButton.createTextButton("MENURANKING", undefined, __reg3++, this, (new XML(com.cegg.game.mahjong.Res.T_MENURANKING)).firstChild);
        this.sendPXR(this.sel.rk());
        this.createTextField("tfUserName", __reg3++, 10, 18, 0, 0);
        this.createTextField("tfExpire", __reg3++, 10, 18, 0, 0);
        this.createEmptyMovieClip("pane0", __reg3++);
        this.createEmptyMovieClip("pane1", __reg3++);
        this.createEmptyMovieClip("pane2", __reg3++);
        this.createEmptyMovieClip("pane3", __reg3++);
        this.createEmptyMovieClip("pane4", __reg3++);
        this.tfExpire.text = com.cegg.game.mahjong.Res.T_EXPIRE + ":" + (this.expire.length == 8 ? this.expire.substr(0, 4) + "/" + this.expire.substr(4, 2) + "/" + this.expire.substr(6, 2) : "----/--/--");
        this.tfExpire.autoSize = "center";
        this.tfUserName.text = _global.unescape(this.uname);
        this.tfUserName.autoSize = "center";
        this.tfExpire._y = this.tfUserName._y + this.tfUserName._height - 4;
        this.goldTotal = 1000000 / 100;
        var __reg4 = [1, 11, 2, 12, 3, 13, 23, 33];
        var __reg5 = 4;
        if (__reg5 < 8) 
        {
            for (;;) 
            {
                ++__reg5;
                if (__reg5 >= 8) 
                {
                    break;
                }
                var __reg6 = 0;
                if (__reg6 < __reg4.length) 
                {
                    for (;;) 
                    {
                        ++__reg6;
                        if (__reg6 >= __reg4.length) 
                        {
                            break;
                        }
                        var __reg7 = __reg5 * 100 + __reg4[__reg6];
                        var __reg8 = com.cegg.game.mahjong.Res.ProfIndexToDBK(__reg7);
                        var __reg9 = this.mpf[__reg8].split(",");
                        if (__reg9.length) 
                        {
                            var __reg10 = com.cegg.game.mahjong.Res.ProfIndexToGameType(__reg7);
                            var __reg11 = Number(__reg9[1]) + Number(__reg9[0]) * com.cegg.game.mahjong.Res.GT_GETCHIP(__reg10);
                            this.goldTotal = this.goldTotal + __reg11;
                        }
                    }
                }
            }
        }
        this.goldTech = 0;
        var __reg12 = [1, 11, 2, 12, 3, 13, 23, 33, 1000];
        var __reg13 = 0;
        if (__reg13 < __reg12.length) 
        {
            for (;;) 
            {
                ++__reg13;
                if (__reg13 >= __reg12.length) 
                {
                    break;
                }
                var __reg14 = __reg12[__reg13];
                var __reg15 = com.cegg.game.mahjong.Res.ProfIndexToDBKC(__reg14);
                var __reg16 = this.mpf[__reg15].split(",");
                if (__reg16.length >= 2) 
                {
                    this.goldTech = this.goldTech + Number(__reg16[2]);
                }
            }
        }
        if (this.mpf.rr == "error") 
        {
            this.bRankingRateAvailable = false;
        }
        else 
        {
            this.bRankingRateAvailable = true;
            this.mrr = {};
            var __reg17 = new LoadVars();
            __reg17.onData(this.mpf.rr);
            for (var __reg18 in __reg17) 
            {
                this.mrr[__reg18] = __reg17[__reg18].split(",");
            }
            delete this.mpf.rr;
        }
        this.initPane();
    }
    ).prototype.__proto__ = MovieClip.prototype;
    __reg0.prototype.__constructor__ = MovieClip;
    var __reg1 = __reg0.prototype;
    __reg1.onLoad = function ()
    {
    }
    ;
    __reg1.onUnload = function ()
    {
        this.sel.save();
    }
    ;
    __reg1.removeMovieClip = function ()
    {
        this.onUnload();
        super.removeMovieClip();
        _global.clearInterval(this.pxrIntervalID);
    }
    ;
    __reg0.drawLinesLR = function (mc, init, last, step)
    {
        mc.lineStyle(1, 14540253, 100);
        var __reg6 = init;
        if (__reg6 < last) 
        {
            if (!mc["L" + __reg6]) 
            {
                for (;;) 
                {
                    __reg6 = __reg6 + step;
                    if (__reg6 >= last) 
                    {
                        return;
                    }
                    if (mc["L" + __reg6]) 
                    {
                        break;
                    }
                }
            }
            var __reg7 = mc["R" + __reg6]._y + mc["R" + __reg6]._height - 3;
            mc.moveTo(mc["L" + __reg6]._x + 2, __reg7);
            mc.lineTo(mc["R" + __reg6]._x + mc["R" + __reg6]._width - 2, __reg7);
        }
    }
    ;
    __reg1.initPane = function ()
    {
        this.tfUserName._x = 10;
        this.tfUserName._width = com.cegg.game.mahjong.Prof2.cx - 20;
        this.tfExpire._x = 10;
        this.tfExpire._width = com.cegg.game.mahjong.Prof2.cx - 20;
        var __reg2 = this.tfExpire.getDepth() + 10;
        var __reg3 = this.tfExpire._y + this.tfExpire._height - 1 + 3;
        this.MENUPROF._y = __reg3;
        this.MENUPROF._x = 15;
        __reg3 = __reg3 + this.MENUPROF._height;
        var __reg4 = this.pane0;
        __reg4.createTextField("tfDisp", __reg2++, 15, __reg3, com.cegg.game.mahjong.Prof2.cx - 30, 22);
        with (__reg4.tfDisp)
        {
            autoSize = "center";
            html = true;
        }
        __reg4.tfDisp.htmlText = "-";
        __reg3 = __reg3 + (__reg4.tfDisp._height - 3 + 5);
        var __reg6 = com.cegg.game.mahjong.Res.T_PROFLABEL[0];
        var __reg7 = 59;
        var __reg8 = 82;
        var __reg9 = 59;
        var __reg10 = __reg3;
        var __reg5 = 0;
        if (__reg5 < __reg6.length) 
        {
            for (;;) 
            {
                ++__reg5;
                if (__reg5 >= __reg6.length) 
                {
                    break;
                }
                if (!(__reg5 % 5)) 
                {
                    __reg3 = __reg10;
                }
                var __reg11 = __reg5 >= 5 ? (__reg5 >= 10 ? __reg9 : __reg8) : __reg7;
                var __reg12 = 15 + (__reg5 >= 5 ? (__reg5 >= 10 ? __reg7 + __reg8 + 20 : __reg7 + 10) : 0);
                com.cegg.game.mahjong.Util.createTextFieldTACS(__reg4, "L" + __reg5, __reg2++, __reg12 - 2, __reg3, __reg11 + 4, 22, __reg6[__reg5], "left", 0, true);
                com.cegg.game.mahjong.Util.createTextFieldTACS(__reg4, "R" + __reg5, __reg2++, __reg12 - 2, __reg3, __reg11 + 4, 22, "-", "right", 0, true);
                __reg3 = __reg3 + 16;
            }
        }
        __reg4.clear();
        com.cegg.game.mahjong.Prof2.drawLinesLR(__reg4, 0, 20, 1);
        __reg10 = __reg4.tfDisp._y + __reg4.tfDisp._height - 3;
        __reg4.moveTo(15, __reg10, 0);
        __reg4.lineTo(com.cegg.game.mahjong.Prof2.cx - 15, __reg10);
        this.updateProf_Normal();
        __reg3 = __reg3 + 24;
        var __reg13 = __reg3;
        __reg3 = this.pane0.tfDisp._y;
        __reg4 = this.pane3;
        __reg3 = __reg3 - 2;
        var __reg14 = com.cegg.game.mahjong.Res.T_PROFLABEL[4];
        var __reg15 = this.tfUserName._height - 4;
        var __reg16 = 0;
        if (__reg16 < 8) 
        {
            for (;;) 
            {
                ++__reg16;
                if (__reg16 >= 8) 
                {
                    break;
                }
                com.cegg.game.mahjong.Util.createTextFieldTACS(__reg4, "A" + __reg16, __reg2++, 15 - 2, __reg3 + int(__reg15 / 2), 40 + 4, 22, __reg14[__reg16 + 2], "left", 0, true);
                com.cegg.game.mahjong.Util.createTextFieldTACS(__reg4, "L" + __reg16, __reg2++, 15 + 40 - 2, __reg3, 40 + 4, 22, __reg14[1].substr(__reg16 & 1, 1), "left", 0, true);
                com.cegg.game.mahjong.Util.createTextFieldTACS(__reg4, "N" + __reg16, __reg2++, 15 + 70 - 2, __reg3, 40 + 4, 22, "-", "right", 0, true);
                com.cegg.game.mahjong.Util.createTextFieldTACS(__reg4, "M" + __reg16, __reg2++, 15 + 125 - 2, __reg3, 40 + 4, 22, "-", "right", 0, true);
                com.cegg.game.mahjong.Util.createTextFieldTACS(__reg4, "R" + __reg16, __reg2++, 15 + 165 - 2, __reg3, 40 + 4, 22, "-", "right", 0, true);
                __reg3 = __reg3 + (__reg15 + (__reg16 & 1 ? -1 : -2));
            }
        }
        __reg4.clear();
        __reg4.lineStyle(1, 14540253, 100);
        __reg4.moveTo(15, __reg4.L1._y + __reg15 + 1);
        __reg4.lineTo(235, __reg4.L1._y + __reg15 + 1);
        __reg4.moveTo(15, __reg4.L3._y + __reg15 + 1);
        __reg4.lineTo(235, __reg4.L3._y + __reg15 + 1);
        __reg4.moveTo(15, __reg4.L5._y + __reg15 + 1);
        __reg4.lineTo(235, __reg4.L5._y + __reg15 + 1);
        __reg3 = this.pane0.tfDisp._y;
        __reg4 = this.pane4;
        var __reg17 = com.cegg.game.mahjong.Res.T_PROFLABEL[4];
        var __reg18 = this.tfUserName._height - 4;
        var __reg19 = [125, 90];
        var __reg20 = [0, __reg19[0] + 5];
        var __reg21 = [78, 43];
        var __reg22 = 0;
        if (__reg22 < __reg17.length) 
        {
            for (;;) 
            {
                ++__reg22;
                if (__reg22 >= __reg17.length) 
                {
                    break;
                }
                com.cegg.game.mahjong.Util.createTextFieldTACS(__reg4, "L" + __reg22, __reg2++, 15 + __reg20[__reg22 & 1] - 2, __reg3, __reg19[__reg22 & 1] + 4, 22, __reg17[__reg22], "left", __reg22 >= 2 ? 0 : 11184810, true);
                com.cegg.game.mahjong.Util.createTextFieldTACS(__reg4, "M" + __reg22, __reg2++, 15 + __reg20[__reg22 & 1] - 2, __reg3, __reg21[__reg22 & 1] + 4, 22, "-", "right", __reg22 >= 2 ? 0 : 11184810, true);
                com.cegg.game.mahjong.Util.createTextFieldTACS(__reg4, "R" + __reg22, __reg2++, 15 + __reg20[__reg22 & 1] - 2, __reg3, __reg19[__reg22 & 1] + 4, 22, "-", "right", __reg22 >= 2 ? 0 : 11184810, true);
                if (__reg22 & 1) 
                {
                    __reg3 = __reg3 + __reg18;
                }
            }
        }
        __reg4.R1.text = __reg4.L1.text.substr(1, 1);
        __reg4.R0.text = __reg4.L1.text.substr(0, 1);
        __reg4.M0.text = __reg4.M1.text = __reg4.L0.text;
        __reg4.L0.text = __reg4.L1.text = "";
        __reg4.createTextField("G", __reg2++, 0, 0, com.cegg.game.mahjong.Prof2.cx, 22);
        var __reg23 = new TextFormat();
        __reg23.size = 21;
        __reg4.G.setNewTextFormat(__reg23);
        __reg4.G.autoSize = "center";
        __reg4.G.text = "0G";
        __reg4.G._y = __reg3 + int((__reg13 - __reg3 - __reg4.G._height) / 2) + 1;
        __reg4.clear();
        com.cegg.game.mahjong.Prof2.drawLinesLR(__reg4, 0, 20, 1);
        this.updateProf_TotalG();
        __reg3 = __reg13;
        this.MENURANKING._y = __reg3;
        this.MENURANKING._x = 15;
        __reg3 = __reg3 + (this.MENURANKING._height + 4);
        __reg4 = this.pane1;
        var __reg24 = ["", "Rate", "-", "-", "-", "-", "-", "-", "-", "-", "-", "-", "-", "-"];
        var __reg25 = [com.cegg.game.mahjong.Res.T_PROF_TAISENSUU, "---", "---", "---", "---", "---", "---", "---", "---", "---", "---", "---", "---", "---"];
        var __reg26 = com.cegg.game.mahjong.Res.T_PROFLABEL[com.cegg.game.mahjong.UtilBase.bPremiumVersion ? 1 : 2];
        var __reg27 = 15;
        var __reg28 = [0, 130, 5, 130, 5, 130, 5, 130, 5, 130, 90, 0, 115, 0];
        var __reg29 = [0, 40, 65, 40, 65, 40, 65, 40, 65, 40, 80, 58, 58, 58];
        var __reg30 = [120, 90, 115, 90, 115, 90, 115, 90, 115, 90, 130, 105, 105, 105];
        var __reg31 = [0, 0, 0, __reg27, 0, __reg27, 0, __reg27, 0, __reg27, __reg27 + 5, 0, __reg27, 0];
        var __reg32 = this.sel.rk();
        var __reg33 = 0;
        if (__reg33 < __reg26.length) 
        {
            for (;;) 
            {
                ++__reg33;
                if (__reg33 >= __reg26.length) 
                {
                    break;
                }
                var __reg34 = __reg33 != 0 && __reg4["R" + __reg33].text != __reg25[__reg33];
                var __reg35 = false;
                if ((__reg33 == 6 || (__reg33 == 7 || (__reg33 == 8 || __reg33 == 9))) && !(__reg32 & com.cegg.game.mahjong.Res.GT_CHIP | com.cegg.game.mahjong.Res.GT_JANS)) 
                {
                    __reg35 = true;
                }
                if ((__reg33 == 4 || __reg33 == 5) && com.cegg.game.mahjong.Res.GT_ISTECH(__reg32)) 
                {
                    __reg35 = true;
                }
                if (__reg33 == 12 && (com.cegg.game.mahjong.Res.GT_ISTECH(__reg32) || __reg32 & com.cegg.game.mahjong.Res.GT_SANMA)) 
                {
                    __reg35 = true;
                }
                if ((__reg33 == 11 || (__reg33 == 12 || __reg33 == 13)) && !com.cegg.game.mahjong.UtilBase.bPremiumVersion) 
                {
                    __reg35 = true;
                }
                com.cegg.game.mahjong.Util.createTextFieldTACS(__reg4, "L" + __reg33, __reg2++, 15 + __reg28[__reg33] - 2, __reg3, __reg30[__reg33] + 4, 22, __reg26[__reg33], "left", __reg35 ? 11184810 : 0, true);
                com.cegg.game.mahjong.Util.createTextFieldTACS(__reg4, "M" + __reg33, __reg2++, 15 + __reg28[__reg33] - 2, __reg3, __reg29[__reg33] + 4, 22, __reg24[__reg33], "right", __reg35 ? 11184810 : 0, true);
                com.cegg.game.mahjong.Util.createTextFieldTACS(__reg4, "R" + __reg33, __reg2++, 15 + __reg28[__reg33] - 2, __reg3, __reg30[__reg33] + 4, 22, __reg25[__reg33], "right", __reg35 ? 11184810 : 0, true);
                if (__reg34) 
                {
                    __reg4["R" + __reg33].textColor = 15790320;
                }
                if (__reg33 == 1) 
                {
                    __reg3 = __reg3 + (__reg27 + 5);
                    com.cegg.game.mahjong.Util.createTextFieldTACS(__reg4, "T", __reg2++, 15 + __reg28[2] - 2, __reg3, __reg29[2] + 4, 22, com.cegg.game.mahjong.Res.T_PROF_TSUUSAN, "right", 11184810, true);
                    com.cegg.game.mahjong.Util.createTextFieldTACS(__reg4, "H", __reg2++, 15 + __reg28[3] - 2, __reg3, __reg29[3] + 4, 22, com.cegg.game.mahjong.Res.T_PROF_HEIKIN, "right", 11184810, true);
                    __reg3 = __reg3 + __reg27;
                }
                __reg3 = __reg3 + __reg31[__reg33];
            }
        }
        __reg4.clear();
        com.cegg.game.mahjong.Prof2.drawLinesLR(__reg4, 0, 20, 1);
        __reg3 = __reg4.T._y + __reg4.T._height - 3;
        __reg4.moveTo(15 + 2, __reg3, 0);
        __reg4.lineTo(15 + __reg28[2] + __reg30[2] - 2, __reg3);
        __reg3 = __reg4.H._y + __reg4.H._height - 3;
        __reg4.moveTo(15 + __reg28[3] + 2, __reg3, 0);
        __reg4.lineTo(15 + __reg28[3] + __reg30[3] - 2, __reg3);
        this.updateRanking_();
        __reg4 = this.pane2;
        __reg3 = __reg13 + 5;
        com.cegg.game.mahjong.Util.createTextFieldTACS(__reg4, "tf", __reg2++, 15, __reg3, com.cegg.game.mahjong.Prof2.cx - 30, 22, com.cegg.game.mahjong.Res.T_RANKINGCSDISP[0], "left", 0, true);
        __reg3 = __reg3 + (__reg4.tf._height + 8);
        var __reg36 = com.cegg.game.mahjong.Res.T_PROFLABEL[3];
        var __reg37 = 0;
        if (__reg37 < __reg36.length) 
        {
            for (;;) 
            {
                ++__reg37;
                if (__reg37 >= __reg36.length) 
                {
                    break;
                }
                com.cegg.game.mahjong.Util.createTextFieldTACS(__reg4, "L" + __reg37, __reg2++, 15, __reg3, com.cegg.game.mahjong.Prof2.cx - 30, 22, __reg36[__reg37], "left", 0, true);
                com.cegg.game.mahjong.Util.createTextFieldTACS(__reg4, "R" + __reg37, __reg2++, 15, __reg3, com.cegg.game.mahjong.Prof2.cx - 30, 22, "-", "right", 0, true);
                __reg3 = __reg3 + (__reg4["L" + __reg37]._height * 2 - 8);
            }
        }
        var __reg38 = new TextFormat();
        __reg38.align = "right";
        __reg4.R0.setNewTextFormat(__reg38);
        __reg4.createTextField("R", __reg2++, 0, __reg4.L2._y - 8, com.cegg.game.mahjong.Prof2.cx, 22);
        var __reg39 = new TextFormat();
        __reg39.size = 48;
        __reg4.R.setNewTextFormat(__reg39);
        __reg4.R.autoSize = "center";
        __reg4.R.text = "- - -";
        __reg4.L2._y = __reg4.R2._y = __reg4.R._y + __reg4.R._height + 4;
        if (__reg4.R2._x < __reg4.L2._x + __reg4.L2._width) 
        {
            __reg4.L2._visible = false;
        }
        __reg4.clear();
        com.cegg.game.mahjong.Prof2.drawLinesLR(__reg4, 0, 20, 1);
        __reg3 = __reg4.tf._y + __reg4.tf._height - 3;
        __reg4.moveTo(15, __reg3, 0);
        __reg4.lineTo(com.cegg.game.mahjong.Prof2.cx - 15, __reg3);
        this.updateRankingCS();
        __reg4._visible = false;
    }
    ;
    __reg1.updateProf = function ()
    {
        if (this.sel.pf() % 100 < 90) 
        {
            this.updateProf_Normal();
            this.pane0._visible = true;
            this.pane3._visible = false;
            this.pane4._visible = false;
            return;
        }
        if (this.sel.pf() % 100 == 90) 
        {
            this.updateProf_TotalR();
            this.pane0._visible = false;
            this.pane3._visible = true;
            this.pane4._visible = false;
            return;
        }
        this.updateProf_TotalG();
        this.pane0._visible = false;
        this.pane3._visible = false;
        this.pane4._visible = true;
    }
    ;
    __reg1.updateProf_Normal = function ()
    {
        var __reg2 = this.pane0;
        var __reg4 = undefined;
        if (this.sel.pf() == 4 || this.sel.pf() == 3) 
        {
            if (this.mpf.PF4 == undefined && this.mpf.PF3 == undefined) 
            {
                __reg2.tfDisp.htmlText = com.cegg.game.mahjong.Res.T_PROFHOWTOUSE;
                __reg2.profHowToUse = function ()
                {
                    com.cegg.GDialog.messageBox(_root.Main, com.cegg.game.mahjong.Res.T_PROFHOWTOUSEBOX);
                }
                ;
            }
            else 
            {
                if (this.sel.pf() == 4) 
                {
                    __reg3 = this.mpf.PF4.split(",");
                    __reg5 = int(__reg3.shift());
                    __reg6 = int(__reg3.shift());
                    __reg7 = int(__reg3.shift());
                }
                else if (this.sel.pf() == 3) 
                {
                    __reg3 = this.mpf.PF3.split(",");
                    var __reg5 = int(__reg3.shift());
                    var __reg6 = int(__reg3.shift());
                    var __reg7 = int(__reg3.shift());
                }
                if (!__reg5) 
                {
                    __reg5 = 0;
                }
                if (!__reg6) 
                {
                    __reg6 = 0;
                }
                if (!__reg7) 
                {
                    __reg7 = 1500;
                }
                __reg2.tfDisp.htmlText = com.cegg.game.mahjong.Res.T_DANDISP[__reg5] + "   " + __reg6 + (0 <= __reg5 && __reg5 < com.cegg.game.mahjong.Res.DAN_NEXT.length ? " / " + com.cegg.game.mahjong.Res.DAN_NEXT[__reg5] : "") + "pt   R" + __reg7;
            }
        }
        else if (this.sel.pf() == 2 || this.sel.pf() == 1) 
        {
            __reg2.tfDisp.htmlText = "-";
            var __reg8 = "";
            if (this.sel.pf() == 2) 
            {
                __reg8 = com.cegg.game.mahjong.SaveData.MJINFO().data.prof_private;
            }
            if (this.sel.pf() == 1) 
            {
                __reg8 = com.cegg.game.mahjong.SaveData.MJINFO().data.prof_private3;
            }
            if (__reg8.length) 
            {
                __reg3 = __reg8.split(",");
            }
        }
        else 
        {
            var __reg9 = this.sel.pf();
            var __reg10 = com.cegg.game.mahjong.Res.ProfIndexToDBK(__reg9);
            var __reg11 = com.cegg.game.mahjong.Res.ProfIndexToDBKC(__reg9);
            var __reg12 = this.mpf[__reg10].split(",");
            var __reg13 = this.mpf[__reg11].split(",");
            if (__reg12 && __reg13) 
            {
                if (this.sel.pf() == 1000) 
                {
                    var __reg14 = "";
                    __reg14 = __reg14 + com.cegg.game.mahjong.Util.GoldToClass(this.goldTech);
                    __reg14 = __reg14 + "  ";
                    __reg14 = __reg14 + (com.cegg.game.mahjong.Util.gold2string(this.goldTech, ",") + "G");
                    __reg14 = __reg14 + ("  R" + com.cegg.game.mahjong.Res.RatingConvFronProfIndex(__reg9, __reg13[1]));
                    __reg2.tfDisp.htmlText = __reg14;
                }
                else 
                {
                    var __reg15 = "";
                    __reg15 = __reg15 + ("R" + com.cegg.game.mahjong.Res.RatingConvFronProfIndex(__reg9, __reg13[1]));
                    var __reg16 = this.mrr[__reg11];
                    __reg15 = __reg15 + " ";
                    __reg15 = __reg15 + ((__reg16[0] || "-") + com.cegg.game.mahjong.Res.T_PROF_I);
                    __reg15 = __reg15 + " ";
                    __reg15 = __reg15 + com.cegg.game.mahjong.Util.RatingClassDisp(__reg16[1], "-");
                    __reg2.tfDisp.htmlText = __reg15;
                    __reg4 = int(__reg12[0]);
                }
            }
            else 
            {
                __reg2.tfDisp.htmlText = "-";
            }
            var __reg3 = __reg12;
            __reg3.shift();
        }
        if (this.sel.pf() == 1000) 
        {
            __reg2.L0.text = com.cegg.game.mahjong.Res.T_PROFLABEL[1][11];
            __reg2.L1.text = com.cegg.game.mahjong.Res.T_PROFLABEL[1][13];
            __reg2.L2.text = __reg2.L3.text = "    -    ";
        }
        else 
        {
            __reg2.L0.text = com.cegg.game.mahjong.Res.T_PROFLABEL[0][0];
            __reg2.L1.text = com.cegg.game.mahjong.Res.T_PROFLABEL[0][1];
            __reg2.L2.text = com.cegg.game.mahjong.Res.T_PROFLABEL[0][2];
            __reg2.L3.text = com.cegg.game.mahjong.Res.T_PROFLABEL[0][3];
        }
        var __reg17 = ["-", "-", "-", "-", "-", "-", "-", "-", "-", "-", "-", "-", "-", "-"];
        var __reg18 = int(__reg3[1]) + int(__reg3[2]) + int(__reg3[3]) + int(__reg3[4]);
        if (__reg18) 
        {
            if (this.sel.pf() == 1000) 
            {
                __reg17[0] = com.cegg.game.mahjong.Util.ffmt100(int(__reg3[1]) / __reg18, 3);
                __reg17[1] = com.cegg.game.mahjong.Util.ffmt100(int(__reg3[4]) / __reg18, 3);
            }
            else 
            {
                __reg17[0] = com.cegg.game.mahjong.Util.ffmt100(int(__reg3[1]) / __reg18, 3);
                __reg17[1] = com.cegg.game.mahjong.Util.ffmt100(int(__reg3[2]) / __reg18, 3);
                __reg17[2] = com.cegg.game.mahjong.Util.ffmt100(int(__reg3[3]) / __reg18, 3);
                __reg17[3] = com.cegg.game.mahjong.Util.ffmt100(int(__reg3[4]) / __reg18, 3);
                __reg17[4] = com.cegg.game.mahjong.Util.ffmt100(int(__reg3[5]) / __reg18, 3);
                __reg17[7] = com.cegg.game.mahjong.Util.ffmt((int(__reg3[1]) * 1 + int(__reg3[2]) * 2 + int(__reg3[3]) * 3 + int(__reg3[4]) * 4) / __reg18, 2, false);
            }
            __reg17[5] = __reg18;
            __reg17[6] = com.cegg.game.mahjong.Util.ffmt3(Number(__reg3[0]) / __reg18, 2);
        }
        if (__reg18 && __reg4 != undefined) 
        {
            var __reg19 = com.cegg.game.mahjong.Res.ProfIndexToGameType(this.sel.pf());
            var __reg20 = Number(__reg3[0]) + Number(__reg4) * com.cegg.game.mahjong.Res.GT_GETCHIP(__reg19);
            __reg17[8] = com.cegg.game.mahjong.Util.ffmt3(__reg20 / __reg18, 2);
            __reg17[9] = com.cegg.game.mahjong.Util.ffmt3(__reg4 / __reg18, 2);
        }
        if (__reg3[6] > 0) 
        {
            __reg17[10] = com.cegg.game.mahjong.Util.ffmt100(int(__reg3[7]) / int(__reg3[6]), 3);
            __reg17[11] = com.cegg.game.mahjong.Util.ffmt100(int(__reg3[8]) / int(__reg3[6]), 3);
            __reg17[12] = com.cegg.game.mahjong.Util.ffmt100(int(__reg3[9]) / int(__reg3[6]), 3);
            __reg17[13] = com.cegg.game.mahjong.Util.ffmt100(int(__reg3[10]) / int(__reg3[6]), 3);
        }
        var __reg21 = 0;
        if (__reg2["R" + __reg21]) 
        {
            var __reg22 = false;
            if (__reg21 == 3 && (this.sel.pf() == 3 || this.sel.pf() == 1)) 
            {
                __reg22 = true;
            }
            if (__reg21 == 3 && (this.sel.pf() >= 100 && int(this.sel.pf() % 100 / 20) == 1)) 
            {
                __reg22 = true;
            }
            if ((__reg21 == 8 || __reg21 == 9) && (this.sel.pf() < 100 || this.sel.pf() == 1000)) 
            {
                __reg22 = true;
            }
            if ((__reg21 == 8 || __reg21 == 9) && (this.sel.pf() >= 100 && this.sel.pf() % 10 == 1)) 
            {
                __reg22 = true;
            }
            if ((__reg21 == 2 || (__reg21 == 3 || (__reg21 == 4 || __reg21 == 7))) && this.sel.pf() == 1000) 
            {
                __reg22 = true;
            }
            __reg2["L" + __reg21].textColor = __reg2["R" + __reg21].textColor = __reg22 ? 11184810 : 0;
            __reg2["R" + __reg21].text = __reg22 ? "-" : __reg17[__reg21];
        }
    }
    ;
    __reg1.updateProf_TotalR = function ()
    {
        var __reg2 = this.pane3;
        var __reg3 = [1, 11, 2, 12, 3, 13, 23, 33];
        var __reg4 = 0;
        if (__reg4 < __reg3.length) 
        {
            var __reg5 = 400 + __reg3[__reg4];
            var __reg6 = com.cegg.game.mahjong.Res.ProfIndexToDBKC(__reg5);
            var __reg7 = this.mpf[__reg6].split(",");
            var __reg8 = this.mrr[__reg6];
            __reg2["N" + __reg4].text = __reg2["M" + __reg4].text = __reg2["R" + __reg4].text = "-";
            if (__reg7.length) 
            {
                var __reg9 = __reg7[0] <= 1200 ? (__reg7[0] <= 800 ? "K" : "L") : "M";
                __reg2["N" + __reg4].text = "R" + com.cegg.game.mahjong.Res.RatingConvFronProfIndex(__reg5, __reg7[1]) + __reg9;
                if (__reg8[0]) 
                {
                    __reg2["M" + __reg4].text = __reg8[0] + com.cegg.game.mahjong.Res.T_PROF_I;
                }
                if (__reg8[1]) 
                {
                    __reg2["R" + __reg4].text = com.cegg.game.mahjong.Util.RatingClassDisp(__reg8[1], "-");
                }
            }
        }
    }
    ;
    __reg1.updateProf_TotalG = function ()
    {
        var __reg2 = this.pane4;
        var __reg3 = [1, 11, 2, 12, 3, 13, 23, 33];
        var __reg4 = int(this.sel.pf() / 100);
        var __reg5 = 0;
        if (__reg5 < __reg3.length) 
        {
            for (;;) 
            {
                ++__reg5;
                if (__reg5 >= __reg3.length) 
                {
                    break;
                }
                var __reg6 = __reg4 * 100 + __reg3[__reg5];
                var __reg7 = com.cegg.game.mahjong.Res.ProfIndexToDBK(__reg6);
                var __reg8 = com.cegg.game.mahjong.Res.ProfIndexToDBKC(__reg6);
                var __reg9 = this.mpf[__reg7].split(",");
                var __reg10 = this.mpf[__reg8].split(",");
                if (__reg9.length && __reg10.length) 
                {
                    var __reg11 = com.cegg.game.mahjong.Res.ProfIndexToGameType(__reg6);
                    var __reg12 = Number(__reg9[1]) + Number(__reg9[0]) * com.cegg.game.mahjong.Res.GT_GETCHIP(__reg11);
                    var __reg13 = __reg10[0] <= 1200 ? (__reg10[0] <= 800 ? "K" : "L") : "M";
                    var __reg14 = int(__reg9[2]) + int(__reg9[3]) + int(__reg9[4]) + int(__reg9[5]);
                    if (__reg14) 
                    {
                        __reg2["M" + (__reg5 + 2)].text = com.cegg.game.mahjong.Util.ffmt3(__reg12 * 100 / __reg14, 2) + "G";
                    }
                    __reg2["R" + (__reg5 + 2)].text = "R" + com.cegg.game.mahjong.Res.RatingConvFronProfIndex(__reg6, __reg10[1]) + __reg13;
                }
                else 
                {
                    __reg2["M" + (__reg5 + 2)].text = __reg2["R" + (__reg5 + 2)].text = "-";
                }
            }
        }
        __reg2.G.text = com.cegg.game.mahjong.Util.gold2string(this.goldTotal * 100, ",") + "G";
    }
    ;
    __reg1.updateRanking = function ()
    {
        if (this.rankingcs.length) 
        {
            this.updateRankingCS();
            this.MENURANKING._visible = false;
            this.pane1._visible = false;
            this.pane2._visible = true;
            this.onEnterFrame = this.onEnterFrame_FadeInCS;
            return;
        }
        this.updateRanking_();
        this.MENURANKING._visible = true;
        this.pane1._visible = true;
        this.pane2._visible = false;
        this.onEnterFrame = this.onEnterFrame_FadeIn;
    }
    ;
    __reg1.updateRanking_ = function ()
    {
        var __reg2 = this.pane1;
        var __reg3 = this.sel.rk();
        var __reg4 = ["", "Rate", "-", "-", "-", "-", "-", "-", "-", "-", "-", "-", "-", "-"];
        var __reg5 = [com.cegg.game.mahjong.Res.T_PROF_TAISENSUU, "---", "---", "---", "---", "---", "---", "---", "---", "---", "---", "---", "---", "---"];
        var __reg6 = this.mprof.split(",");
        var __reg7 = this.ranking.split(",");
        var __reg8 = int(__reg6[0]) + int(__reg6[1]) + int(__reg6[2]) + int(__reg6[3]);
        if (__reg7[0].length && __reg7[0] != "0") 
        {
            if (__reg7.length == 9) 
            {
                __reg4[10] = int(__reg7[1]) + int(__reg7[2]) + int(__reg7[3]) + int(__reg7[4]);
            }
            if (__reg7.length == 13) 
            {
                __reg4[10] = int(__reg7[9]) + int(__reg7[10]) + int(__reg7[11]) + int(__reg7[12]);
            }
        }
        if (__reg7[1].length && __reg7[1] != "0") 
        {
            __reg4[2] = com.cegg.game.mahjong.Util.ffmt3(__reg6[4], 1);
        }
        if (__reg7[3].length && __reg7[3] != "0") 
        {
            __reg4[4] = __reg3 & com.cegg.game.mahjong.Res.GT_SANMA ? int(__reg6[0]) * 30 + int(__reg6[1]) * 0 + int(__reg6[2]) * -30 : int(__reg6[0]) * 30 + int(__reg6[1]) * 10 + int(__reg6[2]) * -10 + int(__reg6[3]) * -30;
        }
        if (__reg8) 
        {
            __reg4[3] = com.cegg.game.mahjong.Util.ffmt3(__reg6[4] / __reg8, 2);
            if (!com.cegg.game.mahjong.Res.GT_ISTECH(__reg3)) 
            {
                __reg4[5] = com.cegg.game.mahjong.Util.ffmt((__reg3 & com.cegg.game.mahjong.Res.GT_SANMA ? int(__reg6[0]) * 1 + int(__reg6[1]) * 2 + int(__reg6[2]) * 3 : int(__reg6[0]) * 1 + int(__reg6[1]) * 2 + int(__reg6[2]) * 3 + int(__reg6[3]) * 4) / __reg8, 2, false);
            }
        }
        if (__reg8 && __reg7.length == 13) 
        {
            __reg4[6] = com.cegg.game.mahjong.Util.ffmt3(__reg6[6], 1);
            __reg4[7] = com.cegg.game.mahjong.Util.ffmt3(__reg6[6] / __reg8, 2);
            __reg4[8] = com.cegg.game.mahjong.Util.ffmt3(__reg6[7], 0);
            __reg4[9] = com.cegg.game.mahjong.Util.ffmt3(__reg6[7] / __reg8, 2);
        }
        if (__reg7[0].length && __reg7[0] != "0") 
        {
            __reg5[10] = __reg7[0] + com.cegg.game.mahjong.Res.T_PROF_I;
        }
        if (__reg7[1].length && __reg7[1] != "0") 
        {
            __reg5[2] = __reg7[1] + com.cegg.game.mahjong.Res.T_PROF_I;
        }
        if (__reg7[2].length && __reg7[2] != "0") 
        {
            __reg5[3] = __reg7[2] + com.cegg.game.mahjong.Res.T_PROF_I;
        }
        if (__reg7[3].length && __reg7[3] != "0") 
        {
            __reg5[4] = __reg7[3] + com.cegg.game.mahjong.Res.T_PROF_I;
        }
        if (__reg7[4].length && __reg7[4] != "0") 
        {
            __reg5[5] = __reg7[4] + com.cegg.game.mahjong.Res.T_PROF_I;
        }
        if (__reg7[9].length && __reg7[9] != "0") 
        {
            __reg5[6] = __reg7[9] + com.cegg.game.mahjong.Res.T_PROF_I;
        }
        if (__reg7[10].length && __reg7[10] != "0") 
        {
            __reg5[7] = __reg7[10] + com.cegg.game.mahjong.Res.T_PROF_I;
        }
        if (__reg7[11].length && __reg7[11] != "0") 
        {
            __reg5[8] = __reg7[11] + com.cegg.game.mahjong.Res.T_PROF_I;
        }
        if (__reg7[12].length && __reg7[12] != "0") 
        {
            __reg5[9] = __reg7[12] + com.cegg.game.mahjong.Res.T_PROF_I;
        }
        if (__reg8) 
        {
            if (__reg3 & com.cegg.game.mahjong.Res.GT_SANMA) 
            {
                __reg5[0] = int(__reg6[0]) + "+" + int(__reg6[1]) + "+" + int(__reg6[2]) + " = " + __reg8 + com.cegg.game.mahjong.Res.T_PROF_SEN;
                __reg4[11] = com.cegg.game.mahjong.Util.ffmt100(int(__reg6[0]) / __reg8, 3);
                __reg4[13] = com.cegg.game.mahjong.Util.ffmt100(int(__reg6[2]) / __reg8, 3);
                if (__reg7[5].length && __reg7[5] != "0") 
                {
                    __reg5[11] = __reg7[5] + com.cegg.game.mahjong.Res.T_PROF_I;
                }
                if (__reg7[7].length && __reg7[7] != "0") 
                {
                    __reg5[13] = __reg7[7] + com.cegg.game.mahjong.Res.T_PROF_I;
                }
            }
            else 
            {
                __reg5[0] = int(__reg6[0]) + "+" + int(__reg6[1]) + "+" + int(__reg6[2]) + "+" + int(__reg6[3]) + " = " + __reg8 + com.cegg.game.mahjong.Res.T_PROF_SEN;
                __reg4[11] = com.cegg.game.mahjong.Util.ffmt100(int(__reg6[0]) / __reg8, 3);
                __reg4[13] = com.cegg.game.mahjong.Util.ffmt100(int(__reg6[3]) / __reg8, 3);
                if (!com.cegg.game.mahjong.Res.GT_ISTECH(__reg3)) 
                {
                    __reg4[12] = com.cegg.game.mahjong.Util.ffmt100((int(__reg6[0]) + int(__reg6[1])) / __reg8, 3);
                }
                if (__reg7[5].length && __reg7[5] != "0") 
                {
                    __reg5[11] = __reg7[5] + com.cegg.game.mahjong.Res.T_PROF_I;
                }
                if (__reg7[6].length && __reg7[6] != "0") 
                {
                    __reg5[12] = __reg7[6] + com.cegg.game.mahjong.Res.T_PROF_I;
                }
                if (__reg7[7].length && __reg7[7] != "0") 
                {
                    __reg5[13] = __reg7[7] + com.cegg.game.mahjong.Res.T_PROF_I;
                }
            }
            if (com.cegg.game.mahjong.Res.GT_ISTECH(__reg3)) 
            {
                __reg5[0] = __reg8 + " " + com.cegg.game.mahjong.Res.T_PROF_SEN;
            }
        }
        if (__reg7[8].length && __reg7[8] != "0") 
        {
            var __reg9 = com.cegg.game.mahjong.Res.GameTypeToProfIndex(__reg3);
            var __reg10 = com.cegg.game.mahjong.Res.ProfIndexToDBK(__reg9);
            var __reg11 = com.cegg.game.mahjong.Res.ProfIndexToDBKC(__reg9);
            var __reg12 = this.mpf[__reg11.length ? __reg11 : __reg10].split(",");
            __reg4[1] = "R" + com.cegg.game.mahjong.Res.RatingConvFronProfIndex(__reg9, __reg12[__reg11.length ? 1 : 2]);
            __reg5[1] = __reg7[8] + com.cegg.game.mahjong.Res.T_PROF_I;
        }
        var __reg13 = 0;
        __reg13 = 0;
        if (__reg2["R" + __reg13]) 
        {
            var __reg14 = __reg13 != 0 && __reg2["R" + __reg13].text != __reg5[__reg13];
            var __reg15 = false;
            if (__reg13 == 12 && (__reg3 & com.cegg.game.mahjong.Res.GT_SANMA || com.cegg.game.mahjong.Res.GT_ISTECH(__reg3))) 
            {
                __reg15 = true;
            }
            if ((__reg13 == 4 || __reg13 == 5) && com.cegg.game.mahjong.Res.GT_ISTECH(__reg3)) 
            {
                __reg15 = true;
            }
            if (6 <= __reg13 && __reg13 <= 9 && __reg3 ^ -1 & com.cegg.game.mahjong.Res.GT_CHIP) 
            {
                __reg15 = true;
            }
            if ((__reg13 == 11 || (__reg13 == 12 || __reg13 == 13)) && !com.cegg.game.mahjong.UtilBase.bPremiumVersion) 
            {
                __reg15 = true;
            }
            __reg2["L" + __reg13].textColor = __reg2["M" + __reg13].textColor = __reg2["R" + __reg13].textColor = __reg15 ? 11184810 : 0;
            __reg2["M" + __reg13].text = __reg4[__reg13];
            __reg2["R" + __reg13].text = __reg5[__reg13];
            if (__reg14) 
            {
                __reg2["R" + __reg13].textColor = 15790320;
            }
        }
    }
    ;
    __reg1.updateRankingCS = function ()
    {
        var __reg2 = this.pane2;
        var __reg3 = "- - -";
        var __reg4 = this.rankingcs.split(",");
        if (__reg4[0] == "sc3m" || (__reg4[0] == "sc3c0m" || (__reg4[0] == "sc3c2m" || __reg4[0] == "sc3c5m"))) 
        {
            __reg2.L2.text = com.cegg.game.mahjong.Res.T_RANKINGCSDISP[1];
            __reg2.R0.text = com.cegg.game.mahjong.Res.T_RANKINGCSDISP[3];
            if (__reg4[0] == "sc3c2m") 
            {
                __reg2.R0.text = __reg2.R0.text + ("\n" + com.cegg.game.mahjong.Res.T_RANKINGCSDISP[5]);
            }
            if (__reg4[0] == "sc3c5m") 
            {
                __reg2.R0.text = __reg2.R0.text + ("\n" + com.cegg.game.mahjong.Res.T_RANKINGCSDISP[6]);
            }
            if (__reg4[6].length) 
            {
                __reg2.R1.text = (int(__reg4[6]) <= 0 ? "" : "+") + __reg4[6];
            }
            if (__reg4[8].length) 
            {
                __reg3 = __reg4[8] + com.cegg.game.mahjong.Res.T_PROF_I;
            }
            var __reg5 = "";
            if (__reg4[3].length) 
            {
                __reg5 = __reg5 + ((int(__reg4[3]) <= 0 ? "" : "+") + __reg4[3]);
            }
            if (__reg4[2].length) 
            {
                __reg5 = __reg5 + ((int(__reg4[2]) < 0 ? "" : "+") + __reg4[2]);
            }
            if (__reg4[1].length) 
            {
                __reg5 = __reg5 + ((int(__reg4[1]) < 0 ? "" : "+") + __reg4[1]);
            }
            if (__reg5.length) 
            {
                var __reg6 = int(__reg4[1]) + int(__reg4[2]) + int(__reg4[3]);
                __reg2.R2.text = __reg5 + " = " + (__reg6 <= 0 ? "" : "+") + __reg6;
            }
        }
        else if (__reg4[0] == "sc5m" || (__reg4[0] == "sc5c0m" || (__reg4[0] == "sc5c2m" || __reg4[0] == "sc5c5m"))) 
        {
            __reg2.L2.text = com.cegg.game.mahjong.Res.T_RANKINGCSDISP[2];
            __reg2.R0.text = com.cegg.game.mahjong.Res.T_RANKINGCSDISP[4];
            if (__reg4[0] == "sc5c2m") 
            {
                __reg2.R0.text = __reg2.R0.text + ("\n" + com.cegg.game.mahjong.Res.T_RANKINGCSDISP[5]);
            }
            if (__reg4[0] == "sc5c5m") 
            {
                __reg2.R0.text = __reg2.R0.text + ("\n" + com.cegg.game.mahjong.Res.T_RANKINGCSDISP[6]);
            }
            if (__reg4[7].length) 
            {
                __reg2.R1.text = (int(__reg4[7]) <= 0 ? "" : "+") + __reg4[7];
            }
            if (__reg4[9].length) 
            {
                __reg3 = __reg4[9] + com.cegg.game.mahjong.Res.T_PROF_I;
            }
            var __reg7 = "";
            if (__reg4[5].length) 
            {
                __reg7 = __reg7 + ((int(__reg4[5]) <= 0 ? "" : "+") + __reg4[5]);
            }
            if (__reg4[4].length) 
            {
                __reg7 = __reg7 + ((int(__reg4[4]) < 0 ? "" : "+") + __reg4[4]);
            }
            if (__reg4[3].length) 
            {
                __reg7 = __reg7 + ((int(__reg4[3]) < 0 ? "" : "+") + __reg4[3]);
            }
            if (__reg4[2].length) 
            {
                __reg7 = __reg7 + ((int(__reg4[2]) < 0 ? "" : "+") + __reg4[2]);
            }
            if (__reg4[1].length) 
            {
                __reg7 = __reg7 + ((int(__reg4[1]) < 0 ? "" : "+") + __reg4[1]);
            }
            if (__reg7.length) 
            {
                var __reg8 = int(__reg4[1]) + int(__reg4[2]) + int(__reg4[3]) + int(__reg4[4]) + int(__reg4[5]);
                __reg2.R2.text = __reg7 + " = " + (__reg8 <= 0 ? "" : "+") + __reg8;
            }
        }
        var __reg9 = __reg2.R.text != __reg3;
        __reg2.R.text = __reg3;
        if (__reg9) 
        {
            __reg2.R.textColor = 15790320;
        }
    }
    ;
    __reg1.onTabChanged = function (wLobbyID, iLastTab, iLastTabGame)
    {
        if (wLobbyID) 
        {
            this.sel["set"](1, -1, -1);
            if ((__reg0 = this.sel.pf()) === 1) 
            {
                this.sel["set"](1, -1, -1);
            }
            else if (__reg0 === 2) 
            {
                this.sel["set"](1, -1, -1);
            }
            else 
            {
                this.sel["set"](1, 2, -1);
            }
            this.SelectProf(this.sel.pf());
            this.sendPXR(-1);
        }
        else if (iLastTab == "pane0") 
        {
            this.sel.LoadLastGame();
            this.sel["set"](0, -1, -1);
            var __reg5 = 1;
            __reg5 = __reg5 | (com.cegg.game.mahjong.Res.GT_ISJANS(this.sel.rk()) ? this.sel.rk() & com.cegg.game.mahjong.Res.GT_NAN : this.sel.rk() & (com.cegg.game.mahjong.Res.GT_TOKU | com.cegg.game.mahjong.Res.GT_HIGH) ^ -1);
            if ((__reg0 = iLastTabGame) === "taku0") 
            {
                __reg5 = __reg5 | 0;
            }
            else if (__reg0 === "taku1") 
            {
                __reg5 = __reg5 | com.cegg.game.mahjong.Res.GT_HIGH;
            }
            else if (__reg0 === "taku2") 
            {
                __reg5 = __reg5 | com.cegg.game.mahjong.Res.GT_TOKU;
            }
            else if (__reg0 === "taku3") 
            {
                __reg5 = __reg5 | com.cegg.game.mahjong.Res.GT_HOUO;
            }
            if ((__reg0 = this.sel.pf()) === 3) 
            {
                this.sel["set"](-1, -1, __reg5);
            }
            else if (__reg0 === 4) 
            {
                this.sel["set"](-1, -1, __reg5);
            }
            else 
            {
                this.sel["set"](-1, 4, __reg5);
            }
            this.SelectProf(this.sel.pf());
            this.SelectRanking(this.sel.rk());
        }
        else if (iLastTab == "pane1") 
        {
            this.sel.LoadLastGame();
            this.sel["set"](2, -1, -1);
            var __reg6 = this.sel.pf() % 100;
            if ((__reg0 = __reg6) !== 1) 
            {
                if (__reg0 !== 2) 
                {
                    if (__reg0 !== 3) 
                    {
                        if (__reg0 !== 11) 
                        {
                            if (__reg0 !== 12) 
                            {
                                if (__reg0 !== 13) 
                                {
                                    if (__reg0 !== 23) 
                                    {
                                        if (__reg0 !== 33) 
                                        {
                                            if (__reg0 !== 90) 
                                            {
                                                if (__reg0 !== 91) 
                                                {
                                                    __reg6 = 90;
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
            }
            var __reg7 = com.cegg.game.mahjong.Res.GT_MULTI;
            __reg7 = __reg7 | (com.cegg.game.mahjong.Res.GT_ISJANS(this.sel.rk()) ? this.sel.rk() & (com.cegg.game.mahjong.Res.GT_TOKU | com.cegg.game.mahjong.Res.GT_HIGH) ^ -1 : this.sel.rk() & com.cegg.game.mahjong.Res.GT_NAN | com.cegg.game.mahjong.Res.GT_JANS);
            if ((__reg0 = iLastTabGame) === "taku0") 
            {
                __reg7 = __reg7 | 0;
                __reg6 = __reg6 + 400;
            }
            else if (__reg0 === "taku1") 
            {
                __reg7 = __reg7 | com.cegg.game.mahjong.Res.GT_HIGH;
                __reg6 = __reg6 + 500;
            }
            else if (__reg0 === "taku2") 
            {
                __reg7 = __reg7 | com.cegg.game.mahjong.Res.GT_TOKU;
                __reg6 = __reg6 + 600;
            }
            else if (__reg0 === "taku3") 
            {
                __reg7 = __reg7 | com.cegg.game.mahjong.Res.GT_HOUO;
                __reg6 = __reg6 + 700;
            }
            this.sel["set"](2, __reg6, __reg7);
            this.SelectProf(this.sel.pf());
            this.SelectRanking(this.sel.rk());
        }
        else if (iLastTab == "pane2") 
        {
            this.sel.LoadLastGame();
            this.sel["set"](4, -1, -1);
            var __reg8 = com.cegg.game.mahjong.Res.GT_MULTI | com.cegg.game.mahjong.Res.GT_TECH;
            var __reg9 = com.cegg.game.mahjong.Res.GameTypeToProfIndex(__reg8);
            this.sel["set"](4, __reg9, __reg8);
            this.SelectProf(this.sel.pf());
            this.SelectRanking(this.sel.rk());
        }
        else 
        {
            this.sel["set"](3, -1, -1);
            this.SelectProf(this.sel.pf());
            this.SelectRanking(this.sel.rk());
        }
        var __reg10 = com.cegg.game.mahjong.SaveData.MJSTATUS();
        if (__reg10.data.lastGameType != undefined) 
        {
            delete __reg10.data.lastGameType;
            __reg10.flush();
        }
    }
    ;
    __reg1.onEnterFrame_FadeIn = function ()
    {
        var __reg2 = true;
        var __reg3 = this.pane1;
        var __reg4 = 0;
        if (__reg4 < 20) 
        {
            for (;;) 
            {
                ++__reg4;
                if (__reg4 >= 20) 
                {
                    break;
                }
                var __reg5 = __reg3["R" + __reg4];
                if (!__reg5 || !__reg5.textColor) 
                {
                    continue;
                }
                if (__reg5.textColor < 526344) 
                {
                    __reg5.textColor = 0;
                }
                else 
                {
                    __reg5.textColor = __reg5.textColor - 526344;
                }
                __reg2 = false;
            }
        }
        if (__reg2) 
        {
            delete this.onEnterFrame;
        }
    }
    ;
    __reg1.onEnterFrame_FadeInCS = function ()
    {
        var __reg2 = this.pane2.R;
        if (__reg2.textColor) 
        {
            if (__reg2.textColor < 526344) 
            {
                __reg2.textColor = 0;
            }
            else 
            {
                __reg2.textColor = __reg2.textColor - 526344;
            }
            return;
        }
        delete this.onEnterFrame;
    }
    ;
    __reg1.onXMLNode = function (n)
    {
        var __reg3 = n.attributes;
        if ((__reg0 = n.nodeName) === "CS") 
        {
            if (__reg3.ranking.length) 
            {
                this.sendPXR(-1);
            }
            return;
        }
        else if (__reg0 !== "RANKING") 
        {
            return;
        }
        if (__reg3.v2.length) 
        {
            var __reg4 = __reg3.v2.split(",");
            if (__reg4.length == 15) 
            {
                this.mprof = [__reg4[0], __reg4[1], __reg4[2], __reg4[3], __reg4[4], __reg4[5]].join(",");
                this.ranking = [__reg4[6], __reg4[7], __reg4[8], __reg4[9], __reg4[10], __reg4[11], __reg4[12], __reg4[13], __reg4[14]].join(",");
            }
            else if (__reg4.length == 21) 
            {
                this.mprof = [__reg4[0], __reg4[1], __reg4[2], __reg4[3], __reg4[4], __reg4[5], __reg4[15], __reg4[16]].join(",");
                this.ranking = [__reg4[6], __reg4[7], __reg4[8], __reg4[9], __reg4[10], __reg4[11], __reg4[12], __reg4[13], __reg4[14], __reg4[17], __reg4[18], __reg4[19], __reg4[20]].join(",");
            }
            this.rankingcs = "";
            this.updateRanking();
        }
        if (__reg3.rankingcs.length) 
        {
            this.ranking = "";
            this.rankingcs = __reg3.rankingcs;
            this.updateRanking();
        }
        return;
    }
    ;
    __reg1.onCommand = function (msg)
    {
        if ((__reg0 = msg.cmd) === "MENUPROF") 
        {
            this.MENUPROF.setText(msg.disp);
            this.sel["set"](-1, int(msg.value), -1);
            this.updateProf();
            return;
        }
        else if (__reg0 === "MENURANKING") 
        {
            this.MENURANKING.setText(msg.disp);
            this.sel["set"](-1, -1, int(msg.value));
            this.mprof = "";
            this.ranking = "";
            this.updateRanking();
            this.sendPXR(this.sel.rk());
            return;
        }
        else if (__reg0 === "CLEARPROF_PRIVATE") 
        {
            com.cegg.GDialog.messageBox(this, com.cegg.game.mahjong.Res.T_CLEARPROF_PRIVATE, "CLEARPROF_PRIVATE_YES", "YES", "NO", "NO");
            return;
        }
        else if (__reg0 === "CLEARPROF_PRIVATE_YES") 
        {
            var __reg3 = com.cegg.game.mahjong.SaveData.MJINFO();
            delete __reg3.data.prof_private;
            delete (__reg3.data.prof_private3);
            __reg3.flush();
            return;
        }
        else if (__reg0 !== "OPEN_WEB_RANKING") 
        {
            return;
        }
        this.getURL("http://tenhou.net/ranking.html", "_blank");
        return;
    }
    ;
    __reg1.sendPXR = function (wGameType)
    {
        _root.send("<PXR V=\"" + wGameType + "\" />");
        _global.clearInterval(this.pxrIntervalID);
        this.pxrIntervalID = _global.setInterval(function ()
        {
            _root.send("<PXR v=\"" + wGameType + "\" />");
        }
        , 1000 * 20);
    }
    ;
    __reg1.SelectProf = function (pf)
    {
        if (this.MENUPROF.value != pf) 
        {
            this.sel["set"](-1, pf, -1);
            this.MENUPROF.selectValue(String(pf));
            this.updateProf();
        }
    }
    ;
    __reg1.SelectRanking = function (rk)
    {
        if (this.MENURANKING.value != rk) 
        {
            this.sel["set"](-1, -1, rk);
            this.MENURANKING.selectValue(String(rk));
            this.sendPXR(rk);
            this.mprof = "";
            this.ranking = "";
            this.updateRanking();
        }
    }
    ;
    __reg1.GetJoinOk = function (lobby, tabsel, taku)
    {
        if (!lobby) 
        {
            if (tabsel == "pane0") 
            {
                if ((__reg0 = taku) !== "taku0") 
                {
                    if (__reg0 !== "taku1") 
                    {
                        if (__reg0 !== "taku2") 
                        {
                            __reg0 === "taku3";
                        }
                    }
                }
            }
            else if (tabsel == "pane1") 
            {
                if (!this.bRankingRateAvailable) 
                {
                    return 0;
                }
                var __reg5 = this.mpf.PF01C.split(",");
                var __reg6 = this.mpf.PF02C.split(",");
                var __reg7 = this.mpf.PF03C.split(",");
                var __reg8 = this.mpf.PF11C.split(",");
                var __reg9 = this.mpf.PF12C.split(",");
                var __reg10 = this.mpf.PF13C.split(",");
                var __reg11 = this.mpf.PF23C.split(",");
                var __reg12 = this.mpf.PF33C.split(",");
                var __reg13 = __reg5.length ? com.cegg.game.mahjong.Res.RatingConvFronProfIndex(401, __reg5[1]) : 1500;
                var __reg14 = __reg6.length ? com.cegg.game.mahjong.Res.RatingConvFronProfIndex(402, __reg6[1]) : 1500;
                var __reg15 = __reg7.length ? com.cegg.game.mahjong.Res.RatingConvFronProfIndex(403, __reg7[1]) : 1500;
                var __reg16 = __reg8.length ? com.cegg.game.mahjong.Res.RatingConvFronProfIndex(411, __reg8[1]) : 1500;
                var __reg17 = __reg9.length ? com.cegg.game.mahjong.Res.RatingConvFronProfIndex(412, __reg9[1]) : 1500;
                var __reg18 = __reg10.length ? com.cegg.game.mahjong.Res.RatingConvFronProfIndex(413, __reg10[1]) : 1500;
                var __reg19 = __reg11.length ? com.cegg.game.mahjong.Res.RatingConvFronProfIndex(423, __reg11[1]) : 1500;
                var __reg20 = __reg12.length ? com.cegg.game.mahjong.Res.RatingConvFronProfIndex(433, __reg12[1]) : 1500;
                if ((__reg0 = taku) === "taku0") 
                {
                    return 255;
                }
                else if (__reg0 === "taku1") 
                {
                    return (__reg13 < 1600 ? 0 : 1) | (__reg16 < 1600 ? 0 : 2) | (__reg14 < 1600 ? 0 : 4) | (__reg17 < 1600 ? 0 : 8) | (__reg15 < 1600 ? 0 : 16) | (__reg18 < 1600 ? 0 : 32) | (__reg19 < 1600 ? 0 : 64) | (__reg20 < 1600 ? 0 : 128);
                }
                else if (__reg0 !== "taku2") 
                {
                    __reg0 === "taku3";
                }
            }
            else if (tabsel == "pane2") 
            {
                if ((__reg0 = taku) === "taku0") 
                {
                    return 1;
                }
                else if (__reg0 !== "taku1") 
                {
                    if (__reg0 !== "taku2") 
                    {
                        __reg0 === "taku3";
                    }
                }
            }
        }
        return 0;
    }
    ;
    ASSetPropFlags(__reg1, null, 1);
    __reg0.SymbolName = "__Packages.com.cegg.game.mahjong.Prof2";
    __reg0.SymbolOwner = com.cegg.game.mahjong.Prof2;
    __reg0.SymbolLinked = Object.registerClass(com.cegg.game.mahjong.Prof2.SymbolName, com.cegg.game.mahjong.Prof2.SymbolOwner);
    __reg0.cx = 250;
    __reg1.sel = {load: function ()
    {
        var __reg2 = com.cegg.game.mahjong.SaveData.MJINFO().data.prof_sel.split(",");
        var __reg3 = 0;
        if (__reg3 < this.v.length) 
        {
            for (;;) 
            {
                ++__reg3;
                if (__reg3 >= this.v.length) 
                {
                    break;
                }
                this.v[__reg3] = int(__reg2[__reg3]);
            }
        }
        var __reg4 = com.cegg.game.mahjong.SaveData.MJINFO();
        delete __reg4.data.tabsel_prof;
        delete (__reg4.data.prof_last);
        delete __reg4.data.ranking_last;
        __reg4.flush();
    }
    , save: function ()
    {
        var __reg2 = com.cegg.game.mahjong.SaveData.MJINFO();
        __reg2.data.prof_sel = this.v.join(",");
        __reg2.flush();
    }
    , loadLastGame: function ()
    {
        var __reg2 = com.cegg.game.mahjong.SaveData.MJSTATUS();
        if (__reg2.data.lastGameType != undefined) 
        {
            var __reg3 = __reg2.data.lastGameType;
            if (com.cegg.game.mahjong.Res.GT_ISJANS(__reg3)) 
            {
                if (this.v[4 + 0] % 100 < 90) 
                {
                    this.v[4 + 0] = this.v[6 + 0] = com.cegg.game.mahjong.Res.GameTypeToProfIndex(__reg3);
                }
                this.v[4 + 1] = this.v[6 + 1] = __reg3;
            }
            else 
            {
                __reg3 = __reg3 & com.cegg.game.mahjong.Res.GT_SAKU ^ -1;
                this.v[0 + 0] = this.v[6 + 0] = com.cegg.game.mahjong.Res.GameTypeToProfIndex(__reg3);
                this.v[0 + 1] = this.v[6 + 1] = __reg3;
            }
            this.save();
        }
    }
    , set: function (iIndex, pf, rk)
    {
        if (iIndex != -1) 
        {
            this.offset = iIndex * 2;
        }
        if (pf != -1) 
        {
            this.v[this.offset + 0] = pf;
            if (this.offset == 0 || this.offset == 4) 
            {
                this.v[6 + 0] = pf;
            }
        }
        if (rk != -1) 
        {
            this.v[this.offset + 1] = rk;
            if (this.offset == 0 || this.offset == 4) 
            {
                this.v[6 + 1] = rk;
            }
        }
    }
    , pf: function ()
    {
        return this.v[this.offset + 0];
    }
    , rk: function ()
    {
        return this.v[this.offset + 1];
    }
    , v: [0, 0, 0, 0, 0, 0, 0, 0, 0, 0], offset: 0};
}#endinitclip

//子图形 31
//  初始化剪辑
#initclip 0

if (!com.cegg.game.mahjong.Res) 
{
    if (!com) 
    {
        _global.com = new Object();
    }
    if (!com.cegg) 
    {
        _global.com.cegg = new Object();
    }
    if (!com.cegg.game) 
    {
        _global.com.cegg.game = new Object();
    }
    if (!com.cegg.game.mahjong) 
    {
        _global.com.cegg.game.mahjong = new Object();
    }
    var __reg1 = (_global.com.cegg.game.mahjong.Res = function ()
    {
    }
    ).prototype;
    __reg0.GT_ISJANS = function (w)
    {
        return (w & com.cegg.game.mahjong.Res.GT_CHIP | com.cegg.game.mahjong.Res.GT_JANS) != 0;
    }
    ;
    __reg0.GT_ISTECH = function (w)
    {
        return (w & com.cegg.game.mahjong.Res.GT_TECH) != 0;
    }
    ;
    __reg0.GT_ISDAN = function (w)
    {
        return !(w & com.cegg.game.mahjong.Res.GT_CHIP | com.cegg.game.mahjong.Res.GT_JANS | com.cegg.game.mahjong.Res.GT_TECH);
    }
    ;
    __reg0.GT_ISSAKU = function (w)
    {
        return (com.cegg.game.mahjong.Res.GT_ISJANS(w) ? w ^ -1 & com.cegg.game.mahjong.Res.GT_NAN : w & com.cegg.game.mahjong.Res.GT_SAKU) != 0;
    }
    ;
    __reg0.GT_GETTAKU = function (w)
    {
        return (w & 32) >> 4 | (w & 128) >> 7;
    }
    ;
    __reg0.GT_GETTAKU2 = function (w)
    {
        return com.cegg.game.mahjong.Res.GT_GETTAKU(w) + (com.cegg.game.mahjong.Res.GT_ISJANS(w) ? 4 : 0) + (com.cegg.game.mahjong.Res.GT_ISTECH(w) ? 8 : 0);
    }
    ;
    __reg0.GT_GETCHIP = function (w)
    {
        return w ^ -1 & com.cegg.game.mahjong.Res.GT_CHIP ? 0 : (w & com.cegg.game.mahjong.Res.GT_JANS ? 5 : 2);
    }
    ;
    __reg0.GameTypeToString = function (g)
    {
        return (g & com.cegg.game.mahjong.Res.GT_SANMA ? "三" : "") + "般上特鳳若銀琥孔技－－－".substr(com.cegg.game.mahjong.Res.GT_GETTAKU2(g), 1) + (com.cegg.game.mahjong.Res.GT_ISTECH(g) ? "" : (g & com.cegg.game.mahjong.Res.GT_NAN ? "南" : "東")) + (com.cegg.game.mahjong.Res.GT_ISJANS(g) ? "喰赤" + (g & com.cegg.game.mahjong.Res.GT_NAN ? "" : "速") + (g ^ -1 & com.cegg.game.mahjong.Res.GT_CHIP ? "祝０" : (g & com.cegg.game.mahjong.Res.GT_JANS ? "祝５" : "祝２")) : (g & com.cegg.game.mahjong.Res.GT_NOKUI ? "" : "喰") + (g & com.cegg.game.mahjong.Res.GT_NOAKA ? "" : "赤") + (g & com.cegg.game.mahjong.Res.GT_SAKU ? "速" : "") + (g & com.cegg.game.mahjong.Res.GT_GRAY ? "暗" : ""));
    }
    ;
    __reg0.GameTypeToInfo = function (g, dan4, dan3)
    {
        var __reg5 = [];
        var __reg6 = "";
        __reg6 = __reg6 + ("■入場条件 / " + com.cegg.game.mahjong.Res.GameTypeToString(g));
        __reg5.push(__reg6);
        __reg6 = "";
        if ((__reg0 = com.cegg.game.mahjong.Res.GT_GETTAKU2(g)) === 0) 
        {
            __reg6 = __reg6 + "四段R1800未満";
        }
        else if (__reg0 === 1) 
        {
            __reg6 = __reg6 + "１級以上七段R2000未満\n１級未満の有料会員";
        }
        else if (__reg0 === 2) 
        {
            __reg6 = __reg6 + "四段R1800以上";
        }
        else if (__reg0 === 3) 
        {
            __reg6 = __reg6 + "七段R2000以上(有料会員限定)";
        }
        else if (__reg0 === 4) 
        {
            __reg6 = __reg6 + "全プレーヤ";
        }
        else if (__reg0 === 5) 
        {
            __reg6 = __reg6 + "R1600以上(仮)";
        }
        else if (__reg0 === 6) 
        {
            __reg6 = __reg6 + "閉店";
        }
        else if (__reg0 === 7) 
        {
            __reg6 = __reg6 + "閉店";
        }
        else if (__reg0 === 8) 
        {
            __reg6 = __reg6 + "全プレーヤ";
        }
        __reg5.push(__reg6);
        __reg6 = "";
        if (com.cegg.game.mahjong.Res.GT_ISDAN(g)) 
        {
            var __reg7 = [0, 0, 0, 0];
            if ((__reg0 = com.cegg.game.mahjong.Res.GT_GETTAKU(g)) === 0) 
            {
                __reg7[0] = 30;
                __reg7[1] = 0;
            }
            else if (__reg0 === 1) 
            {
                __reg7[0] = 40;
                __reg7[1] = 10;
            }
            else if (__reg0 === 2) 
            {
                __reg7[0] = 50;
                __reg7[1] = 20;
            }
            else if (__reg0 === 3) 
            {
                __reg7[0] = 60;
                __reg7[1] = 30;
            }
            if (g & com.cegg.game.mahjong.Res.GT_SANMA) 
            {
                __reg7[0] = __reg7[0] + __reg7[1];
                __reg7[1] = 0;
                __reg7[2] = com.cegg.game.mahjong.Res.DAN_PT4[dan3];
            }
            else 
            {
                __reg7[3] = com.cegg.game.mahjong.Res.DAN_PT4[dan4];
            }
            if (g & com.cegg.game.mahjong.Res.GT_NAN) 
            {
                __reg7[0] = __reg7[0] * 1.5;
                __reg7[1] = __reg7[1] * 1.5;
                __reg7[2] = __reg7[2] * 1.5;
                __reg7[3] = __reg7[3] * 1.5;
            }
            __reg6 = __reg6 + "■段位pt変動 / ";
            __reg6 = __reg6 + com.cegg.game.mahjong.Res.T_DANDISP[g & com.cegg.game.mahjong.Res.GT_SANMA ? dan3 : dan4];
            __reg5.push(__reg6);
            __reg6 = "";
            __reg6 = __reg6 + ("1" + com.cegg.game.mahjong.Res.T_PROF_I + "+" + __reg7[0] + "  2" + com.cegg.game.mahjong.Res.T_PROF_I + "+" + __reg7[1] + "  3" + com.cegg.game.mahjong.Res.T_PROF_I + (__reg7[2] >= 0 ? "+" : "") + __reg7[2] + (g & com.cegg.game.mahjong.Res.GT_SANMA ? "" : "  4" + com.cegg.game.mahjong.Res.T_PROF_I + (__reg7[3] >= 0 ? "+" : "") + __reg7[3]));
            __reg5.push(__reg6);
            __reg6 = "";
        }
        if (com.cegg.game.mahjong.Res.GT_ISTECH(g)) 
        {
            __reg6 = __reg6 + "■場代";
            __reg5.push(__reg6);
            __reg6 = "";
            __reg6 = __reg6 + "0G";
            __reg5.push(__reg6);
            __reg6 = "";
        }
        __reg5.push("■Rate変動");
        __reg6 = __reg6 + "卓の平均Rが高いほど大きく上昇\n";
        __reg5.push(__reg6);
        __reg6 = "";
        __reg5.push("■ルール");
        __reg6 = __reg6 + (com.cegg.game.mahjong.Res.GT_ISTECH(g) ? "１局" : (g & com.cegg.game.mahjong.Res.GT_NAN ? "東南" : "東風"));
        __reg6 = __reg6 + (com.cegg.game.mahjong.Res.GT_ISDAN(g) ? (g & com.cegg.game.mahjong.Res.GT_SANMA ? "+3局サドンデス" : "+4局サドンデス") : "打ち切り ");
        __reg6 = __reg6 + " ウマ:";
        __reg6 = __reg6 + (com.cegg.game.mahjong.Res.GT_ISTECH(g) ? "×" : (com.cegg.game.mahjong.Res.GT_ISJANS(g) ? (g & com.cegg.game.mahjong.Res.GT_SANMA ? "0-30" : "10-30") : (g & com.cegg.game.mahjong.Res.GT_SANMA ? "0-20" : "10-20")));
        __reg6 = __reg6 + "\n";
        __reg6 = __reg6 + (com.cegg.game.mahjong.Res.GT_ISTECH(g) ? "開始:1000点 原点:1000点" : (g & com.cegg.game.mahjong.Res.GT_SANMA ? "開始:35000点 原点:40000点" : "開始:25000点 原点:30000点"));
        __reg6 = __reg6 + " 1本場";
        __reg6 = __reg6 + (com.cegg.game.mahjong.Res.GT_ISTECH(g) ? "--点" : (com.cegg.game.mahjong.Res.GT_ISJANS(g) && g ^ -1 & com.cegg.game.mahjong.Res.GT_NAN ? (g & com.cegg.game.mahjong.Res.GT_SANMA ? "1000点" : "1500点") : (g & com.cegg.game.mahjong.Res.GT_SANMA ? "200点" : "300点")));
        __reg6 = __reg6 + "\n";
        __reg6 = __reg6 + "思考:";
        __reg6 = __reg6 + (com.cegg.game.mahjong.Res.GT_ISSAKU(g) ? "3+5秒" : "5+10秒");
        __reg6 = __reg6 + " 明槓ドラ:";
        __reg6 = __reg6 + (com.cegg.game.mahjong.Res.GT_ISDAN(g) ? "後" : "先");
        __reg6 = __reg6 + " 後付○ 喰替×\n";
        __reg6 = __reg6 + "喰断";
        __reg6 = __reg6 + "○×"[g & com.cegg.game.mahjong.Res.GT_NOKUI ? 1 : 0];
        __reg6 = __reg6 + " 赤";
        __reg6 = __reg6 + "320".substr(g & com.cegg.game.mahjong.Res.GT_NOAKA ? 2 : (g & com.cegg.game.mahjong.Res.GT_SANMA ? 1 : 0), 1);
        __reg6 = __reg6 + "枚";
        __reg6 = __reg6 + " 飛び○";
        __reg6 = __reg6 + " 祝儀";
        __reg6 = __reg6 + (g ^ -1 & com.cegg.game.mahjong.Res.GT_CHIP ? "×" : (g & com.cegg.game.mahjong.Res.GT_JANS ? "1枚5000点" : "1枚2000点"));
        __reg6 = __reg6 + "\n";
        __reg6 = __reg6 + "東西場";
        __reg6 = __reg6 + (com.cegg.game.mahjong.Res.GT_ISJANS(g) && g ^ -1 & com.cegg.game.mahjong.Res.GT_NAN ? "○" : "×");
        __reg6 = __reg6 + (com.cegg.game.mahjong.Res.GT_ISTECH(g) ? " 流し満貫×  途中流局×" : " 流し満貫○  途中流局○");
        __reg6 = __reg6 + "\n";
        if (!com.cegg.game.mahjong.Res.GT_ISTECH(g)) 
        {
            __reg6 = __reg6 + "和了止め○ 聴牌止め○\n";
        }
        __reg6 = __reg6 + "ダブロン:清算 トリロン:";
        __reg6 = __reg6 + (g & com.cegg.game.mahjong.Res.GT_SANMA ? "×" : (com.cegg.game.mahjong.Res.GT_ISTECH(g) ? "清算" : "途流"));
        __reg6 = __reg6 + "\n";
        __reg5.push(__reg6);
        __reg6 = "";
        if (com.cegg.game.mahjong.Res.GT_ISDAN(g)) 
        {
            __reg6 = __reg6 + "■サドンデス";
            __reg5.push(__reg6);
            __reg6 = "";
            __reg6 = __reg6 + "- 全員が";
            __reg6 = __reg6 + (g & com.cegg.game.mahjong.Res.GT_SANMA ? "40000" : "30000");
            __reg6 = __reg6 + "点未満で続行\n";
            __reg6 = __reg6 + "- ";
            __reg6 = __reg6 + (g & com.cegg.game.mahjong.Res.GT_NAN ? (g & com.cegg.game.mahjong.Res.GT_SANMA ? "南3局～西3局" : "南4局～西4局") : (g & com.cegg.game.mahjong.Res.GT_SANMA ? "東3局～南3局" : "東4局～南4局"));
            __reg6 = __reg6 + "\n";
            __reg6 = __reg6 + "※親の連荘/和了止め/聴牌止めが優先\n";
            __reg5.push(__reg6);
            __reg6 = "";
        }
        if (com.cegg.game.mahjong.Res.GT_ISTECH(g)) 
        {
            __reg6 = __reg6 + "■和了り親(ID登録者のみ)";
            __reg5.push(__reg6);
            __reg6 = "";
            __reg6 = __reg6 + "- 1位が次回起家の権利を持ちます\n";
            __reg6 = __reg6 + "- 起家は親権者からランダムに選択されます\n";
            __reg6 = __reg6 + "- 親権は24時間でリセットされます\n";
            __reg5.push(__reg6);
            __reg6 = "";
        }
        return __reg5;
    }
    ;
    __reg0.GameTypeToProfIndex = function (dw_GameType)
    {
        if (com.cegg.game.mahjong.Res.GT_ISTECH(dw_GameType)) 
        {
            return 1000 + com.cegg.game.mahjong.Res.GT_GETTAKU(dw_GameType) * 100;
        }
        if (com.cegg.game.mahjong.Res.GT_ISJANS(dw_GameType)) 
        {
            return com.cegg.game.mahjong.Res.GT_GETTAKU2(dw_GameType) * 100 + (dw_GameType ^ -1 & com.cegg.game.mahjong.Res.GT_CHIP ? 1 : (dw_GameType & com.cegg.game.mahjong.Res.GT_JANS ? 3 : 2)) + (dw_GameType & com.cegg.game.mahjong.Res.GT_NAN ? 10 : 0) + (dw_GameType & com.cegg.game.mahjong.Res.GT_SANMA ? 20 : 0);
        }
        return dw_GameType & com.cegg.game.mahjong.Res.GT_SANMA ? 3 : 4;
    }
    ;
    __reg0.ProfIndexToGameType = function (nProf)
    {
        if ((__reg0 = nProf) === 1) 
        {
            return com.cegg.game.mahjong.Res.GT_SANMA;
        }
        else if (__reg0 === 2) 
        {
            return 0;
        }
        else if (__reg0 === 3) 
        {
            return com.cegg.game.mahjong.Res.GT_MULTI | com.cegg.game.mahjong.Res.GT_SANMA;
        }
        else if (__reg0 === 4) 
        {
            return com.cegg.game.mahjong.Res.GT_MULTI;
        }
        else if (__reg0 === 401) 
        {
            return com.cegg.game.mahjong.Res.GT_MULTI | com.cegg.game.mahjong.Res.GT_JANS;
        }
        else if (__reg0 === 402) 
        {
            return com.cegg.game.mahjong.Res.GT_MULTI | com.cegg.game.mahjong.Res.GT_CHIP;
        }
        else if (__reg0 === 403) 
        {
            return com.cegg.game.mahjong.Res.GT_MULTI | com.cegg.game.mahjong.Res.GT_CHIP5;
        }
        else if (__reg0 === 411) 
        {
            return com.cegg.game.mahjong.Res.GT_MULTI | com.cegg.game.mahjong.Res.GT_NAN | com.cegg.game.mahjong.Res.GT_JANS;
        }
        else if (__reg0 === 412) 
        {
            return com.cegg.game.mahjong.Res.GT_MULTI | com.cegg.game.mahjong.Res.GT_NAN | com.cegg.game.mahjong.Res.GT_CHIP;
        }
        else if (__reg0 === 413) 
        {
            return com.cegg.game.mahjong.Res.GT_MULTI | com.cegg.game.mahjong.Res.GT_NAN | com.cegg.game.mahjong.Res.GT_CHIP5;
        }
        else if (__reg0 === 423) 
        {
            return com.cegg.game.mahjong.Res.GT_MULTI | com.cegg.game.mahjong.Res.GT_SANMA | com.cegg.game.mahjong.Res.GT_CHIP5;
        }
        else if (__reg0 === 433) 
        {
            return com.cegg.game.mahjong.Res.GT_MULTI | com.cegg.game.mahjong.Res.GT_NAN | com.cegg.game.mahjong.Res.GT_SANMA | com.cegg.game.mahjong.Res.GT_CHIP5;
        }
        else if (__reg0 === 501) 
        {
            return com.cegg.game.mahjong.Res.GT_MULTI | com.cegg.game.mahjong.Res.GT_HIGH | com.cegg.game.mahjong.Res.GT_JANS;
        }
        else if (__reg0 === 502) 
        {
            return com.cegg.game.mahjong.Res.GT_MULTI | com.cegg.game.mahjong.Res.GT_HIGH | com.cegg.game.mahjong.Res.GT_CHIP;
        }
        else if (__reg0 === 503) 
        {
            return com.cegg.game.mahjong.Res.GT_MULTI | com.cegg.game.mahjong.Res.GT_HIGH | com.cegg.game.mahjong.Res.GT_CHIP5;
        }
        else if (__reg0 === 511) 
        {
            return com.cegg.game.mahjong.Res.GT_MULTI | com.cegg.game.mahjong.Res.GT_HIGH | com.cegg.game.mahjong.Res.GT_NAN | com.cegg.game.mahjong.Res.GT_JANS;
        }
        else if (__reg0 === 512) 
        {
            return com.cegg.game.mahjong.Res.GT_MULTI | com.cegg.game.mahjong.Res.GT_HIGH | com.cegg.game.mahjong.Res.GT_NAN | com.cegg.game.mahjong.Res.GT_CHIP;
        }
        else if (__reg0 === 513) 
        {
            return com.cegg.game.mahjong.Res.GT_MULTI | com.cegg.game.mahjong.Res.GT_HIGH | com.cegg.game.mahjong.Res.GT_NAN | com.cegg.game.mahjong.Res.GT_CHIP5;
        }
        else if (__reg0 === 523) 
        {
            return com.cegg.game.mahjong.Res.GT_MULTI | com.cegg.game.mahjong.Res.GT_HIGH | com.cegg.game.mahjong.Res.GT_SANMA | com.cegg.game.mahjong.Res.GT_CHIP5;
        }
        else if (__reg0 === 533) 
        {
            return com.cegg.game.mahjong.Res.GT_MULTI | com.cegg.game.mahjong.Res.GT_HIGH | com.cegg.game.mahjong.Res.GT_NAN | com.cegg.game.mahjong.Res.GT_SANMA | com.cegg.game.mahjong.Res.GT_CHIP5;
        }
        else if (__reg0 === 601) 
        {
            return com.cegg.game.mahjong.Res.GT_MULTI | com.cegg.game.mahjong.Res.GT_HIGH | com.cegg.game.mahjong.Res.GT_JANS;
        }
        else if (__reg0 === 602) 
        {
            return com.cegg.game.mahjong.Res.GT_MULTI | com.cegg.game.mahjong.Res.GT_HIGH | com.cegg.game.mahjong.Res.GT_CHIP;
        }
        else if (__reg0 === 603) 
        {
            return com.cegg.game.mahjong.Res.GT_MULTI | com.cegg.game.mahjong.Res.GT_HIGH | com.cegg.game.mahjong.Res.GT_CHIP5;
        }
        else if (__reg0 === 611) 
        {
            return com.cegg.game.mahjong.Res.GT_MULTI | com.cegg.game.mahjong.Res.GT_HIGH | com.cegg.game.mahjong.Res.GT_NAN | com.cegg.game.mahjong.Res.GT_JANS;
        }
        else if (__reg0 === 612) 
        {
            return com.cegg.game.mahjong.Res.GT_MULTI | com.cegg.game.mahjong.Res.GT_HIGH | com.cegg.game.mahjong.Res.GT_NAN | com.cegg.game.mahjong.Res.GT_CHIP;
        }
        else if (__reg0 === 613) 
        {
            return com.cegg.game.mahjong.Res.GT_MULTI | com.cegg.game.mahjong.Res.GT_HIGH | com.cegg.game.mahjong.Res.GT_NAN | com.cegg.game.mahjong.Res.GT_CHIP5;
        }
        else if (__reg0 === 623) 
        {
            return com.cegg.game.mahjong.Res.GT_MULTI | com.cegg.game.mahjong.Res.GT_HIGH | com.cegg.game.mahjong.Res.GT_SANMA | com.cegg.game.mahjong.Res.GT_CHIP5;
        }
        else if (__reg0 === 633) 
        {
            return com.cegg.game.mahjong.Res.GT_MULTI | com.cegg.game.mahjong.Res.GT_HIGH | com.cegg.game.mahjong.Res.GT_NAN | com.cegg.game.mahjong.Res.GT_SANMA | com.cegg.game.mahjong.Res.GT_CHIP5;
        }
        else if (__reg0 === 701) 
        {
            return com.cegg.game.mahjong.Res.GT_MULTI | com.cegg.game.mahjong.Res.GT_HIGH | com.cegg.game.mahjong.Res.GT_JANS;
        }
        else if (__reg0 === 702) 
        {
            return com.cegg.game.mahjong.Res.GT_MULTI | com.cegg.game.mahjong.Res.GT_HIGH | com.cegg.game.mahjong.Res.GT_CHIP;
        }
        else if (__reg0 === 703) 
        {
            return com.cegg.game.mahjong.Res.GT_MULTI | com.cegg.game.mahjong.Res.GT_HIGH | com.cegg.game.mahjong.Res.GT_CHIP5;
        }
        else if (__reg0 === 711) 
        {
            return com.cegg.game.mahjong.Res.GT_MULTI | com.cegg.game.mahjong.Res.GT_HIGH | com.cegg.game.mahjong.Res.GT_NAN | com.cegg.game.mahjong.Res.GT_JANS;
        }
        else if (__reg0 === 712) 
        {
            return com.cegg.game.mahjong.Res.GT_MULTI | com.cegg.game.mahjong.Res.GT_HIGH | com.cegg.game.mahjong.Res.GT_NAN | com.cegg.game.mahjong.Res.GT_CHIP;
        }
        else if (__reg0 === 713) 
        {
            return com.cegg.game.mahjong.Res.GT_MULTI | com.cegg.game.mahjong.Res.GT_HIGH | com.cegg.game.mahjong.Res.GT_NAN | com.cegg.game.mahjong.Res.GT_CHIP5;
        }
        else if (__reg0 === 723) 
        {
            return com.cegg.game.mahjong.Res.GT_MULTI | com.cegg.game.mahjong.Res.GT_HIGH | com.cegg.game.mahjong.Res.GT_SANMA | com.cegg.game.mahjong.Res.GT_CHIP5;
        }
        else if (__reg0 === 733) 
        {
            return com.cegg.game.mahjong.Res.GT_MULTI | com.cegg.game.mahjong.Res.GT_HIGH | com.cegg.game.mahjong.Res.GT_NAN | com.cegg.game.mahjong.Res.GT_SANMA | com.cegg.game.mahjong.Res.GT_CHIP5;
        }
        else if (__reg0 === 1000) 
        {
            return com.cegg.game.mahjong.Res.GT_MULTI | com.cegg.game.mahjong.Res.GT_TECH;
        }
        else if (__reg0 === 1100) 
        {
            return com.cegg.game.mahjong.Res.GT_MULTI | com.cegg.game.mahjong.Res.GT_TECH | com.cegg.game.mahjong.Res.GT_HIGH;
        }
        return 0;
    }
    ;
    __reg0.ProfIndexToDBK = function (nProf)
    {
        if ((__reg0 = nProf) === 3) 
        {
            return "PF" + nProf;
        }
        else if (__reg0 === 4) 
        {
            return "PF" + nProf;
        }
        else if (__reg0 === 401) 
        {
            return "PF" + nProf;
        }
        else if (__reg0 === 402) 
        {
            return "PF" + nProf;
        }
        else if (__reg0 === 403) 
        {
            return "PF" + nProf;
        }
        else if (__reg0 === 411) 
        {
            return "PF" + nProf;
        }
        else if (__reg0 === 412) 
        {
            return "PF" + nProf;
        }
        else if (__reg0 === 413) 
        {
            return "PF" + nProf;
        }
        else if (__reg0 === 423) 
        {
            return "PF" + nProf;
        }
        else if (__reg0 === 433) 
        {
            return "PF" + nProf;
        }
        else if (__reg0 === 501) 
        {
            return "PF" + nProf;
        }
        else if (__reg0 === 502) 
        {
            return "PF" + nProf;
        }
        else if (__reg0 === 503) 
        {
            return "PF" + nProf;
        }
        else if (__reg0 === 511) 
        {
            return "PF" + nProf;
        }
        else if (__reg0 === 512) 
        {
            return "PF" + nProf;
        }
        else if (__reg0 === 513) 
        {
            return "PF" + nProf;
        }
        else if (__reg0 === 523) 
        {
            return "PF" + nProf;
        }
        else if (__reg0 === 533) 
        {
            return "PF" + nProf;
        }
        else if (__reg0 === 601) 
        {
            return "PF" + nProf;
        }
        else if (__reg0 === 602) 
        {
            return "PF" + nProf;
        }
        else if (__reg0 === 603) 
        {
            return "PF" + nProf;
        }
        else if (__reg0 === 611) 
        {
            return "PF" + nProf;
        }
        else if (__reg0 === 612) 
        {
            return "PF" + nProf;
        }
        else if (__reg0 === 613) 
        {
            return "PF" + nProf;
        }
        else if (__reg0 === 623) 
        {
            return "PF" + nProf;
        }
        else if (__reg0 === 633) 
        {
            return "PF" + nProf;
        }
        else if (__reg0 === 701) 
        {
            return "PF" + nProf;
        }
        else if (__reg0 === 702) 
        {
            return "PF" + nProf;
        }
        else if (__reg0 === 703) 
        {
            return "PF" + nProf;
        }
        else if (__reg0 === 711) 
        {
            return "PF" + nProf;
        }
        else if (__reg0 === 712) 
        {
            return "PF" + nProf;
        }
        else if (__reg0 === 713) 
        {
            return "PF" + nProf;
        }
        else if (__reg0 === 723) 
        {
            return "PF" + nProf;
        }
        else if (__reg0 === 733) 
        {
            return "PF" + nProf;
        }
        else if (__reg0 === 1000) 
        {
            return "PF" + nProf;
        }
        else if (__reg0 === 1100) 
        {
            return "PF" + nProf;
        }
        return "";
    }
    ;
    __reg0.ProfIndexToDBKC = function (nProf)
    {
        if (1000 <= nProf) 
        {
            if ((__reg0 = nProf % 100) === 0) 
            {
                return "PF1C00";
            }
        }
        else if (400 <= nProf) 
        {
            if ((__reg0 = nProf % 100) === 1) 
            {
                return "PF01C";
            }
            else if (__reg0 === 2) 
            {
                return "PF02C";
            }
            else if (__reg0 === 3) 
            {
                return "PF03C";
            }
            else if (__reg0 === 11) 
            {
                return "PF11C";
            }
            else if (__reg0 === 12) 
            {
                return "PF12C";
            }
            else if (__reg0 === 13) 
            {
                return "PF13C";
            }
            else if (__reg0 === 23) 
            {
                return "PF23C";
            }
            else if (__reg0 === 33) 
            {
                return "PF33C";
            }
        }
        return "";
    }
    ;
    __reg0.RatingConvFronProfIndex = function (nProf, rate)
    {
        var __reg4 = undefined;
        if (nProf < 400) 
        {
            if ((__reg0 = nProf) === 3) 
            {
                __reg4 = "PF3";
            }
            else if (__reg0 === 4) 
            {
                __reg4 = "PF4";
            }
        }
        else if (nProf < 1000) 
        {
            if ((__reg0 = nProf % 100) === 1) 
            {
                __reg4 = "PF01C";
            }
            else if (__reg0 === 2) 
            {
                __reg4 = "PF02C";
            }
            else if (__reg0 === 3) 
            {
                __reg4 = "PF03C";
            }
            else if (__reg0 === 11) 
            {
                __reg4 = "PF11C";
            }
            else if (__reg0 === 12) 
            {
                __reg4 = "PF12C";
            }
            else if (__reg0 === 13) 
            {
                __reg4 = "PF13C";
            }
            else if (__reg0 === 23) 
            {
                __reg4 = "PF23C";
            }
            else if (__reg0 === 33) 
            {
                __reg4 = "PF33C";
            }
        }
        else if (nProf == 1000) 
        {
            __reg4 = "PF1C00";
        }
        var __reg5 = 1;
        if (com.cegg.game.mahjong.Res.scaleRating[__reg4] != undefined) 
        {
            __reg5 = com.cegg.game.mahjong.Res.scaleRating[__reg4];
        }
        return int((rate - 1500) * __reg5 + 1500);
    }
    ;
    ASSetPropFlags(__reg1, null, 1);
    __reg0.T_HAI = ["一", "二", "三", "四", "五", "六", "七", "八", "九", "①", "②", "③", "④", "⑤", "⑥", "⑦", "⑧", "⑨", "Ⅰ", "Ⅱ", "Ⅲ", "Ⅳ", "Ⅴ", "Ⅵ", "Ⅶ", "Ⅷ", "Ⅸ", "東", "南", "西", "北", "白", "發", "中"];
    __reg0.T_DANDISP = ["新人", "９級", "８級", "７級", "６級", "５級", "４級", "３級", "２級", "１級", "初段", "二段", "三段", "四段", "五段", "六段", "七段", "八段", "九段", "十段", "天鳳"];
    __reg0.T_MDAY = "日月火水木金土";
    __reg0.T_DATEUNIT = "年月日時分秒";
    __reg0.T_BRA = "【";
    __reg0.T_CKET = "】";
    __reg0.T_KARA = "～";
    __reg0.T_VERSION = "版";
    __reg0.T_MAI = "枚";
    __reg0.T_ERRTXT = {E0: "正常に終了しました", E1001: "ﾌﾟﾚｰﾔ名が正しくありません", E1002: "このﾌﾟﾚｰﾔ名を使用するにはIDで入場する必要があります\n" + "\n" + "■ ゲームのプレーヤIDの再発行について\n" + "<font color=\"#0000FF\"><u><a href=\"http://tenhou.net/support.html\" target=\"_blank\">http://tenhou.net/support.html</a></u></font>\n", E1003: "IDが正しくありません\n" + "\n" + "■ ゲームのプレーヤIDの再発行について\n" + "<font color=\"#0000FF\"><u><a href=\"http://tenhou.net/support.html\" target=\"_blank\">http://tenhou.net/support.html</a></u></font>\n" + "\n" + "180日以上対戦を行っていないIDは停止または削除されています。\n" + "七段以上で有料版の決済情報が確認できる場合には\n" + "IDの復元が可能な場合があります。お早めにお問い合わせください。\n", E1004: "このﾌﾟﾚｰﾔは既に接続済みです", E1005: "このﾌﾟﾚｰﾔは既に登録済みです", E1006: "この接続元からの新規登録は約７日間行なえません", E1007: "登録に失敗しました", E1008: "この接続元からは一定期間アクセスできません\n" + "\n" + "多くのﾌﾟﾚｰﾔから不正/迷惑行為の通報が寄せられた可能性があります。\n" + "アクセス解除は問い合わせを頂いても行なえない場合があります。\n" + "健全なコミュニティの運営に何卒ご理解ご協力をいただきますよう\n" + "よろしくお願い申し上げます。", E1009: "通報が完了しました", E1010: "この機能は個室では利用できません\nﾗﾝｷﾝｸﾞ戦ﾛﾋﾞｰに移動してください", E1011: "通報に失敗しました", E1012: "登録が完了しました", E1013: "観戦可能な対戦は現在ありません", E1014: "観戦情報が見つかりませんでした\nこの対戦は既に終了している可能性があります", E1015: "大会ロビーの作成が完了しました", E1016: "大会ロビーの作成に失敗しました", E1017: "予約中は牌譜を閲覧できません", E1018: "予約中は観戦できません", E1019: "大会ロビーが見つかりませんでした。", E1020: "参加に必要な有効期限が不足しています\n\n※有効期限は「ﾒﾆｭｰ」の「料金のお支払い」から購入いただけます\n※有効期限は天鳳ホームページからも購入いただけます\n", E1021: "外部ログインサーバからの応答がありません", E1022: "ID互換のないロビーへは移動できません", E1023: "一時的に使用している外部IDの有効期限が切れました", E1024: "参加に必要な条件を満たしていません", E1025: "外部IDでは利用できません", E1026: "このロビーでは参加登録は行えません", E1027: "参加登録が完了しました", E1028: "すでに参加登録が完了しています", E2000: "このドメインへの接続は許可されていません", E2001: "すでに他のブラウザで接続しています\n\n心当たりがない場合には…\nログオフや再起動をすると\nこのメッセージは表示されなくなります。", E2002: "サーバとの接続が切れました\n再接続しますか？", E2003: "牌譜の読み込みに失敗しました\nプレイ中の牌譜はゲーム終了後に閲覧可能になります", E2004: "性別を選択してください"};
    __reg0.T_WBREADY = "牌譜の保存機能が利用可能です";
    __reg0.T_REGID = "新規ID登録";
    __reg0.T_WELCOME = "<font color=\"#0000FF\"><u><a href=\"asfunction:setHiddenID\">配信保護</a></u></font> | " + "<font color=\"#0000FF\"><u><a href=\"http://tenhou.net/man/\" target=\"_blank\">ﾏﾆｭｱﾙ</a></u></font>";
    __reg0.T_USERNAME = "ﾌﾟﾚｰﾔ名またはﾌﾟﾚｰﾔIDを入力してください。" + "<font color=\"#0000FF\"><u><a href=\"asfunction:aboutPlayerID\" target=\"_blank\">もっとくわしく</a></u></font>";
    __reg0.T_ABOUTPLAYERID = "下の入力欄にﾌﾟﾚｰﾔ名またはﾌﾟﾚｰﾔIDを入力してOKボタンをクリックしてください\n" + "\n" + "ﾌﾟﾚｰﾔ名は８文字以内で入力してください。\n" + "半角スペース全角スペースなど使用できない文字があります。\n" + "ID登録されている名前は使用できません。\n" + "\n" + "ﾌﾟﾚｰﾔIDは\'ID\'の２字を含む半角１９文字をすべて入力してください。\n" + "１１文字目には半角ハイフン\'-\'があります。\n" + "　例) ID01234567-abcdefgh\n" + "\n" + "※ﾌﾟﾚｰﾔIDは再発行することはできません。\n";
    __reg0.T_REGISTPLAYER_NOTICE = "現在入力欄にあるIDは上書きされます。\n" + "IDはメモ帳などにコピーして保管してください。\n" + "\n" + "※Windows版で登録したIDはFlash版でも使用可能です。\n" + "\n" + "新規ID登録を開始しますか？";
    __reg0.T_REGISTPLAYER = "ﾌﾟﾚｰﾔID登録(無料)を行なうとﾗﾝｷﾝｸﾞ/段級位などのサービスを\n" + "利用することができます。\n" + "\n" + "※プレーヤ名には使用できない文字があります。\n" + "※登録が完了すると次の登録は一定期間行なえません。\n" + "※約180日間対戦を行っていないIDは削除されます。\n" + "※IDの再発行には有料版の決済情報が必要です。\n" + "くわしくは<a href=\"http://tenhou.net/support.html\">http://tenhou.net/support.html</a>をご覧下さい。\n" + "\n" + "登録するﾌﾟﾚｰﾔ名を8文字以内で入力してください\n";
    __reg0.T_REGISTPLAYERQ = "次のﾌﾟﾚｰﾔ名で登録を行ないます。\n" + "よろしいですか？\n" + "\n";
    __reg0.T_REGISTPLAYEROK = "ﾌﾟﾚｰﾔ登録が完了しました\n" + "次のIDを大切に保管してください\n" + "\n" + "※IDの再発行は行なえません\n" + "※次の登録は一定期間行なえません\n";
    __reg0.T_SETHIDDEN = "保護する";
    __reg0.T_RESETHIDDEN = "保護しない";
    __reg0.T_SETHIDDENID = "ID入力欄を\'ID########-########\'で表示します。\n" + "\n" + "予期せぬサーバ落ちや切断が発生した場合に入場画面に戻っても\n" + "IDがキャプチャーされないようになります。\n";
    __reg0.T_SEXUALITY = "<menu>" + "<item disp=\"男\"   cmd=\"SEXUALITY\" value=\"M\"/><br/>" + "<item disp=\"女\"   cmd=\"SEXUALITY\" value=\"F\"/><br/>" + "</menu>";
    __reg0.T_CLIENTMODE = "<menu>" + "<item disp=\"ｴｺﾉﾐｰ\"   cmd=\"CLIENTMODE\" value=\"ECONOMY\"/><br/>" + "<item disp=\"ﾌﾟﾚﾐｱﾑ\"  cmd=\"CLIENTMODE\" value=\"PREMIUM\"/><br/>" + "</menu>";
    __reg0.T_WELCOMEMESSAGE = ["※複数「予約」した場合、最初に面子がそろったゲームが開始します\n" + "※チャットの受信は発言するまで無効になっています\n", "※段級位/ﾗﾝｷﾝｸﾞを利用するにはﾌﾟﾚｰﾔID登録を行なってください\n"];
    __reg0.T_USERNUM = "接続";
    __reg0.T_LOBBYNUM = "待機";
    __reg0.T_TAISENNUM = "対戦";
    __reg0.T_OHRASUNUM = "ｵｰﾗｽ";
    __reg0.T_RULEDISP = ["喰断ﾅｼ", "喰断ﾅｼ赤", "喰断ｱﾘ", "喰ｱﾘ赤", "喰ｱﾘ赤速", "三喰ｱﾘ赤", "三喰赤速", "東風戦", "東南戦", "東速戦", "喰赤祝0", "喰赤祝2", "喰赤祝5", "三喰赤祝5", "１局清算"];
    __reg0.T_WAITNUM = "対戦待ち人数";
    __reg0.T_JOIN = "予約";
    __reg0.T_MENU = "ﾒﾆｭｰ";
    __reg0.T_SINGLE = "ﾃｽﾄﾌﾟﾚｲ";
    __reg0.T_CANCEL = "ｷｬﾝｾﾙ";
    __reg0.T_NIN = "人";
    __reg0.T_LOBBYMENU = ["<menu>" + "<item disp=\"牌譜の管理\" cmd=\"LOGMANAGER\"/><br/>" + "<separator/>" + "<item disp=\"ﾐﾆｹﾞｰﾑ\">" + "<item disp=\"ﾊﾟｽﾞﾙ1\" cmd=\"SHANGHAI\"/><br/>" + "<item disp=\"ﾊﾟｽﾞﾙ2\" cmd=\"NIKAKU\"/><br/>" + "<item disp=\"練習麻雀\" cmd=\"NERIMA\"/><br/>" + "</item><br/>" + "<separator/>" + "<item disp=\"料金のお支払い\" cmd=\"BUY_EXPIRE\"/><br/>" + "<separator/>" + "<item disp=\"ﾛｸﾞｱｳﾄ\" cmd=\"LOGOUT\"/><br/>" + "</menu>", "<menu>" + "<item disp=\"牌譜の管理\" cmd=\"LOGMANAGER\"/><br/>" + "<separator/>" + "<item disp=\"ﾛﾋﾞｰ\">" + "<item disp=\"ﾗﾝｷﾝｸﾞ戦ﾛﾋﾞｰ\" cmd=\"CHANGELOBBY_FREE\"/><br/>" + "<item disp=\"個室\" cmd=\"CHANGELOBBY_PRIVATE\"/><br/>" + "</item><br/>" + "<item disp=\"ﾐﾆｹﾞｰﾑ\">" + "<item disp=\"ﾊﾟｽﾞﾙ1\" cmd=\"SHANGHAI\"/><br/>" + "<item disp=\"ﾊﾟｽﾞﾙ2\" cmd=\"NIKAKU\"/><br/>" + "<item disp=\"練習麻雀\" cmd=\"NERIMA\"/><br/>" + "</item><br/>" + "<separator/>" + "<item disp=\"料金のお支払い\" cmd=\"BUY_EXPIRE\"/><br/>" + "<separator/>" + "<item disp=\"ﾛｸﾞｱｳﾄ\" cmd=\"LOGOUT\"/><br/>" + "</menu>"];
    __reg0.T_SINGLEMENU = "<menu>" + "<item disp=\"東風 喰ｱﾘ赤速\" cmd=\"SINGLE\" type=\"64\"   /><br/>" + "<item disp=\"東風 喰ｱﾘ赤\"   cmd=\"SINGLE\" type=\"0\"    /><br/>" + "<item disp=\"東風 ｻﾝﾏ喰赤\"  cmd=\"SINGLE\" type=\"16\"   /><br/>" + "<separator/>" + "<item disp=\"若東祝0β\"    cmd=\"SINGLE\" type=\"1024\" /><br/>" + "<item disp=\"若東祝2β\"    cmd=\"SINGLE\" type=\"512\"  /><br/>" + "<item disp=\"三若東祝5β\"  cmd=\"SINGLE\" type=\"1552\" /><br/>" + "<separator/>" + "<item disp=\"技能戦β\"     cmd=\"SINGLE\" type=\"2112\" /><br/>" + "</menu>";
    __reg0.T_TAB = [[["pane0", "段位戦"], ["pane1", "雀荘β"], ["pane2", "技能β"], ["pwg", "観戦"], ["plog", "牌譜"], ["hlp", "ﾍﾙﾌﾟ"]], [["pane0", "対戦"], ["pwg", "観戦"], ["plog", "牌譜"], ["hlp", "ﾍﾙﾌﾟ"]], [["taku0", "一般", "四段R1800未満"], ["taku1", "上級", "１級以上+有"], ["taku2", "特上", "四段R1800以上"], ["taku3", "鳳凰", "七段R2000以上"]], [["taku0", "個室L0000", "全ﾌﾟﾚｰﾔ / pt,R変動ﾅｼ"]], [["BROWSE", "閲覧"], ["BLOG", "日記"], ["BACKUP", "ﾊﾞｯｸｱｯﾌﾟ"]], [["pane0", "全期間"], ["pane2", "月間ﾗﾝｷﾝｸﾞ"]], [["pane0", "戦績"]], [["taku0", "若葉", "全ﾌﾟﾚｰﾔ"], ["taku1", " 銀 ", "R1600以上(仮)"], ["taku2", "琥珀", "閉店"], ["taku3", "孔雀", "閉店"]], [["taku0", "対戦", "全ﾌﾟﾚｰﾔ"]]];
    __reg0.T_LOBBYTXT = ["ﾗﾝｷﾝｸﾞ戦ﾛﾋﾞｰ", "個室", "参加に必要な条件を満たしていません", "<font color=\"#0000FF\"><u><a href=\"http://tenhou.net/\" target=\"_blank\">天鳳</a></u></font> | " + "<font color=\"#0000FF\"><u><a href=\"http://tenhou.net/ranking.html\" target=\"_blank\">ﾗﾝｷﾝｸﾞ</a></u></font> | " + "<font color=\"#0000FF\"><u><a href=\"http://tenhou.net/man/\" target=\"_blank\">ﾏﾆｭｱﾙ</a></a></u></font><br/>", "ランキング戦", "<font color=\"#0000FF\"><u><a href=\"http://tenhou.net/\" target=\"_blank\">天鳳</a></u></font> | " + "<font color=\"#0000FF\"><u><a href=\"http://tenhou.net/man/\" target=\"_blank\">ﾏﾆｭｱﾙ</a></a></u></font> | " + "<font color=\"#0000FF\"><u><a href=\"http://tenhou.net/stat/raw.shtml\" target=\"_blank\">対戦ﾛｸﾞ</a></u></font>", "エコノミー版では対戦できません\n\n" + "入場画面で「プレミアム」を選択してください", "※ 準 備 中 ※", "※近日オープン予定", "※2013.04.15 リニューアル・オープン", "対戦人数が80人を超えている場合には有料会員限定となります"];
    __reg0.T_LOBBYEXPIRED = ["有効期限の残りが１日以上必要です<br><br>" + "<font color=\"#0000FF\"><u><a href=\"http://tenhou.net/reg/?%ID%\" target=\"_blank\">料金のお支払いはこちらから(月額500円税別)</a></u></font><br><br>" + "上のリンクがクリックで開けない場合には<br>次のURLをブラウザで開いてください。<br>" + "http://tenhou.net/reg/?%ID%<br><br>" + "無料ｴｺﾉﾐｰ版を利用するには<br>入場画面で「ｴｺﾉﾐｰ」を選択してください", "１級未満で上級卓の対戦を行うには、<br>有効期限の残りが６０日以上必要です<br><br>" + "<font color=\"#0000FF\"><u><a href=\"http://tenhou.net/reg/?%ID%\" target=\"_blank\">料金のお支払いはこちらから(月額500円税別)</a></u></font><br><br>" + "上のリンクがクリックで開けない場合には<br>次のURLをブラウザで開いてください。<br>" + "http://tenhou.net/reg/?%ID%<br>"];
    __reg0.T_CSDISP = ["【 開催期間 】", "開始", "終了", "【 対戦ルール 】", "準備中", "終了", "参加できません", "【 参加対象 】", "だれでもOK", "固定", "名", "段位&Rate指定なし", "以上", "以下", "限定", "有効期限3日以上", "【 参加費 】", "有効期限", "日分", "なし", "無料", "有料会員"];
    __reg0.T_JOINREG = "参加登録";
    __reg0.T_JOINREGMSG = ["大会への参加費として\n\n有効期限", "日分\n\nを支払います。よろしいですか？", "この機能はゲストﾌﾟﾚｰﾔでは使用できません\n\n入場画面で「新規ID登録」を行い\nﾌﾟﾚｰﾔIDで入場してください\n"];
    __reg0.T_CSRULEDISP = ["東風戦", "東南戦", "東風ｻﾝﾏ", "東南ｻﾝﾏ", "喰あり", "喰ナシ", "赤あり", "赤ナシ", "", "速", "", "暗", "", "祝"];
    __reg0.T_WG = "観戦";
    __reg0.T_WG0000 = "段位戦観戦一覧 : <font color=\"#0000FF\"><u><a href=\"http://tenhou.net/0/wg/\" target=\"_blank\">http://tenhou.net/0/wg/</a></u></font>\n- - - - - - - - - - - - - - - - - - - -\n";
    __reg0.T_ATO = "あと";
    __reg0.T_RANKINGCSDISP = ["■ 大会ランキング", "最新３戦", "最新５戦", "連続３戦の最大合計得点", "連続５戦の最大合計得点", "祝儀１枚２０００点", "祝儀１枚５０００点"];
    __reg0.N_LOGMAX = 40;
    __reg0.T_LOG = "牌譜";
    __reg0.T_LOGNOLOG = "閲覧可能な牌譜がありません\n";
    __reg0.T_LOGCLEAR = "この牌譜情報をクリアしてもよろしいですか？";
    __reg0.T_LOGCLEARALL = "すべての牌譜情報をクリアしてもよろしいですか？";
    __reg0.T_LOGPLAY = "再生";
    __reg0.T_LOGMGCLEAR = "すべて削除";
    __reg0.T_LOGMGOPENTYPE = "<menu>" + "<item disp=\"このウィンドウで開く\"     cmd=\"OPENTYPE\" value=\"opt\"/><br/>" + "<item disp=\"新しいポップアップで開く\" cmd=\"OPENTYPE\" value=\"opw\"/><br/>" + "<item disp=\"新しいウィンドウで開く\"   cmd=\"OPENTYPE\" value=\"opn\"/><br/>" + "</menu>";
    __reg0.T_LOGMGB = ["《 天鳳 対戦記録 》", "対戦数: ", "得点: ", "平均: ", "順位: ", "位", "牌譜: "];
    __reg0.T_LOGTEHAIOPEN = "手牌表示ON/OFF";
    __reg0.T_LOGFORCEANONYMOUS = "匿名表示ON/OFF";
    __reg0.T_LOGTSUMOGIRIASGRAY = "ツモ切り牌の暗転表示ON/OFF";
    __reg0.T_LOGAUTOPLAY = "自動再生/停止";
    __reg0.T_JUNME = "巡目";
    __reg0.T_PROFHOWTOUSE = "<font color=\"#0000FF\"><u><a href=\"asfunction:profHowToUse\">この機能を使うには?</a></u></font>";
    __reg0.T_PROFHOWTOUSEBOX = "戦績機能を利用するには、ﾌﾟﾚｰﾔIDで入場する必要があります。<br>" + "IDは１つ前の入場画面にある「ID登録」のリンクから登録を行ってください。<br>" + "<br>" + "※上級/特上での対戦にはID登録が必要です<br>" + "※ID登録を行うと戦績/ﾗﾝｷﾝｸﾞ/段級位などの機能を利用することが出来ます<br>" + "※IDの再発行は行えません<br>";
    __reg0.T_PROFLABEL = [["１位率", "２位率", "３位率", "４位率", "飛び率", "対戦数", "平均得点", "平均順位", "平均収支", "平均祝儀", "和了率", "放銃率", "副露率", "立直率"], ["", "", "得点", "", "順位", "", "収支", "", "祝儀", "", "総合", "ﾄｯﾌﾟ率", "連対率", "ﾗｽ率"], ["", "", "得点", "", "順位", "", "収支", "", "祝儀", "", "総合", "---", "---", "---"], ["ルール", "最高得点", "-"], ["平均", "東南", "四祝0", "", "四祝2", "", "四祝5", "", "三祝5", ""]];
    __reg0.T_EXPIRE = "有効期限";
    __reg0.T_PROF_I = "位";
    __reg0.T_PROF_SEN = "戦";
    __reg0.T_PROF_TAISENSUU = "対戦数";
    __reg0.T_PROF_TSUUSAN = "通算";
    __reg0.T_PROF_HEIKIN = "平均";
    __reg0.T_MENUPROF = "<menu textPrefix=\"■全期間 / \" width=\"220\" >" + "<item value=\"4\" disp=\"段位戦 4人打ち\" cmd=\"MENUPROF\"/><br/>" + "<item value=\"3\" disp=\"段位戦 3人打ち\" cmd=\"MENUPROF\"/><br/>" + "<separator/>" + "<item disp=\"雀荘 若葉\">" + "<item value=\"490\" disp=\"若葉 総合R\"     cmd=\"MENUPROF\"/><br/>" + "<item value=\"491\" disp=\"若葉 総合G\"     cmd=\"MENUPROF\"/><br/>" + "<separator/>" + "<item value=\"401\" disp=\"若東 喰赤祝0\"   cmd=\"MENUPROF\"/><br/>" + "<item value=\"402\" disp=\"若東 喰赤祝2\"   cmd=\"MENUPROF\"/><br/>" + "<item value=\"403\" disp=\"若東 喰赤祝5\"   cmd=\"MENUPROF\"/><br/>" + "<separator/>" + "<item value=\"411\" disp=\"若南 喰赤祝0\"   cmd=\"MENUPROF\"/><br/>" + "<item value=\"412\" disp=\"若南 喰赤祝2\"   cmd=\"MENUPROF\"/><br/>" + "<item value=\"413\" disp=\"若南 喰赤祝5\"   cmd=\"MENUPROF\"/><br/>" + "<separator/>" + "<item value=\"423\" disp=\"若東 三喰赤祝5\" cmd=\"MENUPROF\"/><br/>" + "<item value=\"433\" disp=\"若南 三喰赤祝5\" cmd=\"MENUPROF\"/><br/>" + "</item><br/>" + "<item disp=\"雀荘 銀\">" + "<item value=\"590\" disp=\"銀 総合R\"       cmd=\"MENUPROF\"/><br/>" + "<item value=\"591\" disp=\"銀 総合G\"       cmd=\"MENUPROF\"/><br/>" + "<separator/>" + "<item value=\"501\" disp=\"銀東 喰赤祝0\"   cmd=\"MENUPROF\"/><br/>" + "<item value=\"502\" disp=\"銀東 喰赤祝2\"   cmd=\"MENUPROF\"/><br/>" + "<item value=\"503\" disp=\"銀東 喰赤祝5\"   cmd=\"MENUPROF\"/><br/>" + "<separator/>" + "<item value=\"511\" disp=\"銀南 喰赤祝0\"   cmd=\"MENUPROF\"/><br/>" + "<item value=\"512\" disp=\"銀南 喰赤祝2\"   cmd=\"MENUPROF\"/><br/>" + "<item value=\"513\" disp=\"銀南 喰赤祝5\"   cmd=\"MENUPROF\"/><br/>" + "<separator/>" + "<item value=\"523\" disp=\"銀東 三喰赤祝5\" cmd=\"MENUPROF\"/><br/>" + "<item value=\"533\" disp=\"銀南 三喰赤祝5\" cmd=\"MENUPROF\"/><br/>" + "</item><br/>" + "<item disp=\"雀荘 琥珀\">" + "<item value=\"690\" disp=\"琥珀 総合R\"     cmd=\"MENUPROF\"/><br/>" + "<item value=\"691\" disp=\"琥珀 総合G\"     cmd=\"MENUPROF\"/><br/>" + "<separator/>" + "<item value=\"601\" disp=\"琥東 喰赤祝0\"   cmd=\"MENUPROF\"/><br/>" + "<item value=\"602\" disp=\"琥東 喰赤祝2\"   cmd=\"MENUPROF\"/><br/>" + "<item value=\"603\" disp=\"琥東 喰赤祝5\"   cmd=\"MENUPROF\"/><br/>" + "<separator/>" + "<item value=\"611\" disp=\"琥南 喰赤祝0\"   cmd=\"MENUPROF\"/><br/>" + "<item value=\"612\" disp=\"琥南 喰赤祝2\"   cmd=\"MENUPROF\"/><br/>" + "<item value=\"613\" disp=\"琥南 喰赤祝5\"   cmd=\"MENUPROF\"/><br/>" + "<separator/>" + "<item value=\"623\" disp=\"琥東 三喰赤祝5\" cmd=\"MENUPROF\"/><br/>" + "<item value=\"633\" disp=\"琥南 三喰赤祝5\" cmd=\"MENUPROF\"/><br/>" + "</item><br/>" + "<item disp=\"雀荘 孔雀\">" + "<item value=\"790\" disp=\"孔雀 総合R\"     cmd=\"MENUPROF\"/><br/>" + "<item value=\"791\" disp=\"孔雀 総合G\"     cmd=\"MENUPROF\"/><br/>" + "<separator/>" + "<item value=\"701\" disp=\"孔東 喰赤祝0\"   cmd=\"MENUPROF\"/><br/>" + "<item value=\"702\" disp=\"孔東 喰赤祝2\"   cmd=\"MENUPROF\"/><br/>" + "<item value=\"703\" disp=\"孔東 喰赤祝5\"   cmd=\"MENUPROF\"/><br/>" + "<separator/>" + "<item value=\"711\" disp=\"孔南 喰赤祝0\"   cmd=\"MENUPROF\"/><br/>" + "<item value=\"712\" disp=\"孔南 喰赤祝2\"   cmd=\"MENUPROF\"/><br/>" + "<item value=\"713\" disp=\"孔南 喰赤祝5\"   cmd=\"MENUPROF\"/><br/>" + "<separator/>" + "<item value=\"723\" disp=\"孔東 三喰赤祝5\" cmd=\"MENUPROF\"/><br/>" + "<item value=\"733\" disp=\"孔南 三喰赤祝5\" cmd=\"MENUPROF\"/><br/>" + "</item><br/>" + "<separator/>" + "<item value=\"1000\" disp=\"技能戦\" cmd=\"MENUPROF\"/><br/>" + "<separator/>" + "<item value=\"2\" disp=\"個室 4人打ち\" cmd=\"MENUPROF\"/><br/>" + "<item value=\"1\" disp=\"個室 3人打ち\" cmd=\"MENUPROF\"/><br/>" + "<separator/>" + "<item disp=\"個室戦績のﾘｾｯﾄ\" cmd=\"CLEARPROF_PRIVATE\" /><br/>" + "</menu>";
    __reg0.T_CLEARPROF_PRIVATE = "すべての個室戦績をリセットしてもよろしいですか？";
    __reg0.T_MENURANKING = "<menu textPrefix=\"■月間 / \" width=\"220\" >" + "<item disp=\"段位戦 一般\">" + "<item value=\"7\"   disp=\"般東 喰断ﾅｼ\"   cmd=\"MENURANKING\"/><br/>" + "<item value=\"3\"   disp=\"般東 喰断ｱﾘ\"   cmd=\"MENURANKING\"/><br/>" + "<item value=\"1\"   disp=\"般東 喰ｱﾘ赤\"   cmd=\"MENURANKING\"/><br/>" + "<separator/>" + "<item value=\"15\"  disp=\"般南 喰断ﾅｼ\"   cmd=\"MENURANKING\"/><br/>" + "<item value=\"11\"  disp=\"般南 喰断ｱﾘ\"   cmd=\"MENURANKING\"/><br/>" + "<item value=\"9\"   disp=\"般南 喰ｱﾘ赤\"   cmd=\"MENURANKING\"/><br/>" + "<separator/>" + "<item value=\"17\"  disp=\"般東ｻﾝﾏ喰赤\" cmd=\"MENURANKING\"/><br/>" + "<item value=\"25\"  disp=\"般南ｻﾝﾏ喰赤\" cmd=\"MENURANKING\"/><br/>" + "</item><br/>" + "<item disp=\"段位戦 上級\">" + "<item value=\"135\" disp=\"上東 喰断ﾅｼ\"   cmd=\"MENURANKING\"/><br/>" + "<item value=\"131\" disp=\"上東 喰断ｱﾘ\"   cmd=\"MENURANKING\"/><br/>" + "<item value=\"129\" disp=\"上東 喰ｱﾘ赤\"   cmd=\"MENURANKING\"/><br/>" + "<separator/>" + "<item value=\"143\" disp=\"上南 喰断ﾅｼ\"   cmd=\"MENURANKING\"/><br/>" + "<item value=\"139\" disp=\"上南 喰断ｱﾘ\"   cmd=\"MENURANKING\"/><br/>" + "<item value=\"137\" disp=\"上南 喰ｱﾘ赤\"   cmd=\"MENURANKING\"/><br/>" + "<separator/>" + "<item value=\"145\" disp=\"上東ｻﾝﾏ喰赤\" cmd=\"MENURANKING\"/><br/>" + "<item value=\"153\" disp=\"上南ｻﾝﾏ喰赤\" cmd=\"MENURANKING\"/><br/>" + "</item><br/>" + "<item disp=\"段位戦 特上\">" + "<item value=\"39\"  disp=\"特東 喰断ﾅｼ\"   cmd=\"MENURANKING\"/><br/>" + "<item value=\"35\"  disp=\"特東 喰断ｱﾘ\"   cmd=\"MENURANKING\"/><br/>" + "<item value=\"33\"  disp=\"特東 喰ｱﾘ赤\"   cmd=\"MENURANKING\"/><br/>" + "<separator/>" + "<item value=\"47\"  disp=\"特南 喰断ﾅｼ\"   cmd=\"MENURANKING\"/><br/>" + "<item value=\"43\"  disp=\"特南 喰断ｱﾘ\"   cmd=\"MENURANKING\"/><br/>" + "<item value=\"41\"  disp=\"特南 喰ｱﾘ赤\"   cmd=\"MENURANKING\"/><br/>" + "<separator/>" + "<item value=\"49\"  disp=\"特東ｻﾝﾏ喰赤\" cmd=\"MENURANKING\"/><br/>" + "<item value=\"57\"  disp=\"特南ｻﾝﾏ喰赤\" cmd=\"MENURANKING\"/><br/>" + "</item><br/>" + "<item disp=\"段位戦 鳳凰\">" + "<item value=\"167\"  disp=\"鳳東 喰断ﾅｼ\"   cmd=\"MENURANKING\"/><br/>" + "<item value=\"163\"  disp=\"鳳東 喰断ｱﾘ\"   cmd=\"MENURANKING\"/><br/>" + "<item value=\"161\"  disp=\"鳳東 喰ｱﾘ赤\"   cmd=\"MENURANKING\"/><br/>" + "<separator/>" + "<item value=\"175\"  disp=\"鳳南 喰断ﾅｼ\"   cmd=\"MENURANKING\"/><br/>" + "<item value=\"171\"  disp=\"鳳南 喰断ｱﾘ\"   cmd=\"MENURANKING\"/><br/>" + "<item value=\"169\"  disp=\"鳳南 喰ｱﾘ赤\"   cmd=\"MENURANKING\"/><br/>" + "<separator/>" + "<item value=\"177\"  disp=\"鳳東ｻﾝﾏ喰赤\" cmd=\"MENURANKING\"/><br/>" + "<item value=\"185\"  disp=\"鳳南ｻﾝﾏ喰赤\" cmd=\"MENURANKING\"/><br/>" + "</item><br/>" + "<separator/>" + "<item disp=\"雀荘 若葉\">" + "<item value=\"1025\"  disp=\"若東 喰赤祝0\" cmd=\"MENURANKING\"/><br/>" + "<item value=\"513\"   disp=\"若東 喰赤祝2\" cmd=\"MENURANKING\"/><br/>" + "<item value=\"1537\"  disp=\"若東 喰赤祝5\" cmd=\"MENURANKING\"/><br/>" + "<separator/>" + "<item value=\"1033\"  disp=\"若南 喰赤祝0\" cmd=\"MENURANKING\"/><br/>" + "<item value=\"521\"   disp=\"若南 喰赤祝2\" cmd=\"MENURANKING\"/><br/>" + "<item value=\"1545\"  disp=\"若南 喰赤祝5\" cmd=\"MENURANKING\"/><br/>" + "<separator/>" + "<item value=\"1553\"  disp=\"若東 三喰赤祝5\" cmd=\"MENURANKING\"/><br/>" + "<item value=\"1561\"  disp=\"若南 三喰赤祝5\" cmd=\"MENURANKING\"/><br/>" + "</item><br/>" + "<item disp=\"雀荘 銀\">" + "<item value=\"1153\"  disp=\"銀東 喰赤祝0\" cmd=\"MENURANKING\"/><br/>" + "<item value=\"641\"   disp=\"銀東 喰赤祝2\" cmd=\"MENURANKING\"/><br/>" + "<item value=\"1665\"  disp=\"銀東 喰赤祝5\" cmd=\"MENURANKING\"/><br/>" + "<separator/>" + "<item value=\"1161\"  disp=\"銀南 喰赤祝0\" cmd=\"MENURANKING\"/><br/>" + "<item value=\"649\"   disp=\"銀南 喰赤祝2\" cmd=\"MENURANKING\"/><br/>" + "<item value=\"1673\"  disp=\"銀南 喰赤祝5\" cmd=\"MENURANKING\"/><br/>" + "<separator/>" + "<item value=\"1681\"  disp=\"銀東 三喰赤祝5\" cmd=\"MENURANKING\"/><br/>" + "<item value=\"1689\"  disp=\"銀南 三喰赤祝5\" cmd=\"MENURANKING\"/><br/>" + "</item><br/>" + "<item disp=\"雀荘 琥珀\">" + "<item value=\"1057\"  disp=\"琥東 喰赤祝0\" cmd=\"MENURANKING\"/><br/>" + "<item value=\"545\"   disp=\"琥東 喰赤祝2\" cmd=\"MENURANKING\"/><br/>" + "<item value=\"1569\"  disp=\"琥東 喰赤祝5\" cmd=\"MENURANKING\"/><br/>" + "<separator/>" + "<item value=\"1065\"  disp=\"琥南 喰赤祝0\" cmd=\"MENURANKING\"/><br/>" + "<item value=\"553\"   disp=\"琥南 喰赤祝2\" cmd=\"MENURANKING\"/><br/>" + "<item value=\"1577\"  disp=\"琥南 喰赤祝5\" cmd=\"MENURANKING\"/><br/>" + "<separator/>" + "<item value=\"1585\"  disp=\"琥東 三喰赤祝5\" cmd=\"MENURANKING\"/><br/>" + "<item value=\"1593\"  disp=\"琥南 三喰赤祝5\" cmd=\"MENURANKING\"/><br/>" + "</item><br/>" + "<item disp=\"雀荘 孔雀\">" + "<item value=\"1185\"  disp=\"孔東 喰赤祝0\" cmd=\"MENURANKING\"/><br/>" + "<item value=\"673\"   disp=\"孔東 喰赤祝2\" cmd=\"MENURANKING\"/><br/>" + "<item value=\"1697\"  disp=\"孔東 喰赤祝5\" cmd=\"MENURANKING\"/><br/>" + "<separator/>" + "<item value=\"1193\"  disp=\"孔南 喰赤祝0\" cmd=\"MENURANKING\"/><br/>" + "<item value=\"681\"   disp=\"孔南 喰赤祝2\" cmd=\"MENURANKING\"/><br/>" + "<item value=\"1705\"  disp=\"孔南 喰赤祝5\" cmd=\"MENURANKING\"/><br/>" + "<separator/>" + "<item value=\"1713\"  disp=\"孔東 三喰赤祝5\" cmd=\"MENURANKING\"/><br/>" + "<item value=\"1721\"  disp=\"孔南 三喰赤祝5\" cmd=\"MENURANKING\"/><br/>" + "</item><br/>" + "<separator/>" + "<item disp=\"技能戦\">" + "<item value=\"2049\"  disp=\"技能戦 １局清算\" cmd=\"MENURANKING\"/><br/>" + "</item><br/>" + "<separator/>" + "<item disp=\"公開ランキング\" cmd=\"OPEN_WEB_RANKING\" /><br/>" + "</menu>";
    __reg0.T_TAKUCOLOR = "卓";
    __reg0.T_HAICOLOR = "牌";
    __reg0.T_KYOKUBA = ["東１局", "東２局", "東３局", "東４局", "南１局", "南２局", "南３局", "南４局", "西１局", "西２局", "西３局", "西４局", "北１局", "北２局", "北３局", "北４局"];
    __reg0.T_HONBA = "本場";
    __reg0.T_RYUUKYOKU = "流局";
    __reg0.T_RON = "ロン";
    __reg0.T_TSUMO = "ツモ";
    __reg0.T_HOUJUU = "放銃";
    __reg0.T_RYUUKYOKUTYPE = {yao9: "九種九牌", reach4: "四家立直", ron3: "三家和了", kan4: "四槓散了", kaze4: "四風連打", nm: "流し満貫"};
    __reg0.T_WATASHI = "私";
    __reg0.T_SAN = "さん";
    __reg0.T_HINT = "ヒント";
    __reg0.T_RETRY = "リトライ";
    __reg0.T_EDIT = "編集";
    __reg0.T_CLOSE = "閉じる";
    __reg0.T_REST = "残り";
    __reg0.T_ABOUTNERIMARECORD = "※最後の１回は除外します";
    __reg0.T_ERRORSHANGHAI = "牌数を１３６以内の４の倍数にしてください";
    __reg0.T_SHANGHAIEDIT = "※不正な牌の配置は検査しません\n" + "※編集結果は保存されません\n" + "※牌数は１３６以内の４の倍数\n" + "※\'.\'(ﾋﾟﾘｵﾄﾞ)=空  \'o\'=牌  空行=階層区切り";
    __reg0.T_WAITAMOMENT = "しばらくお待ちください";
    __reg0.T_BATSU = "×";
    __reg0.GT_NULL = 0;
    __reg0.GT_MULTI = 1;
    __reg0.GT_NOAKA = 2;
    __reg0.GT_NOKUI = 4;
    __reg0.GT_NAN = 8;
    __reg0.GT_SANMA = 16;
    __reg0.GT_TOKU = 32;
    __reg0.GT_SAKU = 64;
    __reg0.GT_HIGH = 128;
    __reg0.GT_GRAY = 256;
    __reg0.GT_CHIP = 512;
    __reg0.GT_JANS = 1024;
    __reg0.GT_TECH = 2048;
    __reg0.GT_HOUO = com.cegg.game.mahjong.Res.GT_HIGH | com.cegg.game.mahjong.Res.GT_TOKU;
    __reg0.GT_CHIP5 = com.cegg.game.mahjong.Res.GT_CHIP | com.cegg.game.mahjong.Res.GT_JANS;
    __reg0.NAKI_PON = 1;
    __reg0.NAKI_KAN = 2;
    __reg0.NAKI_CHI = 4;
    __reg0.NAKI_RON = 8;
    __reg0.NAKI_TSUMO = 16;
    __reg0.NAKI_REACH = 32;
    __reg0.NAKI_RYUUKYOKU = 64;
    __reg0.NAKI_NUKU = 128;
    __reg0.DAN_PT4 = [0, 0, 0, 0, 0, 0, 0, 0, -10, -20, -30, -40, -50, -60, -70, -80, -90, -100, -110, -120, 0];
    __reg0.DAN_NEXT = [30, 30, 30, 60, 60, 60, 90, 100, 100, 100, 400, 800, 1200, 1600, 2000, 2400, 2800, 3200, 3600, 4000];
    __reg0.scaleRating = {PF3: 1, PF4: 1, PF01C: 0.582221984863, PF02C: 0.501631975174, PF03C: 0.414869010448, PF11C: 0.823386013508, PF12C: 0.709415972233, PF13C: 0.586714029312, PF23C: 0.378722012043, PF33C: 0.535593986511, PF1C00: 8};
}#endinitclip

//子图形 32
//  初始化剪辑
#initclip 0

if (!com.cegg.game.mahjong.OwariBox) 
{
    if (!com) 
    {
        _global.com = new Object();
    }
    if (!com.cegg) 
    {
        _global.com.cegg = new Object();
    }
    if (!com.cegg.game) 
    {
        _global.com.cegg.game = new Object();
    }
    if (!com.cegg.game.mahjong) 
    {
        _global.com.cegg.game.mahjong = new Object();
    }
    (_global.com.cegg.game.mahjong.OwariBox = function ()
    {
        super();
        var __reg3 = 380;
        var __reg4 = 0;
        this.createEmptyMovieClip("bg", __reg4++);
        this.createEmptyMovieClip("img", __reg4++);
        com.cegg.GButton.createTextButton("OK", "OK", __reg4++, this);
        var __reg5 = 0;
        if (__reg5 < this.sc.length) 
        {
            for (;;) 
            {
                ++__reg5;
                if (__reg5 >= this.sc.length) 
                {
                    break;
                }
                this.sc[__reg5] = Number(this.sc[__reg5]);
            }
        }
        var __reg6 = 0;
        __reg6 = __reg6 + 50;
        this.img.attachMovie("owari", "0", 0);
        this.img._x = int((__reg3 - this.img._width) / 2);
        this.img._y = __reg6;
        this.img._alpha = 0;
        this.img.onEnterFrame = function ()
        {
            this._alpha = this._alpha + 4;
            if (this._alpha >= 100) 
            {
                delete this.onEnterFrame;
            }
        }
        ;
        __reg6 = __reg6 + (this.img._height + 50);
        var __reg7 = [0, 1, 2, 3];
        __reg5 = 1;
        if (__reg5 < 4) 
        {
            for (;;) 
            {
                ++__reg5;
                if (__reg5 >= 4) 
                {
                    break;
                }
                if (this.sc[__reg7[__reg5 - 1] * 2 + 1] < this.sc[__reg7[__reg5] * 2 + 1]) 
                {
                    var __reg8 = __reg7[__reg5 - 1];
                    __reg7[__reg5 - 1] = __reg7[__reg5];
                    __reg7[__reg5] = __reg8;
                    __reg5 = 0;
                }
            }
        }
        var __reg9 = [undefined, undefined, undefined, undefined];
        if (this.ratio.length == 2 && this.sc.length == 8) 
        {
            __reg9[0] = this.sc[0 + 0 * 2 + 1] * 10 * this.ratio[1];
            __reg9[1] = this.sc[0 + 1 * 2 + 1] * 10 * this.ratio[1];
            __reg9[2] = this.sc[0 + 2 * 2 + 1] * 10 * this.ratio[1];
            __reg9[3] = this.sc[0 + 3 * 2 + 1] * 10 * this.ratio[1];
        }
        if (this.ratio.length == 2 && this.sc.length == 16) 
        {
            __reg9[0] = (this.sc[0 + 0 * 2 + 1] * 1000 + this.sc[8 + 0 * 2 + 0] * this.ratio[0]) * this.ratio[1] / 100;
            __reg9[1] = (this.sc[0 + 1 * 2 + 1] * 1000 + this.sc[8 + 1 * 2 + 0] * this.ratio[0]) * this.ratio[1] / 100;
            __reg9[2] = (this.sc[0 + 2 * 2 + 1] * 1000 + this.sc[8 + 2 * 2 + 0] * this.ratio[0]) * this.ratio[1] / 100;
            __reg9[3] = (this.sc[0 + 3 * 2 + 1] * 1000 + this.sc[8 + 3 * 2 + 0] * this.ratio[0]) * this.ratio[1] / 100;
        }
        if (this.un[__reg7[0]].length > 0) 
        {
            com.cegg.game.mahjong.OwariBox.createScore(this, __reg4++, this.un[__reg7[0]], this.sc[__reg7[0] * 2 + 0], this.sc[__reg7[0] * 2 + 1], this.sc[8 + __reg7[0] * 2 + 0], __reg9[__reg7[0]], int(__reg3 / 2), __reg6, int(__reg3 * 2 / 3));
            __reg6 = __reg6 + 50;
        }
        if (this.un[__reg7[1]].length > 0) 
        {
            com.cegg.game.mahjong.OwariBox.createScore(this, __reg4++, this.un[__reg7[1]], this.sc[__reg7[1] * 2 + 0], this.sc[__reg7[1] * 2 + 1], this.sc[8 + __reg7[1] * 2 + 0], __reg9[__reg7[1]], int(__reg3 / 2), __reg6, int(__reg3 * 2 / 3));
            __reg6 = __reg6 + 50;
        }
        if (this.un[__reg7[2]].length > 0) 
        {
            com.cegg.game.mahjong.OwariBox.createScore(this, __reg4++, this.un[__reg7[2]], this.sc[__reg7[2] * 2 + 0], this.sc[__reg7[2] * 2 + 1], this.sc[8 + __reg7[2] * 2 + 0], __reg9[__reg7[2]], int(__reg3 / 2), __reg6, int(__reg3 * 2 / 3));
            __reg6 = __reg6 + 50;
        }
        if (this.un[__reg7[3]].length > 0) 
        {
            com.cegg.game.mahjong.OwariBox.createScore(this, __reg4++, this.un[__reg7[3]], this.sc[__reg7[3] * 2 + 0], this.sc[__reg7[3] * 2 + 1], this.sc[8 + __reg7[3] * 2 + 0], __reg9[__reg7[3]], int(__reg3 / 2), __reg6, int(__reg3 * 2 / 3));
            __reg6 = __reg6 + 50;
        }
        __reg6 = __reg6 + 10;
        __reg6 = __reg6 + 20;
        this.OK._x = int((__reg3 - this.OK._width) / 2);
        this.OK._y = __reg6;
        __reg6 = __reg6 + (this.OK._height + 30);
        com.cegg.LGraphics.drawFrame(this.bg, 0, 0, __reg3, __reg6, 0);
        com.cegg.LGraphics.drawShadow(this.bg, 0, 0, __reg3, __reg6, 4);
        this.bg._alpha = 80;
        this._x = int((Stage.width - __reg3) / 2);
        this._y = int((Stage.height - __reg6) / 2);
        this._alpha = 0;
    }
    ).prototype.__proto__ = MovieClip.prototype;
    __reg0.prototype.__constructor__ = MovieClip;
    var __reg1 = __reg0.prototype;
    __reg1.onEnterFrame = function ()
    {
        this._alpha = this._alpha + 5;
        if (this._alpha >= 100) 
        {
            this.onEnterFrame = undefined;
        }
    }
    ;
    __reg1.onCommand = function (msg)
    {
        if ((__reg0 = msg.cmd) === "OK") 
        {
            _root.onCommand({cmd: "GOLOBBYFADEOUT"});
            return;
        }
    }
    ;
    __reg0.createScore = function (mc, depth, uname, ten, point, chip, gold, x, y, w)
    {
        mc.createEmptyMovieClip(String(depth), depth);
        mc = mc[depth];
        mc._x = x;
        mc._y = y;
        mc.createTextField("0", 1, 0, 2, 0, 0);
        mc.createEmptyMovieClip("1", 2);
        mc.createEmptyMovieClip("2", 3);
        mc.createEmptyMovieClip("3", 4);
        mc.createEmptyMovieClip("4", 5);
        var __reg12 = mc[0];
        with (__reg12)
        {
            autoSize = "center";
            textColor = 16777215;
            selectable = false;
            text = uname;
        }
        com.cegg.game.mahjong.Util.printDigit(mc[1], "tendigit", 6, String(ten * 100).split("-").join(";"));
        com.cegg.game.mahjong.Util.printDigit(mc[2], "tendigit", 6, com.cegg.game.mahjong.Util.ffmt(point, 1, false, "+").split("+").join(":").split("-").join(";").split(".").join("@"));
        mc.c2 = new Color(mc[2]);
        mc.c2.setTransform(point >= 0 ? {ra: 0, rb: 0, ga: 65, gb: 64, ba: 65, bb: 64, aa: 100, ab: 0} : {ra: 75, rb: 64, ga: 0, gb: 0, ba: 0, bb: 0, aa: 100, ab: 0});
        mc[1]._x = -5 - mc[1]._width;
        mc[2]._x = 40 - mc[2]._width;
        if (chip != undefined) 
        {
            com.cegg.game.mahjong.Util.printDigit(mc[3], "tendigit", 6, (chip <= 0 ? (chip >= 0 ? "0" : ";" + (0 - chip)) : ":" + chip) + ">?");
            mc.c3 = new Color(mc[3]);
            mc.c3.setTransform(chip >= 0 ? {ra: 0, rb: 0, ga: 65, gb: 64, ba: 65, bb: 64, aa: 100, ab: 0} : {ra: 75, rb: 64, ga: 0, gb: 0, ba: 0, bb: 0, aa: 100, ab: 0});
            mc[1]._x = mc[1]._x - 20;
            mc[2]._x = mc[2]._x - 20;
            mc[3]._x = 60 - mc[3]._width;
        }
        if (gold != undefined) 
        {
            com.cegg.game.mahjong.Util.printDigit(mc[4], "tendigit", 6, (gold <= 0 ? (gold >= 0 ? "0" : ";" + (0 - gold)) : ":" + gold) + "A");
            mc.c4 = new Color(mc[4]);
            mc.c4.setTransform(gold >= 0 ? {ra: 0, rb: 0, ga: 65, gb: 64, ba: 65, bb: 64, aa: 100, ab: 0} : {ra: 75, rb: 64, ga: 0, gb: 0, ba: 0, bb: 0, aa: 100, ab: 0});
            mc[1]._x = mc[1]._x - 25;
            mc[2]._x = mc[2]._x - 25;
            mc[3]._x = mc[3]._x - 25;
            mc[4]._x = (chip == undefined ? 70 : 85) - mc[4]._width;
        }
        mc[1]._y = mc[2]._y = mc[3]._y = mc[4]._y = mc[0]._height + 5;
        var __reg13 = int(w / 2);
        var __reg14 = mc._height + 8;
        var __reg15 = [3355443, 1579032];
        var __reg16 = [50, 50];
        var __reg17 = [0, 255];
        var __reg18 = {a: 0, b: __reg14, c: 0, d: 0 - __reg14, e: 0, f: 0, g: 0, h: int(__reg14 / 2), i: 1};
        mc.beginGradientFill("linear", __reg15, __reg16, __reg17, __reg18);
        mc.moveTo(0 - __reg13, 0);
        mc.lineTo(0 - __reg13, __reg14);
        mc.lineTo(__reg13, __reg14);
        mc.lineTo(__reg13, 0);
        mc.endFill();
    }
    ;
    ASSetPropFlags(__reg1, null, 1);
    __reg0.SymbolName = "__Packages.com.cegg.game.mahjong.OwariBox";
    __reg0.SymbolOwner = com.cegg.game.mahjong.OwariBox;
    __reg0.SymbolLinked = Object.registerClass(com.cegg.game.mahjong.OwariBox.SymbolName, com.cegg.game.mahjong.OwariBox.SymbolOwner);
}#endinitclip

//子图形 33
//  初始化剪辑
#initclip 0

if (!com.cegg.game.mahjong.Mentsu136) 
{
    if (!com) 
    {
        _global.com = new Object();
    }
    if (!com.cegg) 
    {
        _global.com.cegg = new Object();
    }
    if (!com.cegg.game) 
    {
        _global.com.cegg.game = new Object();
    }
    if (!com.cegg.game.mahjong) 
    {
        _global.com.cegg.game.mahjong = new Object();
    }
    var __reg1 = (_global.com.cegg.game.mahjong.Mentsu136 = function (m)
    {
        this.kui = m & 3;
        if (m & 1 << 2) 
        {
            var __reg3 = (m & 64512) >> 10;
            var __reg4 = __reg3 % 3;
            __reg3 = int(__reg3 / 3);
            __reg3 = int(__reg3 / 7) * 9 + __reg3 % 7;
            __reg3 = __reg3 * 4;
            var __reg5 = [__reg3 + 4 * 0 + ((m & 24) >> 3), __reg3 + 4 * 1 + ((m & 96) >> 5), __reg3 + 4 * 2 + ((m & 384) >> 7)];
            if ((__reg0 = __reg4) === 1) 
            {
                __reg5.unshift(int(__reg5.splice(1, 1)[0]));
            }
            else if (__reg0 === 2) 
            {
                __reg5.unshift(int(__reg5.splice(2, 1)[0]));
            }
            this.type = 3;
            this.hai0 = __reg5[0];
            this.hai1 = __reg5[1];
            this.hai2 = __reg5[2];
            return;
        }
        if (m & 1 << 3) 
        {
            var __reg6 = (m & 96) >> 5;
            var __reg7 = (m & 65024) >> 9;
            var __reg8 = __reg7 % 3;
            __reg7 = int(__reg7 / 3);
            __reg7 = __reg7 * 4;
            var __reg9 = [__reg7, __reg7, __reg7];
            if ((__reg0 = __reg6) === 0) 
            {
                __reg9[0] = __reg9[0] + 1;
                __reg9[1] = __reg9[1] + 2;
                __reg9[2] = __reg9[2] + 3;
            }
            else if (__reg0 === 1) 
            {
                __reg9[0] = __reg9[0] + 0;
                __reg9[1] = __reg9[1] + 2;
                __reg9[2] = __reg9[2] + 3;
            }
            else if (__reg0 === 2) 
            {
                __reg9[0] = __reg9[0] + 0;
                __reg9[1] = __reg9[1] + 1;
                __reg9[2] = __reg9[2] + 3;
            }
            else if (__reg0 === 3) 
            {
                __reg9[0] = __reg9[0] + 0;
                __reg9[1] = __reg9[1] + 1;
                __reg9[2] = __reg9[2] + 2;
            }
            if ((__reg0 = __reg8) === 1) 
            {
                __reg9.unshift(int(__reg9.splice(1, 1)[0]));
            }
            else if (__reg0 === 2) 
            {
                __reg9.unshift(int(__reg9.splice(2, 1)[0]));
            }
            if (this.kui < 3) 
            {
                __reg9.unshift(int(__reg9.splice(2, 1)[0]));
            }
            if (this.kui < 2) 
            {
                __reg9.unshift(int(__reg9.splice(2, 1)[0]));
            }
            this.type = 1;
            this.hai0 = __reg9[0];
            this.hai1 = __reg9[1];
            this.hai2 = __reg9[2];
            return;
        }
        if (m & 1 << 4) 
        {
            var __reg10 = (m & 96) >> 5;
            var __reg11 = (m & 65024) >> 9;
            var __reg12 = __reg11 % 3;
            __reg11 = int(__reg11 / 3);
            __reg11 = __reg11 * 4;
            var __reg13 = [__reg11, __reg11, __reg11];
            if ((__reg0 = __reg10) === 0) 
            {
                __reg13[0] = __reg13[0] + 1;
                __reg13[1] = __reg13[1] + 2;
                __reg13[2] = __reg13[2] + 3;
            }
            else if (__reg0 === 1) 
            {
                __reg13[0] = __reg13[0] + 0;
                __reg13[1] = __reg13[1] + 2;
                __reg13[2] = __reg13[2] + 3;
            }
            else if (__reg0 === 2) 
            {
                __reg13[0] = __reg13[0] + 0;
                __reg13[1] = __reg13[1] + 1;
                __reg13[2] = __reg13[2] + 3;
            }
            else if (__reg0 === 3) 
            {
                __reg13[0] = __reg13[0] + 0;
                __reg13[1] = __reg13[1] + 1;
                __reg13[2] = __reg13[2] + 2;
            }
            if ((__reg0 = __reg12) === 1) 
            {
                __reg13.unshift(int(__reg13.splice(1, 1)[0]));
            }
            else if (__reg0 === 2) 
            {
                __reg13.unshift(int(__reg13.splice(2, 1)[0]));
            }
            this.type = 5;
            this.hai0 = __reg11 + __reg10;
            this.hai1 = __reg13[0];
            this.hai2 = __reg13[1];
            this.hai3 = __reg13[2];
            return;
        }
        if (m & 1 << 5) 
        {
            this.type = 10;
            this.hai0 = (m & 65280) >> 8;
            return;
        }
        this.hai0 = (m & 65280) >> 8;
        if (!this.kui) 
        {
            this.hai0 = (this.hai0 & 3 ^ -1) + 3;
        }
        var __reg14 = int(this.hai0 / 4) * 4;
        var __reg15 = [__reg14, __reg14, __reg14];
        if ((__reg0 = this.hai0 % 4) === 0) 
        {
            __reg15[0] = __reg15[0] + 1;
            __reg15[1] = __reg15[1] + 2;
            __reg15[2] = __reg15[2] + 3;
        }
        else if (__reg0 === 1) 
        {
            __reg15[0] = __reg15[0] + 0;
            __reg15[1] = __reg15[1] + 2;
            __reg15[2] = __reg15[2] + 3;
        }
        else if (__reg0 === 2) 
        {
            __reg15[0] = __reg15[0] + 0;
            __reg15[1] = __reg15[1] + 1;
            __reg15[2] = __reg15[2] + 3;
        }
        else if (__reg0 === 3) 
        {
            __reg15[0] = __reg15[0] + 0;
            __reg15[1] = __reg15[1] + 1;
            __reg15[2] = __reg15[2] + 2;
        }
        this.type = this.kui ? 2 : 4;
        this.hai1 = __reg15[0];
        this.hai2 = __reg15[1];
        this.hai3 = __reg15[2];
        if (this.kui == 1) 
        {
            __reg14 = this.hai0;
            this.hai0 = this.hai3;
            this.hai3 = __reg14;
        }
        if (this.kui == 2) 
        {
            __reg14 = this.hai0;
            this.hai0 = this.hai1;
            this.hai1 = __reg14;
        }
    }
    ).prototype;
    __reg0.getNakiType = function (m)
    {
        if (m & 1 << 2) 
        {
            return 3;
        }
        else if (m & 1 << 3) 
        {
            return 1;
        }
        else if (m & 1 << 4) 
        {
            return 5;
        }
        else if (m & 1 << 5) 
        {
            return 10;
        }
        else if (m & 3) 
        {
            return 2;
        }
        return 4;
    }
    ;
    __reg0.isKan = function (m)
    {
        if ((__reg0 = com.cegg.game.mahjong.Mentsu136.getNakiType(m)) === 2) 
        {
            return true;
        }
        else if (__reg0 === 4) 
        {
            return true;
        }
        else if (__reg0 === 5) 
        {
            return true;
        }
        return false;
    }
    ;
    ASSetPropFlags(__reg1, null, 1);
}#endinitclip

//子图形 34
//  初始化剪辑
#initclip 0

if (!com.cegg.game.mahjong.Agari) 
{
    if (!com) 
    {
        _global.com = new Object();
    }
    if (!com.cegg) 
    {
        _global.com.cegg = new Object();
    }
    if (!com.cegg.game) 
    {
        _global.com.cegg.game = new Object();
    }
    if (!com.cegg.game.mahjong) 
    {
        _global.com.cegg.game.mahjong = new Object();
    }
    var __reg1 = (_global.com.cegg.game.mahjong.Agari = function ()
    {
    }
    ).prototype;
    __reg0.isKokushi = function (n, c)
    {
        return n == 14 && c[0] * c[8] * c[9] * c[17] * c[18] * c[26] * c[27] * c[28] * c[29] * c[30] * c[31] * c[32] * c[33] == 2;
    }
    ;
    __reg0.isChiitoi = function (n, c)
    {
        if (n != 14) 
        {
            return false;
        }
        return (c[0] | c[1] | c[2] | c[3] | c[4] | c[5] | c[6] | c[7] | c[8] | c[9] | c[10] | c[11] | c[12] | c[13] | c[14] | c[15] | c[16] | c[17] | c[18] | c[19] | c[20] | c[21] | c[22] | c[23] | c[24] | c[25] | c[26] | c[27] | c[28] | c[29] | c[30] | c[31] | c[32] | c[33]) == 2;
    }
    ;
    __reg0.enumMachi = function (c, n)
    {
        var __reg4 = [];
        var __reg5 = 0;
        if (__reg5 < 34) 
        {
            for (;;) 
            {
                ++__reg5;
                if (__reg5 >= 34) 
                {
                    break;
                }
                ++c[__reg5];
                if (c[__reg5] < 5) 
                {
                    if (n != undefined && com.cegg.game.mahjong.Agari.isKokushi(n + 1, c)) 
                    {
                        __reg4.push(__reg5);
                    }
                    else if (n != undefined && com.cegg.game.mahjong.Agari.isChiitoi(n + 1, c)) 
                    {
                        __reg4.push(__reg5);
                    }
                    else if (!com.cegg.game.mahjong.Agari.checkAgari(c)) 
                    {
                        __reg4.push(__reg5);
                    }
                }
                --c[__reg5];
            }
        }
        return __reg4;
    }
    ;
    __reg0.enumReachAnkan = function (hai)
    {
        var __reg3 = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0];
        var __reg4 = 0;
        if (__reg4 < hai.length) 
        {
            for (;;) 
            {
                ++__reg4;
                if (__reg4 >= hai.length) 
                {
                    break;
                }
                ++__reg3[hai[__reg4]];
            }
        }
        var __reg5 = String(com.cegg.game.mahjong.Agari.enumMachi(__reg3, hai.length));
        com.cegg.Trace.out("machi=" + __reg5 + "\n", "com.cegg.game.mahjong.Agari::enumReachAnkan", "K:\\dev\\mahjong5\\swf\\mtasc-1.11/std/com/cegg/game/mahjong/Agari.as", 48);
        if (__reg5.length) 
        {
            var __reg6 = [];
            __reg4 = 0;
            if (__reg4 < 34) 
            {
                for (;;) 
                {
                    ++__reg4;
                    if (__reg4 >= 34) 
                    {
                        break;
                    }
                    if (__reg3[__reg4] == 3) 
                    {
                        __reg6.push(__reg4);
                    }
                }
            }
            com.cegg.Trace.out("machi=" + __reg5 + " koutsu=" + __reg6 + "\n", "com.cegg.game.mahjong.Agari::enumReachAnkan", "K:\\dev\\mahjong5\\swf\\mtasc-1.11/std/com/cegg/game/mahjong/Agari.as", 53);
            var __reg7 = [];
            while (__reg6.length) 
            {
                __reg4 = int(__reg6.shift());
                __reg3[__reg4] = __reg3[__reg4] - 3;
                if (String(com.cegg.game.mahjong.Agari.enumMachi(__reg3, hai.length - 3)) == __reg5) 
                {
                    __reg7.push(__reg4);
                }
                __reg3[__reg4] = __reg3[__reg4] + 3;
            }
            return __reg7;
        }
    }
    ;
    __reg0.checkReach = function (hai)
    {
        com.cegg.game.mahjong.Agari.nChecked = 0;
        var __reg3 = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0];
        var __reg4 = [];
        var __reg5 = 0;
        if (__reg5 < hai.length) 
        {
            for (;;) 
            {
                ++__reg5;
                if (__reg5 >= hai.length) 
                {
                    break;
                }
                ++__reg3[hai[__reg5]];
            }
        }
        var __reg6 = 0;
        if (__reg3[0] == 1) 
        {
            ++__reg6;
        }
        if (__reg3[8] == 1) 
        {
            ++__reg6;
        }
        if (__reg3[9] == 1) 
        {
            ++__reg6;
        }
        if (__reg3[17] == 1) 
        {
            ++__reg6;
        }
        if (__reg3[18] == 1) 
        {
            ++__reg6;
        }
        if (__reg3[26] == 1) 
        {
            ++__reg6;
        }
        if (__reg3[27] == 1) 
        {
            ++__reg6;
        }
        if (__reg3[28] == 1) 
        {
            ++__reg6;
        }
        if (__reg3[29] == 1) 
        {
            ++__reg6;
        }
        if (__reg3[30] == 1) 
        {
            ++__reg6;
        }
        if (__reg3[31] == 1) 
        {
            ++__reg6;
        }
        if (__reg3[32] == 1) 
        {
            ++__reg6;
        }
        if (__reg3[33] == 1) 
        {
            ++__reg6;
        }
        if (__reg6 > 9) 
        {
            if (__reg3[0] * __reg3[8] * __reg3[9] * __reg3[17] * __reg3[18] * __reg3[26] * __reg3[27] * __reg3[28] * __reg3[29] * __reg3[30] * __reg3[31] * __reg3[32] * __reg3[33] == 2) 
            {
                return [-1];
            }
            __reg5 = 0;
            if (__reg5 < 34) 
            {
                for (;;) 
                {
                    ++__reg5;
                    if (__reg5 >= 34) 
                    {
                        break;
                    }
                    if (__reg3[__reg5]) 
                    {
                        --__reg3[__reg5];
                        var __reg7 = 0;
                        if (__reg7 < 34) 
                        {
                            for (;;) 
                            {
                                ++__reg7;
                                if (__reg7 >= 34) 
                                {
                                    break;
                                }
                                if (__reg7 % 9 != 0 && (__reg7 % 9 != 8 && __reg7 < 26)) 
                                {
                                    continue;
                                }
                                ++__reg3[__reg7];
                                if (__reg3[0] * __reg3[8] * __reg3[9] * __reg3[17] * __reg3[18] * __reg3[26] * __reg3[27] * __reg3[28] * __reg3[29] * __reg3[30] * __reg3[31] * __reg3[32] * __reg3[33] == 2) 
                                {
                                    __reg4.push(__reg5 * 34 + __reg7);
                                }
                                --__reg3[__reg7];
                            }
                        }
                        ++__reg3[__reg5];
                    }
                }
            }
            return __reg4;
        }
        var __reg8 = 0;
        __reg5 = 0;
        if (__reg5 < 34) 
        {
            for (;;) 
            {
                ++__reg5;
                if (__reg5 >= 34) 
                {
                    break;
                }
                if (__reg3[__reg5] == 2) 
                {
                    ++__reg8;
                }
            }
        }
        if (__reg8 == 7) 
        {
            return [-1];
        }
        else if (__reg8 == 6) 
        {
            var __reg9 = [];
            __reg5 = 0;
            if (__reg5 < 34) 
            {
                for (;;) 
                {
                    ++__reg5;
                    if (__reg5 >= 34) 
                    {
                        break;
                    }
                    if (__reg3[__reg5] == 1) 
                    {
                        __reg9.push(__reg5);
                    }
                }
            }
            __reg4.push(__reg9[0] * 34 + __reg9[1]);
            __reg4.push(__reg9[1] * 34 + __reg9[0]);
        }
        else if (__reg8 == 5) 
        {
            __reg5 = 0;
            if (__reg5 < 34) 
            {
                for (;;) 
                {
                    ++__reg5;
                    if (__reg5 >= 34) 
                    {
                        break;
                    }
                    if (__reg3[__reg5] == 1) 
                    {
                        var __reg10 = __reg5;
                    }
                }
            }
            __reg5 = 0;
            if (__reg5 < 34) 
            {
                for (;;) 
                {
                    ++__reg5;
                    if (__reg5 >= 34) 
                    {
                        break;
                    }
                    if (__reg3[__reg5] == 3) 
                    {
                        break;
                    }
                }
            }
            if (__reg5 != 34) 
            {
                __reg4.push(__reg5 * 34 + __reg10);
            }
        }
        var __reg11 = [];
        var __reg12 = [];
        var __reg13 = __reg3[0] ? [0] : [];
        __reg5 = 1;
        if (__reg5 < 9) 
        {
            for (;;) 
            {
                ++__reg5;
                if (__reg5 >= 9) 
                {
                    break;
                }
                if (__reg3[__reg5]) 
                {
                    __reg13.push(__reg5);
                }
                else if (__reg13.length && !__reg3[__reg5 - 1]) 
                {
                    __reg11.push(__reg13);
                    __reg13 = [];
                }
            }
        }
        if (__reg13.length) 
        {
            __reg11.push(__reg13);
        }
        __reg13 = __reg3[9] ? [9] : [];
        __reg5 = 10;
        if (__reg5 < 18) 
        {
            for (;;) 
            {
                ++__reg5;
                if (__reg5 >= 18) 
                {
                    break;
                }
                if (__reg3[__reg5]) 
                {
                    __reg13.push(__reg5);
                }
                else if (__reg13.length && !__reg3[__reg5 - 1]) 
                {
                    __reg11.push(__reg13);
                    __reg13 = [];
                }
            }
        }
        if (__reg13.length) 
        {
            __reg11.push(__reg13);
        }
        __reg13 = __reg3[18] ? [18] : [];
        __reg5 = 19;
        if (__reg5 < 27) 
        {
            for (;;) 
            {
                ++__reg5;
                if (__reg5 >= 27) 
                {
                    break;
                }
                if (__reg3[__reg5]) 
                {
                    __reg13.push(__reg5);
                }
                else if (__reg13.length && !__reg3[__reg5 - 1]) 
                {
                    __reg11.push(__reg13);
                    __reg13 = [];
                }
            }
        }
        if (__reg13.length) 
        {
            __reg11.push(__reg13);
        }
        __reg5 = 27;
        if (__reg5 < 34) 
        {
            for (;;) 
            {
                ++__reg5;
                if (__reg5 >= 34) 
                {
                    break;
                }
                if (__reg3[__reg5]) 
                {
                    __reg11.push([__reg5]);
                }
            }
        }
        __reg5 = 0;
        if (__reg5 < __reg11.length) 
        {
            for (;;) 
            {
                ++__reg5;
                if (__reg5 >= __reg11.length) 
                {
                    break;
                }
                var __reg14 = 0;
                var __reg15 = 0;
                if (__reg15 < __reg11[__reg5].length) 
                {
                    for (;;) 
                    {
                        ++__reg15;
                        if (__reg15 >= __reg11[__reg5].length) 
                        {
                            break;
                        }
                        __reg14 = __reg14 + __reg3[__reg11[__reg5][__reg15]];
                    }
                }
                __reg12.push(__reg14);
            }
        }
        if (__reg12.length > 6) 
        {
            return __reg4;
        }
        __reg5 = 0;
        if (__reg5 < __reg12.length) 
        {
            for (;;) 
            {
                ++__reg5;
                if (__reg5 >= __reg12.length) 
                {
                    break;
                }
                __reg12[__reg5] = __reg12[__reg5] % 3;
            }
        }
        var __reg16 = [0, 0, 0];
        __reg5 = 0;
        if (__reg5 < __reg12.length) 
        {
            for (;;) 
            {
                ++__reg5;
                if (__reg5 >= __reg12.length) 
                {
                    break;
                }
                ++__reg16[__reg12[__reg5] % 3];
            }
        }
        if (__reg16[1] == 0 && __reg16[2] == 1) 
        {
            if (!com.cegg.game.mahjong.Agari.checkAgari(__reg3)) 
            {
                return [-1];
            }
            var __reg17 = 0;
            if (__reg17 < __reg12.length) 
            {
                for (;;) 
                {
                    ++__reg17;
                    if (__reg17 >= __reg12.length) 
                    {
                        break;
                    }
                    if (__reg12[__reg17] == 2) 
                    {
                        break;
                    }
                }
            }
            com.cegg.game.mahjong.Agari.checkMultiTempai(__reg3, __reg11[__reg17], com.cegg.game.mahjong.Agari.makeMachi(__reg3, __reg11[__reg17]), __reg4);
            var __reg18 = 0;
            if (__reg18 < __reg12.length) 
            {
                for (;;) 
                {
                    ++__reg18;
                    if (__reg18 >= __reg12.length) 
                    {
                        break;
                    }
                    if (__reg12[__reg18]) 
                    {
                        continue;
                    }
                    com.cegg.game.mahjong.Agari.checkMultiTempai(__reg3, __reg11[__reg18], com.cegg.game.mahjong.Agari.makeMachi(__reg3, __reg11[__reg18]), __reg4);
                    com.cegg.game.mahjong.Agari.checkMultiTempai(__reg3, __reg11[__reg18], com.cegg.game.mahjong.Agari.makeMachi(__reg3, __reg11[__reg17]), __reg4);
                }
            }
        }
        else if (__reg16[1] == 2 && __reg16[2] == 0) 
        {
            var __reg19 = 0;
            if (__reg19 < __reg12.length) 
            {
                for (;;) 
                {
                    ++__reg19;
                    if (__reg19 >= __reg12.length) 
                    {
                        break;
                    }
                    if (__reg12[__reg19] == 1) 
                    {
                        break;
                    }
                }
            }
            var __reg20 = __reg19 + 1;
            if (__reg20 < __reg12.length) 
            {
                for (;;) 
                {
                    ++__reg20;
                    if (__reg20 >= __reg12.length) 
                    {
                        break;
                    }
                    if (__reg12[__reg20] == 1) 
                    {
                        break;
                    }
                }
            }
            com.cegg.game.mahjong.Agari.checkMultiTempai(__reg3, __reg11[__reg19], com.cegg.game.mahjong.Agari.makeMachi(__reg3, __reg11[__reg20]), __reg4);
            com.cegg.game.mahjong.Agari.checkMultiTempai(__reg3, __reg11[__reg20], com.cegg.game.mahjong.Agari.makeMachi(__reg3, __reg11[__reg19]), __reg4);
        }
        else if (__reg16[1] == 1 && __reg16[2] == 2) 
        {
            var __reg21 = 0;
            if (__reg21 < __reg12.length) 
            {
                for (;;) 
                {
                    ++__reg21;
                    if (__reg21 >= __reg12.length) 
                    {
                        break;
                    }
                    if (__reg12[__reg21] == 1) 
                    {
                        break;
                    }
                }
            }
            var __reg22 = 0;
            if (__reg22 < __reg12.length) 
            {
                for (;;) 
                {
                    ++__reg22;
                    if (__reg22 >= __reg12.length) 
                    {
                        break;
                    }
                    if (__reg12[__reg22] == 2) 
                    {
                        break;
                    }
                }
            }
            var __reg23 = __reg22 + 1;
            if (__reg23 < __reg12.length) 
            {
                for (;;) 
                {
                    ++__reg23;
                    if (__reg23 >= __reg12.length) 
                    {
                        break;
                    }
                    if (__reg12[__reg23] == 2) 
                    {
                        break;
                    }
                }
            }
            com.cegg.game.mahjong.Agari.checkMultiTempai(__reg3, __reg11[__reg21], com.cegg.game.mahjong.Agari.makeMachi(__reg3, __reg11[__reg22]), __reg4);
            com.cegg.game.mahjong.Agari.checkMultiTempai(__reg3, __reg11[__reg21], com.cegg.game.mahjong.Agari.makeMachi(__reg3, __reg11[__reg23]), __reg4);
        }
        return __reg4;
    }
    ;
    __reg0.makeMachi = function (c, v)
    {
        var __reg4 = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0];
        var __reg5 = 0;
        if (__reg5 < v.length) 
        {
            for (;;) 
            {
                ++__reg5;
                if (__reg5 >= v.length) 
                {
                    break;
                }
                var __reg6 = v[__reg5];
                if (__reg6 < 27) 
                {
                    if ((__reg0 = __reg6 % 9) === 0) 
                    {
                        if (c[__reg6]) 
                        {
                            __reg4[__reg6] = __reg4[__reg6 + 1] = 1;
                        }
                    }
                    else if (__reg0 === 8) 
                    {
                        if (c[__reg6]) 
                        {
                            __reg4[__reg6 - 1] = __reg4[__reg6] = 1;
                        }
                    }
                    else if (c[__reg6]) 
                    {
                        __reg4[__reg6 - 1] = __reg4[__reg6] = __reg4[__reg6 + 1] = 1;
                    }
                }
                else if (c[__reg6]) 
                {
                    __reg4[__reg6] = 1;
                }
            }
        }
        var __reg7 = [];
        __reg5 = 0;
        if (__reg5 < 34) 
        {
            for (;;) 
            {
                ++__reg5;
                if (__reg5 >= 34) 
                {
                    break;
                }
                if (__reg4[__reg5]) 
                {
                    __reg7.push(__reg5);
                }
            }
        }
        return __reg7;
    }
    ;
    __reg0.checkMultiTempai = function (c, sute, machi, result)
    {
        var __reg6 = 0;
        if (__reg6 < sute.length) 
        {
            var __reg7 = 0;
            if (__reg7 < machi.length) 
            {
                for (;;) 
                {
                    ++__reg7;
                    if (__reg7 >= machi.length) 
                    {
                        break;
                    }
                    if (com.cegg.game.mahjong.Agari.checkTempai(c, sute[__reg6], machi[__reg7])) 
                    {
                        result.push(sute[__reg6] * 34 + machi[__reg7]);
                    }
                }
            }
        }
    }
    ;
    __reg0.checkTempai = function (c, i, j)
    {
        if (i == j) 
        {
            return false;
        }
        if (!c[i]) 
        {
            return false;
        }
        if (c[j] == 4) 
        {
            return false;
        }
        --c[i];
        ++c[j];
        var __reg5 = !com.cegg.game.mahjong.Agari.checkAgari(c);
        --c[j];
        ++c[i];
        ++com.cegg.game.mahjong.Agari.nChecked;
        return __reg5;
    }
    ;
    __reg0.checkAgari = function (c)
    {
        var __reg4 = [];
        var __reg3 = 27;
        if (__reg3 < 34) 
        {
            for (;;) 
            {
                ++__reg3;
                if (__reg3 >= 34) 
                {
                    break;
                }
                if ((__reg0 = c[__reg3]) === 1) 
                {
                    return 100;
                }
                else if (__reg0 === 4) 
                {
                    return 100;
                }
                else if (__reg0 === 2) 
                {
                    __reg4.push(__reg3);
                }
                else 
                {
                    __reg0 === 3;
                }
            }
        }
        if (__reg4.length > 1) 
        {
            return 101;
        }
        if (!__reg4.length) 
        {
            var __reg5 = 0;
            __reg3 = 0;
            if (__reg3 < 27) 
            {
                for (;;) 
                {
                    ++__reg3;
                    if (__reg3 >= 27) 
                    {
                        break;
                    }
                    __reg5 = __reg5 + __reg3 * c[__reg3];
                }
            }
            var __reg6 = (3 - __reg5 % 3) % 3;
            var __reg7 = [0, 0, 0];
            __reg3 = 0;
            if (__reg3 < 27) 
            {
                for (;;) 
                {
                    ++__reg3;
                    if (__reg3 >= 27) 
                    {
                        break;
                    }
                    if (c[__reg3]) 
                    {
                        __reg7[__reg3 % 3] = __reg7[__reg3 % 3] + c[__reg3];
                    }
                }
            }
            __reg7[0] = __reg7[0] % 3;
            __reg7[1] = __reg7[1] % 3;
            __reg7[2] = __reg7[2] % 3;
            if (__reg7[1] == __reg7[2]) 
            {
                if (__reg6 != 0) 
                {
                    return 201;
                }
                __reg3 = 0;
                if (__reg3 < 27) 
                {
                    for (;;) 
                    {
                        __reg3 = __reg3 + 3;
                        if (__reg3 >= 27) 
                        {
                            break;
                        }
                        if (c[__reg3] >= 2 && (__reg7[0] + 1) % 3 == __reg7[1]) 
                        {
                            __reg4.push(__reg3);
                        }
                    }
                }
            }
            else if (__reg7[2] == __reg7[0]) 
            {
                if (__reg6 != 1) 
                {
                    return 202;
                }
                __reg3 = 1;
                if (__reg3 < 27) 
                {
                    for (;;) 
                    {
                        __reg3 = __reg3 + 3;
                        if (__reg3 >= 27) 
                        {
                            break;
                        }
                        if (c[__reg3] >= 2 && (__reg7[1] + 1) % 3 == __reg7[2]) 
                        {
                            __reg4.push(__reg3);
                        }
                    }
                }
            }
            else if (__reg7[0] == __reg7[1]) 
            {
                if (__reg6 != 2) 
                {
                    return 203;
                }
                __reg3 = 2;
                if (__reg3 < 27) 
                {
                    for (;;) 
                    {
                        __reg3 = __reg3 + 3;
                        if (__reg3 >= 27) 
                        {
                            break;
                        }
                        if (c[__reg3] >= 2 && (__reg7[2] + 1) % 3 == __reg7[0]) 
                        {
                            __reg4.push(__reg3);
                        }
                    }
                }
            }
            else 
            {
                return 105;
            }
        }
        if (!__reg4.length) 
        {
            return 300;
        }
        while (__reg4.length) 
        {
            var __reg8 = int(__reg4.pop());
            var __reg9 = c.slice();
            __reg9[__reg8] = __reg9[__reg8] - 2;
            if (!com.cegg.game.mahjong.Agari.checkMentsu(__reg9)) 
            {
                return 0;
            }
        }
        return 1000;
    }
    ;
    __reg0.checkMentsu = function (c)
    {
        var __reg4 = 0;
        if (__reg4 < 7) 
        {
            for (;;) 
            {
                ++__reg4;
                if (__reg4 >= 7) 
                {
                    break;
                }
                var __reg3 = __reg4;
                if (__reg3 < 27) 
                {
                    for (;;) 
                    {
                        __reg3 = __reg3 + 9;
                        if (__reg3 >= 27) 
                        {
                            break;
                        }
                        if (c[__reg3]) 
                        {
                            if ((__reg0 = c[__reg3]) === 1) 
                            {
                                if (c[__reg3 + 1] && c[__reg3 + 2]) 
                                {
                                    --c[__reg3 + 1];
                                    --c[__reg3 + 2];
                                }
                                else 
                                {
                                    return 1000 + __reg4;
                                }
                            }
                            else if (__reg0 === 2) 
                            {
                                if (c[__reg3 + 1] > 1 && c[__reg3 + 2] > 1) 
                                {
                                    c[__reg3 + 1] = c[__reg3 + 1] - 2;
                                    c[__reg3 + 2] = c[__reg3 + 2] - 2;
                                }
                                else 
                                {
                                    return 1010 + __reg4;
                                }
                            }
                            else if (__reg0 !== 3) 
                            {
                                if (__reg0 === 4) 
                                {
                                    if (c[__reg3 + 1] && c[__reg3 + 2]) 
                                    {
                                        --c[__reg3 + 1];
                                        --c[__reg3 + 2];
                                    }
                                    else 
                                    {
                                        return 1020 + __reg4;
                                    }
                                }
                            }
                            c[__reg3] = 0;
                        }
                    }
                }
            }
        }
        __reg4 = 7;
        if (__reg4 < 9) 
        {
            for (;;) 
            {
                ++__reg4;
                if (__reg4 >= 9) 
                {
                    break;
                }
                __reg3 = __reg4;
                if (__reg3 < 27) 
                {
                    for (;;) 
                    {
                        __reg3 = __reg3 + 9;
                        if (__reg3 >= 27) 
                        {
                            break;
                        }
                        if (c[__reg3]) 
                        {
                            if ((__reg0 = c[__reg3]) === 1) 
                            {
                                return 1000 + __reg4;
                            }
                            else if (__reg0 === 2) 
                            {
                                return 1000 + __reg4;
                            }
                            else if (__reg0 === 4) 
                            {
                                return 1000 + __reg4;
                            }
                            else 
                            {
                                __reg0 === 3;
                            }
                            c[__reg3] = 0;
                        }
                    }
                }
            }
        }
        return 0;
    }
    ;
    ASSetPropFlags(__reg1, null, 1);
    __reg0.nChecked = 0;
}#endinitclip

//子图形 35
//  初始化剪辑
#initclip 0

if (!com.cegg.game.mahjong.UtilBase) 
{
    if (!com) 
    {
        _global.com = new Object();
    }
    if (!com.cegg) 
    {
        _global.com.cegg = new Object();
    }
    if (!com.cegg.game) 
    {
        _global.com.cegg.game = new Object();
    }
    if (!com.cegg.game.mahjong) 
    {
        _global.com.cegg.game.mahjong = new Object();
    }
    var __reg1 = (_global.com.cegg.game.mahjong.UtilBase = function ()
    {
    }
    ).prototype;
    __reg0.xmlSocketOpen = function ()
    {
    }
    ;
    __reg0.xmlSocketClose = function ()
    {
    }
    ;
    __reg0.resolveAsFriendURL = function (url)
    {
        var __reg3 = com.cegg.game.mahjong.UtilBase.baseURL;
        var __reg4 = -1;
        if ((__reg4 = __reg3.indexOf("?")) != -1) 
        {
            __reg3 = __reg3.substr(0, __reg4);
        }
        if ((__reg4 = __reg3.lastIndexOf("\\")) == -1) 
        {
            if ((__reg4 = __reg3.lastIndexOf("/")) != -1) 
            {
                __reg3 = __reg3.substr(0, __reg4 + 1);
            }
        }
        else 
        {
            __reg3 = __reg3.substr(0, __reg4 + 1);
        }
        return __reg3 + url;
    }
    ;
    __reg0.resolveAsSWFUNURL = function (url)
    {
        var __reg3 = _root._url.split("/", 3)[2];
        return "http://" + __reg3 + "/" + url;
    }
    ;
    __reg0.resolveAsFunctionalRootURL = function (url)
    {
        var __reg3 = _root._url.split("/", 3)[2].split(":", 1)[0];
        if ((__reg0 = __reg3.split(".").splice(-2).join(".")) === "mjv.jp") 
        {
            __reg3 = "b.mjv.jp";
        }
        else if (__reg0 === "tenhou.net") 
        {
            __reg3 = "b.tenhou.net";
        }
        return "http://" + __reg3 + "/" + url;
    }
    ;
    __reg0.resolveAsLogDownloadURL = function (url)
    {
        var __reg3 = _root._url.split("/", 3)[2].split(":", 1)[0];
        if ((__reg0 = __reg3.split(".").splice(-2).join(".")) === "mjv.jp") 
        {
            __reg3 = "e.mjv.jp";
        }
        else if (__reg0 === "tenhou.net") 
        {
            __reg3 = "tenhou.net";
        }
        return "http://" + __reg3 + "/" + url;
    }
    ;
    __reg0.unhex = function (c)
    {
        if (48 <= c && c <= 57) 
        {
            return c - 48;
        }
        if (65 <= c && c <= 90) 
        {
            return c - 55;
        }
        if (97 <= c && c <= 122) 
        {
            return c - 87;
        }
        return 0;
    }
    ;
    __reg0.unhex4 = function (s)
    {
        return com.cegg.game.mahjong.UtilBase.unhex(s.charCodeAt(0)) * 4096 | com.cegg.game.mahjong.UtilBase.unhex(s.charCodeAt(1)) * 256 | com.cegg.game.mahjong.UtilBase.unhex(s.charCodeAt(2)) * 16 | com.cegg.game.mahjong.UtilBase.unhex(s.charCodeAt(3)) * 1;
    }
    ;
    __reg0.unhex8 = function (s)
    {
        return com.cegg.game.mahjong.UtilBase.unhex(s.charCodeAt(0)) * 268435456 | com.cegg.game.mahjong.UtilBase.unhex(s.charCodeAt(1)) * 16777216 | com.cegg.game.mahjong.UtilBase.unhex(s.charCodeAt(2)) * 1048576 | com.cegg.game.mahjong.UtilBase.unhex(s.charCodeAt(3)) * 65536 | com.cegg.game.mahjong.UtilBase.unhex(s.charCodeAt(4)) * 4096 | com.cegg.game.mahjong.UtilBase.unhex(s.charCodeAt(5)) * 256 | com.cegg.game.mahjong.UtilBase.unhex(s.charCodeAt(6)) * 16 | com.cegg.game.mahjong.UtilBase.unhex(s.charCodeAt(7)) * 1;
    }
    ;
    __reg0.hexToString4 = function (c)
    {
        c = int(c);
        return com.cegg.game.mahjong.UtilBase.tohex_table.charAt(c >> 12 & 15) + com.cegg.game.mahjong.UtilBase.tohex_table.charAt(c >> 8 & 15) + com.cegg.game.mahjong.UtilBase.tohex_table.charAt(c >> 4 & 15) + com.cegg.game.mahjong.UtilBase.tohex_table.charAt(c >> 0 & 15);
    }
    ;
    __reg0.hexToString8 = function (c)
    {
        c = int(c);
        return com.cegg.game.mahjong.UtilBase.tohex_table.charAt(c >> 28 & 15) + com.cegg.game.mahjong.UtilBase.tohex_table.charAt(c >> 24 & 15) + com.cegg.game.mahjong.UtilBase.tohex_table.charAt(c >> 20 & 15) + com.cegg.game.mahjong.UtilBase.tohex_table.charAt(c >> 16 & 15) + com.cegg.game.mahjong.UtilBase.tohex_table.charAt(c >> 12 & 15) + com.cegg.game.mahjong.UtilBase.tohex_table.charAt(c >> 8 & 15) + com.cegg.game.mahjong.UtilBase.tohex_table.charAt(c >> 4 & 15) + com.cegg.game.mahjong.UtilBase.tohex_table.charAt(c >> 0 & 15);
    }
    ;
    __reg0.authTransform = function (val)
    {
        var __reg3 = val.split("-");
        if (__reg3.length != 2) 
        {
            return val;
        }
        if (__reg3[0].length != 8) 
        {
            return val;
        }
        if (__reg3[1].length != 8) 
        {
            return val;
        }
        var __reg4 = int("2" + __reg3[0].substr(2, 6)) % (13 - int(__reg3[0].substr(7, 1)) - 1);
        return __reg3[0] + "-" + com.cegg.game.mahjong.UtilBase.hexToString4(com.cegg.game.mahjong.UtilBase.tt2[__reg4 * 2 + 0] ^ com.cegg.game.mahjong.UtilBase.unhex4(__reg3[1].substr(0, 4))) + com.cegg.game.mahjong.UtilBase.hexToString4(com.cegg.game.mahjong.UtilBase.tt2[__reg4 * 2 + 1] ^ com.cegg.game.mahjong.UtilBase.unhex4(__reg3[1].substr(4, 4)));
    }
    ;
    ASSetPropFlags(__reg1, null, 1);
    __reg0.bPremiumVersion = false;
    __reg0.nExpireDays = 0;
    __reg0.bExternalID = false;
    __reg0.bWBPopup = false;
    __reg0.xmlWantNextJoin = "";
    __reg0.bPlayStartSE = true;
    __reg0.tohex_table = "0123456789abcdef";
    __reg0.tt2 = [63006, 9570, 49216, 45888, 9822, 23121, 59830, 51114, 54831, 4189, 580, 5203, 42174, 59972, 55457, 59009, 59347, 64456, 8673, 52710, 49975, 2006, 62677, 3463, 17754, 5357];
}#endinitclip

//子图形 36
//  初始化剪辑
#initclip 0

if (!com.cegg.game.SE) 
{
    if (!com) 
    {
        _global.com = new Object();
    }
    if (!com.cegg) 
    {
        _global.com.cegg = new Object();
    }
    if (!com.cegg.game) 
    {
        _global.com.cegg.game = new Object();
    }
    (_global.com.cegg.game.SE = function ()
    {
        super();
    }
    ).prototype.__proto__ = MovieClip.prototype;
    __reg0.prototype.__constructor__ = MovieClip;
    var __reg1 = __reg0.prototype;
    __reg1.play = function (type, nolimit, who)
    {
        if (_global.nose) 
        {
            return undefined;
        }
        var s = this.snd[type];
        if (s == undefined) 
        {
            this.snd[type] = s = new Sound(this);
            s.playing = 0;
            s.attachSound(type);
            s.onSoundComplete = function ()
            {
                --this.playing;
            }
            ;
        }
        if ((__reg0 = int(who)) === 0) 
        {
            s.setPan(0);
            s.setVolume(54);
        }
        else if (__reg0 === 1) 
        {
            s.setPan(40);
            s.setVolume(60);
        }
        else if (__reg0 === 2) 
        {
            s.setPan(0);
            s.setVolume(50);
        }
        else if (__reg0 === 3) 
        {
            s.setPan(-40);
            s.setVolume(60);
        }
        if (!nolimit && s.playing > 1) 
        {
            return undefined;
        }
        if (s.playing) 
        {
            var i;
            i = _global.setInterval(function ()
            {
                s.start();
                _global.clearInterval(i);
            }
            , s.playing * 35);
        }
        else 
        {
            s.start();
        }
        ++s.playing;
    }
    ;
    ASSetPropFlags(__reg1, null, 1);
    __reg0.SymbolName = "__Packages.com.cegg.game.SE";
    __reg0.SymbolOwner = com.cegg.game.SE;
    __reg0.SymbolLinked = Object.registerClass(com.cegg.game.SE.SymbolName, com.cegg.game.SE.SymbolOwner);
    __reg1.snd = {};
}#endinitclip

//子图形 37
//  初始化剪辑
#initclip 0

if (!com.cegg.GEscapeListener) 
{
    if (!com) 
    {
        _global.com = new Object();
    }
    if (!com.cegg) 
    {
        _global.com.cegg = new Object();
    }
    (_global.com.cegg.GEscapeListener = function ()
    {
        super();
        com.cegg.GEscapeListener._this = this;
    }
    ).prototype.__proto__ = MovieClip.prototype;
    __reg0.prototype.__constructor__ = MovieClip;
    var __reg1 = __reg0.prototype;
    __reg0.append = function (o)
    {
        com.cegg.GEscapeListener._this.append_(o);
    }
    ;
    __reg0.remove = function (o)
    {
        com.cegg.GEscapeListener._this.remove_(o);
    }
    ;
    __reg1.append_ = function (o)
    {
        var __reg3 = 0;
        if (__reg3 < this.q.length) 
        {
            for (;;) 
            {
                ++__reg3;
                if (__reg3 >= this.q.length) 
                {
                    break;
                }
                if (this.q[__reg3] == o) 
                {
                    break;
                }
            }
        }
        if (__reg3 == this.q.length) 
        {
            this.q.push(o);
        }
    }
    ;
    __reg1.remove_ = function (o)
    {
        var __reg3 = 0;
        if (__reg3 < this.q.length) 
        {
            for (;;) 
            {
                ++__reg3;
                if (__reg3 >= this.q.length) 
                {
                    break;
                }
                if (this.q[__reg3] == o) 
                {
                    break;
                }
            }
        }
        if (__reg3 != this.q.length) 
        {
            this.q.splice(__reg3, 1);
        }
    }
    ;
    __reg1.onEnterFrame = function ()
    {
        if (this.bDown) 
        {
            if (Key.isDown(Key.ESCAPE)) 
            {
                return undefined;
            }
            this.bDown = false;
            this.q[this.q.length - 1].onCommand({cmd: "EscapeUp"});
        }
        else 
        {
            if (!Key.isDown(Key.ESCAPE)) 
            {
                return undefined;
            }
            this.bDown = true;
            this.q[this.q.length - 1].onCommand({cmd: "EscapeDown"});
        }
        com.cegg.Trace.out("EL " + this.q.length + " " + this.q[this.q.length - 1] + "\n", "com.cegg.GEscapeListener::onEnterFrame", "K:\\dev\\mahjong5\\swf\\mtasc-1.11/std/com/cegg/GEscapeListener.as", 45);
    }
    ;
    ASSetPropFlags(__reg1, null, 1);
    __reg0.SymbolName = "__Packages.com.cegg.GEscapeListener";
    __reg0.SymbolOwner = com.cegg.GEscapeListener;
    __reg0.SymbolLinked = Object.registerClass(com.cegg.GEscapeListener.SymbolName, com.cegg.GEscapeListener.SymbolOwner);
    __reg0._this = undefined;
    __reg1.q = [];
    __reg1.bDown = false;
}#endinitclip

//子图形 38
//  初始化剪辑
#initclip 0

if (!com.cegg.game.mahjong.LobbyCS) 
{
    if (!com) 
    {
        _global.com = new Object();
    }
    if (!com.cegg) 
    {
        _global.com.cegg = new Object();
    }
    if (!com.cegg.game) 
    {
        _global.com.cegg.game = new Object();
    }
    if (!com.cegg.game.mahjong) 
    {
        _global.com.cegg.game.mahjong = new Object();
    }
    (_global.com.cegg.game.mahjong.LobbyCS = function ()
    {
        super();
        _root.Main.setMenuBottom(false);
        this.skipEnterLobbyCancelCount = 0;
        this.join_type = 1;
        this.dan_min = this.dan_max = 0;
        this.rate_min = this.rate_max = 0;
        this.wJoinFee = 0;
        this.join_ok = false;
        this.time_start = 0;
        this.time_end = 0;
    }
    ).prototype.__proto__ = com.cegg.game.mahjong.LobbyBase.prototype;
    __reg0.prototype.__constructor__ = com.cegg.game.mahjong.LobbyBase;
    var __reg1 = __reg0.prototype;
    __reg1.onLoad = function ()
    {
    }
    ;
    __reg1.onUnload = function ()
    {
        var __reg2 = com.cegg.game.mahjong.SaveData.MJINFO();
        __reg2.data.tabsel = this.tabsel;
        __reg2.flush();
        _global.clearInterval(this.idTimer);
        this.idTimer = undefined;
        _global.clearInterval(this.idTimerWG);
        this.idTimerWG = undefined;
    }
    ;
    __reg1.removeMovieClip = function ()
    {
        this.Prof.removeMovieClip();
        this.onUnload();
        super.removeMovieClip();
    }
    ;
    __reg1.init = function ()
    {
        var __reg2 = 30;
        var __reg3 = 0;
        this.createEmptyMovieClip("caption", __reg3++);
        this.createTextField("tfTitle", __reg3++, 0, __reg2, com.cegg.game.mahjong.LobbyCS.cx, 0);
        with (this.tfTitle)
        {
            autoSize = "center";
        }
        var __reg4 = new TextFormat();
        __reg4.size = 18;
        __reg4.bold = true;
        this.tfTitle.setNewTextFormat(__reg4);
        this.tfTitle.text = "- - - -";
        __reg2 = __reg2 + (this.tfTitle._height + 20);
        this.createTextField("tf", __reg3++, 0, __reg2, com.cegg.game.mahjong.LobbyCS.cx, 22);
        this.createEmptyMovieClip("pane0", __reg3++);
        this.createEmptyMovieClip("pwg", __reg3++);
        this.createEmptyMovieClip("plog", __reg3++);
        this.createEmptyMovieClip("hlp", __reg3++);
        this.attachMovie(com.cegg.MCTab.SymbolName, "tab", __reg3++, {_x: 10});
        com.cegg.GButton.createTextButton("MENU", com.cegg.game.mahjong.Res.T_MENU, __reg3++, this, (new XML(com.cegg.game.mahjong.Res.T_LOBBYMENU[0])).firstChild);
        com.cegg.GButton.createTextButton("SINGLE", com.cegg.game.mahjong.Res.T_SINGLE, __reg3++, this, (new XML(com.cegg.game.mahjong.Res.T_SINGLEMENU)).firstChild);
        com.cegg.GButton.createTextButton("CANCEL", com.cegg.game.mahjong.Res.T_CANCEL, __reg3++, this);
        with (this.tf)
        {
            autoSize = "center";
        }
        this.tf.text = com.cegg.game.mahjong.Res.T_USERNUM + " - " + com.cegg.game.mahjong.Res.T_NIN + "    " + com.cegg.game.mahjong.Res.T_LOBBYNUM + " - " + com.cegg.game.mahjong.Res.T_NIN + "    " + com.cegg.game.mahjong.Res.T_OHRASUNUM + " - " + com.cegg.game.mahjong.Res.T_NIN;
        __reg2 = __reg2 + (this.tf._height + 5);
        this.tab.initTab(com.cegg.game.mahjong.Res.T_TAB[1]);
        this.tab.onChanged = function (sel)
        {
            this._parent.onTabChanged(sel);
        }
        ;
        this.tab._y = __reg2;
        __reg2 = __reg2 + this.tab._height;
        if (this.tab.pane0) 
        {
            var __reg5 = 25;
            var __reg6 = 13;
            var __reg7 = this.pane0;
            com.cegg.game.mahjong.Util.createTextFieldTACS(__reg7, "tf0", __reg3++, __reg5 + 0, __reg6 + 21 * 0, com.cegg.game.mahjong.LobbyCS.cx, 22, com.cegg.game.mahjong.Res.T_CSDISP[0], "left", 0, true);
            com.cegg.game.mahjong.Util.createTextFieldTACS(__reg7, "tf2", __reg3++, __reg5 + 0, __reg6 + 21 * 2, com.cegg.game.mahjong.LobbyCS.cx, 22, com.cegg.game.mahjong.Res.T_CSDISP[3], "left", 0, true);
            com.cegg.game.mahjong.Util.createTextFieldTACS(__reg7, "tf3", __reg3++, __reg5 + 0, __reg6 + 21 * 3, com.cegg.game.mahjong.LobbyCS.cx, 22, com.cegg.game.mahjong.Res.T_CSDISP[16], "left", 0, true);
            com.cegg.game.mahjong.Util.createTextFieldTACS(__reg7, "tf4", __reg3++, __reg5 + 0, __reg6 + 21 * 4, com.cegg.game.mahjong.LobbyCS.cx, 22, com.cegg.game.mahjong.Res.T_CSDISP[7], "left", 0, true);
            com.cegg.game.mahjong.Util.createTextFieldTACS(__reg7, "tf10", __reg3++, __reg5 + 90, __reg6 + 21 * 0, com.cegg.game.mahjong.LobbyCS.cx, 22, com.cegg.game.mahjong.Res.T_CSDISP[1] + " ----/--/--(--) --:--", "left", 0, true);
            com.cegg.game.mahjong.Util.createTextFieldTACS(__reg7, "tf11", __reg3++, __reg5 + 90, __reg6 + 21 * 1, com.cegg.game.mahjong.LobbyCS.cx, 22, com.cegg.game.mahjong.Res.T_CSDISP[2] + " ----/--/--(--) --:--", "left", 0, true);
            com.cegg.game.mahjong.Util.createTextFieldTACS(__reg7, "tf12", __reg3++, __reg5 + 90, __reg6 + 21 * 2, com.cegg.game.mahjong.LobbyCS.cx, 22, "- - -", "left", 0, true);
            com.cegg.game.mahjong.Util.createTextFieldTACS(__reg7, "tf13", __reg3++, __reg5 + 90, __reg6 + 21 * 3, com.cegg.game.mahjong.LobbyCS.cx, 22, "- - -", "left", 0, true);
            com.cegg.game.mahjong.Util.createTextFieldTACS(__reg7, "tf14", __reg3++, __reg5 + 90, __reg6 + 21 * 4, com.cegg.game.mahjong.LobbyCS.cx, 22, com.cegg.game.mahjong.Res.T_CSDISP[11], "left", 0, true);
            com.cegg.game.mahjong.Util.createTextFieldTACS(__reg7, "tf15", __reg3++, __reg5 + 90, __reg6 + 21 * 5, com.cegg.game.mahjong.LobbyCS.cx, 22, com.cegg.game.mahjong.Res.T_CSDISP[8], "left", 0, true);
            __reg6 = __reg7.tf15._y + __reg7.tf15._height + 10;
            __reg7.lineStyle(1, 14540253, 100);
            __reg7.moveTo(20, __reg6);
            __reg7.lineTo(com.cegg.game.mahjong.LobbyCS.cx - 20, __reg6);
            __reg6 = __reg6 + 15;
            com.cegg.game.mahjong.Util.createTextFieldTACS(__reg7, "tfRuleNum", __reg3++, 0, 0, 0, 22, "-", "left", 0, false);
            com.cegg.game.mahjong.Util.createTextFieldTACS(__reg7, "tfNotice", __reg3++, 0, 0, 0, 22, com.cegg.game.mahjong.Res.T_CSDISP[4], "left", 4473924, false);
            __reg7.tfRuleNum.text = com.cegg.game.mahjong.Res.T_JOIN + " -" + com.cegg.game.mahjong.Res.T_NIN + "   " + com.cegg.game.mahjong.Res.T_TAISENNUM + " -" + com.cegg.game.mahjong.Res.T_NIN;
            com.cegg.GButton.createTextButton("JOIN", com.cegg.game.mahjong.Res.T_JOIN, __reg3++, __reg7);
            com.cegg.GButton.createTextButton("JOINREG", com.cegg.game.mahjong.Res.T_JOINREG, __reg3++, __reg7);
            __reg7.tfRuleNum._x = 65;
            __reg7.JOIN._x = __reg7.JOINREG._x = __reg7.tfNotice._x = 185;
            __reg7.JOIN._y = __reg7.JOINREG._y = __reg7.tfNotice._y = __reg7.tfRuleNum._y = __reg6;
            __reg7.JOIN._visible = __reg7.JOINREG._visible = false;
        }
        if (this.tab.pwg) 
        {
            var __reg8 = this.pwg;
            __reg8.createTextField("tf", __reg3++, 5, 0, com.cegg.game.mahjong.LobbyCS.cx - 5, 190);
            __reg8.tf.html = true;
            __reg8.tf.htmlText = com.cegg.game.mahjong.Res.T_ERRTXT.E1013;
            com.cegg.GScrollVert.createScrollBar("SB_VERT", __reg8.tf, __reg3++);
            __reg8.SB_VERT._alpha = 50;
            __reg8.startwg = function (args)
            {
                if (this._parent.CANCEL.isEnable()) 
                {
                    _root.onXMLNode((new XML("<ERR code=\"2002\"/>")).firstChild);
                    return;
                }
                var __reg3 = args.split(",");
                _root.tw = int(__reg3[1]);
                _root.send("<CHAT text=\"" + _global.escape("/wg " + __reg3[0]) + "\" />");
            }
            ;
        }
        if (this.tab.plog) 
        {
            var __reg9 = this.plog;
            __reg9._y = this.tab._y + this.tab._height + 2;
            __reg9.onCommand = function (msg)
            {
                this._parent.onCommand(msg);
            }
            ;
            __reg9.createTextField("tf", __reg3++, 5, 0, com.cegg.game.mahjong.LobbyCS.cx - 5, 190);
            __reg9.tf.html = true;
            __reg9.tf.htmlText = com.cegg.game.mahjong.LobbyBase.CompileLOG();
            __reg9.tf.scroll = __reg9.tf.maxscroll;
            com.cegg.GScrollVert.createScrollBar("SB_VERT", __reg9.tf, __reg3++);
            __reg9.SB_VERT._alpha = 50;
            __reg9.openlog = function (args)
            {
                var __reg3 = new LoadVars();
                __reg3.onData(args);
                this._parent.onCommand({cmd: "LOGVIEWER", log: __reg3.log, tw: __reg3.tw, ts: undefined});
            }
            ;
        }
        if (this.tab.hlp) 
        {
            var __reg10 = this.hlp;
            __reg10.attachMovie("hai4", "img", __reg3++);
            __reg10.img._x = int((com.cegg.game.mahjong.LobbyCS.cx - 120) / 2);
            __reg10.img._y = 30;
            __reg10.createTextField("tfLink", __reg3++, 0, __reg10.img._y + __reg10.img._height + 2, com.cegg.game.mahjong.LobbyCS.cx, 22);
            __reg10.createTextField("tf", __reg3++, 0, __reg10.img._y + __reg10.img._height + 22, com.cegg.game.mahjong.LobbyCS.cx, 22);
            with (__reg10.tfLink)
            {
                autoSize = "center";
                selectable = false;
                html = true;
            }
            with (__reg10.tf)
            {
                autoSize = "center";
                selectable = false;
                textColor = 4473924;
            }
            __reg10.tfLink.htmlText = com.cegg.game.mahjong.Res.T_LOBBYTXT[5];
            __reg10.tf.text = "TENHOU (C)C-EGG";
        }
        this.pane0._y = this.pwg._y = this.plog._y = this.hlp._y = __reg2;
        this.pane0.onCommand = this.pwg.onCommand = this.plog.onCommand = function (msg)
        {
            this._parent.onCommand(msg);
        }
        ;
        __reg2 = __reg2 + 210;
        this.MENU._x = int((com.cegg.game.mahjong.LobbyCS.cx - (this.MENU._width + this.SINGLE._width + this.CANCEL._width)) / 2);
        this.SINGLE._x = this.MENU._x + this.MENU._width;
        this.CANCEL._x = this.SINGLE._x + this.SINGLE._width;
        this.MENU._y = this.SINGLE._y = this.CANCEL._y = __reg2;
        var __reg11 = com.cegg.game.mahjong.LobbyCS.cx + com.cegg.game.mahjong.Prof2.cx;
        this.Prof._x = com.cegg.game.mahjong.LobbyCS.cx;
        var __reg12 = this.CANCEL._y + this.CANCEL._height + 10;
        com.cegg.LGraphics.drawCaption(this.caption, __reg11, 12);
        com.cegg.LGraphics.drawFrame(this, 0, 0, __reg11, __reg12, 16777215);
        com.cegg.LGraphics.drawShadow(this, 0, 0, __reg11, __reg12, 4);
        this.lineStyle(1, 14540253, 100);
        this.moveTo(com.cegg.game.mahjong.LobbyCS.cx, 0);
        this.lineTo(com.cegg.game.mahjong.LobbyCS.cx, __reg12);
        this.moveTo(0, this.tf._y - 5);
        this.lineTo(com.cegg.game.mahjong.LobbyCS.cx, this.tf._y - 5);
        this.moveTo(0, this.SINGLE._y - 10);
        this.lineTo(com.cegg.game.mahjong.LobbyCS.cx, this.SINGLE._y - 10);
        this.lineStyle(1, 13421772, 100);
        this.moveTo(10, this.tab._y + this.tab._height - 1);
        this.lineTo(com.cegg.game.mahjong.LobbyCS.cx, this.tab._y + this.tab._height - 1);
        this.caption._focusrect = false;
        this.caption.onPress = function ()
        {
            this._parent.startDrag();
        }
        ;
        this.caption.onMouseUp = this.caption.onRelease = function ()
        {
            this._parent.stopDrag();
        }
        ;
        this.CANCEL.setEnable(false);
        this.tab.selectTab(com.cegg.game.mahjong.SaveData.MJINFO().data.tabsel);
        _root.send("<CS lobby=\"" + _root.lb.substr(0, 9) + "\" />");
    }
    ;
    __reg1.onTabChanged = function (sel)
    {
        this.tabsel = sel;
        this.pane0._visible = this.pwg._visible = this.plog._visible = this.hlp._visible = false;
        this[sel]._visible = true;
        var __reg3 = int("1" + _root.lb.substr(1, 4));
        this.Prof.onTabChanged(__reg3, sel, "taku0");
    }
    ;
    __reg1.onCommand = function (msg)
    {
        if ((__reg0 = msg.cmd) === "JOIN") 
        {
            if (_root.startGame == undefined) 
            {
                return;
            }
            _root.send("<JOIN t=\"1" + _root.lb.substr(1, 4) + "," + this.join_type + "\" />");
            this.pane0.JOIN.setEnable(false);
            this.pane0.JOINREG.setEnable(false);
            this.SINGLE.setEnable(false);
            this.CANCEL.setEnable(true);
            return;
        }
        else if (__reg0 === "SINGLE") 
        {
            if (_root.startGame == undefined) 
            {
                return;
            }
            this.pane0.JOIN.setEnable(false);
            this.pane0.JOINREG.setEnable(false);
            this.SINGLE.setEnable(false);
            this.CANCEL.setEnable(false);
            var __reg3 = int("1" + _root.lb.substr(1, 4));
            _root.send("<JOIN t=\"" + __reg3 + "," + msg.type + "\" />");
            return;
        }
        else if (__reg0 === "CANCEL") 
        {
            if (this.skipEnterLobbyCancelCount) 
            {
                return;
            }
            if (!this.CANCEL.isEnable()) 
            {
                return;
            }
            this.pane0.JOIN.setEnable(true);
            this.pane0.JOINREG.setEnable(true);
            this.SINGLE.setEnable(true);
            this.CANCEL.setEnable(false);
            _root.send("<JOIN />");
            return;
        }
        else if (__reg0 === "REJOIN_ALL") 
        {
            _root.send("<CS lobby=\"" + _root.lb.substr(0, 9) + "\" />");
            this.skipEnterLobbyCancelCount = 2;
            _root.send("<JOIN t=\"1" + _root.lb.substr(1, 4) + "," + this.join_type + "\" />");
            return;
        }
        else if (__reg0 === "JOINREG") 
        {
            if (_root.uname.substr(0, 2) != "ID") 
            {
                com.cegg.GDialog.messageBox(_root.Main, com.cegg.game.mahjong.Res.T_JOINREGMSG[2]);
                return;
            }
            com.cegg.GDialog.messageBox(this, com.cegg.game.mahjong.Res.T_JOINREGMSG[0] + this.wJoinFee + com.cegg.game.mahjong.Res.T_JOINREGMSG[1], "JOINREG_YES", "Yes", "NO", "No");
            return;
        }
        else if (__reg0 === "JOINREG_YES") 
        {
            var _this = this;
            var __reg4 = new LoadVars();
            __reg4.onLoad = function (ok)
            {
                if (ok) 
                {
                    _this.onLoadVars(this);
                }
            }
            ;
            __reg4.load(com.cegg.game.mahjong.UtilBase.resolveAsFunctionalRootURL("csreg?lobby=1" + _root.lb.substr(1, 4) + "&uname=" + _root.uname));
            return;
        }
        _root.onCommand(msg);
        return;
    }
    ;
    __reg1.onXMLNode = function (n)
    {
        var __reg3 = n.attributes;
        if ((__reg0 = n.nodeName) === "CHAT") 
        {
            if (__reg3.lobby.length) 
            {
                this.onCommand({cmd: "CANCEL"});
                if (this.skipEnterLobbyCancelCount) 
                {
                    --this.skipEnterLobbyCancelCount;
                    _root.Main.View.Chat.chatOut("#REFRESH LOBBY " + __reg3.lobby + "\n");
                }
                else 
                {
                    _root.Main.View.Chat.chatOut("#ENTER LOBBY " + __reg3.lobby + "\n");
                }
            }
            else 
            {
                if (__reg3.uname.length) 
                {
                    _root.Main.View.Chat.chatOut(_global.unescape(__reg3.uname) + ": ");
                }
                _root.Main.View.Chat.chatOut(_global.unescape(__reg3.text) + "\n");
            }
            return;
        }
        else if (__reg0 === "LN") 
        {
            var __reg4 = com.cegg.game.mahjong.Util.csv_intZA(__reg3.n).split(",");
            var __reg5 = com.cegg.game.mahjong.Util.csv_intZA(__reg3.j).split(",");
            var __reg6 = com.cegg.game.mahjong.Util.csv_intZA(__reg3.g).split(",");
            this.tf.text = com.cegg.game.mahjong.Res.T_USERNUM + " " + int(__reg4[0]) + com.cegg.game.mahjong.Res.T_NIN + "    " + com.cegg.game.mahjong.Res.T_LOBBYNUM + " " + int(__reg4[2]) + com.cegg.game.mahjong.Res.T_NIN + "    " + com.cegg.game.mahjong.Res.T_OHRASUNUM + " " + int(__reg4[3]) + com.cegg.game.mahjong.Res.T_NIN;
            this.pane0.tfRuleNum.text = com.cegg.game.mahjong.Res.T_JOIN + " " + int(__reg5[0]) + com.cegg.game.mahjong.Res.T_NIN + "   " + com.cegg.game.mahjong.Res.T_TAISENNUM + " " + int(__reg6[0]) + com.cegg.game.mahjong.Res.T_NIN;
            return;
        }
        else if (__reg0 === "CS") 
        {
            if (this.idTimerWG == undefined) 
            {
                _global.clearInterval(this.idTimerWG);
                this.idTimerWG = _global.setInterval(this, "onIntervalWG", 60 * 1000);
                _root.send("<CHAT text=\"%2Fwg\" />");
            }
            if (__reg3.joinfee != undefined) 
            {
                this.wJoinFee = int(__reg3.joinfee);
            }
            if (__reg3.players != undefined && __reg3.premiumonly != undefined) 
            {
                if (this.wJoinFee) 
                {
                    this.pane0.tf15.text = com.cegg.game.mahjong.Res.T_CSDISP[8];
                }
                else if (__reg3.premiumonly) 
                {
                    this.pane0.tf15.text = __reg3.players ? com.cegg.game.mahjong.Res.T_CSDISP[9] + __reg3.players + com.cegg.game.mahjong.Res.T_CSDISP[10] + "(" + com.cegg.game.mahjong.Res.T_CSDISP[15] + ")" : com.cegg.game.mahjong.Res.T_CSDISP[21] + com.cegg.game.mahjong.Res.T_CSDISP[15];
                }
                else 
                {
                    this.pane0.tf15.text = __reg3.players ? com.cegg.game.mahjong.Res.T_CSDISP[9] + __reg3.players + com.cegg.game.mahjong.Res.T_CSDISP[10] : com.cegg.game.mahjong.Res.T_CSDISP[8];
                }
            }
            if (__reg3.title != undefined) 
            {
                this.tfTitle.text = _global.unescape(__reg3.title);
                this.tfTitle.autoSize = "center";
                if (this.tfTitle._width > com.cegg.game.mahjong.LobbyCS.cx - 20) 
                {
                    this.tfTitle.autoSize = "none";
                    this.tfTitle._x = 10;
                    this.tfTitle._width = com.cegg.game.mahjong.LobbyCS.cx - 20;
                }
            }
            if (__reg3.rule != undefined) 
            {
                this.onCommand({cmd: "CANCEL"});
                var __reg7 = __reg3.rule.split(",");
                this.join_type = com.cegg.game.mahjong.UtilBase.unhex4(__reg7[2]);
                var __reg8 = new Date(int(__reg7[0].substr(0, 4)), int(__reg7[0].substr(4, 2)) - 1, int(__reg7[0].substr(6, 2)), int(__reg7[0].substr(8, 2)), int(__reg7[0].substr(10, 2)));
                var __reg9 = new Date(int(__reg7[1].substr(0, 4)), int(__reg7[1].substr(4, 2)) - 1, int(__reg7[1].substr(6, 2)), int(__reg7[1].substr(8, 2)), int(__reg7[1].substr(10, 2)));
                this.pane0.tf10.text = com.cegg.game.mahjong.Res.T_CSDISP[1] + " " + __reg8.getFullYear() + "/" + com.cegg.game.mahjong.LobbyCS.n2(__reg8.getMonth() + 1) + "/" + com.cegg.game.mahjong.LobbyCS.n2(__reg8.getDate()) + "(" + com.cegg.game.mahjong.Res.T_MDAY.substr(__reg8.getDay(), 1) + ") " + com.cegg.game.mahjong.LobbyCS.n2(__reg8.getHours()) + ":" + com.cegg.game.mahjong.LobbyCS.n2(__reg8.getMinutes());
                this.pane0.tf11.text = com.cegg.game.mahjong.Res.T_CSDISP[2] + " " + __reg9.getFullYear() + "/" + com.cegg.game.mahjong.LobbyCS.n2(__reg9.getMonth() + 1) + "/" + com.cegg.game.mahjong.LobbyCS.n2(__reg9.getDate()) + "(" + com.cegg.game.mahjong.Res.T_MDAY.substr(__reg9.getDay(), 1) + ") " + com.cegg.game.mahjong.LobbyCS.n2(__reg9.getHours()) + ":" + com.cegg.game.mahjong.LobbyCS.n2(__reg9.getMinutes());
                var __reg10 = "";
                __reg10 = __reg10 + com.cegg.game.mahjong.Res.T_CSRULEDISP[(this.join_type & com.cegg.game.mahjong.Res.GT_SANMA ? 2 : 0) + (this.join_type & com.cegg.game.mahjong.Res.GT_NAN ? 1 : 0)];
                __reg10 = __reg10 + " ";
                __reg10 = __reg10 + com.cegg.game.mahjong.Res.T_CSRULEDISP[this.join_type & com.cegg.game.mahjong.Res.GT_NOKUI ? 5 : 4];
                __reg10 = __reg10 + " ";
                __reg10 = __reg10 + com.cegg.game.mahjong.Res.T_CSRULEDISP[this.join_type & com.cegg.game.mahjong.Res.GT_NOAKA ? 7 : 6];
                __reg10 = __reg10 + " ";
                __reg10 = __reg10 + com.cegg.game.mahjong.Res.T_CSRULEDISP[this.join_type & com.cegg.game.mahjong.Res.GT_SAKU ? 9 : 8];
                __reg10 = __reg10 + com.cegg.game.mahjong.Res.T_CSRULEDISP[this.join_type & com.cegg.game.mahjong.Res.GT_GRAY ? 11 : 10];
                __reg10 = __reg10 + com.cegg.game.mahjong.Res.T_CSRULEDISP[this.join_type & com.cegg.game.mahjong.Res.GT_CHIP ? 13 : 12];
                this.pane0.tf12.text = __reg10;
                this.time_start = __reg8.getTime();
                this.time_end = __reg9.getTime();
                this.dan_min = int(__reg7[3]);
                this.dan_max = int(__reg7[4]);
                this.rate_min = int(__reg7[5]);
                this.rate_max = int(__reg7[6]);
                var __reg11 = "";
                if (this.dan_min && (this.dan_max && this.dan_min == this.dan_max)) 
                {
                    __reg11 = __reg11 + (com.cegg.game.mahjong.Res.T_DANDISP[this.dan_min] + com.cegg.game.mahjong.Res.T_CSDISP[14]);
                }
                else if (this.dan_min && this.dan_max) 
                {
                    __reg11 = __reg11 + (com.cegg.game.mahjong.Res.T_DANDISP[this.dan_min] + com.cegg.game.mahjong.Res.T_KARA + com.cegg.game.mahjong.Res.T_DANDISP[this.dan_max]);
                }
                else if (this.dan_min) 
                {
                    __reg11 = __reg11 + (com.cegg.game.mahjong.Res.T_DANDISP[this.dan_min] + com.cegg.game.mahjong.Res.T_CSDISP[12]);
                }
                else if (this.dan_max) 
                {
                    __reg11 = __reg11 + (com.cegg.game.mahjong.Res.T_DANDISP[this.dan_max] + com.cegg.game.mahjong.Res.T_CSDISP[13]);
                }
                if (__reg11.length && (this.rate_min || this.rate_max)) 
                {
                    __reg11 = __reg11 + " & ";
                }
                if (this.rate_min && this.rate_max) 
                {
                    __reg11 = __reg11 + ("R" + this.rate_min + com.cegg.game.mahjong.Res.T_KARA + "R" + this.rate_max);
                }
                else if (this.rate_min) 
                {
                    __reg11 = __reg11 + ("R" + this.rate_min + com.cegg.game.mahjong.Res.T_CSDISP[12]);
                }
                else if (this.rate_max) 
                {
                    __reg11 = __reg11 + ("R" + this.rate_max + com.cegg.game.mahjong.Res.T_CSDISP[13]);
                }
                if (!__reg11.length) 
                {
                    __reg11 = com.cegg.game.mahjong.Res.T_CSDISP[11];
                }
                this.pane0.tf14.text = __reg11;
                __reg11 = "- - -";
                if (this.wJoinFee) 
                {
                    __reg11 = com.cegg.game.mahjong.Res.T_CSDISP[17] + this.wJoinFee + com.cegg.game.mahjong.Res.T_CSDISP[18];
                }
                else if (!__reg3.players) 
                {
                    __reg11 = com.cegg.game.mahjong.Res.T_CSDISP[__reg3.premiumonly ? 19 : 20];
                }
                this.pane0.tf13.text = __reg11;
            }
            if (__reg3.join != undefined) 
            {
                this.join_ok = __reg3.join == 1;
                if (this.join_ok) 
                {
                    var __reg12 = this.join_type & com.cegg.game.mahjong.Res.GT_SANMA ? this.dan3 : this.dan4;
                    if (this.dan_min && this.dan_max) 
                    {
                        this.join_ok = this.dan_min <= __reg12 && __reg12 <= this.dan_max;
                    }
                    else if (this.dan_min) 
                    {
                        this.join_ok = this.dan_min <= __reg12;
                    }
                    else if (this.dan_max) 
                    {
                        this.join_ok = __reg12 <= this.dan_max;
                    }
                }
                if (this.join_ok) 
                {
                    var __reg13 = this.join_type & com.cegg.game.mahjong.Res.GT_SANMA ? this.rate3 : this.rate4;
                    if (this.rate_min && this.rate_max) 
                    {
                        this.join_ok = this.rate_min <= __reg13 && __reg13 <= this.rate_max;
                    }
                    else if (this.rate_min) 
                    {
                        this.join_ok = this.rate_min <= __reg13;
                    }
                    else if (this.rate_max) 
                    {
                        this.join_ok = __reg13 <= this.rate_max;
                    }
                }
            }
            if (__reg3.rule != undefined || __reg3.join != undefined) 
            {
                _root.send("<DATE />");
            }
            if (this.skipEnterLobbyCancelCount) 
            {
                --this.skipEnterLobbyCancelCount;
            }
            this.Prof.onXMLNode(n);
            return;
        }
        else if (__reg0 === "DATE") 
        {
            if (this.join_ok) 
            {
                this.pane0.JOIN._visible = true;
                this.pane0.JOINREG._visible = false;
                this.pane0.tfNotice._visible = false;
            }
            else if (this.wJoinFee) 
            {
                this.pane0.JOIN._visible = false;
                this.pane0.JOINREG._visible = true;
                this.pane0.tfNotice._visible = false;
                this.onCommand({cmd: "CANCEL"});
            }
            else 
            {
                this.pane0.tfNotice.text = com.cegg.game.mahjong.Res.T_CSDISP[6];
                this.pane0.JOIN._visible = false;
                this.pane0.JOINREG._visible = false;
                this.pane0.tfNotice._visible = true;
                this.onCommand({cmd: "CANCEL"});
            }
            var __reg15 = __reg3.t;
            var __reg14 = (new Date(int(__reg15.substr(0, 4)), int(__reg15.substr(4, 2)) - 1, int(__reg15.substr(6, 2)), int(__reg15.substr(8, 2)), int(__reg15.substr(10, 2)), int(__reg15.substr(12, 2)))).getTime();
            _global.clearInterval(this.idTimer);
            this.idTimer = undefined;
            if (this.time_end - 30 * 1000 <= __reg14) 
            {
                this.pane0.tfNotice.text = com.cegg.game.mahjong.Res.T_CSDISP[5];
                this.pane0.JOIN._visible = false;
                this.pane0.JOINREG._visible = false;
                this.pane0.tfNotice._visible = true;
                this.onCommand({cmd: "CANCEL"});
            }
            else if (__reg14 < this.time_start) 
            {
                if (this.join_ok) 
                {
                    var __reg16 = int((this.time_start - __reg14) / 1000);
                    this.pane0.tfNotice.text = com.cegg.game.mahjong.Res.T_ATO + (__reg16 <= 60 ? int(__reg16 / 5) * 5 + com.cegg.game.mahjong.Res.T_DATEUNIT.substr(5, 1) : int(__reg16 / 60) + com.cegg.game.mahjong.Res.T_DATEUNIT.substr(4, 1));
                    this.pane0.JOIN._visible = false;
                    this.pane0.JOINREG._visible = false;
                    this.pane0.tfNotice._visible = true;
                    this.idTimer = _global.setInterval(this, "onInterval", __reg16 <= 60 * 2 ? 5 * 1000 : 60 * 1000);
                }
                this.onCommand({cmd: "CANCEL"});
            }
            else 
            {
                this.idTimer = _global.setInterval(this, "onInterval", 60 * 1000);
            }
            return;
        }
        else if (__reg0 === "WG") 
        {
            this.pwg.tf.htmlText = com.cegg.game.mahjong.LobbyBase.CompileWG(__reg3);
            return;
        }
        else if (__reg0 !== "RANKING") 
        {
            return;
        }
        this.Prof.onXMLNode(n);
        return;
    }
    ;
    __reg1.onLoadVars = function (v)
    {
        _root.onXMLNode((new XML("<ERR code=\"" + v.res + "\"/>")).firstChild);
        if (int(v.res) == 1027) 
        {
            if (v.expire.length == 8) 
            {
                this.Prof.tfExpire.text = com.cegg.game.mahjong.Res.T_EXPIRE + ":" + v.expire.substr(0, 4) + "/" + v.expire.substr(4, 2) + "/" + v.expire.substr(6, 2);
            }
            _root.send("<CS lobby=\"" + _root.lb.substr(0, 9) + "\" />");
        }
    }
    ;
    __reg1.onInterval = function ()
    {
        _global.clearInterval(this.idTimer);
        this.idTimer = undefined;
        _root.send("<DATE />");
    }
    ;
    __reg1.onIntervalWG = function ()
    {
        _root.send("<CHAT text=\"%2Fwg\" />");
    }
    ;
    __reg0.n2 = function (n)
    {
        return n >= 10 ? String(n) : "0" + n;
    }
    ;
    ASSetPropFlags(__reg1, null, 1);
    __reg0.SymbolName = "__Packages.com.cegg.game.mahjong.LobbyCS";
    __reg0.SymbolOwner = com.cegg.game.mahjong.LobbyCS;
    __reg0.SymbolLinked = Object.registerClass(com.cegg.game.mahjong.LobbyCS.SymbolName, com.cegg.game.mahjong.LobbyCS.SymbolOwner);
    __reg0.cx = 290;
}#endinitclip

//子图形 39
//  初始化剪辑
#initclip 0

if (!com.cegg.game.mahjong.SaveData) 
{
    if (!com) 
    {
        _global.com = new Object();
    }
    if (!com.cegg) 
    {
        _global.com.cegg = new Object();
    }
    if (!com.cegg.game) 
    {
        _global.com.cegg.game = new Object();
    }
    if (!com.cegg.game.mahjong) 
    {
        _global.com.cegg.game.mahjong = new Object();
    }
    var __reg1 = (_global.com.cegg.game.mahjong.SaveData = function ()
    {
    }
    ).prototype;
    __reg0.MJINFO = function ()
    {
        return SharedObject.getLocal(com.cegg.game.mahjong.SaveData.SO_MJINFO, "/");
    }
    ;
    __reg0.MJSTATUS = function ()
    {
        return SharedObject.getLocal(com.cegg.game.mahjong.SaveData.SO_MJSTATUS, "/");
    }
    ;
    __reg0.init_f0 = function ()
    {
        var __reg2 = com.cegg.game.mahjong.SaveData.MJSTATUS().data.f0;
        if (__reg2 != undefined) 
        {
            com.cegg.game.mahjong.SaveData.f0_logvw_tehaiopen = (__reg2 & com.cegg.game.mahjong.SaveData._F0_LOGVW_TEHAIOPEN) != 0;
            com.cegg.game.mahjong.SaveData.f0_logvw_forceanonymous = (__reg2 & com.cegg.game.mahjong.SaveData._F0_LOGVW_FORCEANONYMOUS) != 0;
            com.cegg.game.mahjong.SaveData.f0_logvw_tsumogiriasgray = (__reg2 & com.cegg.game.mahjong.SaveData._F0_LOGVW_TSUMOGIRIASGRAY) != 0;
            com.cegg.game.mahjong.SaveData.f0_kansen_tsumogiriasgray = (__reg2 & com.cegg.game.mahjong.SaveData._F0_KANSEN_TSUMOGIRIASGRAY) != 0;
        }
    }
    ;
    __reg0.save_f0 = function ()
    {
        var __reg2 = 0;
        if (com.cegg.game.mahjong.SaveData.f0_logvw_tehaiopen) 
        {
            __reg2 = __reg2 | com.cegg.game.mahjong.SaveData._F0_LOGVW_TEHAIOPEN;
        }
        if (com.cegg.game.mahjong.SaveData.f0_logvw_forceanonymous) 
        {
            __reg2 = __reg2 | com.cegg.game.mahjong.SaveData._F0_LOGVW_FORCEANONYMOUS;
        }
        if (com.cegg.game.mahjong.SaveData.f0_logvw_tsumogiriasgray) 
        {
            __reg2 = __reg2 | com.cegg.game.mahjong.SaveData._F0_LOGVW_TSUMOGIRIASGRAY;
        }
        if (com.cegg.game.mahjong.SaveData.f0_kansen_tsumogiriasgray) 
        {
            __reg2 = __reg2 | com.cegg.game.mahjong.SaveData._F0_KANSEN_TSUMOGIRIASGRAY;
        }
        var __reg3 = com.cegg.game.mahjong.SaveData.MJSTATUS();
        __reg3.data.f0 = __reg2;
        __reg3.flush();
    }
    ;
    ASSetPropFlags(__reg1, null, 1);
    __reg0.SO_MJINFO = "mjinfo";
    __reg0.SO_MJSTATUS = "mjstatus";
    __reg0._F0_LOGVW_TEHAIOPEN = 1;
    __reg0._F0_LOGVW_FORCEANONYMOUS = 2;
    __reg0._F0_LOGVW_TSUMOGIRIASGRAY = 4;
    __reg0._F0_KANSEN_TSUMOGIRIASGRAY = 8;
    __reg0.f0_logvw_tehaiopen = true;
    __reg0.f0_logvw_forceanonymous = false;
    __reg0.f0_logvw_tsumogiriasgray = true;
    __reg0.f0_kansen_tsumogiriasgray = true;
}#endinitclip

//子图形 40
//  初始化剪辑
#initclip 0

if (!com.cegg.GPopupMenu) 
{
    if (!com) 
    {
        _global.com = new Object();
    }
    if (!com.cegg) 
    {
        _global.com.cegg = new Object();
    }
    (_global.com.cegg.GPopupMenu = function ()
    {
        super();
        if (this._parent == com.cegg.GPopupMenu._rootView) 
        {
            this.tabChildren = false;
            this.tabEnabled = false;
        }
    }
    ).prototype.__proto__ = MovieClip.prototype;
    __reg0.prototype.__constructor__ = MovieClip;
    var __reg1 = __reg0.prototype;
    __reg1.onLoad = function ()
    {
        if (this._parent == com.cegg.GPopupMenu._rootView) 
        {
            ++_global.numPopup;
            Key.addListener(this);
            Stage.addListener(this);
            com.cegg.GEscapeListener.append(this);
        }
    }
    ;
    __reg1.onUnload = function ()
    {
        if (this._parent == com.cegg.GPopupMenu._rootView) 
        {
            com.cegg.GEscapeListener.remove(this);
            Stage.removeListener(this);
            Key.removeListener(this);
            --_global.numPopup;
        }
    }
    ;
    __reg1.removeMovieClip = function ()
    {
        this.onUnload();
        super.removeMovieClip();
    }
    ;
    __reg0.trackPopupMenu = function (xml, x, y, parent)
    {
        var __reg6 = (parent._name == "PopupMenu" ? parent : com.cegg.GPopupMenu._rootView).attachMovie(com.cegg.GPopupMenu.SymbolName, "PopupMenu", 1048575);
        if (__reg6._parent == com.cegg.GPopupMenu._rootView) 
        {
            __reg6.commandHandler = parent;
        }
        __reg6.init(xml);
        var __reg7 = {x: x, y: y};
        __reg6._parent.localToGlobal(__reg7);
        if (Stage.width - __reg6._width < __reg7.x) 
        {
            __reg7.x = (parent._name == "PopupMenu" ? __reg7.x - x + 6 : Stage.width) - __reg6._width;
        }
        if (Stage.height - __reg6._height < __reg7.y) 
        {
            __reg7.y = Stage.height - __reg6._height;
        }
        __reg6._parent.globalToLocal(__reg7);
        __reg6._x = __reg7.x;
        __reg6._y = __reg7.y;
        return __reg6;
    }
    ;
    __reg1.init = function (xml)
    {
        var __reg3 = this.createEmptyMovieClip("BG", 0);
        __reg3.onPress = function ()
        {
        }
        ;
        __reg3.useHandCursor = false;
        __reg3.tabEnabled = false;
        var __reg4 = 0;
        var __reg5 = 0;
        var __reg6 = 0;
        var __reg7 = 0;
        var __reg8 = [];
        var __reg9 = 1;
        var __reg10 = xml.firstChild;
        var __reg11 = false;
        if (__reg10) 
        {
            for (;;) 
            {
                __reg10 = __reg10.nextSibling;
                if (!__reg10) 
                {
                    break;
                }
                var __reg12 = __reg10.attributes;
                if (__reg12.visible != undefined && __reg12.visible == false) 
                {
                    continue;
                }
                if (__reg10.nodeName == "br") 
                {
                    __reg5 = __reg5 + __reg7;
                    __reg7 = __reg4 = 0;
                    continue;
                }
                if (__reg10.nodeName == "separator") 
                {
                    __reg5 = __reg5 + __reg7;
                    __reg7 = __reg4 = 0;
                    if (!__reg11) 
                    {
                        __reg5 = __reg5 + 4;
                        __reg8.push(__reg5);
                        __reg5 = __reg5 + 5;
                    }
                    __reg11 = true;
                    continue;
                }
                __reg11 = false;
                if (__reg12.type == "icons") 
                {
                    __reg7 = 0;
                    var __reg13 = 0;
                    var __reg14 = __reg10.firstChild;
                    var __reg15 = 0;
                    if (__reg14) 
                    {
                        for (;;) 
                        {
                            __reg14 = __reg14.nextSibling;
                            if (!__reg14) 
                            {
                                break;
                            }
                            if (__reg14.nodeName == "br") 
                            {
                                __reg7 = __reg7 + __reg15;
                                __reg15 = __reg13 = 0;
                            }
                            else 
                            {
                                var __reg16 = com.cegg.GPopupMenuItem.create(__reg14, __reg9, this, 1);
                                if (__reg15 < __reg16.cy) 
                                {
                                    __reg15 = __reg16.cy;
                                }
                                __reg16.noResize = true;
                                __reg16._x = __reg13;
                                __reg16._y = __reg5 + __reg7;
                                __reg13 = __reg13 + int(__reg14.attributes.width);
                                ++__reg9;
                            }
                        }
                    }
                    __reg7 = __reg7 + __reg15;
                }
                else if (__reg12.type == "color") 
                {
                    var __reg17 = this.createEmptyMovieClip(__reg9.toString(), __reg9);
                    __reg17.createEmptyMovieClip("frame", 0);
                    __reg17.cmd = __reg12.cmd.length ? __reg12.cmd : xml.attributes.name;
                    __reg17.bOver = false;
                    __reg17.value = 0;
                    __reg17.onRollOver = function ()
                    {
                        this.bOver = true;
                    }
                    ;
                    __reg17.onRollOut = function ()
                    {
                        this.bOver = false;
                        this.frame._visible = false;
                    }
                    ;
                    __reg17.onPress = function ()
                    {
                        this._parent.onCommand(this);
                    }
                    ;
                    __reg17.drawFrame = function (x, y)
                    {
                        var __reg4 = 0;
                        if (0 <= y && y < 6 * 2) 
                        {
                            if (y < 6) 
                            {
                                __reg4 = 16777215;
                            }
                        }
                        else if (y == 6 * 2) 
                        {
                            if (x < 6) 
                            {
                                __reg4 = 16777215;
                            }
                        }
                        else 
                        {
                            return undefined;
                        }
                        var __reg5 = this.frame;
                        with (__reg5)
                        {
                            _visible = true;
                            clear();
                            lineStyle(1, __reg4);
                            moveTo((x + 0) * 8, (y + 0) * 8);
                            lineTo((x + 0) * 8, (y + 1) * 8);
                            lineTo((x + 1) * 8, (y + 1) * 8);
                            lineTo((x + 1) * 8, (y + 0) * 8);
                            lineTo((x + 0) * 8, (y + 0) * 8);
                        }
                    }
                    ;
                    var __reg18 = com.cegg.LColor.fromString(this[__reg9 - 1].text);
                    var __reg19 = this[__reg9 - 1].text.length == 0;
                    var __reg20 = 0;
                    if (__reg20 < 6 * 2) 
                    {
                        for (;;) 
                        {
                            ++__reg20;
                            if (__reg20 >= 6 * 2) 
                            {
                                break;
                            }
                            var __reg21 = 0;
                            if (__reg21 < 6 * 3) 
                            {
                                for (;;) 
                                {
                                    ++__reg21;
                                    if (__reg21 >= 6 * 3) 
                                    {
                                        break;
                                    }
                                    var __reg22 = 51 * (__reg21 % 6) | 13056 * (__reg20 % 6) | 3342336 * (int(__reg20 / 6) * 3 + int(__reg21 / 6));
                                    __reg17.beginFill(__reg22, 100);
                                    __reg17.moveTo((__reg21 + 0) * 8, (__reg20 + 0) * 8);
                                    __reg17.lineTo((__reg21 + 0) * 8, (__reg20 + 1) * 8);
                                    __reg17.lineTo((__reg21 + 1) * 8, (__reg20 + 1) * 8);
                                    __reg17.lineTo((__reg21 + 1) * 8, (__reg20 + 0) * 8);
                                    __reg17.endFill();
                                    if (!__reg19 && __reg18 == __reg22) 
                                    {
                                        __reg19 = true;
                                        __reg17.drawFrame(__reg21, __reg20);
                                    }
                                }
                            }
                        }
                    }
                    var __reg23 = 6 * 2;
                    var __reg24 = 0;
                    if (__reg24 < 6 * 3) 
                    {
                        for (;;) 
                        {
                            ++__reg24;
                            if (__reg24 >= 6 * 3) 
                            {
                                break;
                            }
                            var __reg25 = 1 <= __reg24 && __reg24 <= 15 ? 1118481 * (__reg24 - 1 & 15) : (__reg24 ? 16777215 : 0);
                            __reg17.beginFill(__reg25, 100);
                            __reg17.moveTo((__reg24 + 0) * 8, (__reg23 + 0) * 8);
                            __reg17.lineTo((__reg24 + 0) * 8, (__reg23 + 1) * 8);
                            __reg17.lineTo((__reg24 + 1) * 8, (__reg23 + 1) * 8);
                            __reg17.lineTo((__reg24 + 1) * 8, (__reg23 + 0) * 8);
                            __reg17.endFill();
                            if (!__reg19 && __reg18 == __reg25) 
                            {
                                __reg19 = true;
                                __reg17.drawFrame(__reg24, __reg23);
                            }
                        }
                    }
                    __reg17.onMouseMove = function ()
                    {
                        if (this.bOver) 
                        {
                            var __reg2 = int(this._xmouse / 8);
                            var __reg3 = int(this._ymouse / 8);
                            if (__reg2 < 0 || 6 * 3 <= __reg2) 
                            {
                                return undefined;
                            }
                            var __reg4 = 0;
                            if (0 <= __reg3 && __reg3 < 6 * 2) 
                            {
                                __reg4 = 51 * (__reg2 % 6) | 13056 * (__reg3 % 6) | 3342336 * (int(__reg3 / 6) * 3 + int(__reg2 / 6));
                            }
                            else if (__reg3 == 6 * 2) 
                            {
                                __reg4 = 1 <= __reg2 && __reg2 <= 15 ? 1118481 * (__reg2 - 1 & 15) : (__reg2 ? 16777215 : 0);
                            }
                            else 
                            {
                                return undefined;
                            }
                            this.drawFrame(__reg2, __reg3);
                            this.value = com.cegg.LColor.toString6(__reg4);
                        }
                    }
                    ;
                    __reg17._x = 2;
                    __reg17._y = 2 + __reg5;
                    ++__reg9;
                    if (__reg6 < __reg17._width + 4) 
                    {
                        __reg6 = __reg17._width + 4;
                    }
                    if (__reg7 < __reg17._height + 4) 
                    {
                        __reg7 = __reg17._height + 4;
                    }
                }
                else if (__reg12.type == "input") 
                {
                    this.createTextField(__reg9.toString(), __reg9, 6, 2 + __reg5, 0, 0);
                    var __reg26 = this[__reg9];
                    __reg26.cmd = __reg12.cmd.length ? __reg12.cmd : xml.attributes.name;
                    __reg26.text = " ";
                    __reg26.autoSize = "left";
                    var __reg27 = __reg26._height;
                    __reg26.autoSize = "none";
                    __reg26.text = __reg12.disp;
                    __reg26._height = __reg27;
                    __reg26.type = "input";
                    __reg26.border = true;
                    __reg26.borderColor = 13421772;
                    __reg26.setWidth = function (cx)
                    {
                        this._width = cx - this._x - 6;
                    }
                    ;
                    if (__reg12.restrict != undefined) 
                    {
                        __reg26.restrict = __reg12.restrict;
                    }
                    if (__reg7 < __reg26._height + 5) 
                    {
                        __reg7 = __reg26._height + 5;
                    }
                    ++__reg9;
                }
                else 
                {
                    var __reg28 = com.cegg.GPopupMenuItem.create(__reg10, __reg9, this, 5.80000019073);
                    __reg28._x = __reg4;
                    __reg28._y = __reg5;
                    if (__reg7 < __reg28.cy) 
                    {
                        __reg7 = __reg28.cy;
                    }
                    __reg4 = __reg4 + __reg28._width;
                    ++__reg9;
                }
            }
        }
        __reg5 = __reg5 + __reg7;
        if (__reg6 < this._width - 2) 
        {
            __reg6 = this._width - 2;
        }
        for (var i in this) 
        {
            if (this[i].getDepth() < 1) 
            {
                continue;
            }
            if (this[i].noResize) 
            {
                continue;
            }
            this[i].setWidth(__reg6 - this[i]._x);
        }
        com.cegg.LGraphics.drawFrame(__reg3, 0, 0, __reg6, __reg5, 16777215);
        com.cegg.LGraphics.drawShadow(__reg3, 0, 0, __reg6, __reg5);
        __reg3.lineStyle(1, 13421772, 100);
        for (;;) 
        {
            if (!__reg8.length) 
            {
                return;
            }
            __reg5 = int(__reg8.shift());
            __reg3.moveTo(4, __reg5);
            __reg3.lineTo(__reg6 - 4, __reg5);
        }
    }
    ;
    __reg1.onCommand = function (msg, xmsg)
    {
        if (this._parent == com.cegg.GPopupMenu._rootView) 
        {
            if ((__reg0 = msg.cmd) === "EscapeDown") 
            {
                this.onCommand({cmd: "CANCEL"});
            }
            else if (__reg0 !== "EscapeUp") 
            {
                Selection.setFocus(null);
                if (msg.cmd != "CANCEL") 
                {
                    this.commandHandler.onCommand(msg, xmsg);
                }
                this.removeMovieClip();
            }
            return;
        }
        this._parent.onCommand(msg, xmsg);
    }
    ;
    __reg1.onMouseDown = function ()
    {
        if (this._parent == com.cegg.GPopupMenu._rootView) 
        {
            if (this.hitTest(_root._xmouse, _root._ymouse, true)) 
            {
                return undefined;
            }
            this.onCommand({cmd: "CANCEL"});
        }
    }
    ;
    __reg1.onKeyDown = function ()
    {
        if (Key.getCode() == Key.ENTER) 
        {
            var __reg2 = Selection.getFocus();
            var __reg3 = eval(__reg2);
            if (__reg3.text != undefined) 
            {
                if (__reg3.cmd.length) 
                {
                    Selection.setFocus(null);
                    this.onCommand({cmd: __reg3.cmd, value: __reg3.text});
                }
            }
        }
    }
    ;
    __reg1.onResize = function ()
    {
        this.onCommand({cmd: "CANCEL"});
    }
    ;
    ASSetPropFlags(__reg1, null, 1);
    __reg0.SymbolName = "__Packages.com.cegg.GPopupMenu";
    __reg0.SymbolOwner = com.cegg.GPopupMenu;
    __reg0.SymbolLinked = Object.registerClass(com.cegg.GPopupMenu.SymbolName, com.cegg.GPopupMenu.SymbolOwner);
    __reg0._rootView = _root;
    __reg1.commandHandler = undefined;
}#endinitclip

//子图形 41
//  初始化剪辑
#initclip 0

if (!com.cegg.game.mahjong.LogViewer) 
{
    if (!com) 
    {
        _global.com = new Object();
    }
    if (!com.cegg) 
    {
        _global.com.cegg = new Object();
    }
    if (!com.cegg.game) 
    {
        _global.com.cegg.game = new Object();
    }
    if (!com.cegg.game.mahjong) 
    {
        _global.com.cegg.game.mahjong = new Object();
    }
    (_global.com.cegg.game.mahjong.LogViewer = function ()
    {
        super();
        this.targetWho = 0;
        this.targetScene = -1;
        this.speed = 0;
        this.noclick = true;
        this.bTehaiOpen = com.cegg.game.mahjong.SaveData.f0_logvw_tehaiopen;
        this.bShowUname = !com.cegg.game.mahjong.SaveData.f0_logvw_forceanonymous;
        this.lastTsumo136 = 255;
        this.uname = ["", "", "", ""];
        var __reg3 = (new XML("<menu><br/></menu>")).firstChild;
        var __reg4 = 0;
        com.cegg.GButton.createTextButton("WHO", "Player", __reg4++, this, __reg3);
        com.cegg.GButton.createTextButton("SCENE", "Scene", __reg4++, this, __reg3);
        if (com.cegg.game.mahjong.UtilBase.bPremiumVersion) 
        {
            com.cegg.GButton.createTextButton("STEP", "Step", __reg4++, this, __reg3);
        }
        com.cegg.GButton.createTextButton("BACK", "Back", __reg4++, this);
        this.WHO._y = this.SCENE._y = this.BACK._y = Stage.height - 20;
        if (this.STEP) 
        {
            this.STEP._y = this.SCENE._y;
        }
        if (_root.log == undefined) 
        {
            com.cegg.GButton.createTextButton("EXIT", "Exit", __reg4++, this);
            this.EXIT._y = this.SCENE._y;
            this.WHO._x = this.EXIT._width + 2;
        }
        this.SCENE._x = this.WHO._x + this.WHO._width;
        if (this.STEP) 
        {
            this.STEP.setEnable(false);
            this.STEP._x = this.SCENE._x + this.SCENE._width;
            this.BACK._x = this.STEP._x + this.STEP._width + 2;
        }
        else 
        {
            this.BACK._x = this.SCENE._x + this.SCENE._width + 2;
        }
        this.EXIT.setEnable(false);
        this.WHO.setEnable(false);
        this.SCENE.setEnable(false);
        this.BACK.setEnable(false);
        var _this = this;
        this.xml = new XML();
        this.xml.ignoreWhite = true;
        this.xml.onLoad = function (ok)
        {
            _this.onLoadXML(ok);
        }
        ;
        this.xml.load(com.cegg.game.mahjong.UtilBase.resolveAsLogDownloadURL("0/log/?" + com.cegg.game.mahjong.Util.logDecode(this.log)));
    }
    ).prototype.__proto__ = MovieClip.prototype;
    __reg0.prototype.__constructor__ = MovieClip;
    var __reg1 = __reg0.prototype;
    __reg1.onLoad = function ()
    {
        Key.addListener(this);
    }
    ;
    __reg1.onUnload = function ()
    {
        Key.removeListener(this);
    }
    ;
    __reg1.removeMovieClip = function ()
    {
        this.onUnload();
        super.removeMovieClip();
    }
    ;
    __reg1.onLoadXML = function (ok)
    {
        this.EXIT.setEnable(true);
        this.WHO.setEnable(true);
        this.SCENE.setEnable(true);
        this.BACK.setEnable(true);
        if (!ok) 
        {
            com.cegg.GDialog.messageBox(this, com.cegg.game.mahjong.Res.T_ERRTXT.E2003);
            return undefined;
        }
        var __reg3 = true;
        if (this.tw != undefined) 
        {
            var __reg4 = com.cegg.game.mahjong.LogManager.getLogArray();
            var __reg5 = 0;
            if (__reg5 < __reg4.length) 
            {
                for (;;) 
                {
                    ++__reg5;
                    if (__reg5 >= __reg4.length) 
                    {
                        break;
                    }
                    if (__reg4[__reg5].file == this.log) 
                    {
                        break;
                    }
                }
            }
            __reg3 = __reg5 == __reg4.length;
        }
        if (__reg3) 
        {
            this.renameXML(true);
        }
        this.n = this.xml.firstChild.firstChild;
        if (this.n.nodeName != "GO") 
        {
            for (;;) 
            {
                this.n = this.n.nextSibling;
                if (this.n.nodeName == "GO") 
                {
                    break;
                }
            }
        }
        var __reg6 = int(this.n.attributes.type);
        var __reg7 = int(this.n.attributes.lobby);
        if (this.n.nodeName != "UN") 
        {
            for (;;) 
            {
                this.n = this.n.nextSibling;
                if (this.n.nodeName == "UN") 
                {
                    break;
                }
            }
        }
        this.uname = [this.n.attributes.n0, this.n.attributes.n1, this.n.attributes.n2, this.n.attributes.n3];
        var __reg8 = this.n.attributes.dan.split(",");
        var __reg9 = this.n.attributes.rate.split(",");
        var __reg10 = this.n.attributes.rc.split(",");
        var __reg11 = this.n.attributes.gold.split(",");
        if (this.n.nodeName == "TAIKYOKU") 
        {
            for (;;) 
            {
                this.n = this.n.nextSibling;
                if (this.n.nodeName != "TAIKYOKU") 
                {
                    break;
                }
            }
        }
        var __reg13 = "";
        var __reg14 = 0;
        if (this.n) 
        {
            for (;;) 
            {
                this.n = this.n.nextSibling;
                if (!this.n) 
                {
                    break;
                }
                if ((__reg0 = this.n.nodeName) === "INIT") 
                {
                    var __reg16 = this.n.attributes.seed.split(",");
                    var __reg15 = "<item cmd=\"SCENE\" scene=\"" + __reg14 + "\" disp=\"" + com.cegg.game.mahjong.Res.T_KYOKUBA[__reg16[0] % com.cegg.game.mahjong.Res.T_KYOKUBA.length] + " " + __reg16[1] + com.cegg.game.mahjong.Res.T_HONBA + " ";
                    ++__reg14;
                }
                else if (__reg0 === "RYUUKYOKU") 
                {
                    __reg13 = __reg13 + (__reg15 + com.cegg.game.mahjong.Res.T_RYUUKYOKU);
                    if (this.n.attributes.type.length) 
                    {
                        __reg13 = __reg13 + ("(" + com.cegg.game.mahjong.Res.T_RYUUKYOKUTYPE[this.n.attributes.type] + ")");
                    }
                    __reg13 = __reg13 + "\"/><br/>";
                }
                else if (__reg0 === "AGARI") 
                {
                    var __reg17 = this.n.attributes;
                    __reg13 = __reg13 + (__reg15 + (__reg17.who == __reg17.fromWho ? com.cegg.game.mahjong.Res.T_TSUMO : com.cegg.game.mahjong.Res.T_RON) + " " + __reg17.ten.split(",")[1] + " \'" + this.uname[__reg17.who] + "\'");
                    if (__reg17.who != __reg17.fromWho) 
                    {
                        __reg13 = __reg13 + ("   " + com.cegg.game.mahjong.Res.T_HOUJUU + " \'" + this.uname[__reg17.fromWho] + "\'");
                    }
                    __reg13 = __reg13 + "\"/><br/>";
                }
                if (this.n.attributes.owari != undefined) 
                {
                    var __reg12 = this.n.attributes.owari.split(",");
                }
            }
        }
        if (__reg13.length > 0) 
        {
            this.SCENE.subMenu = (new XML("<menu>" + __reg13 + "</menu>")).firstChild;
        }
        var __reg18 = 0;
        if (__reg18 < __reg12.length) 
        {
            for (;;) 
            {
                ++__reg18;
                if (__reg18 >= __reg12.length) 
                {
                    break;
                }
                __reg12[__reg18] = Number(__reg12[__reg18]);
            }
        }
        var __reg19 = "";
        __reg19 = __reg19 + "<menu>";
        if (com.cegg.game.mahjong.UtilBase.bPremiumVersion) 
        {
            var __reg20 = [1, 2, 3, 4];
            var __reg21 = [0, 1, 2, 3];
            var __reg22 = this.uname[0].length > 0 && (this.uname[1].length > 0 && (this.uname[2].length > 0 && this.uname[3].length > 0)) ? 4 : 3;
            var __reg23 = 1;
            if (__reg23 < __reg22) 
            {
                for (;;) 
                {
                    ++__reg23;
                    if (__reg23 >= __reg22) 
                    {
                        break;
                    }
                    if (int(__reg12[__reg21[__reg23 - 1] * 2 + 1]) < int(__reg12[__reg21[__reg23] * 2 + 1])) 
                    {
                        var __reg24 = __reg21[__reg23];
                        __reg21[__reg23] = __reg21[__reg23 - 1];
                        __reg21[__reg23 - 1] = __reg24;
                        __reg23 = 0;
                    }
                }
            }
            __reg20[__reg21[0]] = 1;
            __reg20[__reg21[1]] = 2;
            __reg20[__reg21[2]] = 3;
            __reg20[__reg21[3]] = 4;
            var __reg25 = com.cegg.game.mahjong.Res.GameTypeToProfIndex(__reg7 == 0 ? __reg6 : __reg6 & com.cegg.game.mahjong.Res.GT_SANMA);
            var __reg26 = ["", "", "", ""];
            if (__reg10.length == 4) 
            {
                if (int(__reg10[0])) 
                {
                    __reg26[0] = " " + com.cegg.game.mahjong.Util.RatingClassDisp(__reg10[0], "");
                }
                if (int(__reg10[1])) 
                {
                    __reg26[1] = " " + com.cegg.game.mahjong.Util.RatingClassDisp(__reg10[1], "");
                }
                if (int(__reg10[2])) 
                {
                    __reg26[2] = " " + com.cegg.game.mahjong.Util.RatingClassDisp(__reg10[2], "");
                }
                if (int(__reg10[3])) 
                {
                    __reg26[3] = " " + com.cegg.game.mahjong.Util.RatingClassDisp(__reg10[3], "");
                }
            }
            if (__reg11.length == 4) 
            {
                if (int(__reg11[0])) 
                {
                    __reg26[0] = " " + com.cegg.game.mahjong.Util.GoldToClass(__reg11[0]);
                }
                if (int(__reg11[1])) 
                {
                    __reg26[1] = " " + com.cegg.game.mahjong.Util.GoldToClass(__reg11[1]);
                }
                if (int(__reg11[2])) 
                {
                    __reg26[2] = " " + com.cegg.game.mahjong.Util.GoldToClass(__reg11[2]);
                }
                if (int(__reg11[3])) 
                {
                    __reg26[3] = " " + com.cegg.game.mahjong.Util.GoldToClass(__reg11[3]);
                }
            }
            if (__reg3) 
            {
                if (__reg9.length == 4 && __reg12.length == 16) 
                {
                    if (this.uname[0].length > 0) 
                    {
                        __reg19 = __reg19 + ("<item disp=\"" + this.uname[0] + " (" + com.cegg.game.mahjong.Res.T_DANDISP[__reg8[0]] + "R" + com.cegg.game.mahjong.Res.RatingConvFronProfIndex(__reg25, __reg9[0]) + __reg26[0] + ") " + __reg20[0] + com.cegg.game.mahjong.Res.T_PROF_I + "(" + com.cegg.game.mahjong.Util.ffmt(__reg12[0 * 2 + 1], 1, false, "%2B") + "," + com.cegg.game.mahjong.Util.ffmt(__reg12[8 + 0 * 2 + 0], 0, false, "%2B") + com.cegg.game.mahjong.Res.T_MAI + ")\" cmd=\"WHO\" who=\"0\"/><br/>");
                    }
                    if (this.uname[1].length > 0) 
                    {
                        __reg19 = __reg19 + ("<item disp=\"" + this.uname[1] + " (" + com.cegg.game.mahjong.Res.T_DANDISP[__reg8[1]] + "R" + com.cegg.game.mahjong.Res.RatingConvFronProfIndex(__reg25, __reg9[1]) + __reg26[1] + ") " + __reg20[1] + com.cegg.game.mahjong.Res.T_PROF_I + "(" + com.cegg.game.mahjong.Util.ffmt(__reg12[1 * 2 + 1], 1, false, "%2B") + "," + com.cegg.game.mahjong.Util.ffmt(__reg12[8 + 1 * 2 + 0], 0, false, "%2B") + com.cegg.game.mahjong.Res.T_MAI + ")\" cmd=\"WHO\" who=\"1\"/><br/>");
                    }
                    if (this.uname[2].length > 0) 
                    {
                        __reg19 = __reg19 + ("<item disp=\"" + this.uname[2] + " (" + com.cegg.game.mahjong.Res.T_DANDISP[__reg8[2]] + "R" + com.cegg.game.mahjong.Res.RatingConvFronProfIndex(__reg25, __reg9[2]) + __reg26[2] + ") " + __reg20[2] + com.cegg.game.mahjong.Res.T_PROF_I + "(" + com.cegg.game.mahjong.Util.ffmt(__reg12[2 * 2 + 1], 1, false, "%2B") + "," + com.cegg.game.mahjong.Util.ffmt(__reg12[8 + 2 * 2 + 0], 0, false, "%2B") + com.cegg.game.mahjong.Res.T_MAI + ")\" cmd=\"WHO\" who=\"2\"/><br/>");
                    }
                    if (this.uname[3].length > 0) 
                    {
                        __reg19 = __reg19 + ("<item disp=\"" + this.uname[3] + " (" + com.cegg.game.mahjong.Res.T_DANDISP[__reg8[3]] + "R" + com.cegg.game.mahjong.Res.RatingConvFronProfIndex(__reg25, __reg9[3]) + __reg26[3] + ") " + __reg20[3] + com.cegg.game.mahjong.Res.T_PROF_I + "(" + com.cegg.game.mahjong.Util.ffmt(__reg12[3 * 2 + 1], 1, false, "%2B") + "," + com.cegg.game.mahjong.Util.ffmt(__reg12[8 + 3 * 2 + 0], 0, false, "%2B") + com.cegg.game.mahjong.Res.T_MAI + ")\" cmd=\"WHO\" who=\"3\"/><br/>");
                    }
                }
                else if (__reg9.length == 4) 
                {
                    if (this.uname[0].length > 0) 
                    {
                        __reg19 = __reg19 + ("<item disp=\"" + this.uname[0] + " (" + com.cegg.game.mahjong.Res.T_DANDISP[__reg8[0]] + "R" + com.cegg.game.mahjong.Res.RatingConvFronProfIndex(__reg25, __reg9[0]) + __reg26[0] + ") " + __reg20[0] + com.cegg.game.mahjong.Res.T_PROF_I + "(" + com.cegg.game.mahjong.Util.ffmt(__reg12[0 * 2 + 1], 1, false, "%2B") + ")\" cmd=\"WHO\" who=\"0\"/><br/>");
                    }
                    if (this.uname[1].length > 0) 
                    {
                        __reg19 = __reg19 + ("<item disp=\"" + this.uname[1] + " (" + com.cegg.game.mahjong.Res.T_DANDISP[__reg8[1]] + "R" + com.cegg.game.mahjong.Res.RatingConvFronProfIndex(__reg25, __reg9[1]) + __reg26[1] + ") " + __reg20[1] + com.cegg.game.mahjong.Res.T_PROF_I + "(" + com.cegg.game.mahjong.Util.ffmt(__reg12[1 * 2 + 1], 1, false, "%2B") + ")\" cmd=\"WHO\" who=\"1\"/><br/>");
                    }
                    if (this.uname[2].length > 0) 
                    {
                        __reg19 = __reg19 + ("<item disp=\"" + this.uname[2] + " (" + com.cegg.game.mahjong.Res.T_DANDISP[__reg8[2]] + "R" + com.cegg.game.mahjong.Res.RatingConvFronProfIndex(__reg25, __reg9[2]) + __reg26[2] + ") " + __reg20[2] + com.cegg.game.mahjong.Res.T_PROF_I + "(" + com.cegg.game.mahjong.Util.ffmt(__reg12[2 * 2 + 1], 1, false, "%2B") + ")\" cmd=\"WHO\" who=\"2\"/><br/>");
                    }
                    if (this.uname[3].length > 0) 
                    {
                        __reg19 = __reg19 + ("<item disp=\"" + this.uname[3] + " (" + com.cegg.game.mahjong.Res.T_DANDISP[__reg8[3]] + "R" + com.cegg.game.mahjong.Res.RatingConvFronProfIndex(__reg25, __reg9[3]) + __reg26[3] + ") " + __reg20[3] + com.cegg.game.mahjong.Res.T_PROF_I + "(" + com.cegg.game.mahjong.Util.ffmt(__reg12[3 * 2 + 1], 1, false, "%2B") + ")\" cmd=\"WHO\" who=\"3\"/><br/>");
                    }
                }
                else 
                {
                    if (this.uname[0].length > 0) 
                    {
                        __reg19 = __reg19 + ("<item disp=\"" + this.uname[0] + " (" + com.cegg.game.mahjong.Res.T_DANDISP[__reg8[0]] + ") " + __reg20[0] + com.cegg.game.mahjong.Res.T_PROF_I + "(" + com.cegg.game.mahjong.Util.ffmt(__reg12[0 * 2 + 1], 1, false, "%2B") + ")\" cmd=\"WHO\" who=\"0\"/><br/>");
                    }
                    if (this.uname[1].length > 0) 
                    {
                        __reg19 = __reg19 + ("<item disp=\"" + this.uname[1] + " (" + com.cegg.game.mahjong.Res.T_DANDISP[__reg8[1]] + ") " + __reg20[1] + com.cegg.game.mahjong.Res.T_PROF_I + "(" + com.cegg.game.mahjong.Util.ffmt(__reg12[1 * 2 + 1], 1, false, "%2B") + ")\" cmd=\"WHO\" who=\"1\"/><br/>");
                    }
                    if (this.uname[2].length > 0) 
                    {
                        __reg19 = __reg19 + ("<item disp=\"" + this.uname[2] + " (" + com.cegg.game.mahjong.Res.T_DANDISP[__reg8[2]] + ") " + __reg20[2] + com.cegg.game.mahjong.Res.T_PROF_I + "(" + com.cegg.game.mahjong.Util.ffmt(__reg12[2 * 2 + 1], 1, false, "%2B") + ")\" cmd=\"WHO\" who=\"2\"/><br/>");
                    }
                    if (this.uname[3].length > 0) 
                    {
                        __reg19 = __reg19 + ("<item disp=\"" + this.uname[3] + " (" + com.cegg.game.mahjong.Res.T_DANDISP[__reg8[3]] + ") " + __reg20[3] + com.cegg.game.mahjong.Res.T_PROF_I + "(" + com.cegg.game.mahjong.Util.ffmt(__reg12[3 * 2 + 1], 1, false, "%2B") + ")\" cmd=\"WHO\" who=\"3\"/><br/>");
                    }
                }
            }
            else if (__reg9.length == 4 && __reg12.length == 16) 
            {
                if (this.uname[0].length > 0) 
                {
                    __reg19 = __reg19 + ("<item disp=\"A: " + this.uname[0] + " (" + com.cegg.game.mahjong.Res.T_DANDISP[__reg8[0]] + "R" + com.cegg.game.mahjong.Res.RatingConvFronProfIndex(__reg25, __reg9[0]) + __reg26[0] + ") " + __reg20[0] + com.cegg.game.mahjong.Res.T_PROF_I + "(" + com.cegg.game.mahjong.Util.ffmt(__reg12[0 * 2 + 1], 1, false, "%2B") + "," + com.cegg.game.mahjong.Util.ffmt(__reg12[8 + 0 * 2 + 0], 0, false, "%2B") + com.cegg.game.mahjong.Res.T_MAI + ")\" cmd=\"WHO\" who=\"0\"/><br/>");
                }
                if (this.uname[1].length > 0) 
                {
                    __reg19 = __reg19 + ("<item disp=\"B: " + this.uname[1] + " (" + com.cegg.game.mahjong.Res.T_DANDISP[__reg8[1]] + "R" + com.cegg.game.mahjong.Res.RatingConvFronProfIndex(__reg25, __reg9[1]) + __reg26[1] + ") " + __reg20[1] + com.cegg.game.mahjong.Res.T_PROF_I + "(" + com.cegg.game.mahjong.Util.ffmt(__reg12[1 * 2 + 1], 1, false, "%2B") + "," + com.cegg.game.mahjong.Util.ffmt(__reg12[8 + 1 * 2 + 0], 0, false, "%2B") + com.cegg.game.mahjong.Res.T_MAI + ")\" cmd=\"WHO\" who=\"1\"/><br/>");
                }
                if (this.uname[2].length > 0) 
                {
                    __reg19 = __reg19 + ("<item disp=\"C: " + this.uname[2] + " (" + com.cegg.game.mahjong.Res.T_DANDISP[__reg8[2]] + "R" + com.cegg.game.mahjong.Res.RatingConvFronProfIndex(__reg25, __reg9[2]) + __reg26[2] + ") " + __reg20[2] + com.cegg.game.mahjong.Res.T_PROF_I + "(" + com.cegg.game.mahjong.Util.ffmt(__reg12[2 * 2 + 1], 1, false, "%2B") + "," + com.cegg.game.mahjong.Util.ffmt(__reg12[8 + 2 * 2 + 0], 0, false, "%2B") + com.cegg.game.mahjong.Res.T_MAI + ")\" cmd=\"WHO\" who=\"2\"/><br/>");
                }
                if (this.uname[3].length > 0) 
                {
                    __reg19 = __reg19 + ("<item disp=\"D: " + this.uname[3] + " (" + com.cegg.game.mahjong.Res.T_DANDISP[__reg8[3]] + "R" + com.cegg.game.mahjong.Res.RatingConvFronProfIndex(__reg25, __reg9[3]) + __reg26[3] + ") " + __reg20[3] + com.cegg.game.mahjong.Res.T_PROF_I + "(" + com.cegg.game.mahjong.Util.ffmt(__reg12[3 * 2 + 1], 1, false, "%2B") + "," + com.cegg.game.mahjong.Util.ffmt(__reg12[8 + 3 * 2 + 0], 0, false, "%2B") + com.cegg.game.mahjong.Res.T_MAI + ")\" cmd=\"WHO\" who=\"3\"/><br/>");
                }
            }
            else if (__reg9.length == 4) 
            {
                if (this.uname[0].length > 0) 
                {
                    __reg19 = __reg19 + ("<item disp=\"A: " + this.uname[0] + " (" + com.cegg.game.mahjong.Res.T_DANDISP[__reg8[0]] + "R" + com.cegg.game.mahjong.Res.RatingConvFronProfIndex(__reg25, __reg9[0]) + __reg26[0] + ") " + __reg20[0] + com.cegg.game.mahjong.Res.T_PROF_I + "(" + com.cegg.game.mahjong.Util.ffmt(__reg12[0 * 2 + 1], 1, false, "%2B") + ")\" cmd=\"WHO\" who=\"0\"/><br/>");
                }
                if (this.uname[1].length > 0) 
                {
                    __reg19 = __reg19 + ("<item disp=\"B: " + this.uname[1] + " (" + com.cegg.game.mahjong.Res.T_DANDISP[__reg8[1]] + "R" + com.cegg.game.mahjong.Res.RatingConvFronProfIndex(__reg25, __reg9[1]) + __reg26[1] + ") " + __reg20[1] + com.cegg.game.mahjong.Res.T_PROF_I + "(" + com.cegg.game.mahjong.Util.ffmt(__reg12[1 * 2 + 1], 1, false, "%2B") + ")\" cmd=\"WHO\" who=\"1\"/><br/>");
                }
                if (this.uname[2].length > 0) 
                {
                    __reg19 = __reg19 + ("<item disp=\"C: " + this.uname[2] + " (" + com.cegg.game.mahjong.Res.T_DANDISP[__reg8[2]] + "R" + com.cegg.game.mahjong.Res.RatingConvFronProfIndex(__reg25, __reg9[2]) + __reg26[2] + ") " + __reg20[2] + com.cegg.game.mahjong.Res.T_PROF_I + "(" + com.cegg.game.mahjong.Util.ffmt(__reg12[2 * 2 + 1], 1, false, "%2B") + ")\" cmd=\"WHO\" who=\"2\"/><br/>");
                }
                if (this.uname[3].length > 0) 
                {
                    __reg19 = __reg19 + ("<item disp=\"D: " + this.uname[3] + " (" + com.cegg.game.mahjong.Res.T_DANDISP[__reg8[3]] + "R" + com.cegg.game.mahjong.Res.RatingConvFronProfIndex(__reg25, __reg9[3]) + __reg26[3] + ") " + __reg20[3] + com.cegg.game.mahjong.Res.T_PROF_I + "(" + com.cegg.game.mahjong.Util.ffmt(__reg12[3 * 2 + 1], 1, false, "%2B") + ")\" cmd=\"WHO\" who=\"3\"/><br/>");
                }
            }
            else 
            {
                if (this.uname[0].length > 0) 
                {
                    __reg19 = __reg19 + ("<item disp=\"A: " + this.uname[0] + " (" + com.cegg.game.mahjong.Res.T_DANDISP[__reg8[0]] + ") " + __reg20[0] + com.cegg.game.mahjong.Res.T_PROF_I + "(" + com.cegg.game.mahjong.Util.ffmt(__reg12[0 * 2 + 1], 1, false, "%2B") + ")\" cmd=\"WHO\" who=\"0\"/><br/>");
                }
                if (this.uname[1].length > 0) 
                {
                    __reg19 = __reg19 + ("<item disp=\"B: " + this.uname[1] + " (" + com.cegg.game.mahjong.Res.T_DANDISP[__reg8[1]] + ") " + __reg20[1] + com.cegg.game.mahjong.Res.T_PROF_I + "(" + com.cegg.game.mahjong.Util.ffmt(__reg12[1 * 2 + 1], 1, false, "%2B") + ")\" cmd=\"WHO\" who=\"1\"/><br/>");
                }
                if (this.uname[2].length > 0) 
                {
                    __reg19 = __reg19 + ("<item disp=\"C: " + this.uname[2] + " (" + com.cegg.game.mahjong.Res.T_DANDISP[__reg8[2]] + ") " + __reg20[2] + com.cegg.game.mahjong.Res.T_PROF_I + "(" + com.cegg.game.mahjong.Util.ffmt(__reg12[2 * 2 + 1], 1, false, "%2B") + ")\" cmd=\"WHO\" who=\"2\"/><br/>");
                }
                if (this.uname[3].length > 0) 
                {
                    __reg19 = __reg19 + ("<item disp=\"D: " + this.uname[3] + " (" + com.cegg.game.mahjong.Res.T_DANDISP[__reg8[3]] + ") " + __reg20[3] + com.cegg.game.mahjong.Res.T_PROF_I + "(" + com.cegg.game.mahjong.Util.ffmt(__reg12[3 * 2 + 1], 1, false, "%2B") + ")\" cmd=\"WHO\" who=\"3\"/><br/>");
                }
            }
            __reg19 = __reg19 + "<separator/>";
            __reg19 = __reg19 + ("<item disp=\"" + com.cegg.game.mahjong.Res.T_LOGTEHAIOPEN + "\" cmd=\"TEHAIOPEN\" /><br/>");
            __reg19 = __reg19 + ("<item disp=\"" + com.cegg.game.mahjong.Res.T_LOGTSUMOGIRIASGRAY + "\" cmd=\"TSUMOGIRIASGRAY\" /><br/>");
            if (!__reg3) 
            {
                __reg19 = __reg19 + ("<item disp=\"" + com.cegg.game.mahjong.Res.T_LOGFORCEANONYMOUS + "\" cmd=\"FORCEANONYMOUS\" /><br/>");
            }
        }
        else 
        {
            if (this.uname[0].length > 0) 
            {
                __reg19 = __reg19 + ("<item disp=\"" + this.uname[0] + "\" cmd=\"WHO\" who=\"0\"/><br/>");
            }
            if (this.uname[1].length > 0) 
            {
                __reg19 = __reg19 + ("<item disp=\"" + this.uname[1] + "\" cmd=\"WHO\" who=\"1\"/><br/>");
            }
            if (this.uname[2].length > 0) 
            {
                __reg19 = __reg19 + ("<item disp=\"" + this.uname[2] + "\" cmd=\"WHO\" who=\"2\"/><br/>");
            }
            if (this.uname[3].length > 0) 
            {
                __reg19 = __reg19 + ("<item disp=\"" + this.uname[3] + "\" cmd=\"WHO\" who=\"3\"/><br/>");
            }
        }
        __reg19 = __reg19 + "</menu>";
        this.WHO.subMenu = (new XML(__reg19)).firstChild;
        this.targetWho = int(this.tw) % 4;
        com.cegg.game.mahjong.LogViewer.rotateXML(this.xml, this.targetWho);
        if (!__reg3 && !this.bShowUname) 
        {
            this.renameXML(true);
        }
        this.n = this.xml.firstChild.firstChild;
        this.tick();
        if (this.ts != undefined) 
        {
            this.onCommand({cmd: "SCENE", scene: int(this.ts)});
        }
    }
    ;
    __reg1.createStepMenu = function ()
    {
        var __reg2 = "";
        __reg2 = __reg2 + "<menu>";
        var __reg3 = this.n;
        if (__reg3.nodeName == "INIT") 
        {
            __reg3 = __reg3.nextSibling;
        }
        var __reg4 = 1;
        if (__reg3) 
        {
            for (;;) 
            {
                __reg3 = __reg3.nextSibling;
                if (!__reg3) 
                {
                    break;
                }
                if (__reg3.nodeName == "INIT") 
                {
                    break;
                }
                if (__reg3.nodeName.charCodeAt(0) == 84) 
                {
                    __reg2 = __reg2 + ("<item disp=\"" + __reg4 + com.cegg.game.mahjong.Res.T_JUNME + "\" cmd=\"STEP\" step=\"" + __reg4 + "\" /><br/>");
                    ++__reg4;
                }
                else if (__reg3.nodeName == "N") 
                {
                    if (__reg3.attributes.who != 0) 
                    {
                        continue;
                    }
                    var __reg5 = com.cegg.game.mahjong.Mentsu136.getNakiType(int(__reg3.attributes.m));
                    if (__reg5 != 1 && __reg5 != 3) 
                    {
                        continue;
                    }
                    __reg2 = __reg2 + ("<item disp=\"" + __reg4 + com.cegg.game.mahjong.Res.T_JUNME + "\" cmd=\"STEP\" step=\"" + __reg4 + "\" /><br/>");
                    ++__reg4;
                }
            }
        }
        __reg2 = __reg2 + ("<separator/>" + "<item disp=\"" + com.cegg.game.mahjong.Res.T_LOGAUTOPLAY + "\" cmd=\"AUTOPLAY\" /><br/>" + "</menu>");
        this.STEP.subMenu = (new XML(__reg2)).firstChild;
        this.STEP.setEnable(true);
    }
    ;
    __reg1.onCommand = function (msg)
    {
        if ((__reg0 = msg.cmd) === "WHO") 
        {
            if (this.targetScene == -1) 
            {
                this.targetScene = 0;
            }
            if (!this.n) 
            {
                this.n = this.xml.firstChild.lastChild;
            }
            this.n = com.cegg.game.mahjong.LogViewer.reinit_safe_rewitr(this.n, false);
            var __reg3 = 0;
            if (this.n && this.n.nodeName != "INIT") 
            {
                for (;;) 
                {
                    this.n = this.n.previousSibling;
                    if (!(this.n && this.n.nodeName != "INIT")) 
                    {
                        break;
                    }
                    ++__reg3;
                }
            }
            if (msg.who != undefined) 
            {
                com.cegg.game.mahjong.LogViewer.rotateXML(this.xml, (int(msg.who) - this.targetWho + 4) % 4);
                this.targetWho = int(msg.who);
            }
            this.init_itr(this.targetScene);
            if (__reg3) 
            {
                this.callback.onXMLNode((new XML(com.cegg.game.mahjong.LogViewerUtil.log2reinitXML(this.n, __reg3, this.bTehaiOpen))).firstChild);
                if (__reg3) 
                {
                    for (;;) 
                    {
                        --__reg3;
                        if (!__reg3) 
                        {
                            break;
                        }
                        this.n = this.n.nextSibling;
                    }
                }
                this.tick();
            }
            return;
        }
        else if (__reg0 === "SCENE") 
        {
            this.init_itr(int(msg.scene));
            this.tick();
            this.targetScene = int(msg.scene);
            return;
        }
        else if (__reg0 === "STEP") 
        {
            this.init_itr(this.targetScene);
            var __reg4 = int(msg.step);
            if (this.n && __reg4) 
            {
                for (;;) 
                {
                    this.n = this.n.nextSibling;
                    if (!(this.n && __reg4)) 
                    {
                        break;
                    }
                    if (this.n.nodeName.charCodeAt(0) == 84) 
                    {
                        --__reg4;
                    }
                    else if (this.n.nodeName == "N") 
                    {
                        if (this.n.attributes.who != 0) 
                        {
                            continue;
                        }
                        var __reg5 = com.cegg.game.mahjong.Mentsu136.getNakiType(int(this.n.attributes.m));
                        if (__reg5 != 1 && __reg5 != 3) 
                        {
                            continue;
                        }
                        --__reg4;
                    }
                }
            }
            this.onCommand({cmd: "REFRESH"});
            return;
        }
        else if (__reg0 === "BACK") 
        {
            if (this.targetScene == -1) 
            {
                this.init_itr(this.targetScene = 0);
            }
            if (!this.n) 
            {
                this.n = this.xml.firstChild.lastChild;
            }
            this.n = com.cegg.game.mahjong.LogViewer.reinit_safe_rewitr(this.n, msg.cmd == "BACK");
            var __reg6 = this.n;
            var __reg7 = 0;
            if (__reg6 && __reg6.nodeName != "INIT") 
            {
                for (;;) 
                {
                    __reg6 = __reg6.previousSibling;
                    if (!(__reg6 && __reg6.nodeName != "INIT")) 
                    {
                        break;
                    }
                    ++__reg7;
                }
            }
            this.callback.onXMLNode((new XML(com.cegg.game.mahjong.LogViewerUtil.log2reinitXML(__reg6, __reg7, this.bTehaiOpen))).firstChild);
            this.tick();
            return;
        }
        else if (__reg0 === "REFRESH") 
        {
            if (this.targetScene == -1) 
            {
                this.init_itr(this.targetScene = 0);
            }
            if (!this.n) 
            {
                this.n = this.xml.firstChild.lastChild;
            }
            this.n = com.cegg.game.mahjong.LogViewer.reinit_safe_rewitr(this.n, msg.cmd == "BACK");
            __reg6 = this.n;
            __reg7 = 0;
            if (__reg6 && __reg6.nodeName != "INIT") 
            {
                for (;;) 
                {
                    __reg6 = __reg6.previousSibling;
                    if (!(__reg6 && __reg6.nodeName != "INIT")) 
                    {
                        break;
                    }
                    ++__reg7;
                }
            }
            this.callback.onXMLNode((new XML(com.cegg.game.mahjong.LogViewerUtil.log2reinitXML(__reg6, __reg7, this.bTehaiOpen))).firstChild);
            this.tick();
            return;
        }
        else if (__reg0 === "TEHAIOPEN") 
        {
            this.bTehaiOpen = !this.bTehaiOpen;
            com.cegg.game.mahjong.SaveData.f0_logvw_tehaiopen = this.bTehaiOpen;
            com.cegg.game.mahjong.SaveData.save_f0();
            this.onCommand({cmd: "REFRESH"});
            return;
        }
        else if (__reg0 === "FORCEANONYMOUS") 
        {
            this.bShowUname = !this.bShowUname;
            com.cegg.game.mahjong.SaveData.f0_logvw_forceanonymous = !this.bShowUname;
            com.cegg.game.mahjong.SaveData.save_f0();
            this.renameXML(!this.bShowUname);
            this.onCommand({cmd: "WHO"});
            return;
        }
        else if (__reg0 === "AUTOPLAY") 
        {
            if (this.speed) 
            {
                this.speed = 0;
                this.BACK.setEnable(true);
            }
            else 
            {
                this.speed = 1;
                this.BACK.setEnable(false);
                this.intervalID = _global.setInterval(this, "tick", 100);
            }
            return;
        }
        else if (__reg0 === "TSUMOGIRIASGRAY") 
        {
            _root.Main.Game.bTsumogiriAsGray = !_root.Main.Game.bTsumogiriAsGray;
            com.cegg.game.mahjong.SaveData.f0_logvw_tsumogiriasgray = _root.Main.Game.bTsumogiriAsGray;
            com.cegg.game.mahjong.SaveData.save_f0();
            this.onCommand({cmd: "REFRESH"});
            return;
        }
        else if (__reg0 !== "EXIT") 
        {
            return;
        }
        _root.onCommand({cmd: "GOLOBBY"});
        return;
    }
    ;
    __reg1.init_itr = function (scene)
    {
        this.n = this.xml.firstChild.firstChild;
        while (this.n = this.n.nextSibling) 
        {
            if (this.n.nodeName == "UN") 
            {
                break;
            }
        }
        this.callback.onXMLNode(this.n);
        var __reg3 = scene + 1;
        if (__reg3) 
        {
            for (;;) 
            {
                --__reg3;
                if (!__reg3) 
                {
                    break;
                }
                while (this.n = this.n.nextSibling) 
                {
                    if (this.n.nodeName == "INIT") 
                    {
                        break;
                    }
                }
            }
        }
        if (this.STEP) 
        {
            this.createStepMenu();
        }
    }
    ;
    __reg0.reinit_safe_rewitr = function (n, ft)
    {
        var __reg4 = undefined;
        while (n) 
        {
            n = n.previousSibling;
            var __reg5 = n.nodeName;
            if (__reg5 == "INIT") 
            {
                return n.nextSibling;
            }
            if (__reg5 == "TAIKYOKU") 
            {
                return n.nextSibling.nextSibling;
            }
            if (__reg5 == "N" && com.cegg.game.mahjong.Mentsu136.isKan(n.attributes.m)) 
            {
                __reg4 = undefined;
            }
            var __reg6 = __reg5.charCodeAt(1);
            if (__reg5.length > 1 && (48 <= __reg6 && __reg6 <= 57)) 
            {
                __reg6 = __reg5.charCodeAt(0);
                if (68 <= __reg6 && (__reg6 <= 71 && __reg4 != undefined)) 
                {
                    break;
                }
                if (84 <= __reg6 && (__reg6 <= 87 && !ft)) 
                {
                    __reg4 = n;
                }
            }
            ft = false;
        }
        return __reg4;
    }
    ;
    __reg1.tick = function ()
    {
        if (this.intervalID != undefined) 
        {
            _global.clearInterval(this.intervalID);
            this.intervalID = undefined;
        }
        var __reg2 = true;
        if (__reg2 && this.n) 
        {
            var __reg3 = this.n;
            var __reg4 = this.n.nodeName.charCodeAt(1);
            if (this.n.nodeName.length == 1 || (48 <= __reg4 && __reg4 <= 57)) 
            {
                __reg4 = this.n.nodeName.charCodeAt(0);
                if ((__reg0 = __reg4) === 68) 
                {
                    if (this.speed) 
                    {
                        this.intervalID = _global.setInterval(this, "tick", 500 / this.speed);
                    }
                    this.noclick = false;
                    __reg2 = false;
                    if (__reg4 != 68 && (!this.bTehaiOpen && int(this.n.nodeName.substr(1)) == this.lastTsumo136)) 
                    {
                        __reg3 = (new XML("<" + String.fromCharCode(100 + __reg4 - 68) + this.n.nodeName.substr(1) + " />")).firstChild;
                    }
                }
                else if (__reg0 === 69) 
                {
                    if (this.speed) 
                    {
                        this.intervalID = _global.setInterval(this, "tick", 500 / this.speed);
                    }
                    this.noclick = false;
                    __reg2 = false;
                    if (__reg4 != 68 && (!this.bTehaiOpen && int(this.n.nodeName.substr(1)) == this.lastTsumo136)) 
                    {
                        __reg3 = (new XML("<" + String.fromCharCode(100 + __reg4 - 68) + this.n.nodeName.substr(1) + " />")).firstChild;
                    }
                }
                else if (__reg0 === 70) 
                {
                    if (this.speed) 
                    {
                        this.intervalID = _global.setInterval(this, "tick", 500 / this.speed);
                    }
                    this.noclick = false;
                    __reg2 = false;
                    if (__reg4 != 68 && (!this.bTehaiOpen && int(this.n.nodeName.substr(1)) == this.lastTsumo136)) 
                    {
                        __reg3 = (new XML("<" + String.fromCharCode(100 + __reg4 - 68) + this.n.nodeName.substr(1) + " />")).firstChild;
                    }
                }
                else if (__reg0 === 71) 
                {
                    if (this.speed) 
                    {
                        this.intervalID = _global.setInterval(this, "tick", 500 / this.speed);
                    }
                    this.noclick = false;
                    __reg2 = false;
                    if (__reg4 != 68 && (!this.bTehaiOpen && int(this.n.nodeName.substr(1)) == this.lastTsumo136)) 
                    {
                        __reg3 = (new XML("<" + String.fromCharCode(100 + __reg4 - 68) + this.n.nodeName.substr(1) + " />")).firstChild;
                    }
                }
                else if (__reg0 === 84) 
                {
                    if (this.speed) 
                    {
                        this.intervalID = _global.setInterval(this, "tick", 900 / this.speed);
                    }
                    this.noclick = false;
                    __reg2 = false;
                    this.lastTsumo136 = int(this.n.nodeName.substr(1));
                    if (__reg4 != 84 && !this.bTehaiOpen) 
                    {
                        __reg3 = com.cegg.game.mahjong.LogViewer.X_UVW[__reg4 - 85].firstChild;
                    }
                }
                else if (__reg0 === 85) 
                {
                    if (this.speed) 
                    {
                        this.intervalID = _global.setInterval(this, "tick", 900 / this.speed);
                    }
                    this.noclick = false;
                    __reg2 = false;
                    this.lastTsumo136 = int(this.n.nodeName.substr(1));
                    if (__reg4 != 84 && !this.bTehaiOpen) 
                    {
                        __reg3 = com.cegg.game.mahjong.LogViewer.X_UVW[__reg4 - 85].firstChild;
                    }
                }
                else if (__reg0 === 86) 
                {
                    if (this.speed) 
                    {
                        this.intervalID = _global.setInterval(this, "tick", 900 / this.speed);
                    }
                    this.noclick = false;
                    __reg2 = false;
                    this.lastTsumo136 = int(this.n.nodeName.substr(1));
                    if (__reg4 != 84 && !this.bTehaiOpen) 
                    {
                        __reg3 = com.cegg.game.mahjong.LogViewer.X_UVW[__reg4 - 85].firstChild;
                    }
                }
                else if (__reg0 === 87) 
                {
                    if (this.speed) 
                    {
                        this.intervalID = _global.setInterval(this, "tick", 900 / this.speed);
                    }
                    this.noclick = false;
                    __reg2 = false;
                    this.lastTsumo136 = int(this.n.nodeName.substr(1));
                    if (__reg4 != 84 && !this.bTehaiOpen) 
                    {
                        __reg3 = com.cegg.game.mahjong.LogViewer.X_UVW[__reg4 - 85].firstChild;
                    }
                }
                else if (__reg0 === 78) 
                {
                    if (this.speed) 
                    {
                        this.intervalID = _global.setInterval(this, "tick", 1000 / this.speed);
                    }
                    this.noclick = false;
                    __reg2 = false;
                }
            }
            else if ((__reg0 = this.n.nodeName) === "INIT") 
            {
                this.noclick = true;
                __reg2 = false;
                if (!this.bTehaiOpen) 
                {
                    __reg3 = (new XML(__reg3.toString())).firstChild;
                    __reg3.attributes.hai1 = undefined;
                    __reg3.attributes.hai2 = undefined;
                    __reg3.attributes.hai3 = undefined;
                }
                this.createStepMenu();
                ++this.targetScene;
            }
            else if (__reg0 === "TAIKYOKU") 
            {
                this.noclick = true;
                __reg2 = false;
            }
            else if (__reg0 === "RYUUKYOKU") 
            {
                this.noclick = true;
                __reg2 = false;
            }
            else if (__reg0 === "AGARI") 
            {
                if (this.n.nextSibling.nodeName != "AGARI") 
                {
                    this.noclick = true;
                    __reg2 = false;
                }
            }
            else if (__reg0 === "REACH") 
            {
                if (this.n.attributes.step != 2) 
                {
                    if (this.speed) 
                    {
                        this.intervalID = _global.setInterval(this, "tick", 1000 / this.speed);
                    }
                    this.noclick = false;
                    __reg2 = false;
                }
            }
            else if (__reg0 === "GO") 
            {
                this.intervalID = _global.setInterval(this, "tick", 100);
                this.noclick = true;
                __reg2 = false;
            }
            this.callback.onXMLNode(__reg3);
        }
    }
    ;
    __reg1.onKeyDown = function ()
    {
        if (_root.Main.PopupMenu) 
        {
            return undefined;
        }
        if (this.MessageBox) 
        {
            return undefined;
        }
        if (this.noclick) 
        {
            return undefined;
        }
        if (Key.isDown(Key.ESCAPE)) 
        {
            this.onCommand({cmd: "BACK"});
            return;
        }
        if (this.intervalID != undefined) 
        {
            _global.clearInterval(this.intervalID);
        }
        this.intervalID = _global.setInterval(this, "tick", 20);
    }
    ;
    __reg1.onMouseDown = function ()
    {
        if (!_root._xmouse || !_root._ymouse) 
        {
            this.onCommand({cmd: "BACK"});
            return;
        }
        if (this._ymouse < this.SCENE._y - 1) 
        {
            this.onKeyDown();
        }
    }
    ;
    __reg1.send = function (xml)
    {
        var __reg3 = xml.firstChild;
        if (__reg3 == undefined) 
        {
            __reg3 = (new XML(xml.toString())).firstChild;
        }
        if ((__reg0 = __reg3.nodeName) === "NEXTREADY") 
        {
            this.tick();
            return;
        }
    }
    ;
    __reg1.renameXML = function (anonymous)
    {
        if (anonymous) 
        {
            var __reg4 = ["A" + com.cegg.game.mahjong.Res.T_SAN, "B" + com.cegg.game.mahjong.Res.T_SAN, "C" + com.cegg.game.mahjong.Res.T_SAN, "D" + com.cegg.game.mahjong.Res.T_SAN];
            if (this.tw != undefined) 
            {
                __reg4[int(this.tw)] = com.cegg.game.mahjong.Res.T_WATASHI;
            }
            __reg3 = [__reg4[(this.targetWho + 0) % 4], __reg4[(this.targetWho + 1) % 4], __reg4[(this.targetWho + 2) % 4], __reg4[(this.targetWho + 3) % 4]];
        }
        else 
        {
            var __reg3 = [this.uname[(this.targetWho + 0) % 4], this.uname[(this.targetWho + 1) % 4], this.uname[(this.targetWho + 2) % 4], this.uname[(this.targetWho + 3) % 4]];
        }
        var __reg5 = this.xml.firstChild.firstChild;
        for (;;) 
        {
            if (!(__reg5 = __reg5.nextSibling)) 
            {
                return;
            }
            if (__reg5.nodeName == "UN") 
            {
                var __reg6 = __reg5.attributes;
                if (__reg6.n0.length && __reg6.n0.substr(0, 9) != "%E2%93%85") 
                {
                    __reg6.n0 = __reg3[0];
                }
                if (__reg6.n1.length && __reg6.n1.substr(0, 9) != "%E2%93%85") 
                {
                    __reg6.n1 = __reg3[1];
                }
                if (__reg6.n2.length && __reg6.n2.substr(0, 9) != "%E2%93%85") 
                {
                    __reg6.n2 = __reg3[2];
                }
                if (__reg6.n3.length && __reg6.n3.substr(0, 9) != "%E2%93%85") 
                {
                    __reg6.n3 = __reg3[3];
                }
            }
        }
    }
    ;
    __reg0.rotateXML = function (xml, r)
    {
        r = int(r) % 4;
        if (r) 
        {
            var __reg4 = ["D", "E", "F", "G"];
            var __reg5 = ["T", "U", "V", "W"];
            __reg4 = __reg4.concat(__reg4.splice(0, (4 - r) % 4));
            __reg5 = __reg5.concat(__reg5.splice(0, (4 - r) % 4));
            var __reg6 = xml.firstChild.firstChild;
            if (__reg6) 
            {
                com.cegg.game.mahjong.LogViewerUtil.rotateXMLNode_internal(__reg6, r, __reg4, __reg5);
            }
        }
    }
    ;
    ASSetPropFlags(__reg1, null, 1);
    __reg0.SymbolName = "__Packages.com.cegg.game.mahjong.LogViewer";
    __reg0.SymbolOwner = com.cegg.game.mahjong.LogViewer;
    __reg0.SymbolLinked = Object.registerClass(com.cegg.game.mahjong.LogViewer.SymbolName, com.cegg.game.mahjong.LogViewer.SymbolOwner);
    __reg0.X_UVW = [new XML("<U />"), new XML("<V />"), new XML("<W />")];
}#endinitclip

//子图形 42
//  初始化剪辑
#initclip 0

if (!com.cegg.MCImageCheck) 
{
    if (!com) 
    {
        _global.com = new Object();
    }
    if (!com.cegg) 
    {
        _global.com.cegg = new Object();
    }
    (_global.com.cegg.MCImageCheck = function ()
    {
        super();
        this._focusrect = false;
        this.checked = false;
        this.focused = false;
        this.updateImage();
    }
    ).prototype.__proto__ = MovieClip.prototype;
    __reg0.prototype.__constructor__ = MovieClip;
    var __reg1 = __reg0.prototype;
    __reg1.onPress = function ()
    {
        this.setCheck(!this.checked);
    }
    ;
    __reg1.onRollOver = function ()
    {
        this.focused = true;
        this.updateImage();
    }
    ;
    __reg1.onRollOut = function ()
    {
        this.focused = false;
        this.updateImage();
    }
    ;
    __reg1.onDragOver = function ()
    {
        this.onRollOver();
    }
    ;
    __reg1.onDragOut = function ()
    {
        this.onRollOut();
    }
    ;
    __reg1.setCheck = function (b)
    {
        this.checked = b;
        this.updateImage();
    }
    ;
    __reg1.updateImage = function ()
    {
        this.attachMovie(this.checked ? this.bf : this.bn, "img", 0);
        this.img._x = this.img._y = this.checked ? 1 : 0;
        this.clear();
        if (this.focused) 
        {
            var __reg2 = this._width;
            var __reg3 = this._height;
            var __reg4 = [16777215, 16777215, 16777215];
            var __reg5 = [10, 0, 5];
            var __reg6 = [0, 68, 255];
            var __reg7 = {a: 0, b: __reg3, c: 0, d: 0 - __reg3, e: 0, f: 0, g: 0, h: int(__reg3 / 2), i: 1};
            this.beginGradientFill("linear", __reg4, __reg5, __reg6, __reg7);
            this.moveTo(0, 0);
            this.lineTo(0, __reg3);
            this.lineTo(__reg2, __reg3);
            this.lineTo(__reg2, 0);
            this.endFill();
            this.lineStyle(1, 16777215, 75);
            this.moveTo(0, __reg3 - 3);
            this.lineTo(__reg2, __reg3 - 3);
        }
    }
    ;
    ASSetPropFlags(__reg1, null, 1);
    __reg0.SymbolName = "__Packages.com.cegg.MCImageCheck";
    __reg0.SymbolOwner = com.cegg.MCImageCheck;
    __reg0.SymbolLinked = Object.registerClass(com.cegg.MCImageCheck.SymbolName, com.cegg.MCImageCheck.SymbolOwner);
}#endinitclip

//子图形 43
//  初始化剪辑
#initclip 0

if (!Main) 
{
    var __reg1 = (_global.Main = function ()
    {
    }
    ).prototype;
    __reg0.main = function (_this)
    {
        com.cegg.game.mahjong.UtilBase.bPremiumVersion = true;
        com.cegg.game.mahjong.Hai.YT = 63;
        com.cegg.game.mahjong.Hai.Y0T = com.cegg.game.mahjong.Hai.Y0T + 3;
        com.cegg.game.mahjong.Hai.Y1T = com.cegg.game.mahjong.Hai.Y1T + 3;
        com.cegg.game.mahjong.MainInit.init();
    }
    ;
    ASSetPropFlags(__reg1, null, 1);
}#endinitclip

//子图形 44
//  初始化剪辑
#initclip 0

if (!com.cegg.game.mahjong.MainRoot) 
{
    if (!com) 
    {
        _global.com = new Object();
    }
    if (!com.cegg) 
    {
        _global.com.cegg = new Object();
    }
    if (!com.cegg.game) 
    {
        _global.com.cegg.game = new Object();
    }
    if (!com.cegg.game.mahjong) 
    {
        _global.com.cegg.game.mahjong = new Object();
    }
    var __reg1 = (_global.com.cegg.game.mahjong.MainRoot = function ()
    {
    }
    ).prototype;
    __reg0.onCommandRoot = function (msg)
    {
        if ((__reg0 = msg.cmd) === "OPENXMLSOCKET") 
        {
            if (_root.send == undefined) 
            {
                com.cegg.game.mahjong.UtilBase.xmlSocketOpen();
            }
            else 
            {
                _root.onCommand({cmd: "SENDHELO"});
            }
            return;
        }
        else if (__reg0 === "CLOSEXMLSOCKET") 
        {
            _root.send("<BYE />");
            return;
        }
        else if (__reg0 === "SENDHELO") 
        {
            _root.onXMLNode = com.cegg.game.mahjong.MainRoot.onXMLNode_HELO;
            if (_root.wg.length > 0) 
            {
                _root.send("<HELO name=\"NoName\" />");
                _root.onXMLNode = com.cegg.game.mahjong.MainRoot.onXMLNode_LOGHELO;
            }
            else 
            {
                var __reg3 = "";
                var __reg4 = com.cegg.game.mahjong.SaveData.MJSTATUS();
                if (__reg4.data.gpid.length == 17) 
                {
                    __reg3 = __reg4.data.gpid;
                }
                delete __reg4.data.gpid;
                __reg4.flush();
                var __reg5 = com.cegg.game.mahjong.UtilBase.bPremiumVersion ? "f0" : "0000";
                var __reg6 = String(com.cegg.game.mahjong.SaveData.MJINFO().data.sx).substr(0, 1);
                if (__reg6 != "F") 
                {
                    __reg6 = "M";
                }
                if (__reg3.length > 0) 
                {
                    _root.send("<HELO name=\"" + _global.escape(_root.uname) + "\"" + " gpid=\"" + __reg3 + "\"" + " tid=\"" + __reg5 + "\"" + " sx=\"" + __reg6 + "\"" + " />");
                }
                else if (com.cegg.game.mahjong.MainRoot.goLobbyNow) 
                {
                    _root.send("<HELO name=\"" + _global.escape(_root.uname) + "\"" + " tid=\"" + __reg5 + "\"" + " sx=\"" + __reg6 + "\"" + " />");
                    com.cegg.game.mahjong.MainRoot.goLobbyNow = false;
                }
                else if (com.cegg.game.mahjong.UtilBase.bExternalID) 
                {
                    _root.send("<HELO name=\"NoName\" />");
                }
                else if (!_root.Main.View.WelcomeMain) 
                {
                    _root.Main.View.attachMovie(com.cegg.game.mahjong.WelcomeMain.SymbolName, "WelcomeMain", 2);
                }
            }
            return;
        }
        else if (__reg0 === "CHAT") 
        {
            if (msg.text == "/cls") 
            {
                _root.Main.View.Chat.ChatView.text = "";
            }
            else 
            {
                _root.send("<CHAT text=\"" + _global.escape(msg.text) + "\" />");
            }
            return;
        }
        else if (__reg0 === "RELOAD") 
        {
            getURL("javascript:pmj();", "_self");
            return;
        }
        else if (__reg0 === "LOGOUT") 
        {
            if (com.cegg.game.mahjong.UtilBase.bExternalID) 
            {
                _root.onCommand({cmd: "RELOAD"});
            }
            else 
            {
                _root.onCommand({cmd: "CLOSEXMLSOCKET"});
                _root.onCommand({cmd: "GOWELCOME"});
            }
            return;
        }
        else if (__reg0 === "GOWELCOME") 
        {
            _root.BGM.play();
            _root.Main.CS.Main.img.removeMovieClip();
            _root.Main.CS.Main.removeMovieClip();
            _root.Main.View.LogViewer.removeMovieClip();
            _root.Main.View.Chat.removeMovieClip();
            _root.Main.View.LobbyMain.removeMovieClip();
            _root.Main.View.LogManager.removeMovieClip();
            _root.onCommand({cmd: "OPENXMLSOCKET"});
            return;
        }
        else if (__reg0 === "GOLOBBY") 
        {
            if (_root.log.length > 0) 
            {
                _root.Main.Clipper.removeMovieClip();
                _root.Main.Owari.Main.removeMovieClip();
                _root.onCommand({cmd: "LOGVIEWER", log: _root.log, tw: _root.tw, ts: _root.ts});
            }
            else 
            {
                if (_root.Main.View.LogViewer) 
                {
                    _root.send = undefined;
                }
                com.cegg.game.mahjong.MainRoot.goLobbyNow = true;
                _root.onCommand({cmd: "GOWELCOME"});
            }
            return;
        }
        else if (__reg0 === "GOLOBBYFADEOUT") 
        {
            com.cegg.GClipper.create("Clipper", 1048575, _root.Main, 0, 100);
            var mc = _root.Main.Clipper;
            mc._alpha = 0;
            mc.onEnterFrame = function ()
            {
                if (this._alpha < 100) 
                {
                    this._alpha = this._alpha + 5;
                    return;
                }
                _root.Main.Game.unloadMovie();
                mc.onEnterFrame = function ()
                {
                    _root.onCommand({cmd: "GOLOBBY"});
                    delete this.onEnterFrame;
                }
                ;
            }
            ;
            return;
        }
        else if (__reg0 === "LOGMANAGER") 
        {
            _root.Main.View.attachMovie(com.cegg.game.mahjong.LogManager.SymbolName, "LogManager", 6);
            return;
        }
        else if (__reg0 === "LOGVIEWER") 
        {
            if (_root.Main.View.LobbyMain && _root.Main.View.LobbyMain.CANCEL.isEnable()) 
            {
                _root.onXMLNode((new XML("<ERR code=\"1017\"/>")).firstChild);
            }
            else 
            {
                com.cegg.game.mahjong.UtilBase.xmlSocketClose();
                _root.BGM.play();
                _root.Main.CS.Main.img.removeMovieClip();
                _root.Main.CS.Main.removeMovieClip();
                _root.Main.View.Chat.removeMovieClip();
                _root.Main.View.LobbyMain.removeMovieClip();
                _root.Main.View.LogManager.removeMovieClip();
                _root.onXMLNode = com.cegg.game.mahjong.MainRoot.onXMLNode_LOGHELO;
                _root.send = function (xml)
                {
                    _root.Main.View.LogViewer.send(xml);
                }
                ;
                _root.Main.View.attachMovie(com.cegg.game.mahjong.LogViewer.SymbolName, "LogViewer", 2, {callback: _root, log: msg.log, tw: msg.tw, ts: msg.ts});
            }
            return;
        }
        else if (__reg0 === "SHANGHAI") 
        {
            _root.Main.CS.Main.img.removeMovieClip();
            _root.startGame(msg.cmd);
            return;
        }
        else if (__reg0 === "NIKAKU") 
        {
            _root.Main.CS.Main.img.removeMovieClip();
            _root.startGame(msg.cmd);
            return;
        }
        else if (__reg0 === "NERIMA") 
        {
            _root.Main.CS.Main.img.removeMovieClip();
            _root.startGame(msg.cmd);
            return;
        }
        else if (__reg0 !== "BUY_EXPIRE") 
        {
            return;
        }
        if (_root.uname.substr(0, 2) == "ID") 
        {
            getURL("http://tenhou.net/reg/?ID" + _root.uname.substr(2, 8), "_blank");
        }
        else 
        {
            getURL("http://tenhou.net/reg/?ID00000000", "_blank");
        }
        return;
    }
    ;
    __reg0.onXMLNode_ERR = function (n)
    {
        var __reg3 = int(n.attributes.code);
        var __reg4 = com.cegg.game.mahjong.Res.T_ERRTXT["E" + __reg3];
        if (!__reg4.length) 
        {
            __reg4 = "ERROR";
        }
        if (__reg3 == 8000) 
        {
            __reg4 = "Connection failed";
        }
        if (__reg3 == 8001) 
        {
            __reg4 = "Invalid connection(1)";
        }
        if (__reg3 == 8002) 
        {
            __reg4 = "Invalid connection(2)";
        }
        if (__reg3 == 2002) 
        {
            com.cegg.GDialog.messageBox(_root.Main, __reg4, "RELOAD", "YES", "NO", "NO");
        }
        else if (__reg3 == 8000) 
        {
            com.cegg.GDialog.messageBox(_root.Main, __reg4, "RELOAD", "OK");
        }
        else 
        {
            com.cegg.GDialog.messageBox(_root.Main, __reg4);
        }
        if (__reg3 == 1019) 
        {
            _root.send("<BYE />");
        }
        if ((__reg0 = __reg3) !== 0) 
        {
            if (__reg0 !== 1012) 
            {
                if (__reg0 !== 1013) 
                {
                    if (__reg0 !== 1014) 
                    {
                        if (__reg0 !== 1017) 
                        {
                            if (__reg0 !== 1018) 
                            {
                                if (__reg0 !== 1019) 
                                {
                                    if (__reg0 !== 1020) 
                                    {
                                        if (__reg0 !== 1026) 
                                        {
                                            if (__reg0 !== 1027) 
                                            {
                                                if (__reg0 !== 1028) 
                                                {
                                                    if (__reg0 !== 2000) 
                                                    {
                                                        if (__reg0 !== 2001) 
                                                        {
                                                            if (__reg0 !== 2002) 
                                                            {
                                                                if (__reg0 !== 2003) 
                                                                {
                                                                    if (!_root.Main.View.WelcomeMain) 
                                                                    {
                                                                        _root.Main.View.attachMovie(com.cegg.game.mahjong.WelcomeMain.SymbolName, "WelcomeMain", 2);
                                                                    }
                                                                }
                                                            }
                                                        }
                                                    }
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }
        if (_root.Main.View.WelcomeMain) 
        {
            _root.Main.View.WelcomeMain.onXMLNode(n);
        }
    }
    ;
    __reg0.onXMLNode_HELO = function (n)
    {
        var __reg3 = n.attributes;
        if ((__reg0 = n.nodeName) === "HELO") 
        {
            if (__reg3.closing) 
            {
                _root.onCommand({cmd: "RELOAD"});
                return;
            }
            if (__reg3.auth.length) 
            {
                _root.send("<AUTH val=\"" + com.cegg.game.mahjong.UtilBase.authTransform(__reg3.auth) + "\"/>");
            }
            if (__reg3.ratingscale.length) 
            {
                var __reg4 = new LoadVars();
                __reg4.onData(__reg3.ratingscale);
                for (var __reg5 in __reg4) 
                {
                    if (__reg5.substr(0, 2) != "PF") 
                    {
                        continue;
                    }
                    com.cegg.game.mahjong.Res.scaleRating[__reg5] = Number(__reg4[__reg5]);
                }
            }
            com.cegg.game.mahjong.UtilBase.nExpireDays = __reg3.expire.length <= 0 ? 0 : 1;
            if (__reg3.expiredays.length) 
            {
                com.cegg.game.mahjong.UtilBase.nExpireDays = int(__reg3.expiredays);
            }
            if (com.cegg.game.mahjong.UtilBase.bWBPopup) 
            {
                if (com.cegg.game.mahjong.UtilBase.bPremiumVersion && (com.cegg.game.mahjong.UtilBase.nExpireDays && _root.wb)) 
                {
                    getURL("javascript:try{if (window.external && window.external.trayPopup) void(window.external.trayPopup(\'" + com.cegg.game.mahjong.Res.T_WBREADY + "\'));}catch(e){}", "_self");
                }
                com.cegg.game.mahjong.UtilBase.bWBPopup = false;
            }
            if (__reg3.uname != undefined && !com.cegg.game.mahjong.UtilBase.bExternalID) 
            {
                var __reg6 = com.cegg.game.mahjong.SaveData.MJINFO();
                __reg6.data.uname = _root.uname;
                __reg6.flush();
            }
            if (com.cegg.game.mahjong.UtilBase.xmlWantNextJoin.length) 
            {
                _root.send(com.cegg.game.mahjong.UtilBase.xmlWantNextJoin);
                com.cegg.game.mahjong.UtilBase.xmlWantNextJoin = "";
                _root.onXMLNode = com.cegg.game.mahjong.MainRoot.onXMLNode_LOBBY;
                com.cegg.game.mahjong.UtilBase.bPlayStartSE = false;
                return;
            }
            com.cegg.game.mahjong.UtilBase.bPlayStartSE = true;
            _root.Main.Clipper.removeMovieClip();
            _root.Main.Owari.Main.removeMovieClip();
            _root.Main.Game.unloadMovie();
            _root.Main.View.WelcomeMain.removeMovieClip();
            if (_root.Main.View.LobbyMain) 
            {
                _root.Main.View.LobbyMain.onCommand({cmd: "REJOIN_ALL"});
            }
            else 
            {
                var __reg7 = __reg3.PF4.split(",");
                var __reg8 = __reg3.PF3.split(",");
                _root.Main.View.attachMovie((_root.lb == undefined || _root.lb.length == 4 ? com.cegg.game.mahjong.LobbyMain : com.cegg.game.mahjong.LobbyCS).SymbolName, "LobbyMain", 3, {dan4: int(__reg7[0]), dan3: int(__reg8[0]), rate4: int(__reg7[2]), rate3: int(__reg8[2])});
                _root.Main.View.LobbyMain.attachMovie(com.cegg.game.mahjong.Prof2.SymbolName, "Prof", 1000, {uname: __reg3.uname, expire: __reg3.expire, mpf: __reg3});
                _root.Main.View.LobbyMain.init();
                _root.Main.View.LobbyMain._x = int((Stage.width - _root.Main.View.LobbyMain._width) / 2) + 10;
                _root.Main.View.LobbyMain._y = int((Stage.height - _root.Main.View.LobbyMain._height) / 2);
            }
            if (!_root.Main.View.Chat) 
            {
                _root.Main.View.attachMovie(com.cegg.GChat.SymbolName, "Chat", 4);
                if (_root.lb.length != 9 && _root.lb.length != 17) 
                {
                    _root.Main.View.Chat.chatOut(com.cegg.game.mahjong.Res.T_WELCOMEMESSAGE[0]);
                    if (_root.uname.substr(0, 2) != "ID") 
                    {
                        _root.Main.View.Chat.chatOut(com.cegg.game.mahjong.Res.T_WELCOMEMESSAGE[1]);
                    }
                    _root.Main.View.Chat.chatOut("\n");
                }
            }
            if (__reg3.nintei != undefined) 
            {
                _root.Main.View.attachMovie(com.cegg.game.mahjong.NinteiBox.SymbolName, "Nintei", 6, {nintei: __reg3.nintei});
                _root.Main.View.LobbyMain._visible = _root.Main.View.Chat._visible = false;
                _root.Main.View.Nintei.onUnload = function ()
                {
                    _root.Main.View.LobbyMain._visible = _root.Main.View.Chat._visible = true;
                }
                ;
            }
            if (_root.lb.length == 9 || _root.lb.length == 17) 
            {
                if (_root.attachChampionship) 
                {
                    if (!_root.Main.CS.Main) 
                    {
                        _root.attachChampionship(_root.Main.CS);
                    }
                }
                else 
                {
                    _root.Main.View.LobbyMain._visible = _root.Main.View.Chat._visible = false;
                    _root.onLoadMovieClip = function ()
                    {
                        _root.attachChampionship(_root.Main.CS);
                        _root.Main.View.LobbyMain._visible = _root.Main.View.Chat._visible = true;
                        delete _root.onLoadMovieClip;
                    }
                    ;
                    _root.Main.CS.loadMovie(com.cegg.game.mahjong.UtilBase.resolveAsFriendURL("cs.swf"));
                    _root.Main.attachMovie(com.cegg.game.Loading.SymbolName, "Loading", 1001, {target: _root.Main.CS, callback: _root});
                    _root.Main.Loading._y = Stage.height - _root.Main.Loading._height - 20;
                }
            }
            _root.onXMLNode = com.cegg.game.mahjong.MainRoot.onXMLNode_LOBBY;
            return;
        }
        else if (__reg0 === "GO") 
        {
            _root.onXMLNode = com.cegg.game.mahjong.MainRoot.onXMLNode_LOBBY;
            _root.onXMLNode(n);
            return;
        }
        else if (__reg0 === "REHELO") 
        {
            _root.onCommand({cmd: "RELOAD"});
            return;
        }
        else if (__reg0 !== "ERR") 
        {
            return;
        }
        com.cegg.game.mahjong.MainRoot.onXMLNode_ERR(n);
        return;
    }
    ;
    __reg0.onXMLNode_LOBBY = function (n)
    {
        if ((__reg0 = n.nodeName) === "GO") 
        {
            _root.BGM.play();
            delete _root.BGM;
            if (n.attributes.gpid != undefined) 
            {
                var __reg3 = com.cegg.game.mahjong.SaveData.MJSTATUS();
                __reg3.data.gpid = n.attributes.gpid;
                __reg3.data.lastGameType = n.attributes.type;
                __reg3.flush();
            }
            _root.Main.CS.Main.img.removeMovieClip();
            _root.Main.CS.Main.removeMovieClip();
            _root.Main.View.WelcomeMain.removeMovieClip();
            _root.Main.View.Chat.removeMovieClip();
            _root.Main.View.LobbyMain.removeMovieClip();
            _root.Main.View.LogManager.removeMovieClip();
            _root.startGame("MAHJONG", n.attributes);
            _root.send("<GOK />");
            if (n.attributes.kansen.length > 0) 
            {
                _root.onXMLNode = com.cegg.game.mahjong.MainRoot.onXMLNode_LOGGAME;
            }
            else 
            {
                _root.onXMLNode = com.cegg.game.mahjong.MainRoot.onXMLNode_GAME;
            }
            return;
        }
        else if (__reg0 === "ERR") 
        {
            com.cegg.game.mahjong.MainRoot.onXMLNode_ERR(n);
            return;
        }
        else if (__reg0 === "REHELO") 
        {
            _root.send = undefined;
            com.cegg.game.mahjong.UtilBase.xmlSocketClose();
            com.cegg.game.mahjong.MainRoot.goLobbyNow = true;
            _root.onCommand({cmd: "OPENXMLSOCKET"});
            return;
        }
        else if (__reg0 === "REJOIN") 
        {
            if (_root.Main.View.LobbyMain && (_root.Main.View.LobbyMain.CANCEL && !_root.Main.View.LobbyMain.CANCEL.isEnable())) 
            {
                return;
            }
            n.nodeName = "JOIN";
            _root.send(n);
            return;
        }
        _root.Main.View.LobbyMain.onXMLNode(n);
        return;
    }
    ;
    __reg0.onXMLNode_LOGHELO = function (n)
    {
        if ((__reg0 = n.nodeName) === "HELO") 
        {
            _root.Main.Clipper.removeMovieClip();
            _root.Main.Owari.Main.removeMovieClip();
            _root.Main.Game.unloadMovie();
            if (n.attributes.closing) 
            {
                _root.onCommand({cmd: "RELOAD"});
            }
            else 
            {
                _root.send("<CHAT text=\"%2Fwg%20" + _global.escape(_root.wg) + "\" />");
            }
            return;
        }
        else if (__reg0 === "GO") 
        {
            _root.startGame("MAHJONG", n.attributes);
            _root.send("<GOK />");
            if (n.attributes.kansen.length > 0) 
            {
                _root.onXMLNode = com.cegg.game.mahjong.MainRoot.onXMLNode_LOGGAME;
            }
            else 
            {
                _root.onXMLNode = com.cegg.game.mahjong.MainRoot.onXMLNode_GAME;
            }
            return;
        }
        else if (__reg0 !== "ERR") 
        {
            return;
        }
        com.cegg.game.mahjong.MainRoot.onXMLNode_ERR(n);
        return;
    }
    ;
    __reg0.onXMLNode_LOGGAME = function (n)
    {
        if ((__reg0 = n.nodeName) === "WGC") 
        {
            var __reg3 = n.firstChild;
            if (__reg3) 
            {
                for (;;) 
                {
                    __reg3 = __reg3.nextSibling;
                    if (!__reg3) 
                    {
                        break;
                    }
                    com.cegg.game.mahjong.LogViewerUtil.rotateXMLNode(__reg3, _root.tw);
                }
            }
            _root.Main.Game.onXMLNode(n);
            return;
        }
        else if (__reg0 === "INITBYLOG") 
        {
            if (n.firstChild == undefined) 
            {
                return;
            }
            n = (new XML(com.cegg.game.mahjong.LogViewerUtil.log2reinitXML(n.firstChild, -1, true))).firstChild;
        }
        com.cegg.game.mahjong.LogViewerUtil.rotateXMLNode(n, _root.tw);
        _root.Main.Game.onXMLNode(n);
        return;
    }
    ;
    __reg0.onXMLNode_GAME = function (n)
    {
        if (n.nodeName == "ERR") 
        {
            com.cegg.game.mahjong.MainRoot.onXMLNode_ERR(n);
            return;
        }
        _root.Main.Game.onXMLNode(n);
    }
    ;
    ASSetPropFlags(__reg1, null, 1);
    __reg0.goLobbyNow = false;
}#endinitclip

//子图形 45
//  初始化剪辑
#initclip 0

if (!com.cegg.GPopupMenuItem) 
{
    if (!com) 
    {
        _global.com = new Object();
    }
    if (!com.cegg) 
    {
        _global.com.cegg = new Object();
    }
    (_global.com.cegg.GPopupMenuItem = function ()
    {
        super();
        this._focusrect = false;
        this.bChildren = false;
    }
    ).prototype.__proto__ = MovieClip.prototype;
    __reg0.prototype.__constructor__ = MovieClip;
    var __reg1 = __reg0.prototype;
    __reg0.create = function (xml, depth, parent, xoffset)
    {
        var __reg6 = parent.attachMovie(com.cegg.GPopupMenuItem.SymbolName, depth.toString(), depth);
        __reg6.init(xml, xoffset);
        return __reg6;
    }
    ;
    __reg1.init = function (n, xoffset)
    {
        this.node = n;
        var __reg4 = this.node.attributes;
        var __reg5 = undefined;
        if (__reg4.callback) 
        {
            __reg5 = __reg4.callback(n, this, "face", 0);
            this.cy = int(__reg4.height) + 2;
            this.setWidth(int(__reg4.width) + 4);
        }
        else 
        {
            this.createTextField("txt", 0, 0, 0, 0, 0);
            __reg5 = this.txt;
            __reg5.autoSize = "left";
            __reg5.text = _global.unescape(__reg4.disp);
            __reg5.selectable = false;
            this.cy = __reg5._height;
            this.setWidth(xoffset + __reg5._width + 20);
            if (__reg4.enabled == "false") 
            {
                __reg5.textColor = 13421772;
            }
            __reg5._x = xoffset;
        }
        if (__reg4.enabled == undefined || __reg4.enabled == "true") 
        {
            this.onRelease = this._onRelease;
            this.onRollOver = this._onRollOver;
            this.onRollOut = this._onRollOut;
            this.onDragOver = this._onDragOver;
            this.onDragOut = this._onDragOut;
        }
        this.bChildren = !this.node.attributes.cmd.length && this.node.childNodes.length != 0;
        if (!this.bChildren && !this.node.attributes.cmd.length) 
        {
            this.node.attributes.cmd = this.node.parentNode.attributes.name;
        }
    }
    ;
    __reg1.setWidth = function (w)
    {
        this.cx = w;
        this.drawBack(false);
    }
    ;
    __reg1.drawBack = function (bOver)
    {
        this.clear();
        this.lineStyle();
        this.beginFill(bOver ? 9674864 : 16777215, 100);
        this.moveTo(1, 1);
        this.lineTo(1, this.cy);
        this.lineTo(this.cx - 0.5, this.cy);
        this.lineTo(this.cx - 0.5, 1);
        this.endFill();
        if (this.bChildren) 
        {
            this.beginFill(0, 100);
            this.moveTo(this.cx - 4, int(this.cy / 2));
            this.lineTo(this.cx - 8, int(this.cy / 2) - 3.5);
            this.lineTo(this.cx - 8, int(this.cy / 2) + 3.5);
            this.endFill();
        }
    }
    ;
    __reg1.killInterval = function ()
    {
        if (this.intervalID != undefined) 
        {
            _global.clearInterval(this.intervalID);
            this.intervalID = undefined;
        }
    }
    ;
    __reg1.invokeCommand = function ()
    {
        this.killInterval();
        if (this.bChildren) 
        {
            com.cegg.GPopupMenu.trackPopupMenu(this.node, this._x + this.cx, this._y, this._parent);
            return;
        }
        this._parent.onCommand(this.node.attributes, this.node.firstChild);
    }
    ;
    __reg1._onRelease = function ()
    {
        this.invokeCommand();
    }
    ;
    __reg1._onRollOver = function ()
    {
        this.drawBack(true);
        this.txt.textColor = 16777215;
        if (this.intervalID == undefined) 
        {
            this.intervalID = _global.setInterval(this, "onExpandOrCollapse", 300);
        }
    }
    ;
    __reg1._onRollOut = function ()
    {
        this.drawBack(false);
        this.txt.textColor = 0;
        this.killInterval();
    }
    ;
    __reg1._onDragOver = function ()
    {
        this.onRollOver();
    }
    ;
    __reg1._onDragOut = function ()
    {
        this.onRollOut();
    }
    ;
    __reg1.onExpandOrCollapse = function ()
    {
        this.killInterval();
        if (this.bChildren) 
        {
            this.invokeCommand();
            return;
        }
        if (this._parent.PopupMenu) 
        {
            this._parent.PopupMenu._visible = false;
        }
    }
    ;
    ASSetPropFlags(__reg1, null, 1);
    __reg0.SymbolName = "__Packages.com.cegg.GPopupMenuItem";
    __reg0.SymbolOwner = com.cegg.GPopupMenuItem;
    __reg0.SymbolLinked = Object.registerClass(com.cegg.GPopupMenuItem.SymbolName, com.cegg.GPopupMenuItem.SymbolOwner);
    __reg1.node = undefined;
    __reg1.intervalID = undefined;
    __reg1.cx = 0;
    __reg1.cy = 0;
}#endinitclip

//子图形 46
//  初始化剪辑
#initclip 0

if (!com.cegg.game.mahjong.AnimationQ) 
{
    if (!com) 
    {
        _global.com = new Object();
    }
    if (!com.cegg) 
    {
        _global.com.cegg = new Object();
    }
    if (!com.cegg.game) 
    {
        _global.com.cegg.game = new Object();
    }
    if (!com.cegg.game.mahjong) 
    {
        _global.com.cegg.game.mahjong = new Object();
    }
    var __reg1 = (_global.com.cegg.game.mahjong.AnimationQ = function ()
    {
    }
    ).prototype;
    __reg0.push = function (mc)
    {
        if (com.cegg.game.mahjong.AnimationQ.q.length == 0) 
        {
            if (com.cegg.game.mahjong.AnimationQ.iid) 
            {
                _global.clearInterval(com.cegg.game.mahjong.AnimationQ.iid);
            }
            com.cegg.game.mahjong.AnimationQ.iid = _global.setInterval(function ()
            {
                com.cegg.game.mahjong.AnimationQ.onInterval();
            }
            , 20);
        }
        com.cegg.game.mahjong.AnimationQ.q.push(mc);
    }
    ;
    __reg0.onInterval = function ()
    {
        var __reg2 = 0;
        __reg2 = 0;
        while (__reg2 < com.cegg.game.mahjong.AnimationQ.q.length) 
        {
            com.cegg.game.mahjong.AnimationQ.q[__reg2].onTickAnimation();
            if (com.cegg.game.mahjong.AnimationQ.q[__reg2] && com.cegg.game.mahjong.AnimationQ.q[__reg2].onTickAnimation) 
            {
                ++__reg2;
            }
            else 
            {
                com.cegg.game.mahjong.AnimationQ.q.splice(__reg2, 1);
            }
        }
        _global.updateAfterEvent();
        if (com.cegg.game.mahjong.AnimationQ.q.length) 
        {
            return;
        }
        _global.clearInterval(com.cegg.game.mahjong.AnimationQ.iid);
        com.cegg.game.mahjong.AnimationQ.iid = undefined;
    }
    ;
    ASSetPropFlags(__reg1, null, 1);
    __reg0.q = [];
    __reg0.iid = undefined;
}#endinitclip

//子图形 47
//  初始化剪辑
#initclip 0

if (!com.cegg.game.nerima.NerimaMain) 
{
    if (!com) 
    {
        _global.com = new Object();
    }
    if (!com.cegg) 
    {
        _global.com.cegg = new Object();
    }
    if (!com.cegg.game) 
    {
        _global.com.cegg.game = new Object();
    }
    if (!com.cegg.game.nerima) 
    {
        _global.com.cegg.game.nerima = new Object();
    }
    (_global.com.cegg.game.nerima.NerimaMain = function ()
    {
        super();
        com.cegg.game.mahjong.Tehai.sock = this;
        com.cegg.game.mahjong.Hai.aka = false;
        var __reg3 = 0;
        this.createTextField("tf", __reg3++, 0, 0, 0, 0);
        this.createTextField("tfTimer", __reg3++, 0, 0, 0, 0);
        this.createTextField("tfScore", __reg3++, 0, 0, 0, 0);
        var __reg4 = "";
        __reg4 = __reg4 + ("<menu>" + "<item disp=\"5\"  cmd=\"MAXNUMOK\" maxnum=\"5\"/>" + "<item disp=\"8\"  cmd=\"MAXNUMOK\" maxnum=\"8\"/>" + "<item disp=\"11\" cmd=\"MAXNUMOK\" maxnum=\"11\"/>" + "<item disp=\"14\" cmd=\"MAXNUMOK\" maxnum=\"14\"/>" + "<separator/>" + "<item disp=\"NoLimit\" cmd=\"MODEOK\" mode=\"0\"/><br/>" + "<item disp=\"TimeAttack\"  cmd=\"MODEOK\" mode=\"1\"/><br/>" + "</menu>");
        com.cegg.GButton.createTextButton("MENU", "MENU", __reg3++, this, (new XML(__reg4)).firstChild);
        com.cegg.GButton.createTextButton("START", "START", __reg3++, this);
        com.cegg.GButton.createTextButton("STOP", "STOP", __reg3++, this);
        com.cegg.GButton.createTextButton("CLOSE", com.cegg.game.mahjong.Res.T_CLOSE, __reg3++, this);
        with (this.tf)
        {
            autoSize = "left";
            selectable = false;
            textColor = 16777215;
        }
        with (this.tfTimer)
        {
            autoSize = "left";
            selectable = false;
            textColor = 16777215;
        }
        with (this.tfScore)
        {
            autoSize = "center";
            selectable = false;
            textColor = 16777215;
        }
        this.MENU._x = int((Stage.width - this.MENU._width - this.START._width - this.STOP._width - this.CLOSE._width) / 2);
        this.START._x = this.MENU._x + this.MENU._width;
        this.STOP._x = this.START._x + this.START._width;
        this.CLOSE._x = this.STOP._x + this.STOP._width;
        this.MENU._y = this.START._y = this.STOP._y = this.CLOSE._y = Stage.height - this.START._height;
        this.STOP.setEnable(false);
        this.gostart();
    }
    ).prototype.__proto__ = MovieClip.prototype;
    __reg0.prototype.__constructor__ = MovieClip;
    var __reg1 = __reg0.prototype;
    __reg1.gostart = function ()
    {
        var __reg2 = int((Stage.width - com.cegg.game.mahjong.Hai.XT * this.maxnum) / 2);
        var __reg3 = int(Stage.height - 80 - 5);
        this.tf.text = com.cegg.game.mahjong.Res.T_REST + " " + this.yama.length;
        this.tfScore._y = this.tfTimer._y = this.tf._y = __reg3 - this.tf._height;
        this.tfScore._x = this.tf._x = __reg2;
        this.tfTimer._x = __reg2 + com.cegg.game.mahjong.Hai.XT * (this.maxnum - 1);
        this.tfScore._width = com.cegg.game.mahjong.Hai.XT * this.maxnum;
        this.tfScore.text = "0";
        this.STOP.setEnable(true);
        this.START.setEnable(false);
        this.sc = {num: 0, yama: 0, time: 0, machi: 0};
        if (this.tehai) 
        {
            this.tehai.removeMovieClip();
        }
        this.onEnterFrame = this.onEnterFrame_Init;
    }
    ;
    __reg1.onEnterFrame_Init = function ()
    {
        var __reg2 = 100;
        this.attachMovie(com.cegg.game.mahjong.Tehai.SymbolName, "tehai", __reg2++, {who: 0, silent: false});
        this.tehai._x = this.tf._x - 90;
        this.tehai._y = this.tf._y + this.tf._height;
        this.tfTimer.text = this.mode ? String(this.tLimit) : "NoLimit";
        this.yama = [];
        var __reg4 = [];
        var __reg3 = 0;
        if (__reg3 < 136) 
        {
            for (;;) 
            {
                ++__reg3;
                if (__reg3 >= 136) 
                {
                    break;
                }
                __reg4.push(__reg3);
            }
        }
        while (__reg4.length) 
        {
            this.yama[__reg4.length - 1] = __reg4.splice(random(__reg4.length), 1)[0];
        }
        var __reg5 = com.cegg.game.nerima.NerimaMain.maxTsumo + this.maxnum - 1;
        while (__reg5 < this.yama.length) 
        {
            this.yama.pop();
        }
        this.anim = 0;
        this.onEnterFrame = this.onEnterFrame_Haipai;
    }
    ;
    __reg1.onTick = function ()
    {
        if (this.mode) 
        {
            var __reg2 = new Date();
            var __reg3 = int(this.tLimit - (__reg2.getTime() - this.tStart));
            if (__reg3 < 0) 
            {
                __reg3 = 0;
            }
            this.tfTimer.text = __reg3.toString();
            if (__reg3) 
            {
                return;
            }
            this.fin();
        }
    }
    ;
    __reg1.onEnterFrame_Haipai = function ()
    {
        if (++this.anim >= 2) 
        {
            if (this.anim & 1) 
            {
                return undefined;
            }
            if (this.tehai.n < this.maxnum - 1) 
            {
                this.tsumo(false);
                return;
            }
            this.anim = 0;
            this.onEnterFrame = this.onEnterFrame_Start;
        }
    }
    ;
    __reg1.onEnterFrame_Start = function ()
    {
        if (++this.anim >= 5) 
        {
            _root.SE.play("SE_KACHI", false, 0);
            this.tehai.initsort();
            this.tStart = (new Date()).getTime();
            this.anim = 0;
            this.onEnterFrame = this.onEnterFrame_Tsumo;
        }
    }
    ;
    __reg1.onEnterFrame_Tsumo = function ()
    {
        this.onTick();
        if (++this.anim >= 8) 
        {
            this.onEnterFrame = this.onTick;
            this.tsumo(true);
        }
    }
    ;
    __reg1.onEnterFrame_Clear = function ()
    {
        this.onTick();
        if (this.tehai._alpha > 0) 
        {
            this.tehai._alpha = this.tehai._alpha - 15;
            return;
        }
        this.onEnterFrame = this.onEnterFrame_Init;
    }
    ;
    __reg1.tsumo = function (activate)
    {
        if (!this.yama.length) 
        {
            this.fin();
            return;
        }
        var __reg3 = int(this.yama.pop());
        var __reg4 = {x: 0 - com.cegg.game.mahjong.Hai.X0, y: this.tehai._y};
        this.tehai.Tsumo(__reg4, __reg3, activate, activate ? 32 : 0, false);
        _root.SE.play("SE_KACHI", false, 0);
        this.tf.text = com.cegg.game.mahjong.Res.T_REST + " " + this.yama.length;
    }
    ;
    __reg1.dahai = function (hai136)
    {
        _root.SE.play("SE_DA", true, 0);
        var __reg3 = this.tehai.Dahai(false, hai136);
        this.attachMovie(com.cegg.game.mahjong.Hai.SymbolName, "da", 101, {_x: Stage.width, _y: this.tehai._y});
        var __reg4 = this.da;
        __reg4.setImage(hai136, 0, false);
        __reg4.ex = __reg4._x;
        __reg4.ey = __reg4._y;
        __reg4.x = __reg4._x;
        __reg4.y = __reg4._y;
        __reg4._x = __reg3.x;
        __reg4._y = __reg3.y;
        __reg4.a = 8;
        __reg4.nakiEnd = function ()
        {
            if (this.onEnterFrame) 
            {
                this.x = this.ex;
                this.y = this.ey;
            }
            this._x = this.ex;
            this._y = this.ey;
            this._rotation = 0;
            delete this.ex;
            delete this.ex;
            delete this.nakiEnd;
        }
        ;
        __reg4.onEnterFrame = function ()
        {
            var __reg2 = this.a / 8;
            __reg2 = __reg2 * __reg2 * __reg2 * __reg2 * __reg2;
            this._x = this.x + (this._x - this.x) * __reg2;
            this._y = this.y + (this._y - this.y) * __reg2;
            if (this.a--) 
            {
                return;
            }
            delete this.onEnterFrame;
            delete this.x;
            delete this.y;
            delete this.a;
        }
        ;
        this.anim = 0;
        if (this.tehai.reached) 
        {
            ++this.sc.num;
            this.sc.yama = this.sc.yama + (com.cegg.game.nerima.NerimaMain.maxTsumo - this.yama.length);
            if (this.mode) 
            {
                this.sc.time = this.sc.time + (this.tLimit - int(this.tfTimer.text)) / 1000;
            }
            this.sc.machi = this.sc.machi + com.cegg.game.mahjong.Agari.enumMachi(this.tehai.getC(), this.tehai.n).length;
            this.sc.turn = int(this.sc.yama / this.sc.num * 1000) / 1000;
            this.sc.speed = int(this.sc.time / this.sc.num * 1000) / 1000;
            this.sc.avm = int(this.sc.machi / this.sc.num * 1000) / 1000;
            if (this.mode) 
            {
                this.tfScore.text = this.sc.num + "-" + this.sc.turn + "-" + this.sc.speed + "-" + this.sc.avm;
            }
            else 
            {
                this.tfScore.text = this.sc.num + "-" + this.sc.turn + "-" + this.sc.avm;
            }
            this.onEnterFrame = this.onEnterFrame_Clear;
            return;
        }
        this.anim = 0;
        this.onEnterFrame = this.onEnterFrame_Tsumo;
    }
    ;
    __reg1.fin = function ()
    {
        delete this.onEnterFrame;
        this.onEnterFrame = undefined;
        this.STOP.setEnable(false);
        this.START.setEnable(true);
        this.tehai.removeMovieClip();
        if (this.sc.num) 
        {
            var __reg2 = "";
            __reg2 = __reg2 + ("N" + this.maxnum + " " + this.tfScore.text + "\n" + "\n" + "ROUND = " + this.sc.num + "\n" + "TURN/ROUND = " + this.sc.turn + "\n");
            if (this.mode) 
            {
                __reg2 = __reg2 + ("TIME/ROUND = " + this.sc.speed + "\n");
            }
            __reg2 = __reg2 + ("MACHI/ROUND = " + this.sc.avm + "\n" + "\n" + com.cegg.game.mahjong.Res.T_ABOUTNERIMARECORD);
            com.cegg.GDialog.messageBox(_root.Main, __reg2);
        }
    }
    ;
    __reg1.sendDa = function (hai136)
    {
        this.dahai(hai136);
    }
    ;
    __reg1.sendReach = function (hai136)
    {
        _root.SE.play("SE_REACH", true, 0);
    }
    ;
    __reg1.onCommand = function (msg)
    {
        if ((__reg0 = msg.cmd) === "START") 
        {
            this.gostart();
            return;
        }
        else if (__reg0 === "MAXNUMOK") 
        {
            this.maxnum = int(msg.maxnum);
            this.gostart();
            return;
        }
        else if (__reg0 === "MODEOK") 
        {
            this.mode = int(msg.mode);
            this.gostart();
            return;
        }
        else if (__reg0 === "STOP") 
        {
            this.fin();
            return;
        }
        else if (__reg0 !== "CLOSE") 
        {
            return;
        }
        this.removeMovieClip();
        return;
    }
    ;
    ASSetPropFlags(__reg1, null, 1);
    __reg0.SymbolName = "__Packages.com.cegg.game.nerima.NerimaMain";
    __reg0.SymbolOwner = com.cegg.game.nerima.NerimaMain;
    __reg0.SymbolLinked = Object.registerClass(com.cegg.game.nerima.NerimaMain.SymbolName, com.cegg.game.nerima.NerimaMain.SymbolOwner);
    __reg0.maxTsumo = int((136 - 14 - 13 * 4) / 4);
    __reg1.maxnum = 5;
    __reg1.tLimit = 1000 * com.cegg.game.nerima.NerimaMain.maxTsumo * 2;
    __reg1.mode = 1;
}#endinitclip

//子图形 48
//  初始化剪辑
#initclip 0

if (!com.cegg.game.nikaku.NikakuMain) 
{
    if (!com) 
    {
        _global.com = new Object();
    }
    if (!com.cegg) 
    {
        _global.com.cegg = new Object();
    }
    if (!com.cegg.game) 
    {
        _global.com.cegg.game = new Object();
    }
    if (!com.cegg.game.nikaku) 
    {
        _global.com.cegg.game.nikaku = new Object();
    }
    (_global.com.cegg.game.nikaku.NikakuMain = function ()
    {
        super();
        var __reg3 = 136;
        this.createEmptyMovieClip("mc", __reg3++);
        this.createTextField("tf", __reg3++, 0, 0, 100, 20);
        com.cegg.GButton.createTextButton("HINT", com.cegg.game.mahjong.Res.T_HINT, __reg3++, this);
        com.cegg.GButton.createTextButton("RETRY", com.cegg.game.mahjong.Res.T_RETRY, __reg3++, this);
        com.cegg.GButton.createTextButton("CLOSE", com.cegg.game.mahjong.Res.T_CLOSE, __reg3++, this);
        var __reg4 = "";
        __reg4 = __reg4 + "<menu>";
        var __reg5 = 1;
        if (__reg5 < this.stage_size.length) 
        {
            for (;;) 
            {
                ++__reg5;
                if (__reg5 >= this.stage_size.length) 
                {
                    break;
                }
                __reg4 = __reg4 + ("<item disp=\"" + __reg5 + "\" cmd=\"LEVELOK\" level=\"" + __reg5 + "\"/>");
                if (!(__reg5 % 5)) 
                {
                    __reg4 = __reg4 + "<br/>";
                }
            }
        }
        __reg4 = __reg4 + "</menu>";
        com.cegg.GButton.createTextButton("LEVEL", "Level", __reg3++, this, (new XML(__reg4)).firstChild);
        this.HINT._visible = this.RETRY._visible = this.LEVEL._visible = this.CLOSE._visible = false;
        with (this.tf)
        {
            autoSize = "left";
            selectable = false;
            textColor = 16777215;
        }
        this.init();
    }
    ).prototype.__proto__ = MovieClip.prototype;
    __reg0.prototype.__constructor__ = MovieClip;
    var __reg1 = __reg0.prototype;
    __reg1.init = function ()
    {
        this.hintUsed = false;
        this.haiSel = undefined;
        this.cx = this.stage_size[com.cegg.game.nikaku.NikakuMain.level][0];
        this.cy = this.stage_size[com.cegg.game.nikaku.NikakuMain.level][1];
        if (this.cx * this.cy % 4 || 136 < this.cx * this.cy) 
        {
            return undefined;
        }
        var __reg2 = 0;
        if (__reg2 < 136) 
        {
            for (;;) 
            {
                ++__reg2;
                if (__reg2 >= 136) 
                {
                    break;
                }
                this[__reg2].removeMovieClip();
            }
        }
        var yama = [];
        var __reg3 = [];
        __reg2 = 0;
        if (__reg2 < 34) 
        {
            for (;;) 
            {
                ++__reg2;
                if (__reg2 >= 34) 
                {
                    break;
                }
                __reg3.push(__reg2);
            }
        }
        var __reg4 = [];
        __reg2 = 0;
        if (__reg2 < this.cx * this.cy) 
        {
            for (;;) 
            {
                __reg2 = __reg2 + 4;
                if (__reg2 >= this.cx * this.cy) 
                {
                    break;
                }
                var __reg5 = __reg3.splice(random(__reg3.length), 1)[0];
                __reg4.push(__reg5 * 4 + 0);
                __reg4.push(__reg5 * 4 + 1);
                __reg4.push(__reg5 * 4 + 2);
                __reg4.push(__reg5 * 4 + 3);
            }
        }
        while (__reg4.length) 
        {
            yama[__reg4.length - 1] = __reg4.splice(random(__reg4.length), 1)[0];
        }
        var __reg7 = 0;
        if (__reg7 < this.cy) 
        {
            for (;;) 
            {
                ++__reg7;
                if (__reg7 >= this.cy) 
                {
                    break;
                }
                var __reg6 = 0;
                if (__reg6 < this.cx) 
                {
                    for (;;) 
                    {
                        ++__reg6;
                        if (__reg6 >= this.cx) 
                        {
                            break;
                        }
                        var __reg8 = __reg7 * this.cx + __reg6;
                        this.attachMovie(com.cegg.game.mahjong.Hai.SymbolName, String(__reg8), __reg8, {_x: __reg6 * com.cegg.game.mahjong.Hai.X0, _y: __reg7 * com.cegg.game.mahjong.Hai.Y0, onRollOver: function ()
                        {
                            this._parent.onRollOverHai(this);
                        }
                        , onRollOut: function ()
                        {
                            this._parent.onRollOutHai();
                        }
                        , onRelease: function ()
                        {
                            this._parent.onReleaseHai(this);
                        }
                        , onReleaseOutside: function ()
                        {
                            this._parent.onRollOutHai();
                        }
                        });
                        this[__reg8].c = __reg6 + __reg7;
                        this[__reg8].onEnterFrame = function ()
                        {
                            if (this.c == 1) 
                            {
                                _root.SE.play("SE_KACHI");
                            }
                            if (this.c--) 
                            {
                                return undefined;
                            }
                            this.setImage(int(yama.pop()), 0, false);
                            delete (this.onEnterFrame);
                        }
                        ;
                    }
                }
            }
        }
        this.tf.text = "Level  " + com.cegg.game.nikaku.NikakuMain.level;
        this.HINT._visible = this.RETRY._visible = this.LEVEL._visible = this.CLOSE._visible = true;
        this.HINT._x = int((com.cegg.game.mahjong.Hai.X0 * this.cx - this.HINT._width - this.RETRY._width - this.LEVEL._width - this.CLOSE._width) / 2);
        this.RETRY._x = this.HINT._x + this.HINT._width;
        this.LEVEL._x = this.RETRY._x + this.RETRY._width;
        this.CLOSE._x = this.LEVEL._x + this.LEVEL._width;
        this.HINT._y = this.RETRY._y = this.LEVEL._y = this.CLOSE._y = com.cegg.game.mahjong.Hai.Y0 * (this.cy + 1);
        this.tf._y = 0 - this.tf._height;
        this._x = int((Stage.width - com.cegg.game.mahjong.Hai.X0 * this.cx) / 2);
        this._y = Stage.height - (this.HINT._y + this.HINT._height);
    }
    ;
    __reg1.onRollOverHai = function (mc)
    {
        if (mc.hai136 != undefined) 
        {
            var __reg3 = 0;
            if (__reg3 < 136) 
            {
                for (;;) 
                {
                    ++__reg3;
                    if (__reg3 >= 136) 
                    {
                        break;
                    }
                    if (this[__reg3].hai136 != undefined) 
                    {
                        if (this.haiSel._name != __reg3) 
                        {
                            if (int(this[__reg3].hai136 / 4) == int(mc.hai136 / 4)) 
                            {
                                this[__reg3].setColor(1);
                            }
                        }
                    }
                }
            }
            if (this.haiSel != undefined) 
            {
                this.haiSel.setColor(2);
            }
        }
    }
    ;
    __reg1.onRollOutHai = function ()
    {
        var __reg2 = 0;
        if (__reg2 < 136) 
        {
            if (this.haiSel._name == __reg2) 
            {
                for (;;) 
                {
                    ++__reg2;
                    if (__reg2 >= 136) 
                    {
                        return;
                    }
                    if (this.haiSel._name != __reg2) 
                    {
                        break;
                    }
                }
            }
            this[__reg2].setColor(0);
        }
    }
    ;
    __reg1.onReleaseHai = function (hai)
    {
        if (this.haiSel) 
        {
            this.mc.clear();
            this.mc.lineStyle(8, 16776960, 50);
            if (this.findPath(this.mc, this.haiSel, hai)) 
            {
                _root.SE.play("SE_PON");
                this.haiSel.removeMovieClip();
                hai.removeMovieClip();
                delete this.haiSel;
                if (this.isComplete()) 
                {
                    if (com.cegg.game.nikaku.NikakuMain.level == this.stage_size.length - 1 && !this.hintUsed) 
                    {
                        com.cegg.GDialog.messageBox(_root.Main, "Complete !!");
                    }
                    else 
                    {
                        if (!this.hintUsed) 
                        {
                            ++com.cegg.game.nikaku.NikakuMain.level;
                        }
                        this.init();
                    }
                }
                else if (!this.showHint(undefined)) 
                {
                    com.cegg.GDialog.messageBox(_root.Main, "Dead lock !!");
                }
            }
            else 
            {
                _root.SE.play("SE_KACHI");
                delete this.haiSel;
            }
            this.onRollOutHai();
            return;
        }
        this.haiSel = hai;
        this.onRollOverHai(hai);
    }
    ;
    __reg1.isComplete = function ()
    {
        var __reg2 = 0;
        if (__reg2 < 136) 
        {
            for (;;) 
            {
                ++__reg2;
                if (__reg2 >= 136) 
                {
                    break;
                }
                if (this[__reg2]) 
                {
                    return false;
                }
            }
        }
        return true;
    }
    ;
    __reg1.showHint = function (mc)
    {
        var __reg3 = 0;
        if (__reg3 < 136) 
        {
            for (;;) 
            {
                ++__reg3;
                if (__reg3 >= 136) 
                {
                    break;
                }
                if (this[__reg3]) 
                {
                    var __reg4 = __reg3 + 1;
                    if (__reg4 < 136) 
                    {
                        for (;;) 
                        {
                            ++__reg4;
                            if (__reg4 >= 136) 
                            {
                                break;
                            }
                            if (this[__reg4]) 
                            {
                                if (int(this[__reg3].hai136 / 4) == int(this[__reg4].hai136 / 4)) 
                                {
                                    if (this.findPath(mc, this[__reg3], this[__reg4])) 
                                    {
                                        return true;
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }
        return false;
    }
    ;
    __reg1.findPath = function (mc, h0, h1)
    {
        if (h0 == h1) 
        {
            return false;
        }
        if (int(h0.hai136 / 4) != int(h1.hai136 / 4)) 
        {
            return false;
        }
        var __reg5 = int(int(h0._name) % this.cx);
        var __reg6 = int(int(h0._name) / this.cx);
        var __reg7 = int(int(h1._name) % this.cx);
        var __reg8 = int(int(h1._name) / this.cx);
        var __reg9 = [];
        if ((__reg5 == __reg7 && (__reg6 + 1 == __reg8 || __reg6 == __reg8 + 1)) || (__reg6 == __reg8 && (__reg5 + 1 == __reg7 || __reg5 == __reg7 + 1))) 
        {
            __reg9.push([__reg5, __reg6, __reg7, __reg8]);
            if (!mc) 
            {
                return true;
            }
        }
        var __reg10 = __reg5;
        var __reg11 = __reg7;
        var __reg12 = __reg6;
        var __reg13 = __reg8;
        if (__reg10 > 0) 
        {
            for (;;) 
            {
                --__reg10;
                if (__reg10 <= 0) 
                {
                    break;
                }
                if (this[__reg6 * this.cx + (__reg10 - 1)]) 
                {
                    break;
                }
            }
        }
        if (__reg11 > 0) 
        {
            for (;;) 
            {
                --__reg11;
                if (__reg11 <= 0) 
                {
                    break;
                }
                if (this[__reg8 * this.cx + (__reg11 - 1)]) 
                {
                    break;
                }
            }
        }
        if (__reg12 > 0) 
        {
            for (;;) 
            {
                --__reg12;
                if (__reg12 <= 0) 
                {
                    break;
                }
                if (this[(__reg12 - 1) * this.cx + __reg5]) 
                {
                    break;
                }
            }
        }
        if (__reg13 > 0) 
        {
            for (;;) 
            {
                --__reg13;
                if (__reg13 <= 0) 
                {
                    break;
                }
                if (this[(__reg13 - 1) * this.cx + __reg7]) 
                {
                    break;
                }
            }
        }
        if (__reg10 == 0) 
        {
            __reg10 = -1;
        }
        if (__reg11 == 0) 
        {
            __reg11 = -1;
        }
        if (__reg12 == 0) 
        {
            __reg12 = -1;
        }
        if (__reg13 == 0) 
        {
            __reg13 = -1;
        }
        var __reg14 = __reg5;
        var __reg15 = __reg7;
        var __reg16 = __reg6;
        var __reg17 = __reg8;
        if (__reg14 < this.cx - 1) 
        {
            for (;;) 
            {
                ++__reg14;
                if (__reg14 >= this.cx - 1) 
                {
                    break;
                }
                if (this[__reg6 * this.cx + (__reg14 + 1)]) 
                {
                    break;
                }
            }
        }
        if (__reg15 < this.cx - 1) 
        {
            for (;;) 
            {
                ++__reg15;
                if (__reg15 >= this.cx - 1) 
                {
                    break;
                }
                if (this[__reg8 * this.cx + (__reg15 + 1)]) 
                {
                    break;
                }
            }
        }
        if (__reg16 < this.cy - 1) 
        {
            for (;;) 
            {
                ++__reg16;
                if (__reg16 >= this.cy - 1) 
                {
                    break;
                }
                if (this[(__reg16 + 1) * this.cx + __reg5]) 
                {
                    break;
                }
            }
        }
        if (__reg17 < this.cy - 1) 
        {
            for (;;) 
            {
                ++__reg17;
                if (__reg17 >= this.cy - 1) 
                {
                    break;
                }
                if (this[(__reg17 + 1) * this.cx + __reg7]) 
                {
                    break;
                }
            }
        }
        if (__reg14 == this.cx - 1) 
        {
            __reg14 = this.cx;
        }
        if (__reg15 == this.cx - 1) 
        {
            __reg15 = this.cx;
        }
        if (__reg16 == this.cy - 1) 
        {
            __reg16 = this.cy;
        }
        if (__reg17 == this.cy - 1) 
        {
            __reg17 = this.cy;
        }
        if (!__reg9.length && (__reg5 != __reg7 && __reg6 != __reg8)) 
        {
            if (__reg5 < __reg7 && (__reg6 < __reg8 && (__reg7 <= __reg14 && __reg13 <= __reg6))) 
            {
                __reg9.push([__reg5, __reg6, __reg7, __reg6, __reg7, __reg8]);
            }
            if (__reg7 < __reg5 && (__reg8 < __reg6 && (__reg5 <= __reg15 && __reg12 <= __reg8))) 
            {
                __reg9.push([__reg5, __reg6, __reg5, __reg8, __reg7, __reg8]);
            }
            if (__reg5 < __reg7 && (__reg6 < __reg8 && (__reg11 <= __reg5 && __reg8 <= __reg16))) 
            {
                __reg9.push([__reg5, __reg6, __reg5, __reg8, __reg7, __reg8]);
            }
            if (__reg7 < __reg5 && (__reg8 < __reg6 && (__reg10 <= __reg7 && __reg6 <= __reg17))) 
            {
                __reg9.push([__reg5, __reg6, __reg7, __reg6, __reg7, __reg8]);
            }
            if (__reg7 < __reg5 && (__reg6 < __reg8 && (__reg5 <= __reg15 && __reg8 <= __reg16))) 
            {
                __reg9.push([__reg5, __reg6, __reg5, __reg8, __reg7, __reg8]);
            }
            if (__reg5 < __reg7 && (__reg8 < __reg6 && (__reg7 <= __reg14 && __reg6 <= __reg17))) 
            {
                __reg9.push([__reg5, __reg6, __reg7, __reg6, __reg7, __reg8]);
            }
            if (__reg5 < __reg7 && (__reg8 < __reg6 && (__reg11 <= __reg5 && __reg12 <= __reg8))) 
            {
                __reg9.push([__reg5, __reg6, __reg5, __reg8, __reg7, __reg8]);
            }
            if (__reg7 < __reg5 && (__reg6 < __reg8 && (__reg10 <= __reg7 && __reg13 <= __reg6))) 
            {
                __reg9.push([__reg5, __reg6, __reg7, __reg6, __reg7, __reg8]);
            }
            if (!mc && __reg9.length) 
            {
                return true;
            }
        }
        if (!__reg9.length) 
        {
            if (__reg10 <= __reg15 || __reg11 <= __reg14) 
            {
                var __reg20 = __reg10 >= __reg11 ? __reg10 : __reg11;
                var __reg21 = __reg14 <= __reg15 ? __reg14 : __reg15;
                var __reg22 = __reg6 >= __reg8 ? __reg8 : __reg6;
                var __reg23 = __reg6 <= __reg8 ? __reg8 : __reg6;
                var __reg18 = __reg20;
                if (__reg18 <= __reg21) 
                {
                    for (;;) 
                    {
                        ++__reg18;
                        if (__reg18 > __reg21) 
                        {
                            break;
                        }
                        if (__reg18 != -1 && __reg18 != this.cx) 
                        {
                            var __reg19 = __reg22;
                            if (__reg19 <= __reg23) 
                            {
                                for (;;) 
                                {
                                    ++__reg19;
                                    if (__reg19 > __reg23) 
                                    {
                                        break;
                                    }
                                    if (this[__reg19 * this.cx + __reg18]) 
                                    {
                                        break;
                                    }
                                }
                            }
                        }
                        if (__reg18 == -1 || (__reg18 == this.cx || __reg19 == __reg23 + 1)) 
                        {
                            if (__reg22 == __reg6) 
                            {
                                __reg9.push([__reg5, __reg6, __reg18, __reg22, __reg18, __reg23, __reg7, __reg8]);
                            }
                            else 
                            {
                                __reg9.push([__reg7, __reg8, __reg18, __reg22, __reg18, __reg23, __reg5, __reg6]);
                            }
                            if (!mc) 
                            {
                                return true;
                            }
                        }
                    }
                }
            }
            if (__reg12 <= __reg17 || __reg13 <= __reg16) 
            {
                var __reg24 = __reg5 >= __reg7 ? __reg7 : __reg5;
                var __reg25 = __reg5 <= __reg7 ? __reg7 : __reg5;
                var __reg26 = __reg12 >= __reg13 ? __reg12 : __reg13;
                var __reg27 = __reg16 <= __reg17 ? __reg16 : __reg17;
                __reg19 = __reg26;
                if (__reg19 <= __reg27) 
                {
                    for (;;) 
                    {
                        ++__reg19;
                        if (__reg19 > __reg27) 
                        {
                            break;
                        }
                        if (__reg19 != -1 && __reg19 != this.cy) 
                        {
                            __reg18 = __reg24;
                            if (__reg18 <= __reg25) 
                            {
                                for (;;) 
                                {
                                    ++__reg18;
                                    if (__reg18 > __reg25) 
                                    {
                                        break;
                                    }
                                    if (this[__reg19 * this.cx + __reg18]) 
                                    {
                                        break;
                                    }
                                }
                            }
                        }
                        if (__reg19 == -1 || (__reg19 == this.cy || __reg18 == __reg25 + 1)) 
                        {
                            if (__reg24 == __reg5) 
                            {
                                __reg9.push([__reg5, __reg6, __reg24, __reg19, __reg25, __reg19, __reg7, __reg8]);
                            }
                            else 
                            {
                                __reg9.push([__reg7, __reg8, __reg24, __reg19, __reg25, __reg19, __reg5, __reg6]);
                            }
                            if (!mc) 
                            {
                                return true;
                            }
                        }
                    }
                }
            }
        }
        if (!mc) 
        {
            return false;
        }
        var __reg28 = __reg9.length > 0;
        var __reg29 = 0;
        var __reg30 = 10000;
        var __reg31 = 0;
        if (__reg31 < __reg9.length) 
        {
            for (;;) 
            {
                ++__reg31;
                if (__reg31 >= __reg9.length) 
                {
                    break;
                }
                var __reg32 = __reg9[__reg31];
                var __reg33 = Math.abs(__reg32[2] - __reg32[0]) + Math.abs(__reg32[3] - __reg32[1]);
                if (__reg32.length >= 6) 
                {
                    __reg33 = __reg33 + (Math.abs(__reg32[4] - __reg32[2]) + Math.abs(__reg32[5] - __reg32[3]));
                }
                if (__reg32.length >= 8) 
                {
                    __reg33 = __reg33 + (Math.abs(__reg32[6] - __reg32[4]) + Math.abs(__reg32[7] - __reg32[5]));
                }
                if (__reg30 > __reg33) 
                {
                    __reg30 = __reg33;
                    __reg29 = __reg31;
                }
            }
        }
        with (mc)
        {
            _alpha = 100;
            _x = int(com.cegg.game.mahjong.Hai.X0 / 2);
            _y = int(com.cegg.game.mahjong.Hai.Y0 / 2);
            var __reg34 = __reg9[__reg29];
            moveTo(__reg34[0] * com.cegg.game.mahjong.Hai.X0, __reg34[1] * com.cegg.game.mahjong.Hai.Y0);
            lineTo(__reg34[2] * com.cegg.game.mahjong.Hai.X0, __reg34[3] * com.cegg.game.mahjong.Hai.Y0);
            if (__reg34.length >= 6) 
            {
                lineTo(__reg34[4] * com.cegg.game.mahjong.Hai.X0, __reg34[5] * com.cegg.game.mahjong.Hai.Y0);
            }
            if (__reg34.length >= 8) 
            {
                lineTo(__reg34[6] * com.cegg.game.mahjong.Hai.X0, __reg34[7] * com.cegg.game.mahjong.Hai.Y0);
            }
        }
        mc.onEnterFrame = function ()
        {
            this._alpha = this._alpha - 8;
            if (this._alpha <= 0) 
            {
                this.clear();
                this._alpha = 100;
                delete this.onEnterFrame;
            }
        }
        ;
        return __reg28;
    }
    ;
    __reg1.onCommand = function (msg)
    {
        if ((__reg0 = msg.cmd) === "RETRY") 
        {
            this.init();
            return;
        }
        else if (__reg0 === "HINT") 
        {
            this.hintUsed = true;
            this.mc.clear();
            this.mc.lineStyle(8, 65535, 50);
            this.showHint(this.mc);
            return;
        }
        else if (__reg0 === "LEVELOK") 
        {
            com.cegg.game.nikaku.NikakuMain.level = msg.level;
            this.init();
            return;
        }
        else if (__reg0 !== "CLOSE") 
        {
            return;
        }
        this.removeMovieClip();
        return;
    }
    ;
    ASSetPropFlags(__reg1, null, 1);
    __reg0.SymbolName = "__Packages.com.cegg.game.nikaku.NikakuMain";
    __reg0.SymbolOwner = com.cegg.game.nikaku.NikakuMain;
    __reg0.SymbolLinked = Object.registerClass(com.cegg.game.nikaku.NikakuMain.SymbolName, com.cegg.game.nikaku.NikakuMain.SymbolOwner);
    __reg0.level = 1;
    __reg1.cx = 17;
    __reg1.cy = 8;
    __reg1.hintUsed = false;
    __reg1.stage_size = [undefined, [4, 3], [4, 4], [5, 4], [6, 4], [7, 4], [8, 4], [6, 6], [5, 8], [6, 8], [7, 8], [8, 8], [9, 8], [10, 8], [11, 8], [12, 8], [13, 8], [14, 8], [15, 8], [16, 8], [17, 8]];
}#endinitclip

//子图形 49
//  初始化剪辑
#initclip 0

if (!com.cegg.game.mahjong.Tehai) 
{
    if (!com) 
    {
        _global.com = new Object();
    }
    if (!com.cegg) 
    {
        _global.com.cegg = new Object();
    }
    if (!com.cegg.game) 
    {
        _global.com.cegg.game = new Object();
    }
    if (!com.cegg.game.mahjong) 
    {
        _global.com.cegg.game.mahjong = new Object();
    }
    (_global.com.cegg.game.mahjong.Tehai = function ()
    {
        super();
        com.cegg.game.mahjong.CountDown.excount = com.cegg.game.mahjong.CountDown.excountinit;
    }
    ).prototype.__proto__ = MovieClip.prototype;
    __reg0.prototype.__constructor__ = MovieClip;
    var __reg1 = __reg0.prototype;
    __reg1.posHai = function (pos)
    {
        var __reg3 = {x: 0, y: 0};
        if ((__reg0 = this.who) === 0) 
        {
            __reg3.x = int((Stage.width - com.cegg.game.mahjong.Hai.XT * 13) / 2 - 10 + com.cegg.game.mahjong.Hai.XT * pos);
        }
        else if (__reg0 === 1) 
        {
            __reg3.y = int((Stage.height - 20 + com.cegg.game.mahjong.Hai.Y1 * 13) / 2 + 10 - com.cegg.game.mahjong.Hai.Y1 * (pos + 1) + this.nakiPos * 0.070000000298);
        }
        else if (__reg0 === 2) 
        {
            __reg3.x = int((Stage.width + com.cegg.game.mahjong.Hai.X0 * 13) / 2 + 10 - com.cegg.game.mahjong.Hai.X0 * (pos + 1) + this.nakiPos * 0.070000000298);
        }
        else if (__reg0 === 3) 
        {
            __reg3.y = int((Stage.height - 20 - com.cegg.game.mahjong.Hai.Y1 * 13) / 2 - 10 + com.cegg.game.mahjong.Hai.Y1 * pos - this.nakiPos * 0.140000000596);
        }
        if (pos == this.n) 
        {
            if ((__reg0 = this.who) === 0) 
            {
                __reg3.x = __reg3.x + 6;
            }
            else if (__reg0 === 1) 
            {
                __reg3.y = __reg3.y - 4;
            }
            else if (__reg0 === 2) 
            {
                __reg3.x = __reg3.x - 6;
            }
            else if (__reg0 === 3) 
            {
                __reg3.y = __reg3.y + 4;
            }
        }
        return __reg3;
    }
    ;
    __reg1.createHai = function (pos, hai136)
    {
        var __reg4 = this.posHai(pos);
        this.attachMovie(com.cegg.game.mahjong.Hai.SymbolName, String(pos), this.who == 1 || this.who == 2 ? 21 - pos : pos, {_x: __reg4.x, _y: __reg4.y});
        var __reg5 = this[pos];
        __reg5.hai = hai136;
        if (this.who) 
        {
            return undefined;
        }
        __reg5.naki = undefined;
        __reg5.focused = false;
        __reg5.enabled = true;
        __reg5.onRollOver = function ()
        {
            if (this.enabled) 
            {
                this.focused = true;
                if (this.naki) 
                {
                    if (this.naki.length > 2) 
                    {
                        this._parent[this.naki[2]].setColor(3, -5);
                    }
                    if (this.naki.length > 1) 
                    {
                        this._parent[this.naki[1]].setColor(3, -5);
                    }
                    this._parent[this.naki[0]].setColor(3, -5);
                    this.setColor(3, -5);
                    return;
                }
                if (this.onRelease) 
                {
                    this.setColor(1);
                    return;
                }
                this.setColor(2);
            }
        }
        ;
        __reg5.onRollOut = function ()
        {
            this.focused = false;
            if (this.naki) 
            {
                if (this.naki.length > 2) 
                {
                    this._parent[this.naki[2]].onRollOut();
                }
                if (this.naki.length > 1) 
                {
                    this._parent[this.naki[1]].onRollOut();
                }
                this._parent[this.naki[0]].onRollOut();
            }
            this.setColor(this.enabled ? 0 : 4, this.anim.c ? undefined : 0);
        }
        ;
        __reg5.onDragOver = function ()
        {
            this.onRollOver();
        }
        ;
        __reg5.onDragOut = function ()
        {
            this.onRollOut();
        }
        ;
        __reg5.clearNaki = function ()
        {
            this.nakis.removeMovieClip();
            delete this.naki;
            delete this.nakiString;
        }
        ;
        __reg5.setEnable = function (ok)
        {
            this.enabled = true;
            if (ok) 
            {
                this.onRelease = function ()
                {
                    this._parent.setEnable(false);
                    this._parent._parent.sendDa(int(this.hai));
                }
                ;
                if (this.focused) 
                {
                    this.onRollOver();
                }
                else 
                {
                    this.setColor(0);
                }
                return;
            }
            this.clearNaki();
            delete this.onRelease;
        }
        ;
        __reg5.setDisable = function ()
        {
            this.enabled = false;
            this.clearNaki();
            this.setColor(4);
            delete (this.onRelease);
        }
        ;
    }
    ;
    __reg1.setAnim = function (mc, x, y, sound, godepth, sleep)
    {
        if (this.noanim) 
        {
            mc._x = x;
            mc._y = y;
            return;
        }
        if (mc._x == x && mc._y == y) 
        {
            if (godepth != undefined) 
            {
                mc.swapDepths(godepth);
            }
            return;
        }
        mc.sleep = sleep;
        mc.godepth = godepth;
        mc.x = x;
        mc.y = y;
        mc.a = 8;
        mc.onEnterFrame = function ()
        {
            if (this.sleep > 0) 
            {
                --this.sleep;
                return undefined;
            }
            if (this.initdepth != undefined) 
            {
                this.swapDepths(this.initdepth);
                this.initdepth = undefined;
            }
            var __reg2 = this.a / 8;
            __reg2 = __reg2 * __reg2;
            this._x = this.x + (this._x - this.x) * __reg2;
            this._y = this.y + (this._y - this.y) * __reg2;
            if (this.a == 6 && sound) 
            {
                _root.SE.play("SE_KACHI", false, this._parent.who);
            }
            if (this.a == 4 && this.godepth != undefined) 
            {
                this.swapDepths(this.godepth);
            }
            if (this.a--) 
            {
                return;
            }
            delete (this.a);
            delete this.y;
            delete (this.x);
            delete (this.godepth);
            delete (this.sleep);
            delete (this.onEnterFrame);
        }
        ;
    }
    ;
    __reg1.updateDepths = function ()
    {
        var __reg2 = 0;
        if (__reg2 < this.n) 
        {
            this[__reg2].swapDepths(this.who == 1 || this.who == 2 ? 21 - __reg2 : __reg2);
        }
    }
    ;
    __reg1.initsort = function ()
    {
        this.AsyncSort(0);
        if (this.who) 
        {
            return;
        }
        this.updateDepths();
    }
    ;
    __reg1.AsyncSort = function (sleep)
    {
        var __reg4 = [];
        var __reg3 = 0;
        if (__reg3 < this.n) 
        {
            for (;;) 
            {
                ++__reg3;
                if (__reg3 >= this.n) 
                {
                    break;
                }
                __reg4.push({mc: this[__reg3], o: this[__reg3].hai == undefined ? __reg3 / 100 : this[__reg3].hai});
            }
        }
        __reg4.sort(function (x, y)
        {
            return x.o - y.o;
        }
        );
        __reg3 = 0;
        if (__reg3 < this.n) 
        {
            for (;;) 
            {
                ++__reg3;
                if (__reg3 >= this.n) 
                {
                    break;
                }
                __reg4[__reg3].mc._name = __reg3;
            }
        }
        __reg3 = 0;
        if (__reg3 < this.n) 
        {
            var __reg5 = this.posHai(__reg3);
            this.setAnim(this[__reg3], __reg5.x, __reg5.y, false, this.who == 1 || this.who == 2 ? 21 - __reg3 : __reg3, sleep);
        }
    }
    ;
    __reg1.getC = function ()
    {
        var __reg2 = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0];
        var __reg3 = 0;
        if (__reg3 < this.n) 
        {
            for (;;) 
            {
                ++__reg3;
                if (__reg3 >= this.n) 
                {
                    break;
                }
                ++__reg2[int(this[__reg3].hai / 4)];
            }
        }
        return __reg2;
    }
    ;
    __reg1.checkReach = function ()
    {
        if (this.who) 
        {
            return false;
        }
        if (this.reached) 
        {
            return false;
        }
        if (!this.menzen) 
        {
            return false;
        }
        var __reg2 = [];
        var __reg3 = 0;
        if (__reg3 < this.n) 
        {
            for (;;) 
            {
                ++__reg3;
                if (__reg3 >= this.n) 
                {
                    break;
                }
                __reg2.push(int(this[__reg3].hai / 4));
                this.toReach[__reg3] = false;
            }
        }
        var __reg4 = com.cegg.game.mahjong.Agari.checkReach(__reg2);
        if (!__reg4.length) 
        {
            return false;
        }
        if (__reg4[0] == -1) 
        {
            __reg3 = 0;
            if (__reg3 < this.n) 
            {
                for (;;) 
                {
                    ++__reg3;
                    if (__reg3 >= this.n) 
                    {
                        break;
                    }
                    this.toReach[__reg3] = true;
                }
            }
            return true;
        }
        var __reg5 = -1;
        var __reg6 = {};
        __reg4.sort(function (x, y)
        {
            return int(x) - int(y);
        }
        );
        while (__reg4.length) 
        {
            __reg3 = int(__reg4.shift());
            if (__reg3 > __reg5) 
            {
                __reg5 = __reg3;
                if (__reg6[int(__reg3 / 34)] == undefined) 
                {
                    __reg6[int(__reg3 / 34)] = "";
                }
                __reg6[int(__reg3 / 34)] = __reg6[int(__reg3 / 34)] + com.cegg.game.mahjong.Res.T_HAI[__reg3 % 34];
            }
        }
        for (var __reg7 in __reg6) 
        {
            __reg3 = 0;
            if (__reg3 < this.n) 
            {
                for (;;) 
                {
                    ++__reg3;
                    if (__reg3 >= this.n) 
                    {
                        break;
                    }
                    if (int(this[__reg3].hai / 4) == __reg7) 
                    {
                        this.toReach[__reg3] = true;
                    }
                }
            }
        }
        return true;
    }
    ;
    __reg1.ReInit = function (hai, m)
    {
        this.noanim = true;
        if (m != undefined) 
        {
            var __reg4 = m.length - 1;
            if (__reg4 >= 0) 
            {
                for (;;) 
                {
                    --__reg4;
                    if (__reg4 < 0) 
                    {
                        break;
                    }
                    this.Naki(int(m[__reg4]), undefined);
                }
            }
        }
        if (hai == undefined) 
        {
            __reg4 = 13;
            if (m != undefined) 
            {
                var __reg5 = 0;
                if (__reg5 < m.length) 
                {
                    for (;;) 
                    {
                        ++__reg5;
                        if (__reg5 >= m.length) 
                        {
                            break;
                        }
                        var __reg6 = com.cegg.game.mahjong.Mentsu136.getNakiType(m[__reg5]);
                        if (__reg6 != 5) 
                        {
                            if (__reg6 != 10) 
                            {
                                __reg4 = __reg4 - 3;
                            }
                        }
                    }
                }
            }
            this.n = 0;
            if (this.n < __reg4) 
            {
                for (;;) 
                {
                    ++this.n;
                    if (this.n >= __reg4) 
                    {
                        break;
                    }
                    this.createHai(this.n, undefined);
                    this[this.n].setImage(undefined, this.who, true);
                }
            }
        }
        else 
        {
            this.n = 0;
            if (this.n < hai.length) 
            {
                for (;;) 
                {
                    ++this.n;
                    if (this.n >= hai.length) 
                    {
                        break;
                    }
                    this.createHai(this.n, int(hai[this.n]));
                    this[this.n].setImage(int(hai[this.n]), this.who, true);
                }
            }
        }
        if (this.n % 3 != 2) 
        {
            this.AsyncSort(0);
        }
        this.updateDepths();
        this.noanim = false;
    }
    ;
    __reg1.Tsumo = function (pt, hai136, activate, flags, tsumogiri, autoron)
    {
        this.updateDepths();
        if (_root.Main.View.LogViewer) 
        {
            var __reg8 = 0;
            if (__reg8 < this.n) 
            {
                for (;;) 
                {
                    ++__reg8;
                    if (__reg8 >= this.n) 
                    {
                        break;
                    }
                    this[__reg8].sleep = this[__reg8].a = 0;
                }
            }
        }
        this.createHai(this.n, hai136);
        this[this.n].setImage(hai136, this.who, true);
        if (!this.noanim) 
        {
            this[this.n].globalToLocal(pt);
            this[this.n].setImage(undefined, this.who, false);
            this[this.n][0].removeMovieClip();
            var __reg9 = this[this.n].anim;
            __reg9._x = pt.x;
            __reg9._y = pt.y;
            __reg9.onTickAnimation = function ()
            {
                var __reg2 = this.c * 0.10000000149;
                this._x = this._x * __reg2;
                this._y = this._y * __reg2;
                if (this.c == 4) 
                {
                    this._parent.setImage(this._parent.hai, this._parent._parent.who, true);
                }
                if (--this.c) 
                {
                    return;
                }
                if (this.iid) 
                {
                    _global.clearInterval(this.iid);
                }
                this.iid = undefined;
                delete this.onTickAnimation;
                delete this.onInterval;
                delete this.onEnterFrame;
                this._x = 0;
                this._y = 0;
            }
            ;
            if (com.cegg.game.mahjong.UtilBase.bPremiumVersion) 
            {
                __reg9.c = 10;
                com.cegg.game.mahjong.AnimationQ.push(__reg9);
            }
            else 
            {
                __reg9.c = 9;
                __reg9.onEnterFrame = __reg9.onTickAnimation;
            }
        }
        ++this.n;
        if (this.silent) 
        {
            return undefined;
        }
        if (this.who) 
        {
            return undefined;
        }
        if (activate) 
        {
            if (autoron && flags & com.cegg.game.mahjong.Res.NAKI_TSUMO) 
            {
                this.onCommand({cmd: "tsumo"});
                return undefined;
            }
            var __reg10 = true;
            this.setEnable(true);
            var __reg11 = false;
            var __reg12 = {tsumo: (flags & com.cegg.game.mahjong.Res.NAKI_TSUMO) != 0, reach: flags & com.cegg.game.mahjong.Res.NAKI_REACH ? this.checkReach() : false, ryuukyoku: (flags & com.cegg.game.mahjong.Res.NAKI_RYUUKYOKU) != 0, nuku: flags & com.cegg.game.mahjong.Res.NAKI_NUKU && this.isEnableNuku()};
            if (__reg12.tsumo || (__reg12.reach || (__reg12.ryuukyoku || __reg12.nuku))) 
            {
                this.attachMovie(com.cegg.game.mahjong.NakiBox.SymbolName, "nb", 100, __reg12);
                _root.SE.play("SE_NAKI");
                this.nb._x = this.posHai(this.n).x - this.nb._width + 20;
                this.nb._y = -40;
                if (this.nb._x < 0) 
                {
                    this.nb._x = 0;
                }
                __reg10 = false;
            }
            if (__reg12.tsumo) 
            {
                __reg11 = true;
            }
            if (flags & com.cegg.game.mahjong.Res.NAKI_KAN) 
            {
                var __reg13 = 0;
                if (__reg13 < 20) 
                {
                    for (;;) 
                    {
                        ++__reg13;
                        if (__reg13 >= 20) 
                        {
                            break;
                        }
                        var __reg14 = this["naki" + __reg13].chahai;
                        if (__reg14 != undefined) 
                        {
                            var __reg15 = 0;
                            if (__reg15 < this.n) 
                            {
                                for (;;) 
                                {
                                    ++__reg15;
                                    if (__reg15 >= this.n) 
                                    {
                                        break;
                                    }
                                    if (this[__reg15].hai == __reg14) 
                                    {
                                        break;
                                    }
                                }
                            }
                            if (__reg15 != this.n) 
                            {
                                this["naki" + __reg13].setChakanEnable(this[__reg15]);
                                __reg10 = false;
                            }
                        }
                    }
                }
            }
            if (flags & com.cegg.game.mahjong.Res.NAKI_KAN) 
            {
                var __reg16 = [];
                var __reg17 = this.getC();
                if (this.reached) 
                {
                    --__reg17[int(hai136 / 4)];
                    var __reg19 = String(com.cegg.game.mahjong.Agari.enumMachi(__reg17, undefined));
                    ++__reg17[int(hai136 / 4)];
                    __reg18 = 0;
                    if (__reg18 < 34) 
                    {
                        for (;;) 
                        {
                            ++__reg18;
                            if (__reg18 >= 34) 
                            {
                                break;
                            }
                            if (__reg18 == int(hai136 / 4)) 
                            {
                                if (__reg17[__reg18] == 4) 
                                {
                                    __reg17[__reg18] = __reg17[__reg18] - 4;
                                    if (__reg19 == String(com.cegg.game.mahjong.Agari.enumMachi(__reg17, undefined))) 
                                    {
                                        __reg16.push(__reg18);
                                    }
                                    __reg17[__reg18] = __reg17[__reg18] + 4;
                                }
                            }
                        }
                    }
                }
                else 
                {
                    var __reg18 = 0;
                    if (__reg18 < 34) 
                    {
                        for (;;) 
                        {
                            ++__reg18;
                            if (__reg18 >= 34) 
                            {
                                break;
                            }
                            if (__reg17[__reg18] == 4) 
                            {
                                __reg16.push(__reg18);
                            }
                        }
                    }
                }
                while (__reg16.length) 
                {
                    __reg10 = false;
                    var __reg20 = int(__reg16.shift());
                    var __reg21 = [];
                    var __reg22 = 0;
                    if (__reg22 < this.n) 
                    {
                        for (;;) 
                        {
                            ++__reg22;
                            if (__reg22 >= this.n) 
                            {
                                break;
                            }
                            if (int(this[__reg22].hai / 4) == __reg20) 
                            {
                                __reg21.push(__reg22);
                            }
                        }
                    }
                    if (__reg21.length == 4) 
                    {
                        this[__reg21[2]].setEnable(true);
                        this[__reg21[2]].naki = [__reg21[3], __reg21[0], __reg21[1]];
                        this[__reg21[2]].nakiString = "<N type=\"4\" hai=\"" + (__reg20 * 4 + 2) + "\" />";
                        this[__reg21[2]].attachMovie("nakis1", "nakis", 2);
                        this[__reg21[2]].onRelease = function ()
                        {
                            com.cegg.game.mahjong.Tehai.sock.send(this.nakiString);
                            this._parent.setEnable(false);
                        }
                        ;
                    }
                }
            }
            var __reg23 = true;
            if (__reg10 && (this.reached || tsumogiri)) 
            {
                __reg23 = false;
            }
            this.attachMovie(com.cegg.game.mahjong.CountDown.SymbolName, "ct", 101, {_x: this[this.n - 1]._x + 45, _y: this[this.n - 1]._y + 2, release: this[this.n - 1], nodblclk: __reg11, useex: __reg23, exadd: true});
        }
    }
    ;
    __reg1.Dahai = function (tsumogiri, hai136)
    {
        if (this.nb) 
        {
            this.nb.removeMovieClip();
        }
        var __reg4 = this.n - 1;
        var __reg5 = 0;
        if (__reg5 < this.n) 
        {
            for (;;) 
            {
                ++__reg5;
                if (__reg5 >= this.n) 
                {
                    break;
                }
                if (this[__reg5].hai == hai136) 
                {
                    break;
                }
            }
        }
        if (__reg5 == this.n) 
        {
            if (!tsumogiri) 
            {
                __reg4 = random(this.n - (this.nakida ? 0 : 1));
            }
        }
        else 
        {
            __reg4 = __reg5;
        }
        this.nakida = false;
        if (__reg4 != this.n - 1) 
        {
            var __reg6 = this[this.n - 1];
            this[__reg4]._name = this.n - 1;
            __reg6._name = String(__reg4);
        }
        var __reg7 = this[this.n - 1];
        var __reg8 = {x: 0, y: 0};
        __reg7.localToGlobal(__reg8);
        __reg7.removeMovieClip();
        --this.n;
        if (__reg4 != this.n) 
        {
            this.AsyncSort(this.who ? 10 : 5);
            if (this.who) 
            {
                if (this.who == 1 || this.who == 2) 
                {
                    this[__reg4].initdepth = 21 + 1;
                }
            }
            else 
            {
                this.updateDepths();
            }
        }
        return __reg8;
    }
    ;
    __reg1.isChiiAvailable = function (hai0, hai1, hai2)
    {
        var __reg5 = [255, 255];
        var __reg6 = int(hai2 / 4) - int(hai1 / 4);
        if (__reg6 == 1 || __reg6 == -1) 
        {
            if (int((hai1 + 36) / 4 / 9) == int(((hai1 + 36) / 4 - 1) / 9)) 
            {
                __reg5[0] = int(hai1 / 4) - 1;
            }
            if (int((hai2 + 36) / 4 / 9) == int(((hai2 + 36) / 4 + 1) / 9)) 
            {
                __reg5[1] = int(hai2 / 4) + 1;
            }
        }
        else 
        {
            __reg5[0] = int(hai0 / 4);
        }
        var __reg7 = 0;
        if (__reg7 < this.n) 
        {
            for (;;) 
            {
                ++__reg7;
                if (__reg7 >= this.n) 
                {
                    break;
                }
                if (this[__reg7].hai != hai1) 
                {
                    if (this[__reg7].hai != hai2) 
                    {
                        if ((__reg5[0] == 255 || __reg5[0] != int(this[__reg7].hai / 4)) && (__reg5[1] == 255 || __reg5[1] != int(this[__reg7].hai / 4))) 
                        {
                            break;
                        }
                    }
                }
            }
        }
        return __reg7 != this.n;
    }
    ;
    __reg1.askNaki = function (hai136, flags, dahai, autoron)
    {
        if (this.silent) 
        {
            return undefined;
        }
        var __reg6 = (flags & com.cegg.game.mahjong.Res.NAKI_RON) != 0;
        var __reg8 = -1;
        var __reg9 = 0;
        var __reg10 = [-1, -1, -1, -1, -1];
        var __reg11 = [-1, -1, -1, -1, -1];
        var __reg7 = 0;
        if (__reg7 < this.n) 
        {
            for (;;) 
            {
                ++__reg7;
                if (__reg7 >= this.n) 
                {
                    break;
                }
                if (__reg8 == int(this[__reg7].hai / 4)) 
                {
                    ++__reg9;
                    if (flags & 1 && (__reg9 == 1 && __reg8 == int(hai136 / 4))) 
                    {
                        this[__reg7].naki = [__reg7 - 1];
                        this[__reg7].nakiString = "<N type=\"1\" hai0=\"" + this[__reg7].hai + "\" hai1=\"" + this[__reg7 - 1].hai + "\" />";
                        this[__reg7].attachMovie("nakis0", "nakis", 2);
                        __reg6 = true;
                    }
                    if (flags & 2 && (__reg9 == 2 && __reg8 == int(hai136 / 4))) 
                    {
                        this[__reg7].naki = [__reg7 - 2, __reg7 - 1];
                        this[__reg7].nakiString = "<N type=\"2\" />";
                        this[__reg7].attachMovie("nakis1", "nakis", 2);
                        __reg6 = true;
                    }
                }
                else 
                {
                    __reg8 = int(this[__reg7].hai / 4);
                    __reg9 = 0;
                    if (flags & 4 && hai136 < 27 * 4) 
                    {
                        if (__reg8 % 9 < 7 && __reg8 + 2 == int(hai136 / 4)) 
                        {
                            __reg10[0] = __reg7;
                            __reg11[0] = this[__reg7].hai;
                        }
                        if (__reg8 % 9 < 8 && __reg8 + 1 == int(hai136 / 4)) 
                        {
                            __reg10[1] = __reg7;
                            __reg11[1] = this[__reg7].hai;
                        }
                        if (0 < __reg8 % 9 && __reg8 - 1 == int(hai136 / 4)) 
                        {
                            __reg10[3] = __reg7;
                            __reg11[3] = this[__reg7].hai;
                        }
                        if (1 < __reg8 % 9 && __reg8 - 2 == int(hai136 / 4)) 
                        {
                            __reg10[4] = __reg7;
                            __reg11[4] = this[__reg7].hai;
                        }
                    }
                }
            }
        }
        if (__reg10[0] != -1 && (__reg10[1] != -1 && this.isChiiAvailable(hai136, __reg11[0], __reg11[1]))) 
        {
            __reg7 = __reg10[0];
            this[__reg7].naki = [__reg10[1]];
            this[__reg7].nakiString = "<N type=\"3\" hai0=\"" + __reg11[0] + "\" hai1=\"" + __reg11[1] + "\" />";
            this[__reg7].attachMovie("nakis2", "nakis", 2);
            __reg6 = true;
        }
        if (__reg10[1] != -1 && (__reg10[3] != -1 && this.isChiiAvailable(hai136, __reg11[1], __reg11[3]))) 
        {
            __reg7 = __reg10[1];
            this[__reg7].naki = [__reg10[3]];
            this[__reg7].nakiString = "<N type=\"3\" hai0=\"" + __reg11[1] + "\" hai1=\"" + __reg11[3] + "\" />";
            this[__reg7].attachMovie("nakis2", "nakis", 2);
            __reg6 = true;
        }
        if (__reg10[3] != -1 && (__reg10[4] != -1 && this.isChiiAvailable(hai136, __reg11[3], __reg11[4]))) 
        {
            __reg7 = __reg10[3];
            this[__reg7].naki = [__reg10[4]];
            this[__reg7].nakiString = "<N type=\"3\" hai0=\"" + __reg11[3] + "\" hai1=\"" + __reg11[4] + "\" />";
            this[__reg7].attachMovie("nakis2", "nakis", 2);
            __reg6 = true;
        }
        __reg7 = 0;
        if (__reg7 < this.n) 
        {
            for (;;) 
            {
                ++__reg7;
                if (__reg7 >= this.n) 
                {
                    break;
                }
                if (this[__reg7].naki.length) 
                {
                    this[__reg7].onRelease = function ()
                    {
                        com.cegg.game.mahjong.Tehai.sock.send(this.nakiString);
                        this._parent.setEnable(false);
                    }
                    ;
                }
            }
        }
        if (__reg6) 
        {
            var __reg12 = (flags & com.cegg.game.mahjong.Res.NAKI_RON) != 0;
            this.attachMovie(com.cegg.game.mahjong.NakiBox.SymbolName, "nb", 100, {ron: flags & com.cegg.game.mahjong.Res.NAKI_RON, pass: true, dahai: dahai});
            _root.SE.play("SE_NAKI");
            this.nb._x = this.posHai(this.n + 1).x - this.nb._width + 20;
            this.nb._y = -40;
            if (this.nb._x < 0) 
            {
                this.nb._x = 0;
            }
            var __reg13 = true;
            if (autoron && flags & com.cegg.game.mahjong.Res.NAKI_RON) 
            {
                __reg13 = false;
            }
            this.attachMovie(com.cegg.game.mahjong.CountDown.SymbolName, "ct", 101, {_x: this.nb._x + this.nb._width, _y: this.nb._y + 32 - 11, command: __reg13 ? "pass" : "ron", nodblclk: __reg12, noescape: !__reg13, count: __reg13 ? undefined : 0, useex: __reg13});
            return;
        }
        com.cegg.game.mahjong.Tehai.sock.send("<N />");
    }
    ;
    __reg1.pushNuki = function (hai136, x, y)
    {
        var __reg5 = 20 - 1;
        if (__reg5 >= 0) 
        {
            for (;;) 
            {
                --__reg5;
                if (__reg5 < 0) 
                {
                    break;
                }
                if (this["naki" + __reg5].nuki) 
                {
                    break;
                }
            }
        }
        var __reg7 = 0;
        var __reg8 = 0;
        if (__reg5 == -1) 
        {
            var __reg6 = this.pushNaki(0, hai136, x, y, false);
            __reg7 = __reg6.x == undefined ? __reg6._x : __reg6.x;
            __reg8 = __reg6.y == undefined ? __reg6._y : __reg6.y;
            __reg6.nuki = 1;
        }
        else 
        {
            __reg6 = this["naki" + __reg5];
            __reg7 = __reg6.x == undefined ? __reg6._x : __reg6.x;
            __reg8 = __reg6.y == undefined ? __reg6._y : __reg6.y;
            __reg6._x = x;
            __reg6._y = y;
            ++__reg6.nuki;
            this.setAnim(__reg6, __reg7, __reg8, false, undefined, 0);
        }
        this.createEmptyMovieClip("nuki", 30);
        com.cegg.game.mahjong.Util.printDigit(this.nuki, "tendigit", 6, "<" + __reg6.nuki);
        if ((__reg0 = this.who) === 0) 
        {
            this.nuki._rotation = 90 * 4;
            this.nuki._x = __reg7 + com.cegg.game.mahjong.Hai.X0 - this.nuki._width;
            this.nuki._y = __reg8 - this.nuki._height;
            return;
        }
        else if (__reg0 === 1) 
        {
            this.nuki._rotation = 90 * 3;
            this.nuki._x = __reg7 - this.nuki._width;
            this.nuki._y = __reg8 + this.nuki._height;
            return;
        }
        else if (__reg0 === 2) 
        {
            this.nuki._rotation = 90 * 2;
            this.nuki._x = __reg7 + this.nuki._width;
            this.nuki._y = __reg8 + com.cegg.game.mahjong.Hai.Y0 + com.cegg.game.mahjong.Hai.Y0T + this.nuki._height - 2;
            return;
        }
        else if (__reg0 !== 3) 
        {
            return;
        }
        this.nuki._rotation = 90 * 1;
        this.nuki._x = __reg7 + com.cegg.game.mahjong.Hai.X1 + this.nuki._width;
        this.nuki._y = __reg8 + com.cegg.game.mahjong.Hai.Y1 + com.cegg.game.mahjong.Hai.Y1T - this.nuki._height - 3;
        return;
    }
    ;
    __reg1.pushNaki = function (yoko, hai136, x, y, chakan)
    {
        var __reg7 = 0;
        if (__reg7 < 20) 
        {
            for (;;) 
            {
                ++__reg7;
                if (__reg7 >= 20) 
                {
                    break;
                }
                if (!this["naki" + __reg7]) 
                {
                    break;
                }
            }
        }
        this.attachMovie(com.cegg.game.mahjong.Hai.SymbolName, "naki" + __reg7, this.who == 1 || this.who == 2 ? __reg7 : 21 - __reg7, {_x: x, _y: y});
        var __reg8 = this["naki" + __reg7];
        __reg8.setImage(hai136, (this.who + yoko) % 4, false);
        if (chakan) 
        {
            __reg8.chahai = hai136;
            __reg8._visible = false;
        }
        var __reg9 = com.cegg.game.mahjong.UtilBase.bPremiumVersion != true;
        if ((__reg0 = this.who) === 0) 
        {
            if (!chakan) 
            {
                this.nakiPos = this.nakiPos + (yoko ? com.cegg.game.mahjong.Hai.X1 : com.cegg.game.mahjong.Hai.X0);
            }
            this.setAnim(__reg8, Stage.width - this.nakiPos, yoko ? (chakan ? 1 : 26) : 16, __reg9, undefined, 0);
        }
        else if (__reg0 === 1) 
        {
            this.setAnim(__reg8, (chakan ? -40 : (yoko ? -9 : -18)) + 18, this.nakiPos, __reg9, undefined, 0);
            if (!chakan) 
            {
                this.nakiPos = this.nakiPos + (yoko ? com.cegg.game.mahjong.Hai.Y0 : com.cegg.game.mahjong.Hai.Y1);
            }
        }
        else if (__reg0 === 2) 
        {
            this.setAnim(__reg8, this.nakiPos - (chakan ? 40 : 0), chakan ? 25 : 0, __reg9, undefined, 0);
            if (!chakan) 
            {
                this.nakiPos = this.nakiPos + (yoko ? com.cegg.game.mahjong.Hai.X1 : com.cegg.game.mahjong.Hai.X0);
            }
        }
        else if (__reg0 === 3) 
        {
            if (!chakan) 
            {
                this.nakiPos = this.nakiPos + (yoko ? com.cegg.game.mahjong.Hai.Y0 : com.cegg.game.mahjong.Hai.Y1);
            }
            this.setAnim(__reg8, chakan ? 31 : 0, Stage.height - 20 - com.cegg.game.mahjong.Hai.Y1T - this.nakiPos - (chakan ? 35 : 0), __reg9, undefined, 0);
        }
        return __reg8;
    }
    ;
    __reg1.Naki = function (mm, pt)
    {
        this.updateDepths();
        var __reg4 = new com.cegg.game.mahjong.Mentsu136(mm);
        if (pt) 
        {
            this.globalToLocal(pt);
        }
        var __reg5 = 0;
        if (__reg5 < this.n) 
        {
            for (;;) 
            {
                ++__reg5;
                if (__reg5 >= this.n) 
                {
                    break;
                }
                var __reg6 = this[__reg5].hai;
                if (__reg4.hai0 != undefined && __reg6 == __reg4.hai0) 
                {
                    this[__reg5].hai = this[__reg5].hai | 256;
                }
                if (__reg4.hai1 != undefined && __reg6 == __reg4.hai1) 
                {
                    this[__reg5].hai = this[__reg5].hai | 256;
                }
                if (__reg4.hai2 != undefined && __reg6 == __reg4.hai2) 
                {
                    this[__reg5].hai = this[__reg5].hai | 256;
                }
                if (__reg4.hai3 != undefined && __reg6 == __reg4.hai3) 
                {
                    this[__reg5].hai = this[__reg5].hai | 256;
                }
            }
        }
        this.AsyncSort(0);
        __reg5 = 0;
        if (__reg5 < this.n) 
        {
            for (;;) 
            {
                ++__reg5;
                if (__reg5 >= this.n) 
                {
                    break;
                }
                if (this[__reg5].hai & 256) 
                {
                    this[__reg5].hai = this[__reg5].hai & 256 ^ -1;
                }
            }
        }
        var __reg7 = [];
        var __reg8 = false;
        if ((__reg0 = __reg4.type) === 1) 
        {
            if ((__reg0 = (__reg4.hai0 & 3) + (__reg4.hai1 & 3) + (__reg4.hai2 & 3)) === 3) 
            {
                var __reg9 = 3;
            }
            else if (__reg0 === 4) 
            {
                __reg9 = 2;
            }
            else if (__reg0 === 5) 
            {
                __reg9 = 1;
            }
            else if (__reg0 === 6) 
            {
                __reg9 = 0;
            }
            __reg9 = __reg9 + int(__reg4.hai0 / 4) * 4;
            if (this.who & 1 && __reg4.kui == 1) 
            {
                this.pushNaki(3, __reg9, 0, 0, true);
            }
            this.pushNaki(__reg4.kui == 1 ? 3 : 0, __reg4.hai2, this[this.n - 2]._x, this[this.n - 2]._y, false);
            if (this.who ^ -1 & 1 && __reg4.kui == 1) 
            {
                this.pushNaki(3, __reg9, 0, 0, true);
            }
            if (this.who & 1 && __reg4.kui == 2) 
            {
                this.pushNaki(1, __reg9, 0, 0, true);
            }
            this.pushNaki(__reg4.kui == 2 ? 1 : 0, __reg4.hai1, this[this.n - 1]._x, this[this.n - 1]._y, false);
            if (this.who ^ -1 & 1 && __reg4.kui == 2) 
            {
                this.pushNaki(1, __reg9, 0, 0, true);
            }
            if (this.who & 1 && __reg4.kui == 3) 
            {
                this.pushNaki(1, __reg9, 0, 0, true);
            }
            this.pushNaki(__reg4.kui == 3 ? 1 : 0, __reg4.hai0, pt.x, pt.y, false);
            if (this.who ^ -1 & 1 && __reg4.kui == 3) 
            {
                this.pushNaki(1, __reg9, 0, 0, true);
            }
            __reg5 = 0;
            if (__reg5 < 20) 
            {
                for (;;) 
                {
                    ++__reg5;
                    if (__reg5 >= 20) 
                    {
                        break;
                    }
                    if (!this["naki" + __reg5]) 
                    {
                        break;
                    }
                }
            }
            --__reg5;
            var __reg10 = [this["naki" + __reg5], this["naki" + (__reg5 - 1)], this["naki" + (__reg5 - 2)], this["naki" + (__reg5 - 3)]];
            if (__reg10[1].chahai != undefined) 
            {
                __reg10.unshift(__reg10.splice(1, 1)[0]);
            }
            if (__reg10[2].chahai != undefined) 
            {
                __reg10.unshift(__reg10.splice(2, 1)[0]);
            }
            __reg10[0].enabled = false;
            __reg10[1].to0 = __reg10[2].to0 = __reg10[3].to0 = __reg10[0];
            __reg10[0].naki = [__reg10[1], __reg10[2], __reg10[3], undefined];
            __reg10[0].setChakanEnable = function (haimc)
            {
                if (haimc) 
                {
                    this.enabled = true;
                    this.naki[3] = haimc;
                    this._visible = true;
                    this._alpha = 25;
                    this.naki[0].attachMovie("nakis1", "nakis", 2);
                    this.naki[0].nakis._y = this.naki[0]._height - this.naki[0].nakis._height;
                    this.onRollOver = function ()
                    {
                        if (this.enabled) 
                        {
                            this.setColor(3);
                            this.naki[0].setColor(3);
                            this.naki[1].setColor(3);
                            this.naki[2].setColor(3);
                            this.naki[3].setColor(3, -5);
                        }
                    }
                    ;
                    this.onRollOut = function ()
                    {
                        if (this.enabled) 
                        {
                            this.setColor(0);
                            this.naki[0].setColor(0);
                            this.naki[1].setColor(0);
                            this.naki[2].setColor(0);
                            this.naki[3].setColor(0, 0);
                        }
                    }
                    ;
                    this.onRelease = function ()
                    {
                        this._parent.setEnable(false);
                        com.cegg.game.mahjong.Tehai.sock.send("<N type=\"5\" hai=\"" + this.chahai + "\" />");
                        this.setChakanEnable(undefined);
                    }
                    ;
                    this.naki[0].onRollOver = this.naki[1].onRollOver = this.naki[2].onRollOver = function ()
                    {
                        this.to0.onRollOver();
                    }
                    ;
                    this.naki[0].onRollOut = this.naki[1].onRollOut = this.naki[2].onRollOut = function ()
                    {
                        this.to0.onRollOut();
                    }
                    ;
                    this.naki[0].onRelease = this.naki[1].onRelease = this.naki[2].onRelease = function ()
                    {
                        this.to0.onRelease();
                    }
                    ;
                    return;
                }
                this.onRollOut();
                this.enabled = false;
                this._visible = false;
                this._alpha = 100;
                this.naki[0].nakis.removeMovieClip();
                delete this.onRelease;
                delete (this.onRollOver);
                delete (this.onRollOut);
                delete (this.naki[0].onRollOver);
                delete (this.naki[1].onRollOver);
                delete (this.naki[2].onRollOver);
                delete this.naki[0].onRollOut;
                delete this.naki[1].onRollOut;
                delete (this.naki[2].onRollOut);
                delete (this.naki[0].onRelease);
                delete (this.naki[1].onRelease);
                delete (this.naki[2].onRelease);
            }
            ;
            this[this.n - 2].removeMovieClip();
            this[this.n - 1].removeMovieClip();
            this.n = this.n - 2;
            this.menzen = false;
            if (!this.who) 
            {
                __reg7.push(int(__reg4.hai0 / 4));
            }
        }
        else if (__reg0 === 2) 
        {
            this.pushNaki(__reg4.kui == 1 ? 3 : 0, __reg4.hai3, this[this.n - 3]._x, this[this.n - 3]._y);
            this.pushNaki(0, __reg4.hai2, this[this.n - 2]._x, this[this.n - 2]._y);
            this.pushNaki(__reg4.kui == 2 ? 1 : 0, __reg4.hai1, this[this.n - 1]._x, this[this.n - 1]._y);
            this.pushNaki(__reg4.kui == 3 ? 1 : 0, __reg4.hai0, pt.x, pt.y);
            this[this.n - 3].removeMovieClip();
            this[this.n - 2].removeMovieClip();
            this[this.n - 1].removeMovieClip();
            this.n = this.n - 3;
            this.menzen = false;
            __reg8 = true;
        }
        else if (__reg0 === 3) 
        {
            this.pushNaki(__reg4.kui == 1 ? 3 : 0, __reg4.hai2, this[this.n - 2]._x, this[this.n - 2]._y);
            this.pushNaki(__reg4.kui == 2 ? 1 : 0, __reg4.hai1, this[this.n - 1]._x, this[this.n - 1]._y);
            this.pushNaki(__reg4.kui == 3 ? 1 : 0, __reg4.hai0, pt.x, pt.y);
            this[this.n - 2].removeMovieClip();
            this[this.n - 1].removeMovieClip();
            this.n = this.n - 2;
            this.menzen = false;
            if (!this.who) 
            {
                var __reg11 = int(__reg4.hai2 / 4) - int(__reg4.hai1 / 4);
                if (__reg11 == 1 || __reg11 == -1) 
                {
                    if (int((__reg4.hai1 + 36) / 4 / 9) == int(((__reg4.hai1 + 36) / 4 - 1) / 9)) 
                    {
                        __reg7.push(int(__reg4.hai1 / 4) - 1);
                    }
                    if (int((__reg4.hai2 + 36) / 4 / 9) == int(((__reg4.hai2 + 36) / 4 + 1) / 9)) 
                    {
                        __reg7.push(int(__reg4.hai2 / 4) + 1);
                    }
                }
                else 
                {
                    __reg7.push(int(__reg4.hai0 / 4));
                }
            }
        }
        else if (__reg0 === 4) 
        {
            this.pushNaki(0, undefined, this[this.n - 4]._x, this[this.n - 4]._y);
            this.pushNaki(0, __reg4.hai2, this[this.n - 3]._x, this[this.n - 3]._y);
            this.pushNaki(0, __reg4.hai1, this[this.n - 2]._x, this[this.n - 2]._y);
            this.pushNaki(0, undefined, this[this.n - 1]._x, this[this.n - 1]._y);
            this[this.n - 4].removeMovieClip();
            this[this.n - 3].removeMovieClip();
            this[this.n - 2].removeMovieClip();
            this[this.n - 1].removeMovieClip();
            this.n = this.n - 4;
            __reg8 = true;
        }
        else if (__reg0 === 5) 
        {
            __reg5 = 0;
            if (__reg5 < 20) 
            {
                for (;;) 
                {
                    ++__reg5;
                    if (__reg5 >= 20) 
                    {
                        break;
                    }
                    if (this["naki" + __reg5].chahai == __reg4.hai0) 
                    {
                        break;
                    }
                }
            }
            if (__reg5 == 20) 
            {
                if (this.noanim) 
                {
                    this.Naki(mm ^ 24, undefined);
                    __reg5 = 0;
                    if (__reg5 < 20) 
                    {
                        for (;;) 
                        {
                            ++__reg5;
                            if (__reg5 >= 20) 
                            {
                                break;
                            }
                            if (this["naki" + __reg5].chahai == __reg4.hai0) 
                            {
                                break;
                            }
                        }
                    }
                    if (__reg5 != 20) 
                    {
                        __reg12 = com.cegg.game.mahjong.UtilBase.bPremiumVersion != true;
                        __reg13 = this["naki" + __reg5];
                        __reg13._visible = true;
                        __reg14 = __reg13._x;
                        __reg15 = __reg13._y;
                        __reg13._x = this[this.n - 1]._x;
                        __reg13._y = this[this.n - 1]._y;
                        this.setAnim(__reg13, __reg14, __reg15, __reg12, undefined, 0);
                        delete (__reg13.chahai);
                        this[this.n - 1].removeMovieClip();
                        --this.n;
                        __reg8 = true;
                        this.menzen = false;
                    }
                }
            }
            else 
            {
                var __reg12 = com.cegg.game.mahjong.UtilBase.bPremiumVersion != true;
                var __reg13 = this["naki" + __reg5];
                __reg13._visible = true;
                var __reg14 = __reg13._x;
                var __reg15 = __reg13._y;
                __reg13._x = this[this.n - 1]._x;
                __reg13._y = this[this.n - 1]._y;
                this.setAnim(__reg13, __reg14, __reg15, __reg12, undefined, 0);
                delete (__reg13.chahai);
                this[this.n - 1].removeMovieClip();
                --this.n;
                __reg8 = true;
                this.menzen = false;
            }
        }
        else if (__reg0 === 10) 
        {
            this.pushNuki(__reg4.hai0, this[this.n - 1]._x, this[this.n - 1]._y);
            this[this.n - 1].removeMovieClip();
            --this.n;
            __reg8 = true;
        }
        if (!this.silent && (!this.who && (!__reg8 && !this.noanim))) 
        {
            this.nakida = true;
            this.setEnable(true);
            var __reg16 = this.n - 1;
            if (__reg7.length == 1) 
            {
                this.setEnableTargetFalse34(__reg7[0]);
                if (__reg16 > 0) 
                {
                    for (;;) 
                    {
                        --__reg16;
                        if (__reg16 <= 0) 
                        {
                            break;
                        }
                        if (__reg7[0] != int(this[__reg16].hai136 / 4)) 
                        {
                            break;
                        }
                    }
                }
            }
            else if (__reg7.length == 2) 
            {
                this.setEnableTargetFalse34(__reg7[0]);
                this.setEnableTargetFalse34(__reg7[1]);
                if (__reg16 > 0) 
                {
                    for (;;) 
                    {
                        --__reg16;
                        if (__reg16 <= 0) 
                        {
                            break;
                        }
                        if (__reg7[0] != int(this[__reg16].hai136 / 4) && __reg7[1] != int(this[__reg16].hai136 / 4)) 
                        {
                            break;
                        }
                    }
                }
            }
            var __reg17 = this.posHai(this.n - 1);
            this.attachMovie(com.cegg.game.mahjong.CountDown.SymbolName, "ct", 101, {_x: __reg17.x + 45, _y: __reg17.y + 2, release: this[__reg16], useex: true});
        }
        this.AsyncSort(0);
    }
    ;
    __reg1.setEnable = function (ok)
    {
        if (this.nb) 
        {
            this.nb.removeMovieClip();
        }
        if (this.ct) 
        {
            this.ct.removeMovieClip();
        }
        if (this.silent) 
        {
            ok = false;
        }
        if (this.reached) 
        {
            __reg3 = 0;
            if (__reg3 < this.n) 
            {
                for (;;) 
                {
                    ++__reg3;
                    if (__reg3 >= this.n) 
                    {
                        break;
                    }
                    this[__reg3].setDisable();
                }
            }
            if (this.n % 3 == 2 && ok) 
            {
                this[this.n - 1].setEnable(true);
            }
        }
        else 
        {
            var __reg3 = 0;
            if (__reg3 < this.n) 
            {
                for (;;) 
                {
                    ++__reg3;
                    if (__reg3 >= this.n) 
                    {
                        break;
                    }
                    this[__reg3].setEnable(ok);
                }
            }
        }
        __reg3 = 0;
        if (__reg3 < 20) 
        {
            for (;;) 
            {
                ++__reg3;
                if (__reg3 >= 20) 
                {
                    break;
                }
                if (this["naki" + __reg3].chahai != undefined) 
                {
                    this["naki" + __reg3].setChakanEnable(undefined);
                }
            }
        }
        if (ok) 
        {
            return;
        }
        __reg3 = 0;
        if (__reg3 < this.n) 
        {
            this[__reg3].onRollOut();
        }
    }
    ;
    __reg1.setEnableTargetFalse34 = function (hai34)
    {
        var __reg3 = 0;
        if (__reg3 < this.n) 
        {
            if (int(this[__reg3].hai / 4) != hai34) 
            {
                for (;;) 
                {
                    ++__reg3;
                    if (__reg3 >= this.n) 
                    {
                        return;
                    }
                    if (int(this[__reg3].hai / 4) == hai34) 
                    {
                        break;
                    }
                }
            }
            this[__reg3].setEnable(false);
        }
    }
    ;
    __reg1.isEnableNuku = function ()
    {
        if (this.reached) 
        {
            if (int(this[this.n - 1].hai / 4) == 30) 
            {
                return true;
            }
        }
        else 
        {
            var __reg2 = 0;
            if (__reg2 < this.n) 
            {
                for (;;) 
                {
                    ++__reg2;
                    if (__reg2 >= this.n) 
                    {
                        break;
                    }
                    if (int(this[__reg2].hai / 4) == 30) 
                    {
                        return true;
                    }
                }
            }
        }
        return false;
    }
    ;
    __reg1.doReach = function ()
    {
        if (this.silent) 
        {
            return undefined;
        }
        if (this.who) 
        {
            return undefined;
        }
        var __reg2 = 0;
        if (__reg2 < this.n) 
        {
            for (;;) 
            {
                ++__reg2;
                if (__reg2 >= this.n) 
                {
                    break;
                }
                if (this.toReach[__reg2]) 
                {
                    this[__reg2].clearNaki();
                    this[__reg2].setEnable(true);
                }
                else 
                {
                    this[__reg2].setDisable();
                }
            }
        }
        if (this.toReach[this.n - 1]) 
        {
            __reg2 = this.n - 1;
        }
        else 
        {
            __reg2 = 0;
            if (__reg2 < this.n) 
            {
                for (;;) 
                {
                    ++__reg2;
                    if (__reg2 >= this.n) 
                    {
                        break;
                    }
                    if (this.toReach[__reg2]) 
                    {
                        break;
                    }
                }
            }
        }
        this._parent.sendReach(this[__reg2].hai);
        this.attachMovie(com.cegg.game.mahjong.CountDown.SymbolName, "ct", 101, {_x: this[this.n - 1]._x + 45, _y: this[this.n - 1]._y + 2, release: this[__reg2], useex: true});
        this.reached = true;
    }
    ;
    __reg1.setDisable = function ()
    {
        this.setEnable(false);
        var __reg2 = 0;
        if (__reg2 < this.n) 
        {
            this[__reg2].setDisable();
        }
    }
    ;
    __reg1.showTehai = function (tehai)
    {
        if (this.who) 
        {
            if (tehai) 
            {
                __reg3 = 0;
                if (__reg3 < this.n) 
                {
                    for (;;) 
                    {
                        ++__reg3;
                        if (__reg3 >= this.n) 
                        {
                            break;
                        }
                        if (this[__reg3].hai == undefined || 136 <= this[__reg3].hai) 
                        {
                            break;
                        }
                    }
                }
            }
            else 
            {
                var __reg3 = 0;
                if (__reg3 < this.n) 
                {
                    for (;;) 
                    {
                        ++__reg3;
                        if (__reg3 >= this.n) 
                        {
                            break;
                        }
                        if (0 <= this[__reg3].hai && this[__reg3].hai < 136) 
                        {
                            break;
                        }
                    }
                }
            }
            if (__reg3 != this.n) 
            {
                __reg3 = 0;
                if (__reg3 < this.n) 
                {
                    for (;;) 
                    {
                        ++__reg3;
                        if (__reg3 >= this.n) 
                        {
                            break;
                        }
                        this[__reg3].hai = tehai ? int(tehai[__reg3]) : undefined;
                    }
                }
                this.onEnterFrame = this.onEnterFrame_showTehai;
            }
        }
    }
    ;
    __reg1.onEnterFrame_showTehai = function ()
    {
        var __reg2 = 0;
        if (__reg2 < this.n) 
        {
            for (;;) 
            {
                ++__reg2;
                if (__reg2 >= this.n) 
                {
                    break;
                }
                if (this[__reg2].onEnterFrame) 
                {
                    break;
                }
            }
        }
        if (__reg2 == this.n) 
        {
            __reg2 = 0;
            if (__reg2 < this.n) 
            {
                for (;;) 
                {
                    ++__reg2;
                    if (__reg2 >= this.n) 
                    {
                        break;
                    }
                    var __reg3 = this[__reg2];
                    __reg3.c = __reg2;
                    __reg3.onEnterFrame = function ()
                    {
                        if (this.c--) 
                        {
                            return undefined;
                        }
                        _root.SE.play("SE_KACHI", false);
                        var __reg2 = this._parent.who;
                        this.setImage(this.hai, __reg2, false);
                        delete this.onEnterFrame;
                    }
                    ;
                }
            }
            delete this.onEnterFrame;
        }
    }
    ;
    __reg1.onCommand = function (msg)
    {
        if ((__reg0 = msg.cmd) === "reach") 
        {
            this.setEnable(false);
            this.doReach();
        }
        else if (__reg0 === "ron") 
        {
            this.setEnable(false);
            com.cegg.game.mahjong.Tehai.sock.send("<N type=\"6\" />");
        }
        else if (__reg0 === "tsumo") 
        {
            this.setEnable(false);
            com.cegg.game.mahjong.Tehai.sock.send("<N type=\"7\" />");
        }
        else if (__reg0 === "ryuukyoku") 
        {
            this.setEnable(false);
            com.cegg.game.mahjong.Tehai.sock.send("<N type=\"9\" />");
        }
        else if (__reg0 === "nuku") 
        {
            this.setEnable(false);
            com.cegg.game.mahjong.Tehai.sock.send("<N type=\"10\" />");
        }
        else if (__reg0 === "pass") 
        {
            this.setEnable(false);
            com.cegg.game.mahjong.Tehai.sock.send("<N />");
        }
        if (this.nb) 
        {
            this.nb.removeMovieClip();
        }
        if (this.ct) 
        {
            this.ct.removeMovieClip();
        }
    }
    ;
    ASSetPropFlags(__reg1, null, 1);
    __reg0.SymbolName = "__Packages.com.cegg.game.mahjong.Tehai";
    __reg0.SymbolOwner = com.cegg.game.mahjong.Tehai;
    __reg0.SymbolLinked = Object.registerClass(com.cegg.game.mahjong.Tehai.SymbolName, com.cegg.game.mahjong.Tehai.SymbolOwner);
    __reg0.sock = _root;
    __reg1.toReach = [false, false, false, false, false, false, false, false, false, false, false, false, false, false];
    __reg1.n = 0;
    __reg1.nakiPos = 0;
    __reg1.reached = false;
    __reg1.menzen = true;
    __reg1.nakida = false;
}#endinitclip

//子图形 50
//  初始化剪辑
#initclip 0

if (!com.cegg.game.Loading) 
{
    if (!com) 
    {
        _global.com = new Object();
    }
    if (!com.cegg) 
    {
        _global.com.cegg = new Object();
    }
    if (!com.cegg.game) 
    {
        _global.com.cegg.game = new Object();
    }
    (_global.com.cegg.game.Loading = function ()
    {
        super();
        this.createTextField("tf", 0, 0, 0, Stage.width, 0);
        this.createEmptyMovieClip("bar", 1);
        this.createEmptyMovieClip("target", 2);
        with (this.tf)
        {
            textColor = 13421772;
            text = "L O A D I N G ...";
            autoSize = "center";
            selectable = false;
        }
        this.bar._x = Stage.width / 4;
        this.bar._y = this.tf._y + this.tf._height;
        this._visible = false;
    }
    ).prototype.__proto__ = MovieClip.prototype;
    __reg0.prototype.__constructor__ = MovieClip;
    var __reg1 = __reg0.prototype;
    __reg1.onEnterFrame = function ()
    {
        var __reg2 = this.target.getBytesLoaded();
        var __reg3 = this.target.getBytesTotal();
        this.tf.text = "L O A D I N G ... " + int(__reg2 / __reg3 * 100) + "%";
        var __reg4 = __reg2 / __reg3;
        with (this.bar)
        {
            clear();
            var __reg5 = int(Stage.width / 2);
            var __reg6 = 5;
            lineStyle(1, 4473924, 100);
            beginFill(0, 100);
            moveTo(0, 0);
            lineTo(0, __reg6);
            lineTo(__reg5, __reg6);
            lineTo(__reg5, 0);
            endFill();
            lineStyle();
            beginFill(8947848, 100);
            moveTo(0, 0);
            lineTo(0, __reg6);
            lineTo(__reg5 * __reg4, __reg6);
            lineTo(__reg5 * __reg4, 0);
            endFill();
        }
        if (__reg2 > 4 && __reg3 <= __reg2) 
        {
            this.callback.onLoadMovieClip(this.target);
            this.removeMovieClip();
            return;
        }
        if (__reg4 && !this._visible) 
        {
            this._visible = true;
        }
    }
    ;
    ASSetPropFlags(__reg1, null, 1);
    __reg0.SymbolName = "__Packages.com.cegg.game.Loading";
    __reg0.SymbolOwner = com.cegg.game.Loading;
    __reg0.SymbolLinked = Object.registerClass(com.cegg.game.Loading.SymbolName, com.cegg.game.Loading.SymbolOwner);
}#endinitclip

//子图形 51
//  初始化剪辑
#initclip 0

if (!com.cegg.GChat) 
{
    if (!com) 
    {
        _global.com = new Object();
    }
    if (!com.cegg) 
    {
        _global.com.cegg = new Object();
    }
    (_global.com.cegg.GChat = function ()
    {
        super();
        var __reg3 = 400;
        var __reg4 = 98;
        var __reg5 = 0;
        this.createEmptyMovieClip("BG", __reg5++);
        this.createTextField("ChatView", __reg5++, 0, 0, 0, 0);
        this.createEmptyMovieClip("Caption", __reg5++);
        this.createEmptyMovieClip("SizeGrip", __reg5++);
        this.createEmptyMovieClip("InputBG", __reg5++);
        this.createTextField("ChatLabel", __reg5++, 0, 0, 0, 0);
        this.createTextField("Input", __reg5++, 0, 0, 0, 0);
        this.Caption._focusrect = false;
        this.Caption.onPress = function ()
        {
            this._parent.startDrag();
        }
        ;
        this.Caption.onRelease = function ()
        {
            this._parent.stopDrag();
        }
        ;
        this.ChatLabel.text = " Chat ";
        with (this.ChatLabel)
        {
            textColor = 4210752;
            autoSize = "left";
            selectable = false;
        }
        var __reg6 = this.ChatLabel._height;
        this.Input.type = "input";
        with (this.Input)
        {
            textColor = 2105376;
        }
        with (this.ChatView)
        {
            multiline = true;
            textColor = 16777215;
        }
        with (this.SizeGrip)
        {
            lineStyle(1, 8421504, 100);
            beginFill(13421772, 100);
            moveTo(0, 0);
            lineTo(0, __reg6);
            lineTo(14, __reg6);
            lineTo(14, 0);
            endFill();
            lineStyle(1, 8421504, 100);
            var __reg7 = 0;
            if (__reg7 < 14) 
            {
                for (;;) 
                {
                    __reg7 = __reg7 + 4;
                    if (__reg7 >= 14) 
                    {
                        break;
                    }
                    moveTo(14 - __reg7, __reg6);
                    lineTo(14, __reg6 - __reg7);
                }
            }
        }
        this.SizeGrip.onSetPos = function (x, y)
        {
            this._parent.setGripPos(x, y);
        }
        ;
        com.cegg.LDrag.enableDrag(this.SizeGrip);
        this.setGripPos(__reg3 - 14, __reg4 - __reg6);
        this.onMouseMove();
        this.showInput(false);
    }
    ).prototype.__proto__ = MovieClip.prototype;
    __reg0.prototype.__constructor__ = MovieClip;
    var __reg1 = __reg0.prototype;
    __reg1.onLoad = function ()
    {
        Key.addListener(this);
    }
    ;
    __reg1.onUnload = function ()
    {
        Key.removeListener(this);
    }
    ;
    __reg1.removeMovieClip = function ()
    {
        this.onUnload();
        super.removeMovieClip();
    }
    ;
    __reg1.setGripPos = function (x, y)
    {
        var __reg4 = 14;
        if (x < 40) 
        {
            x = 40;
        }
        if (y < __reg4 * 2) 
        {
            y = __reg4 * 2;
        }
        this.ChatView._x = 0;
        this.ChatView._y = 0;
        this.ChatView._width = x + 14;
        this.ChatView._height = y;
        this.ChatView.scroll = this.ChatView.maxscroll;
        this.SizeGrip._x = x;
        this.SizeGrip._y = y;
        this.ChatLabel._y = y;
        this.Input._x = this.ChatLabel._x + this.ChatLabel._width;
        this.Input._y = y;
        this.Input._width = x - this.Input._x;
        this.Input._height = this.ChatLabel._height;
        var __reg5 = this.ChatLabel._width;
        var __reg6 = this.ChatLabel._height;
        var __reg7 = x + 14;
        var __reg8 = y + __reg6;
        var __reg9 = __reg8 - __reg6;
        com.cegg.GScrollVert.createScrollBar("SB_VERT", this.ChatView, 7, this);
        this.Caption.clear();
        with (this.Caption)
        {
            var __reg10 = [8947848, 15790320];
            var __reg11 = [75, 100];
            var __reg12 = [0, 255];
            var __reg13 = {a: __reg7, b: 0, c: 0, d: 0, e: 0 - __reg7, f: 0, g: int(__reg7 / 2), h: 0, i: 1};
            lineStyle();
            beginGradientFill("linear", __reg10, __reg11, __reg12, __reg13);
            moveTo(0, 0);
            lineTo(0, __reg4);
            lineTo(__reg7 - 14, __reg4);
            lineTo(__reg7 - 14, 0);
            endFill();
        }
        this.BG.clear();
        with (this.BG)
        {
            lineStyle(1, 8421504, 100);
            moveTo(0, 0);
            lineTo(__reg7, 0);
            lineTo(__reg7, __reg8 - __reg6);
            lineTo(0, __reg8 - __reg6);
            lineTo(0, 0);
            endFill();
        }
        this.InputBG.clear();
        with (this.InputBG)
        {
            lineStyle(1, 8421504, 100);
            beginFill(15790320, 100);
            moveTo(0, __reg9);
            lineTo(__reg5, __reg9);
            lineTo(__reg5, __reg8);
            lineTo(0, __reg8);
            endFill();
            lineStyle(1, 8421504, 100);
            beginFill(16777215, 100);
            moveTo(__reg5, __reg9);
            lineTo(__reg7 - 14, __reg9);
            lineTo(__reg7 - 14, __reg8);
            lineTo(__reg5, __reg8);
            endFill();
        }
    }
    ;
    __reg1.chatOut = function (txt)
    {
        var __reg3 = this.ChatView;
        var __reg4 = __reg3.scroll == __reg3.maxscroll;
        __reg3.htmlText = __reg3.htmlText + txt;
        if (__reg4) 
        {
            __reg3.scroll = __reg3.maxscroll;
        }
        this.SB_VERT.update();
    }
    ;
    __reg1.onKeyDown = function ()
    {
        if (Key.getCode() == Key.ENTER) 
        {
            if (String(Selection.getFocus()) == String(this.Input)) 
            {
                if (!this.Input.text.length) 
                {
                    return undefined;
                }
                _root.onCommand({cmd: "CHAT", text: this.Input.text});
                this.Input.text = "";
                return;
            }
            if (Selection.getFocus() == null) 
            {
                Selection.setFocus(this.Input);
            }
        }
    }
    ;
    __reg1.onEnterFrame = function ()
    {
        if (this.counterHide && --this.counterHide == 0) 
        {
            this.showInput(false);
        }
    }
    ;
    __reg1.showInput = function (b)
    {
        this.Caption._visible = this.SizeGrip._visible = this.ChatLabel._visible = this.Input._visible = this.InputBG._visible = this.SB_VERT._visible = b;
        this._alpha = b ? 100 : 20;
    }
    ;
    __reg1.onMouseMove = function ()
    {
        var __reg2 = this.hitTest(_root._xmouse, _root._ymouse, false);
        if (__reg2 != this.Input._visible) 
        {
            if (__reg2) 
            {
                this.showInput(true);
                this.counterHide = 0;
                return;
            }
            this.counterHide = 2;
        }
    }
    ;
    ASSetPropFlags(__reg1, null, 1);
    __reg0.SymbolName = "__Packages.com.cegg.GChat";
    __reg0.SymbolOwner = com.cegg.GChat;
    __reg0.SymbolLinked = Object.registerClass(com.cegg.GChat.SymbolName, com.cegg.GChat.SymbolOwner);
    __reg1.counterHide = 0;
}#endinitclip

//子图形 1474
//  初始化剪辑
#initclip 0

Main.main();#endinitclip

