import QtQuick
import QtQuick.Layouts

import ".." // For using Variables.qml.
import "../Reusable"

Item {
    id: element

    property bool isPaused: false

    implicitHeight: Math.max(36, timeLabel.height + 8)

    Rectangle {
        anchors.fill: parent

        color: Variables.accentBgColor

        radius: 8

        RowLayout {
            anchors.fill: parent
            spacing: 0

            Item {
                visible: !element.isPaused

                width: 36
                height: 36

                Icon {
                    anchors.centerIn: parent

                    properties: Variables.iconClock16

                    color: Variables.foregroundColor
                }
            }

            Item {
                visible: element.isPaused

                width: 36
                height: 36

                Icon {
                    anchors.centerIn: parent

                    properties: Variables.iconPause16
                    
                    color: Variables.foregroundColor
                }
            }

            Text {
                id: timeLabel

                Layout.fillWidth: true

                color: Variables.foregroundColor
                font { family: Variables.monospaceFont; pixelSize: 16; }
                text: "0000d 00h 01m 40s"

                verticalAlignment: Text.AlignVCenter
                wrapMode: Text.WordWrap
            }
        }
    }
}
