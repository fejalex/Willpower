import QtQuick
import QtQuick.Controls as Controls

import ".." // For using Variables.qml.

Item {
    id: element

    width: properties.width
    height: properties.height

    property IconProperties properties: IconProperties {}

    property string color: Variables.foregroundColor

    // QML hack to render svg with changable color and size.
    Controls.Button {
        anchors.centerIn: parent

        background: Item { }
        enabled: false

        icon.source: element.properties.svg

        icon.width: element.properties.width
        icon.height: element.properties.height

        icon.color: element.color
    }

    onWidthChanged: {
        implicitWidth = width
    }

    onHeightChanged: {
        implicitHeight = height
    }
}
