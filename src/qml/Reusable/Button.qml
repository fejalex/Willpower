import QtQuick
import QtQuick.Layouts

import ".." // For using Variables.qml.

Item {
    id: element

    property string backgroundColor: Variables.backgroundColor
    property string foregroundColor: Variables.foregroundColor

    property string text: ""
    property string iconSvg: ""

    property real iconWidth: 24
    property real iconHeight: 24

    property int cornerRadius: 0
    property int horizontalPadding: 0
    property int verticalPadding: 0
    property int spacing: 0

    property alias font: buttonText.font

    readonly property int contentWidth: row.width
    readonly property int contentHeight: row.height

    signal clicked()

    Rectangle {
        id: background

        width: Math.max(horizontalPadding * 2 + element.contentWidth, element.width)
        height: Math.max(verticalPadding * 2 + element.contentHeight, element.height)

        color: element.backgroundColor

        radius: element.cornerRadius

        RowLayout {
            id: row

            anchors.centerIn: parent

            Icon {
                id: buttonIcon

                visible: element.iconSvg !== ""

                Layout.alignment: Qt.AlignVCenter

                color: element.foregroundColor

                iconSvg: element.iconSvg

                width: element.iconWidth
                height: element.iconHeight
            }

            Rectangle {
                width: element.spacing
                color: "transparent"
                visible: buttonIcon.visible && buttonText.visible
            }

            Text {
                id: buttonText

                visible: element.text !== ""

                Layout.alignment: Qt.AlignVCenter

                color: element.foregroundColor

                text: element.text
            }
        }

        MouseArea {
            anchors.fill: parent

            propagateComposedEvents: true

            cursorShape: "PointingHandCursor"

            onClicked: {
                element.clicked()
            }
        }
    }
}
