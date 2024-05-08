import QtQuick
import QtQuick.Layouts

import ".." // For using Variables.qml.

Item {
    id: element

    property bool active: true

    property string text: ""
    property alias iconProperties: buttonIcon.properties

    property string inactiveBgColor: Variables.inactiveBgColor
    property string inactiveFgColor: Variables.inactiveFgColor
    property string backgroundColor: Variables.backgroundColor
    property string foregroundColor: Variables.foregroundColor

    property string borderColor: "white"
    property int borderWidth: 0

    property int cornerRadius: 0
    property int horizontalPadding: 0
    property int verticalPadding: 0
    property int spacing: 0

    property alias font: buttonText.font

    readonly property int contentWidth: row.width
    readonly property int contentHeight: row.height

    signal clicked()

    implicitHeight: verticalPadding * 2 + element.contentHeight
    implicitWidth: horizontalPadding * 2 + element.contentWidth

    Rectangle {
        id: background

        width: Math.max(horizontalPadding * 2 + element.contentWidth, element.width)
        height: Math.max(verticalPadding * 2 + element.contentHeight, element.height)

        color: element.active ? element.backgroundColor : element.inactiveBgColor

        radius: element.cornerRadius

        border.color: element.borderColor
        border.width: element.borderWidth

        RowLayout {
            id: row

            anchors.centerIn: parent
            spacing: element.spacing

            Icon {
                id: buttonIcon

                visible: element.iconSvg !== ""

                Layout.alignment: Qt.AlignVCenter

                color: element.active ? element.foregroundColor : element.inactiveFgColor
            }

            Text {
                id: buttonText

                visible: element.text !== ""

                Layout.alignment: Qt.AlignVCenter

                color: element.active ? element.foregroundColor : element.inactiveFgColor

                text: element.text
            }
        }

        MouseArea {
            id: mouseArea

            anchors.fill: parent

            cursorShape: element.active ? Qt.PointingHandCursor : Qt.ArrowCursor

            onClicked: {
                if (element.active)
                {
                    element.clicked();
                }
            }
        }
    }
}
