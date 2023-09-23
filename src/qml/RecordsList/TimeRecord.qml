import QtQuick
import QtQuick.Layouts

import ".." // For using Variables.qml.
import "../Reusable"

Item {
    id: element

    property bool isEditable: true
    property bool isDeletable: true

    implicitHeight: Math.max(36, timeLabel.height + 8)

    Rectangle {
        anchors.fill: parent

        color: Variables.timeRecordBgColor

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
                text: "0000d 00h 01m 40s"

                verticalAlignment: Text.AlignVCenter
                wrapMode: Text.WordWrap
            }

            Button {
                visible: element.isEditable

                width: 36
                height: width

                iconHeight: 16
                iconWidth: 16

                iconSvg: "qrc:/src/resources/icons/edit.svg"

                backgroundColor: "transparent"
                foregroundColor: Variables.foregroundColor

                onClicked: {
                    console.log("Edit time record button clicked.")
                }
            }

            Button {
                visible: element.isDeletable

                width: 36
                height: width

                iconHeight: 16
                iconWidth: 14

                iconSvg: "qrc:/src/resources/icons/delete.svg"

                backgroundColor: "transparent"
                foregroundColor: Variables.foregroundColor

                onClicked: {
                    console.log("Delete time record button clicked.")
                }
            }
        }
    }
}
