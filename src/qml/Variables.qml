pragma Singleton
import QtQuick

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
    readonly property string foregroundColor: "#EDECF2"
    // Records list colors.
    readonly property string timeRecordBgColor: "#2D2B3E"
    // Accent colors.
    readonly property string greenAccentColor: "#2BD665"
    readonly property string yellowAccentColor: "#EBC43B"
    readonly property string redAccentColor: "#FD4949"
    readonly property string greyAccentColor: "#383C49"
    readonly property string placeholderColor: "#696F83"
    // Additional colors.
    readonly property string fadeColor: "#000000"

    // SVG settings.
    readonly property int svgIconsStroke: 2

    // SVG pathes.
    readonly property string menuIconSvg: "M3,18H21M3,12H21M3,6H21"

    // Font loaders
    FontLoader {
        id: nunitoLoader
        source: "qrc:/src/resources/fonts/Nunito.ttf"
    }
    FontLoader {
        id: jetBrainsMonoLoader
        source: "qrc:/src/resources/fonts/JetBrainsMono.ttf"
    }
}
