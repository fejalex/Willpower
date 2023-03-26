import QtQuick
import QtQuick.Window

Window {
    width: Variables.windowWidth
    height: Variables.windowHeight
    visible: true
    title: qsTr(Variables.windowTitle)

    Rectangle{
        anchors.fill: parent
        color: Variables.backgroundColor

        Text {
            anchors.centerIn: parent
            color: Variables.foregroundColor
            text: "Hello world!"
            font.pixelSize: 30
        }
    }
}
