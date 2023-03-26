import QtQuick 2.0

import ".." // For using Variables.qml.

Item {
    id: element

    width: Variables.svgIconsSize
    height: Variables.svgIconsSize

    property int lineWidth: Variables.svgIconsStroke

    property string color: Variables.foregroundColor
    property string iconSvg: ""

    Canvas {
        id: canvas

        width: element.width; height: element.height
        contextType: "2d"

        anchors.centerIn: parent

        onPaint: {
            context.strokeStyle = element.color
            context.lineWidth = element.lineWidth
            context.path = element.iconSvg
            context.stroke()
        }
    }
}
