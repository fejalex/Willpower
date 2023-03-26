import QtQuick
import QtQuick.Layouts

import ".." // For using Variables.qml.

Item {
    id: root

    property string title: Variables.initialTopBarTitle
    property string backgroundColor: Variables.backgroundColor
    property string foregroundColor: Variables.foregroundColor
    property string iconSvg: ""

    Rectangle {
        id: background

        anchors.fill: parent

        color: root.backgroundColor

        RowLayout {
            anchors.fill: parent

            Rectangle {
                visible: root.iconSvg !== ""

                Layout.fillHeight: true
                Layout.preferredWidth: height

                color: "transparent"

                Icon {
                    id: icon

                    anchors.centerIn: parent

                    color: root.foregroundColor

                    iconSvg: root.iconSvg
                }
            }

            Text {
                id: titleText

                Layout.fillWidth: true
                Layout.alignment: Qt.AlignVCenter

                color: root.foregroundColor

                font { pixelSize: Variables.topBarTextSize; bold: true; }

                text: root.title
            }
        }
    }
}
