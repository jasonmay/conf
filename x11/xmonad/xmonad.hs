import XMonad
import XMonad.Actions.CycleWS
import XMonad.Hooks.ManageDocks
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.FadeInactive
import XMonad.Hooks.UrgencyHook
import XMonad.Layout.Reflect
import XMonad.Layout.WindowNavigation
import XMonad.Util.Font(stringToPixel)
import XMonad.Util.Run(spawnPipe)
import XMonad.Util.EZConfig(additionalKeysP)
import XMonad.Actions.WindowGo
import qualified XMonad.StackSet as W
import System.IO
import Data.List

main = do
    xmproc <- spawnPipe "xmobar"
    xmonad $ defaultConfig {
                 terminal           = "urxvtc",
                 modMask            = mod4Mask,
                 normalBorderColor  = "#161616",
                 focusedBorderColor = "#aaaaaa",

                 layoutHook         = avoidStruts myLayout,
                 logHook            = myFadeInactiveLogHook >>
                                    (myXmobarLogHook xmproc),
                 manageHook         = myManageHook <+> manageHook defaultConfig
             } `additionalKeysP` [
                ("C-M1-n", spawn "urxvtc")
                ,("C-M1-b", runOrRaise "firefox" (className =? "Firefox"))
                ,("C-M1-e", spawn "urxvtc -name urxvt_float")
                ,("C-M1-v", spawn "urxvtc -name urxvt_big")

                ,("C-M1-o",     spawn "xscreensaver-command -lock")
                ,("M1-<Space>", spawn "gmrun")

                ,("C-M1-c", restart "xmonad" True)

                ,("C-M1-<Left>",  prevWS)
                ,("C-M1-<Right>", nextWS)

                ,("C-M1-<Up>", focusUrgent)

                ,("C-S-M1-<Left>",  shiftToPrev)
                ,("C-S-M1-<Right>", shiftToNext)

                ,("M1-<Tab>",       windows W.focusDown)
                ,("M1-S-<Tab>",     windows W.focusUp)

                ,("C-M1-h", sendMessage $ Go L)
                ,("C-M1-j", sendMessage $ Go D)
                ,("C-M1-k", sendMessage $ Go U)
                ,("C-M1-l", sendMessage $ Go R)
             ]

myFadeInactiveLogHook =
    fadeInactiveLogHook 0xbbbbbbbb

myXmobarLogHook xmproc =
    dynamicLogWithPP $ xmobarPP
    { ppOutput = hPutStrLn xmproc
    , ppTitle  = xmobarColor "green" "" . shorten 100
    , ppUrgent = xmobarColor "yellow" "red" . xmobarStrip
    }

myLayout = configurableNavigation noNavigateBorders (tiled ||| Mirror tiled ||| Full)
    where
        tiled   = Tall master delta ratio
        master  = 2
        ratio   = 0.5238
        delta   = 0.0005

myManageHook = composeAll
    [ resource =? "Msgcompose"   --> doFloat
    , className =? "Eog"         --> doFloat
    , className =? "Meld"        --> doFloat
    , className =? "Xmessage"    --> doFloat
    , resource  =? "urxvt_float" --> doFloat
    --, resource  =? "urxvt_big" --> doFloat
    , className =? "Firefox"    --> doShift "2:browser"
    , className =? "rdesktop"    --> doShift "7"
    , manageDocks
    ]
