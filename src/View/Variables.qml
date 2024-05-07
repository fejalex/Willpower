pragma Singleton
import QtQuick

import "Reusable"

Item {
    // Window properties.
    readonly property int windowWidth: 360
    readonly property int windowHeight: 764 // 9x20 screen minus common statusbar height.
    readonly property string applicationName: "Willpower"

    // Fonts
    readonly property string generalFont: nunitoLoader.name
    readonly property string monospaceFont: jetBrainsMonoLoader.name

    // Main application colors.
    readonly property string backgroundColor: "#22212C"
    readonly property string accentBgColor: "#2D2B3E"
    readonly property string foregroundColor: "#EDECF2"
    // Accent colors.
    readonly property string greenAccentColor: "#2BD665"
    readonly property string yellowAccentColor: "#EBC43B"
    readonly property string redAccentColor: "#FD4949"
    readonly property string greyAccentColor: "#383C49"
    readonly property string placeholderColor: "#696F83"
    // Additional colors.
    readonly property string fadeColor: "#000000"
    readonly property string textSelectionBgColor: "#4F6F9E"
    readonly property string timeRecordShineColor: "#37354A"

    // SVG settings.
    readonly property int svgIconsStroke: 2

    // Other settings.
    readonly property double fadePower: 0.7

    // Font loaders
    FontLoader {
        id: nunitoLoader
        source: "qrc:/src/Resources/Fonts/Nunito.ttf"
    }
    FontLoader {
        id: jetBrainsMonoLoader
        source: "qrc:/src/Resources/Fonts/JetBrainsMono.ttf"
    }

    // Icons
    readonly property IconProperties iconEdit16:        IconProperties { svg: "qrc:/src/Resources/Icons/edit.svg";         width: 16; height: 16 }
    readonly property IconProperties iconDelete16:      IconProperties { svg: "qrc:/src/Resources/Icons/delete.svg";       width: 14; height: 16 }

    readonly property IconProperties iconClock16:       IconProperties { svg: "qrc:/src/Resources/Icons/clock.svg";        width: 16; height: 16 }
    readonly property IconProperties iconPause16:       IconProperties { svg: "qrc:/src/Resources/Icons/pause.svg";        width: 10; height: 16 }

    readonly property IconProperties iconTick16:        IconProperties { svg: "qrc:/src/Resources/Icons/tick.svg";         width: 14; height: 16 }
    readonly property IconProperties iconChevronUp16:   IconProperties { svg: "qrc:/src/Resources/Icons/chevron-up.svg";   width: 14; height: 16 }
    readonly property IconProperties iconChevronDown16: IconProperties { svg: "qrc:/src/Resources/Icons/chevron-down.svg"; width: 14; height: 16 }

    readonly property IconProperties iconMenu24:        IconProperties { svg: "qrc:/src/Resources/Icons/menu.svg";         width: 21; height: 24 }
    readonly property IconProperties iconClose24:       IconProperties { svg: "qrc:/src/Resources/Icons/close.svg";        width: 18; height: 24 }

    readonly property IconProperties iconPlay24:        IconProperties { svg: "qrc:/src/Resources/Icons/play.svg";         width: 22; height: 24 }
    readonly property IconProperties iconPause24:       IconProperties { svg: "qrc:/src/Resources/Icons/pause.svg";        width: 15; height: 24 }
    readonly property IconProperties iconStop24:        IconProperties { svg: "qrc:/src/Resources/Icons/stop.svg";         width: 18; height: 24 }

    readonly property IconProperties iconSun24:         IconProperties { svg: "qrc:/src/Resources/Icons/sun.svg";          width: 24; height: 24 }
    readonly property IconProperties iconMoon24:        IconProperties { svg: "qrc:/src/Resources/Icons/moon.svg";         width: 18; height: 24 }
    readonly property IconProperties iconPlus24:        IconProperties { svg: "qrc:/src/Resources/Icons/plus.svg";         width: 21; height: 24 }
    readonly property IconProperties iconSettings24:    IconProperties { svg: "qrc:/src/Resources/Icons/settings.svg";     width: 24; height: 24 }
}
