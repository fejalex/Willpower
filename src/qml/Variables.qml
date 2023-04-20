pragma Singleton
import QtQuick

Item {
    // Window properties.
    readonly property int windowWidth: 400
    readonly property int windowHeight: 800
    readonly property string windowTitle: "Willpower"

    // Application colors.
    readonly property string backgroundColor: "#18171f"
    readonly property string foregroundColor: "#F1F1F1"
    // Top bar colors.
    readonly property string topBarBgColor: backgroundColor
    readonly property string topBarFgColor: "#EDECF2"
    // Bottom bar colors.
    readonly property string bottomBarBgColor: backgroundColor
    // Bottom bar buttons colors.
    readonly property string startBg: "#28C768"
    readonly property string pauseBg: "#EBBF4D"
    readonly property string stopBg: "#E35157"
    readonly property string stopUnactiveBg: "#36363C"
    readonly property string bottomButtonsFg: "#FFFFFF"
    readonly property string stopUnactiveFg: "#84838E"

    // SVG settings.
    readonly property int svgIconsStroke: 2
    readonly property int svgIconsSize: 24

    // Initial strings.
    readonly property string initialTopBarTitle: "Title"

    // Top bar properties.
    readonly property int topBarTextSize: 18

    // Bottom bar properties.
    readonly property int bottomBarMargins: 4

    // SVG pathes.
    readonly property string menuIconSvg: "M3,18H21M3,12H21M3,6H21"
}
