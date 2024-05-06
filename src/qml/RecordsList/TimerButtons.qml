import QtQuick

import ActiveTimer

import ".." // For using Variables.qml.
import "../Reusable"

Item {
    id: element

    property int buttonSize: 56
    property int edgeMargin: 16

    property int status: ActiveTimer.Stopped

    signal playClicked()
    signal pauseClicked()
    signal stopClicked()

    Button {
        id: playPauseButton

        height: element.buttonSize
        width: height

        state: _.timerStatusToPlayState(element.status)
        states: [
            State {
                name: "PlayButton"
                PropertyChanges { target: playPauseButton; backgroundColor: Variables.greenAccentColor }
                PropertyChanges { target: playPauseButton; iconProperties: Variables.iconPlay24 }
                PropertyChanges { target: playPauseButton; anchors.bottomMargin: element.edgeMargin }
                PropertyChanges { target: playPauseButton; onClicked: {
                    element.playClicked()
                } }
            },
            State {
                name: "PauseButton"
                PropertyChanges { target: playPauseButton; backgroundColor: Variables.yellowAccentColor }
                PropertyChanges { target: playPauseButton; iconProperties: Variables.iconPause24 }
                PropertyChanges { target: playPauseButton; anchors.bottomMargin: stopButton.anchors.bottomMargin + stopButton.height + element.edgeMargin }
                PropertyChanges { target: playPauseButton; onClicked: {
                    element.pauseClicked()
                } }
            },
            State {
                name: "UnpauseButton"
                PropertyChanges { target: playPauseButton; backgroundColor: Variables.greenAccentColor }
                PropertyChanges { target: playPauseButton; iconProperties: Variables.iconPlay24 }
                PropertyChanges { target: playPauseButton; anchors.bottomMargin: stopButton.anchors.bottomMargin + stopButton.height + element.edgeMargin }
                PropertyChanges { target: playPauseButton; onClicked: {
                    element.playClicked()
                } }
            }
        ]

        anchors { right: parent.right; bottom: parent.bottom; rightMargin: element.edgeMargin }

        cornerRadius: height / 2

        Behavior on anchors.bottomMargin {
            NumberAnimation {
                duration: 120
            }
        }
    }

    Button {
        id: stopButton

        height: element.buttonSize
        width: height

        state: _.timerStatusToStopState(element.status)
        states: [
            State {
                name: "Visible"
                PropertyChanges { target: stopButton; anchors.rightMargin: element.edgeMargin }
            },
            State {
                name: "Hidden"
                PropertyChanges { target: stopButton; anchors.rightMargin: -height }
            }
        ]

        anchors { right: parent.right; bottom: parent.bottom; bottomMargin: element.edgeMargin }

        cornerRadius: height / 2
        iconProperties: Variables.iconStop24
        backgroundColor: Variables.redAccentColor

        onClicked: {
            element.stopClicked()
        }

        Behavior on anchors.rightMargin {
            NumberAnimation {
                duration: 120
            }
        }
    }

    Item {
        id: _

        function timerStatusToPlayState(status) {
            switch(status) {
                case ActiveTimer.Running:
                    return "PauseButton";
                case ActiveTimer.Paused:
                    return "UnpauseButton";
                default:
                    return "PlayButton";
            }
        }

        function timerStatusToStopState(status) {
            switch(status) {
                case ActiveTimer.Running:
                case ActiveTimer.Paused:
                    return "Visible";
                default:
                    return "Hidden";
            }
        }
    }
}
