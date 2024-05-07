import QtQuick
import QtQuick.Layouts

import ".." // For using Variables.qml.
import "../Reusable"

Item {
    id: element

    property bool isEditable: true
    property bool isDeletable: true

    property string text: "000d 00h 00m 00s"

    implicitHeight: Math.max(36, timeLabel.height + 8)

    signal editClicked()
    signal deleteClicked()

    Rectangle {
        anchors.fill: parent

        color: Variables.accentBgColor

        radius: 8

        RowLayout {
            anchors.fill: parent
            anchors.leftMargin: 8
            spacing: 4

            Text {
                id: timeLabel
                Layout.fillWidth: true

                color: Variables.foregroundColor
                font { family: Variables.monospaceFont; pixelSize: 16; }
                text: element.text

                verticalAlignment: Text.AlignVCenter
                wrapMode: Text.WordWrap
            }

            Button {
                visible: element.isEditable

                Layout.preferredHeight: 36
                Layout.preferredWidth: height

                iconProperties: Variables.iconEdit16

                backgroundColor: "transparent"
                foregroundColor: Variables.foregroundColor

                onClicked: {
                    console.log("Edit time record button clicked.")
                    editClicked()
                }
            }

            Button {
                visible: element.isDeletable

                Layout.preferredHeight: 36
                Layout.preferredWidth: height

                iconProperties: Variables.iconDelete16

                backgroundColor: "transparent"
                foregroundColor: Variables.foregroundColor

                onClicked: {
                    deleteClicked()
                }
            }
        }
    }
}
