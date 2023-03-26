pragma Singleton
import QtQuick

Item {
    readonly property int windowWidth: 400
    readonly property int windowHeight: 800
    readonly property string windowTitle: "Willpower"

    readonly property string backgroundColor: "#18171f"
    readonly property string foregroundColor: "#F1F1F1"
    readonly property string topBarBgColor: backgroundColor
    readonly property string topBarFgColor: "#EDECF2"

    readonly property int svgIconsStroke: 2
    readonly property int svgIconsSize: 24

    readonly property string initialTopBarTitle: "Title"

    readonly property int topBarTextSize: 18

    readonly property string menuIconSvg: "M3,18H21M3,12H21M3,6H21"
}
