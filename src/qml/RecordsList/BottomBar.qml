import QtQuick
import QtQuick.Layouts

import ".."
import "../Reusable"

Item {
    id: element

    height: 56 + Variables.bottomBarMargins * 2

    property string backgroundColor: Variables.bottomBarBgColor
    property string foregroundColor: Variables.bottomButtonsFg

    Rectangle {
        id: background

        anchors.fill: parent

        color: element.backgroundColor

        RowLayout {
            anchors.fill: parent
            anchors.margins: Variables.bottomBarMargins

            spacing: Variables.bottomBarMargins

            Button {
                id: startButton

                Layout.fillWidth: true
                Layout.fillHeight: true

                backgroundColor: Variables.startBg
                foregroundColor: element.foregroundColor

                cornerRadius: height / 2

                font { pixelSize: 20 }

                text: "Start"

                onClicked: {
                    console.log("Start button clicked.")
                }
            }

            Button {
                id: stopButton

                Layout.fillWidth: true
                Layout.fillHeight: true

                backgroundColor: Variables.stopUnactiveBg
                foregroundColor: element.foregroundColor

                cornerRadius: height / 2

                font { pixelSize: 20 }

                text: "Stop"

                onClicked: {
                    console.log("Stop button clicked.")
                }
            }
        }
    }
}
