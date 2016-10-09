import Data.Ratio ((%))
import XMonad hiding (Tall)
import XMonad.Actions.FloatKeys
import XMonad.Actions.NoBorders
import XMonad.Actions.PhysicalScreens
import XMonad.Actions.SpawnOn
import XMonad.Actions.Submap

import XMonad.Doc.Extending

import XMonad.Hooks.DynamicLog
import XMonad.Hooks.EwmhDesktops
import XMonad.Hooks.ManageDocks
import XMonad.Hooks.SetWMName
import XMonad.Hooks.UrgencyHook

import XMonad.Layout.BoringWindows (focusMaster, focusUp, focusDown, boringWindows)
import XMonad.Layout.GridVariants
import XMonad.Layout.Minimize
import XMonad.Layout.MultiToggle
import XMonad.Layout.NoBorders
import XMonad.Layout.PerWorkspace
import XMonad.Layout.Reflect
import XMonad.Layout.ResizableTile
import XMonad.Layout.Tabbed
import XMonad.Layout.ThreeColumns

import XMonad.Prompt 
import XMonad.Prompt.Shell

import XMonad.Util.NamedWindows
import XMonad.Util.NamedScratchpad
import XMonad.Util.Run
import XMonad.Util.WorkspaceCompare

import Control.Monad (liftM2)
import Graphics.X11.ExtraTypes.XF86
import System.Exit (ExitCode (ExitSuccess), exitWith)
import System.IO

--import MyEventHook

import XMonad.Layout.MultiToggle.Instances

import qualified Data.Map as M
import qualified XMonad.StackSet as W


{- MAIN -}
main = do
    dzen <- spawnPipe myStatusBar
    conkytop <- spawnPipe myTopBar
--    conkympd <- spawnPipe myMpdBar

    xmonad $ withUrgencyHook LibNotifyUrgencyHook $ ewmh defaultConfig { 
      modMask             = myModMask
    , borderWidth         = myBorderWidth
    , terminal            = myTerminal
    , focusFollowsMouse   = myFocusFollowsMouse
    , normalBorderColor   = myNormalBorderColor
    , focusedBorderColor  = myFocusedBorderColor
    , workspaces          = myWorkspaces
    , startupHook         = myStartupHook
    , logHook             = do
        ewmhDesktopsLogHook 
        dynamicLogWithPP $ myDzenPP dzen
    , manageHook          = myManageHook <+> manageDocks
    , layoutHook          = myLayoutHook
    , handleEventHook     = do
        docksEventHook
        -- handleEventHook defaultConfig
        -- fullscreenEventHook
    , keys                = myKeys -- <+> keys defaultConfig
    }


myModMask            = mod1Mask -- 4 Win
myTerminal           = "urxvtc"
myFocusFollowsMouse  = True
myBorderWidth        = 3
myNormalBorderColor  = "#000000"
myFocusedBorderColor = "#cd4500"


{- dzen2 config -}

myStatusBar = "dzen2 -h 20 -w 1000 -xs 1 -ta l -sa l -fg '" ++ myDzenFGColor ++ "' -bg '" ++ myDzenBGColor ++ "' -fn '" ++ myFont ++ "' -e 'button2=;'"
myTopBar    = "conky -c $HOME/.config/conky/bars/top.conf | dzen2 -x 1000 -y 0 -h 20 -w 920 -xs 1 -ta r -sa r -fg '" ++ myDzenFGColor ++ "' -bg '" ++ myDzenBGColor ++ "' -fn '" ++ myFont ++ "' -e 'button2=;'"
myMpdBar    = "conky -c $HOME/.config/conky/bars/mpd.conf | dzen2 -x 0 -y 1900 -h 17 -w 1920 -xs 1 -ta l -sa l -fg '" ++ myDzenFGColor ++ "' -bg '" ++ myDzenBGColor ++ "' -fn '" ++ myXftFont ++ "' -e 'button2=;'"

myXftFont  = "IPAPGothic:pixelsize=11:antialias=true"
--myXftFont  = "xft:Source Code Pro:pixelsize=13:antialias=true"
myFont     = "-*-montecarlo-medium-r-normal-*-11-*-*-*-c-*-*-*"

myIconDir     = ".xmonad/icons/"
myRightCorner = "right.xbm"
myLeftCorner  = "left.xbm"
myIconCombiner ico = "^i(" ++ myIconDir ++ ico ++ ")"

myWithWindowBGC = "#383838"

myDzenFGColor = "#ddd"
myDzenBGColor = "#000"

myCurrentFGColor = "#000" --"#00ff66"
myCurrentBGColor = "#6495ed" --myWithWindowBGC

myVisibleFGColor = "#0ad"
myVisibleBGColor = myWithWindowBGC

myHiddenNoWindowsFGColor = "#999"
myHiddenNoWindowsBGColor = "#1f1f1f"

myUrgentFGColor = "#000"  -- black font
myUrgentBGColor = "#f80"  -- in orange background

myHiddenFGColor = "#fff"
myHiddenBGColor = myWithWindowBGC

myDzenWrap fgc bgc = wrap (p ++ ib ++ (fg bgc) ++ leftCorner ++ r ++ pR ++ (fg fgc) ++ p2) (pR ++ p ++ (fg bgc) ++ rightCorner ++ (fg myDzenBGColor) ++ r ++ ibR ++ fgR ++ bgR ++ pR)
    where
  -- R for reset
    p           = "^p(2)"
    p2          = "^p(2;1)"
    pR          = "^p()"
    ib          = "^ib(1)"
    ibR         = "^ib(0)"
    fg c        = "^fg(" ++ c ++ ")"
    fgR         = "^fg()"
    bg c        = "^bg(" ++ c ++ ")"
    bgR         = "^bg()"
    r           = "^r(1100x16)^p(-1100)"
    leftCorner  = "^i(" ++ myIconDir ++ myLeftCorner ++ ")"
    rightCorner = "^i(" ++ myIconDir ++ myRightCorner ++ ")"
 

myDzenPP h = defaultPP
    { ppCurrent = myDzenWrap myCurrentFGColor myCurrentBGColor
    , ppVisible = myDzenWrap myVisibleFGColor myVisibleBGColor
    , ppHidden  = myDzenWrap myHiddenFGColor myHiddenBGColor . noScratchPad
    , ppHiddenNoWindows = myDzenWrap myHiddenNoWindowsFGColor myHiddenNoWindowsBGColor . noScratchPad
    , ppUrgent  = myDzenWrap myUrgentFGColor myUrgentBGColor 
    , ppTitle   = myDzenWrap myDzenFGColor  myWithWindowBGC . shorten 50
    , ppSep = " "
    , ppWsSep = ""
    -- ppLayout inspirated by https://github.com/rakete/dot-xmonad/blob/master/xmonad.hs
    , ppLayout = myDzenWrap myDzenFGColor myHiddenNoWindowsBGColor . myIconCombiner . (\x ->
        let tokens = words x
            xs = filter (=="ReflectX") tokens
            ys = filter (=="ReflectY") tokens
            name = head $ filter (\t -> (all (/=t) [ "Mirror"
                                                   , "Mirrored"
                                                   , "Minimize"
                                                   , "Maximize"
                                                   , "ReflectX"
                                                   , "ReflectY"
                                                   , "TwoScreen"
                                                   , "Spacing"
                                                   ])) tokens
            in case name of 
                "Full"            -> "Full.xbm"
                "SplitGrid"       -> "SplitGrid.xbm"
                "ResizableTall"   -> "Tall.xbm"
                "ThreeCol"        -> "ThreeCol.xbm"
                "Tabbed Simplest" -> "SimpleTabbed.xbm"
                otherwise -> name
        )
    ,   ppOutput = hPutStrLn h
    }
    where
        noScratchPad ws = if ws == "NSP" then "" else ws -- Hide NSP Workspace


{- Urgency -}
data LibNotifyUrgencyHook = LibNotifyUrgencyHook deriving (Read, Show)

instance UrgencyHook LibNotifyUrgencyHook where
    urgencyHook LibNotifyUrgencyHook w = do
        name <- getName w
        Just idx <- fmap (W.findTag w) $ gets windowset
        safeSpawn "notify-send" [show name, "Workspace: " ++ idx]


{- Theme -}
myTheme :: Theme
myTheme = defaultTheme
    { activeColor        = myVisibleBGColor
    , activeBorderColor  = myVisibleFGColor
    , activeTextColor    = myVisibleFGColor
    , inactiveColor        = "#a0a0a0"
    , inactiveBorderColor  = myHiddenFGColor
    , inactiveTextColor    = "#000000"
    , urgentColor        = myUrgentBGColor
    , urgentBorderColor  = myUrgentFGColor
    , urgentTextColor    = myUrgentFGColor

    , decoHeight = 18

    --, fontName = "xft:Source Code Pro:Medium:size=8"

    }


{-------------
 - Workspace -
 -------------}

myWorkspaces = ["1st", "2nd", "3:www", "4:dev", "5", "6:gra", "7:med", "8:kom", "9:news", "0", "-", "`" ]
wsWWW = myWorkspaces !! 2
wsDEV = myWorkspaces !! 3
wsGRA = myWorkspaces !! 5
wsMED = myWorkspaces !! 6
wsKOM = myWorkspaces !! 7
wsNEW = myWorkspaces !! 8

toggleFloat = withFocused 
    ( \windowId -> do
        { floats <- gets (W.floating . windowset);
          if windowId `M.member` floats
          then withFocused $ windows . W.sink
          else float windowId
            --keysMoveWindowTo (2880, 540) (1%2, 1%2) windowId
            --keysAbsResizeWindow (50, 50) (1,1) windowId
        }
    )


{------------
 - XPConfig -
 ------------}

myXPConfig = defaultXPConfig 
    { position = Top
    , font     = "xft:" ++ myXftFont
    , bgColor  = myDzenBGColor
    , fgColor  = myDzenFGColor
    , bgHLight = myDzenBGColor
    , fgHLight = myUrgentBGColor
    , promptBorderWidth = 0
    , alwaysHighlight = True
    , height = 20
    , historySize = 10
    }


{--------
 - Keys -
 --------}

{- Neo2 Keyboard Layout -}
myKeys conf@(XConfig {modMask = modm}) = M.fromList $

    {- programs by shortcut -}
    [ ((modm              , xK_l), shellPrompt myXPConfig)
    , ((modm              , xK_x), spawn "passmenu")
    , ((modm              , xK_o), submap . M.fromList $
        [ ((0             , xK_m), runInTerm  "-name mutt" "mutt $xdg_mutt")
        , ((0             , xK_f), safeSpawnProg "firefox")
        , ((0             , xK_z), safeSpawnProg "zathura")
        , ((0             , xK_s), spawn "apulse32 skype %U")
        ]
      )

    {- Screenshot -}
    , ((0                 , xK_Print), spawn "import -window root ~/Pictures/Screenshots/$(date '+%Y-%m-%d_%H:%M:%S').png")
    , ((shiftMask         , xK_Print), spawn "import ~/Pictures/Screenshots/$(date '+%Y-%m-%d_%H:%M:%S').png")

    {- Lock screen -}
    , ((modm .|. shiftMask, xK_l), spawn "slock & sleep 1 ; xset dpms force off")


    {- XMONAD -}
    
    {- Base -}
    , ((modm              , xK_Return), spawn $ XMonad.terminal conf)
    , ((modm .|. shiftMask, xK_Return), windows W.swapMaster)
    , ((modm .|. shiftMask, xK_t), toggleFloat)


    {- Layout Management -}
    , ((modm              , xK_BackSpace), withFocused minimizeWindow)
    , ((modm .|. shiftMask, xK_BackSpace), sendMessage RestoreNextMinimizedWin)

    , ((modm              , xK_space), sendMessage NextLayout)
    , ((modm .|. shiftMask, xK_space), setLayout $ XMonad.layoutHook conf)
    , ((modm .|. shiftMask, xK_m    ), sendMessage $ Toggle REFLECTX)


    , ((modm              , xK_s), sendMessage Shrink)
    , ((modm              , xK_t), sendMessage Expand)

    , ((modm              , xK_n), focusDown)
    , ((modm              , xK_r), focusUp)

    , ((modm .|. shiftMask, xK_n), windows W.swapDown)
    , ((modm .|. shiftMask, xK_r), windows W.swapUp)

    , ((modm              , xK_h), sendMessage MirrorExpand)
    , ((modm              , xK_z), sendMessage MirrorShrink)
    

    , ((modm              , xK_comma), sendMessage $ IncMasterN 1)
    , ((modm              , xK_period), sendMessage $ IncMasterN $ -1)

    , ((modm              , xK_g), onPrevNeighbour W.view)  -- Show neighbour screen. much easier on dualscreen
    , ((modm .|. shiftMask, xK_g), onPrevNeighbour W.shift) -- Shift window to neighbour screen
    , ((modm              , xK_adiaeresis), kill)           -- close window

    {- toggle mode -}
    , ((modm              , xK_b), submap . M.fromList $        -- Toggle ..
        [ ((0             , xK_n), sendMessage $ ToggleStrut D) -- + Bottom Bar
        , ((0             , xK_r), sendMessage $ ToggleStrut U) -- + Top Bar
        , ((0             , xK_t), sendMessage ToggleStruts)    -- + All Bars
        , ((0             , xK_o), withFocused toggleBorder)    -- + Border
        {- Fullscreen Layout, NoBorders, ToggleStruts -}
        , ((0             , xK_f), sequence_ 
            [ sendMessage $ Toggle NBFULL
            , sendMessage ToggleStruts
            ]
          )
        ]
      )
    --, ((modm              , xK_grave), submap . M.fromList $
    --    [ ((modm          , xK_grave), namedScratchpadAction myScratchPads "mid")
    --    , ((modm          , xK_space), namedScratchpadAction myScratchPads "bot")
    --    ]
    --  )


    -- Reload, Exit, recompile & reload
    , ((modm             , xK_q), submap . M.fromList $
        [ ((0            , xK_q), io $ exitWith ExitSuccess)
        , ((0            , xK_r), spawn "notify-send 'xmonad' 'restarting';  killall dzen2 conky; xmonad --restart")
        , ((0            , xK_c), spawn "notify-send 'xmonad' 'recompiling'; killall dzen2 conky; xmonad --recompile; xmonad --restart")
        ]
      )
    
    -- Audio
    , ((0           , xF86XK_AudioNext),        spawn "mpc next")
    , ((0           , xF86XK_AudioPrev),        spawn "mpc prev")
    , ((0           , xF86XK_AudioPlay),        spawn "mpc toggle")
    , ((shiftMask   , xF86XK_AudioPlay),        spawn "mpc stop")
    , ((shiftMask   , xF86XK_AudioLowerVolume), spawn "mpc volume -1")
    , ((shiftMask   , xF86XK_AudioRaiseVolume), spawn "mpc volume +1")
    , ((0           , xF86XK_AudioLowerVolume), spawn "amixer -q set Master 2-")
    , ((0           , xF86XK_AudioRaiseVolume), spawn "amixer -q set Master 2+")
    , ((controlMask , xF86XK_AudioLowerVolume), spawn "amixer -q set Master 8-")
    , ((controlMask , xF86XK_AudioRaiseVolume), spawn "amixer -q set Master 8+")
    , ((0           , xF86XK_AudioMute),        spawn "amixer -q set Master toggle")
    ] 
    ++
    [ ((m .|. modm, k), windows $ f i)
    | (i, k) <- zip (XMonad.workspaces conf) ([xK_1 .. xK_9] ++ [xK_0, xK_minus, xK_grave])
    , (f, m) <- [(W.greedyView, 0), (W.shift, shiftMask)]
    ]


{--------------
 - ManageHook -
 --------------}

{- 
 - xprop WM_CLASS => WM_CLASS(STRING) = "resource/appName", "className"
 - xprop WM_NAME  => WM_NAME(STRING)  = "title"
 - resource =? x <||> className =? y <&&> title =? z
 -}
myManageHook = (composeAll . concat $
    [ [ className =? "Skype"        --> doShift wsKOM ]
    , [ resource  =? "ncmpcpp"      --> doShift wsMED ]
    , [ resource  =? "mutt"         --> doShift wsKOM ]
    , [ resource  =? "floatingTerm" --> doFloat ]
    , [ className =? "Firefox"      --> doShift wsWWW ]
    , [ className =? c              --> doShift wsDEV | c <- ["jetbrains-rubymine", "Eclipse"] ]
    , [ title     =? c              --> doShift wsDEV | c <- ["Eclipse"] ]
    , [ className =? c              --> doShift wsGRA | c <- ["Dia", "Gimp", "Inkscape"] ]
    , [ className =? "Gimp" <&&> (title =? "GIMP beenden" <||> title =? "Bild öffnen") --> doFloat ]
    , [ className =? "TeamSpeak 3"  --> doShift wsKOM ]
    , [ resource  =? c              --> doShift wsNEW | c <- ["newsbeuter", "calcurse"] ]
    ]) <+> namedScratchpadManageHook myScratchPads
    --where doVShift = doF . liftM2 (.) W.greedyView W.shift


{--------------
 - Scratchpad -
 --------------}

myScratchPads = [ NS "mid" spawnMid findMid manageMid
                , NS "bot" spawnBot findBot manageBot
                ]
    where
    spawnMid  = myTerminal ++ " -name scratchpadMid"
    findMid   = resource =? "scratchpadMid"
    manageMid = customFloating $ W.RationalRect l t w h
        where
        h = 7 / 10        -- terminal height
        w = 7 / 10        -- terminal width
        t = (1 - h) / 2 -- distance from top edge 
        l = (1 - w) / 2 -- distance from left edge (centered)

    spawnBot  = myTerminal ++ " -name scratchpadBot"
    findBot   = resource =? "scratchpadBot"
    manageBot = customFloating $ W.RationalRect l t w h
        where
        h = 1/10
        w = 1
        t = 1 - h
        l = 1 - w

{--------------
 - LayoutHook -
 --------------}

myLayoutHook 
    = avoidStrutsOn [U]
    . smartBorders 
    . minimize 
    . boringWindows
    . mkToggle (single NBFULL)
    . mkToggle (single REFLECTX)
    $ myLayouts
        where
        myLayouts = tiled ResizableTall [] ||| Full
        ----
        tiledGrid = SplitGrid XMonad.Layout.GridVariants.L 1 1 ratio (16/9) delta

        tiled lay = lay nmaster delta ratio
        nmaster = 1     --Windows in Master Pane
        delta = 1/10    --Resize %
        ratio = 4/10    --Proportionen beim Start von >1 Fenstern

{---------------
 - StartUpHook -
 ---------------}

myStartupHook :: X ()
myStartupHook = do
    setWMName "LG3D" -- Java Hack

{------------------------
 - Additional Functions -
 ------------------------}

spawnOnWorkspace :: String -> String -> X ()
spawnOnWorkspace workspace program = do
    spawn program
    windows $ W.shift workspace

