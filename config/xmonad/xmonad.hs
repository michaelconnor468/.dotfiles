import XMonad
import Data.Monoid
import Data.Map
import System.Exit
import XMonad.Util.SpawnOnce
import XMonad.Util.EZConfig
import XMonad.Hooks.DynamicLog
import qualified XMonad.StackSet as W

myModKey         = mod4Mask -- Left Windows button

myMouseBindings (XConfig {XMonad.modMask = modm}) = Data.Map.fromList
    [ ((modm, button1), \w -> focus w >> mouseMoveWindow w)
    , ((modm, button2), \w -> focus w >> windows W.shiftMaster)
    , ((modm, button3), \w -> focus w >> mouseResizeWindow w)
    ]

myLayoutHook = tiled ||| Full
  where
    tiled   = Tall nmaster delta ratio
    nmaster = 1
    ratio   = 1/2
    delta   = 3/100

myManageHook = composeAll
    [ className =? "MPlayer"        --> doFloat
    , className =? "Gimp"           --> doFloat
    , resource  =? "desktop_window" --> doIgnore
    , resource  =? "kdesktop"       --> doIgnore ]

myStartupHook = do
    spawnOnce "picom --backend xrender --config ~/.config/picom/picom.conf &"
    spawnOnce "nitrogen --set-scaled ~/Media/Photos/Wallpapers/$((`date | awk '{print $3}'` % 31)).jpg &"

main = xmonad $ def {
        terminal           = "kitty",
        focusFollowsMouse  = True,
        borderWidth        = 0,
        modMask            = myModKey,
        workspaces         = ["1", "2", "3", "4", "5", "6", "7", "8", "9"],
        normalBorderColor  = "000000",
        focusedBorderColor = "222222",
        mouseBindings      = myMouseBindings,
        layoutHook         = myLayoutHook,
        manageHook         = myManageHook,
        startupHook        = myStartupHook
    }
