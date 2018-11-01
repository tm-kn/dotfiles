#include <X11/XF86keysym.h>

/* appearance */
static const unsigned int borderpx  = 1;        /* border pixel of windows */
static const unsigned int snap      = 32;       /* snap pixel */
static const unsigned int systraypinning = 0;   /* 0: sloppy systray follows selected monitor, >0: pin systray to monitor X */
static const unsigned int systrayspacing = 2;   /* systray spacing */
static const int systraypinningfailfirst = 1;   /* 1: if pinning fails, display systray on the first monitor, False: display systray on the last monitor*/
static const int showsystray        = 1;     /* 0 means no systray */
static const int showbar            = 1;        /* 0 means no bar */
static const int topbar             = 1;        /* 0 means bottom bar */
static const char *fonts[]          = { "monospace:size=10" };
static const char dmenufont[]       = "monospace:size=10";
static const char col_gray1[]       = "#222222";
static const char col_gray2[]       = "#444444";
static const char col_gray3[]       = "#bbbbbb";
static const char col_gray4[]       = "#eeeeee";
static const char col_cyan[]        = "#005577";
static const char *colors[][3]      = {
	/*               fg         bg         border   */
	[SchemeNorm] = { col_gray3, col_gray1, col_gray2 },
	[SchemeSel]  = { col_gray4, col_cyan,  col_cyan  },
};

/* tagging */
static const char *tags[] = { "1", "2", "3", "4", "5", "6", "7", "8", "9" };

static const Rule rules[] = {
	/* xprop(1):
	 *	WM_CLASS(STRING) = instance, class
	 *	WM_NAME(STRING) = title
	 */
	/* class      instance    title       tags mask     isfloating   monitor */
	{ "Firefox",  NULL,       NULL,       1 << 0,       0,           -1 },
	{ "keepassxc",  NULL,       NULL,     1 << 5,       0,           -1 },
	{ "URxvt",  NULL,       NULL,       1 << 1,       0,           -1 },
	{ "Slack",  NULL,       NULL,       1 << 7,       0,           -1 },
	{ "Evolution",  NULL,       NULL,       1 << 8,       0,           -1 },
};

/* layout(s) */
static const float mfact     = 0.55; /* factor of master area size [0.05..0.95] */
static const int nmaster     = 1;    /* number of clients in master area */
static const int resizehints = 1;    /* 1 means respect size hints in tiled resizals */

static const Layout layouts[] = {
	/* symbol     arrange function */
	{ "[]=",      tile },    /* first entry is default */
	{ "><>",      NULL },    /* no layout function means floating behavior */
	{ "[M]",      monocle },
};

/* key definitions */
#define MODKEY Mod4Mask
#define TAGKEYS(KEY,TAG) \
	{ MODKEY,                       KEY,      view,           {.ui = 1 << TAG} }, \
	{ MODKEY|ControlMask,           KEY,      toggleview,     {.ui = 1 << TAG} }, \
	{ MODKEY|ShiftMask,             KEY,      tag,            {.ui = 1 << TAG} }, \
	{ MODKEY|ControlMask|ShiftMask, KEY,      toggletag,      {.ui = 1 << TAG} },

/* helper for spawning shell commands in the pre dwm-5.0 fashion */
#define SHCMD(cmd) { .v = (const char*[]){ "/bin/sh", "-c", cmd, NULL } }

static const char terminal[] = "urxvtc";

/* commands */
static char dmenumon[2] = "0"; /* component of dmenucmd, manipulated in spawn() */
static const char *kill_xinit[] = { "killall", "xinit", NULL };
static const char *dmenucmd[] = { "dmenu_run", "-m", dmenumon, "-fn", dmenufont, "-nb", col_gray1, "-nf", col_gray3, "-sb", col_cyan, "-sf", col_gray4, NULL };
static const char *clipmenucmd[] = { "clipmenu", NULL };
static const char *clipmenudelcmd[] = { "clipdel", "-d", ".*", NULL };
static const char *termcmd[]  = { terminal, "-e", "tmux", "new-session", NULL };
static const char *alt_termcmd[]  = { terminal, NULL };

static const char *file_manager[] = { terminal, "-e", "tmux", "new-session", "ranger", NULL };
static const char *web_browser[] = { "xdg-open", "https://", NULL };
static const char *password_manager[] = {"keepassxc", NULL };

static const char *dpms_suspend[] = { "xset", "dpms", "force", "suspend", NULL };

static const char *switch_monitor[] = { "mons", "-n", "right", NULL };

static const char *music_player[] = { terminal, "-e", "tmux", "new-session", "-A", "-s", "music", "cmus", NULL };
static const char *music_play_pause[] = { "cmus-remote", "--pause", NULL };
static const char *music_next[] = { "cmus-remote", "--next", NULL };
static const char *music_prev[] = { "cmus-remote", "--prev", NULL };

static const char *volume_up[] = { "pactl", "set-sink-volume", "@DEFAULT_SINK@", "+5%", NULL };
static const char *volume_down[] = { "pactl", "set-sink-volume", "@DEFAULT_SINK@", "-5%", NULL };
static const char *volume_mute_sink[] = { "pactl", "set-sink-mute", "@DEFAULT_SINK@", "toggle", NULL };
static const char *volume_mute_mic[] = { "pactl", "set-source-mute", "@DEFAULT_SOURCE@", "toggle", NULL };

static const char *volume_settings[] = { "pavucontrol", NULL };

static const char *brightness_down[] = { "xbacklight", "-dec", "10", NULL };
static const char *brightness_up[] = { "xbacklight", "-inc", "10", NULL };

static const char *toggle_touchpad[] = { "toggle_touchpad.sh", NULL };

// Screenshot
static const char *screenshot_full[] = { "screenshot.sh", NULL };
static const char *screenshot_full_clipboard[] = { "screenshot.sh", "--clipboard", NULL };
static const char *screenshot_window[] = { "screenshot.sh", "--window", NULL };
static const char *screenshot_window_clipboard[] = { "screenshot.sh", "--clipboard", "--window", NULL };


static Key keys[] = {
	/* modifier                     key        function        argument */
	{ MODKEY,                       XK_p,      spawn,          {.v = dmenucmd } },
	{ MODKEY,                       XK_c,      spawn,          {.v = clipmenucmd } },
	{ MODKEY|ShiftMask,             XK_c,      spawn,          {.v = clipmenudelcmd } },
	{ MODKEY|ShiftMask,             XK_Return, spawn,          {.v = alt_termcmd } },
	{ MODKEY,                       XK_Return, spawn,          {.v = termcmd } },
	{ MODKEY,                       XK_b,      togglebar,      {0} },
	{ MODKEY,                       XK_j,      focusstack,     {.i = +1 } },
	{ MODKEY,                       XK_k,      focusstack,     {.i = -1 } },
	{ MODKEY,                       XK_i,      incnmaster,     {.i = +1 } },
	{ MODKEY,                       XK_d,      incnmaster,     {.i = -1 } },
	{ MODKEY,                       XK_h,      setmfact,       {.f = -0.05} },
	{ MODKEY,                       XK_l,      setmfact,       {.f = +0.05} },
	{ MODKEY,                       XK_z, zoom,           {0} },
	{ MODKEY,                       XK_Tab,    view,           {0} },
	{ MODKEY|ShiftMask,             XK_q,      killclient,     {0} },
	{ MODKEY,                       XK_t,      setlayout,      {.v = &layouts[0]} },
	{ MODKEY,                       XK_f,      setlayout,      {.v = &layouts[1]} },
	{ MODKEY,                       XK_m,      setlayout,      {.v = &layouts[2]} },
	{ MODKEY,                       XK_space,  setlayout,      {0} },
	{ MODKEY|ShiftMask,             XK_space,  togglefloating, {0} },
	{ MODKEY,                       XK_0,      view,           {.ui = ~0 } },
	{ MODKEY|ShiftMask,             XK_0,      tag,            {.ui = ~0 } },
	{ MODKEY,                       XK_comma,  focusmon,       {.i = -1 } },
	{ MODKEY,                       XK_period, focusmon,       {.i = +1 } },
	{ MODKEY|ShiftMask,             XK_comma,  tagmon,         {.i = -1 } },
	{ MODKEY|ShiftMask,             XK_period, tagmon,         {.i = +1 } },
	TAGKEYS(                        XK_1,                      0)
	TAGKEYS(                        XK_2,                      1)
	TAGKEYS(                        XK_3,                      2)
	TAGKEYS(                        XK_4,                      3)
	TAGKEYS(                        XK_5,                      4)
	TAGKEYS(                        XK_6,                      5)
	TAGKEYS(                        XK_7,                      6)
	TAGKEYS(                        XK_8,                      7)
	TAGKEYS(                        XK_9,                      8)
	{ MODKEY|ShiftMask,             XK_r,      quit,           {0} },
	{ MODKEY|ShiftMask,             XK_e,      spawn,          {.v = kill_xinit } },

    // General
	{ MODKEY|ShiftMask,             XK_l,      spawn,         {.v = dpms_suspend} },
	{ 0,                            XF86XK_Tools, spawn,      {.v = volume_settings } },
	{ 0,                            XF86XK_Display, spawn,    {.v = switch_monitor } },
	{ MODKEY|ShiftMask,             XK_f,      spawn,         {.v = web_browser} },
	{ MODKEY|ShiftMask,             XK_k,      spawn,         {.v = password_manager } },
	{ MODKEY|ShiftMask,             XK_t,      spawn,         {.v = toggle_touchpad} },
	{ 0,                            XF86XK_Explorer, spawn,   {.v = file_manager } },

    // Screenshot
    { 0,                           XK_Print,   spawn,        {.v = screenshot_full } },
    { ControlMask,                 XK_Print,   spawn,        {.v = screenshot_full_clipboard } },
    { Mod1Mask,                    XK_Print,   spawn,        {.v = screenshot_window } },
    { ControlMask|Mod1Mask,        XK_Print,   spawn,        {.v = screenshot_window_clipboard } },
    { ShiftMask,                   XK_Print,   spawn,        SHCMD("sleep 1;screenshot.sh --area") },
    { ControlMask|ShiftMask,        XK_Print,   spawn,       SHCMD("sleep 1;screenshot.sh --area --clipboard") },

    // Brightness
    { 0,                            XF86XK_MonBrightnessDown, spawn, {.v = brightness_down } },
    { 0,                            XF86XK_MonBrightnessUp, spawn, {.v = brightness_up } },

    // Music
    { MODKEY|ShiftMask,              XK_m, spawn, {.v = music_player } },
    { 0,                             XF86XK_AudioPlay, spawn, {.v = music_play_pause } },
    { 0,                             XF86XK_LaunchA, spawn, {.v = music_play_pause } },
    { Mod4Mask,                      XK_apostrophe, spawn, {.v = music_next } },
    { 0,                             XF86XK_AudioNext, spawn, {.v = music_next } },
    { Mod4Mask,                      XK_semicolon, spawn, {.v = music_prev } },
    { 0,                             XF86XK_AudioPrev, spawn, {.v = music_prev } },

    // Audio keys
    { 0,                             XF86XK_AudioRaiseVolume, spawn, {.v = volume_up } },
    { 0,                             XF86XK_AudioLowerVolume, spawn, {.v = volume_down } },
    { 0,                             XF86XK_AudioMute, spawn, {.v = volume_mute_sink } },
    { 0,                             XF86XK_AudioMicMute, spawn, {.v = volume_mute_mic } },
};

/* button definitions */
/* click can be ClkTagBar, ClkLtSymbol, ClkStatusText, ClkWinTitle, ClkClientWin, or ClkRootWin */
static Button buttons[] = {
	/* click                event mask      button          function        argument */
	{ ClkLtSymbol,          0,              Button1,        setlayout,      {0} },
	{ ClkLtSymbol,          0,              Button3,        setlayout,      {.v = &layouts[2]} },
	{ ClkWinTitle,          0,              Button2,        zoom,           {0} },
	{ ClkStatusText,        0,              Button2,        spawn,          {.v = termcmd } },
	{ ClkClientWin,         MODKEY,         Button1,        movemouse,      {0} },
	{ ClkClientWin,         MODKEY,         Button2,        togglefloating, {0} },
	{ ClkClientWin,         MODKEY,         Button3,        resizemouse,    {0} },
	{ ClkTagBar,            0,              Button1,        view,           {0} },
	{ ClkTagBar,            0,              Button3,        toggleview,     {0} },
	{ ClkTagBar,            MODKEY,         Button1,        tag,            {0} },
	{ ClkTagBar,            MODKEY,         Button3,        toggletag,      {0} },
};

