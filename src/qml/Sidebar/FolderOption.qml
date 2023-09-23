import QtQuick
import QtQuick.Layouts

import ".." // For using Variables.qml.
import "../Reusable"

Item {
    id: element

    implicitHeight: Math.max(48, nameLabel.height + 8)

    property bool isSelected: false

    Rectangle {
        anchors.fill: parent

        color: isSelected ? Variables.timeRecordBgColor : Variables.backgroundColor

        RowLayout {
            anchors.fill: parent
            anchors.leftMargin: 15
            spacing: 4

            Text {
                id: nameLabel
                Layout.fillWidth: true

                color: Variables.foregroundColor
                font { family: Variables.generalFont; pixelSize: 18; }
                text: "Default"

                verticalAlignment: Text.AlignVCenter
                wrapMode: Text.WordWrap
            }

            Button {
                width: 48
                height: width

                iconHeight: 16
                iconWidth: 16

                iconSvg: "qrc:/src/resources/icons/edit.svg"

                backgroundColor: "transparent"
                foregroundColor: Variables.foregroundColor

                onClicked: {
                    console.log("Edit folder button clicked.")
                }
            }
        }
    }
}
