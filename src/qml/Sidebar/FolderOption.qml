import QtQuick
import QtQuick.Layouts

import ".." // For using Variables.qml.
import "../Reusable"

Item {
    id: element

    implicitHeight: Math.max(48, nameLabel.height + 8)

    property alias title: nameLabel.text
    property bool isSelected: false

    signal editClicked()

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
                Layout.preferredHeight: 48
                Layout.preferredWidth: height

                iconHeight: 16
                iconWidth: 16

                iconSvg: "qrc:/src/resources/icons/edit.svg"

                backgroundColor: "transparent"
                foregroundColor: Variables.foregroundColor

                onClicked: {
                    element.editClicked()
                }
            }
        }
    }
}
