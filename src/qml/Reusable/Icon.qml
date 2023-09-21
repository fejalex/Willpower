import QtQuick
import QtQuick.Controls as Controls

import ".." // For using Variables.qml.

Item {
    id: element

    width: 24
    height: 24

    property string color: Variables.foregroundColor

    property string iconSvg: ""

    // QML hack to render svg with changable color and size.
    Controls.Button {
        anchors.centerIn: parent

        background: Item { }
        enabled: false

        icon.source: element.iconSvg

        icon.width: element.width
        icon.height: element.height

        icon.color: element.color
    }

    onWidthChanged: {
        implicitWidth = width
    }

    onHeightChanged: {
        implicitHeight = height
    }
}
