import XMonad
import XMonad.Hooks.DynamicLog
import Control.Monad
import XMonad.Layout.NoBorders
import XMonad.Hooks.ManageHelpers
import XMonad.Util.EZConfig
import XMonad.Util.Cursor

main = xmonad =<< statusBar "xmobar" xmobarPP toggleStrutsKey myConfig

myConfig = defaultConfig{
  terminal = "urxvt",
  startupHook = setDefaultCursor xC_left_ptr,
  layoutHook = smartBorders (layoutHook defaultConfig),
  manageHook = composeAll 
    [isFullscreen --> doFullFloat,
     className =? "MPlayer" --> doFullFloat]
} `additionalKeys`
  [((controlMask,xK_g),spawn "gvim"),
   ((controlMask,xK_s),spawn "chromium --disk-cache-dir=/tmp/chrome")]

toggleStrutsKey XConfig {XMonad.modMask = modMask} = (modMask, xK_b)
