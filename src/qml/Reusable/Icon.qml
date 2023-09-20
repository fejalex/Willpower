import QtQuick
import QtQuick.Controls as Controls

import ".." // For using Variables.qml.

Item {
    id: element

    width: 24
    height: 24

    property int iconWidth: width
    property int iconHeight: height

    property string color: Variables.foregroundColor

    property string iconSvg: ""

    // QML hack to render svg with changable color and size.
    Controls.Button {
        anchors.centerIn: parent

        background: Item { }
        enabled: false

        icon.source: element.iconSvg

        icon.width: element.iconWidth
        icon.height: element.iconHeight

        icon.color: element.color
    }
}
