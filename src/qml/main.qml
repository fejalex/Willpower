import QtQuick
import QtQuick.Window

Window {
    width: 400
    height: 800
    visible: true
    title: qsTr("Willpower")

    Rectangle{
        anchors.fill: parent
        color: "#18171f"

        Text {
            anchors.centerIn: parent
            color: "#F1F1F1"
            text: "Hello world!"
            font.pixelSize: 30
        }
    }
}
