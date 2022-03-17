import XMonad
import Data.Monoid
import System.Exit
import XMonad.Util.SpawnOnce
import XMonad.Hooks.DynamicLog
import qualified XMonad.StackSet as W

TERMINAL        = "kitty"
TEXT_EDITOR     = "vim"
MOD_KEY         = mod4Mask -- Left Windows button

KEYMAPS conf@(XConfig {XMonad.modMask = modm}) = Data.Map.fromList $
    [ ((modm .|. shiftMask, xK_Return), spawn $ XMonad.terminal conf)
    , ((modm,               xK_p     ), spawn "dmenu_run")
    , ((modm .|. shiftMask, xK_p     ), spawn "gmrun")
    , ((modm, xK_c     ), kill)
    , ((modm,               xK_space ), sendMessage NextLayout)
    , ((modm .|. shiftMask, xK_space ), setLayout $ XMonad.layoutHook conf)
    , ((modm,               xK_n     ), refresh)
    , ((modm,               xK_Tab   ), windows W.focusDown)
    , ((modm,               xK_j     ), windows W.focusDown)
    , ((modm,               xK_k     ), windows W.focusUp  )
    , ((modm,               xK_m     ), windows W.focusMaster  )
    , ((modm,               xK_Return), windows W.swapMaster)
    , ((modm .|. shiftMask, xK_j     ), windows W.swapDown  )
    , ((modm .|. shiftMask, xK_k     ), windows W.swapUp    )
    , ((modm,               xK_h     ), sendMessage Shrink)
    , ((modm,               xK_l     ), sendMessage Expand)
    , ((modm,               xK_t     ), withFocused $ windows . W.sink)
    , ((modm              , xK_comma ), sendMessage (IncMasterN 1))
    , ((modm              , xK_period), sendMessage (IncMasterN (-1)))
    , ((modm .|. shiftMask, xK_q     ), io exitSuccess)
    , ((modm              , xK_q     ), spawn "xmonad --recompile; xmonad --restart")
    ]
    ++
    -- mod-[1..9], Switch to workspace N
    -- mod-shift-[1..9], Move client to workspace N
    [((m .|. modm, k), windows $ f i)
        | (i, k) <- zip (XMonad.workspaces conf) [xK_1 .. xK_9]
        , (f, m) <- [(W.greedyView, 0), (W.shift, shiftMask)]]
    ++
    -- mod-{w,e,r}, Switch to physical/Xinerama screens 1, 2, or 3
    -- mod-shift-{w,e,r}, Move client to screen 1, 2, or 3
    [((m .|. modm, key), screenWorkspace sc >>= flip whenJust (windows . f))
        | (key, sc) <- zip [xK_w, xK_e, xK_r] [0..]
        , (f, m) <- [(W.view, 0), (W.shift, shiftMask)]]

MOUSE_BINDINGS (XConfig {XMonad.modMask = modm}) = Data.Map.fromList
    [ ((modm, button1), \w -> focus w >> mouseMoveWindow w)
    , ((modm, button2), \w -> focus w >> windows W.shiftMaster)
    , ((modm, button3), \w -> focus w >> mouseResizeWindow w)
    ]

LAYOUT_HOOK = tiled ||| Full
  where
    tiled   = Tall nmaster delta ratio
    nmaster = 1
    ratio   = 1/2
    delta   = 3/100

MANAGE_HOOK = composeAll
    [ className =? "MPlayer"        --> doFloat
    , className =? "Gimp"           --> doFloat
    , resource  =? "desktop_window" --> doIgnore
    , resource  =? "kdesktop"       --> doIgnore ]

STARTUP_HOOK = do
    spawnOnce "nitrogen --set-scaled ~/Media/Pictures/.wallpapers/$((`date | awk '{print $3}'` % 32)).jpg &"
    spawnOnce "picom --backend xrender --config ~/.config/picom/picom.conf &"
    spawnOnce "xrandr --output \"DP-1\" --mode \"2560x1440\""
    spawnOnce "xrandr --output \"HDMI-0\" --mode \"2560x1440\""
    spawnOnce "xrandr --output \"HDMI-0\" --auto --output \"DP-1\" --same-as \"HDMI-0\""

main = xmonad $ def {
        terminal           = TERMINAL,
        focusFollowsMouse  = True,
        borderWidth        = 0,
        modMask            = MOD_KEY,
        workspaces         = ["1", "2", "3", "4", "5", "6", "7", "8", "9"],
        normalBorderColor  = "000000",
        focusedBorderColor = "222222",
        keys               = KEYMAPS,
        mouseBindings      = MOUSE_BINDINGS,
        layoutHook         = LAYOUT_HOOK,
        manageHook         = MANAGE_HOOK,
        startupHook        = STARTUP_HOOK
    }

