import QtQuick
import QtQuick.Layouts

import ActiveTimer

import ".." // For using Variables.qml.
import "../Reusable"

Item {
    id: element

    property int status: ActiveTimer.Stopped
    property string text: "000d 00h 00m 00s"

    signal tick()

    implicitHeight: Math.max(36, timeLabel.height + 8)

    Rectangle {
        anchors.fill: parent

        color: Variables.accentBgColor

        radius: 8

        RowLayout {
            anchors.fill: parent
            spacing: 0

            Item {
                visible: element.status === ActiveTimer.Running

                width: 36
                height: 36

                Icon {
                    anchors.centerIn: parent

                    properties: Variables.iconClock16

                    color: Variables.foregroundColor
                }
            }

            Item {
                visible: element.status === ActiveTimer.Paused

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
                text: element.text

                verticalAlignment: Text.AlignVCenter
                wrapMode: Text.WordWrap
            }
        }

        gradient: shineAnimation.gradient

        ShineAnimation {
            id: shineAnimation

            isRunning: element.visible

            backgroundColor: Variables.accentBgColor
            foregroundColor: Variables.timeRecordShineColor
        }
    }

    Timer {
        interval: 300
        repeat: true
        running: element.status === ActiveTimer.Running
        triggeredOnStart: true

        onTriggered: {
            element.tick()
        }
    }
}
