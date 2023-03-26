import QtQuick
import QtQuick.Layouts

import ".." // For using Variables.qml.

Item {
    id: root

    Rectangle {
        id: background

        anchors.fill: parent

        color: "black"

        RowLayout {
            anchors.fill: parent

            Rectangle {
                Layout.fillHeight: true
                Layout.preferredWidth: height

                color: "grey"
            }

            Text {
                Layout.fillWidth: true
                Layout.alignment: Qt.AlignVCenter

                color: Variables.foregroundColor

                font { pixelSize: 18; }

                text: "Title"
            }
        }
    }
}
