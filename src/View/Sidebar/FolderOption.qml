import QtQuick
import QtQuick.Layouts

import ".." // For using Variables.qml.
import "../Reusable"

Item {
    id: element

    implicitHeight: Math.max(48, nameLabel.height + 8)

    property string title: "Default"
    property bool isSelected: false

    signal editClicked()
    signal selected()

    Rectangle {
        anchors.fill: parent

        color: isSelected ? Variables.accentBgColor : Variables.backgroundColor

        MouseArea {
            anchors.fill: parent

            cursorShape: "PointingHandCursor"

            onClicked: {
                element.selected()
            }
        }

        RowLayout {
            anchors.fill: parent
            anchors.leftMargin: 15
            spacing: 4

            Text {
                id: nameLabel
                Layout.fillWidth: true

                color: Variables.foregroundColor
                font { family: Variables.generalFont; pixelSize: 18; }
                text: element.title

                verticalAlignment: Text.AlignVCenter
                wrapMode: Text.WordWrap
            }
        }
    }
}
