import XMonad
import XMonad.Actions.CycleWS
import XMonad.Hooks.ManageDocks
import XMonad.Hooks.DynamicLog
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
    xmonad $ defaultConfig {
                 terminal           = "urxvt",
                 modMask            = mod4Mask,
                 normalBorderColor  = "#161616",
                 focusedBorderColor = "#aaaaaa",
                 workspaces         = ["term", "browser", "3", "4",
                                       "5", "6", "7", "8", "9"],
                 layoutHook         = avoidStruts myLayout,
                 manageHook         = manageDocks <+> manageHook defaultConfig
             } `additionalKeysP` [("M1-n", spawn "urxvt")
                                 ,("M1-b", runOrRaise "firefox" (className =? "Firefox"))
                                 ,("M1-t", runOrRaise "thunderbird" (className =? "Thunderbird-bin"))
                                 ,("M1-p", runOrRaise "pidgin" (className =? "Pidgin"))
                                 ,("M1-f", runOrRaise "filezilla" (className =? "Filezilla"))
                                 ,("M1-d", runOrRaise "urxvt -name dev" (resource =? "dev"))
                                 ,("M1-i", runOrRaise "urxvt -name irc" (resource =? "irc"))
                                 ,("M1-s", runOrRaise "urxvt -name sql" (resource =? "sql"))
                                 ,("M1-l", spawn "xscreensaver-command -lock")
                                 ,("M1-<Space>", spawn "gmrun")
                                 ,("C-M1-c", restart "xmonad" True)
                                 ,("C-M1-<Left>", prevWS)
                                 ,("C-M1-<Right>", nextWS)
                                 ,("C-M1-<Up>", focusUrgent)
                                 ,("C-S-M1-<Left>", shiftToPrev)
                                 ,("C-S-M1-<Right>", shiftToNext)
                                 ,("M1-<Tab>", windows W.focusDown)
                                 ,("M1-S-<Tab>", windows W.focusUp)
                                 ,("C-M1-h", sendMessage $ Go L)
                                 ,("C-M1-j", sendMessage $ Go D)
                                 ,("C-M1-k", sendMessage $ Go U)
                                 ,("C-M1-l", sendMessage $ Go R)
                                 ]

myLayout = configurableNavigation noNavigateBorders (tiled ||| Mirror tiled ||| Full)
    where
        tiled   = reflectHoriz $ Tall nmaster delta ratio
        nmaster = 3
        ratio   = 0.5
        delta   = 0.0005
