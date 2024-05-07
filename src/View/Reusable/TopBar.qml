import QtQuick
import QtQuick.Layouts

import ".." // For using Variables.qml.

Item {
    id: element

    property string title: Variables.initialTopBarTitle

    property string backgroundColor: Variables.backgroundColor
    property string foregroundColor: Variables.foregroundColor

    property alias iconProperties: button.iconProperties

    signal buttonClicked()

    Rectangle {
        id: background

        anchors.fill: parent

        color: element.backgroundColor

        RowLayout {
            anchors.fill: parent
            spacing: 0

            Button {
                id: button

                visible: element.iconSvg !== ""

                Layout.fillHeight: true
                Layout.preferredWidth: height

                backgroundColor: element.backgroundColor
                foregroundColor: element.foregroundColor

                onClicked: {
                    element.buttonClicked()
                }
            }

            Text {
                id: titleText

                Layout.fillWidth: true
                Layout.alignment: Qt.AlignVCenter

                color: element.foregroundColor

                font { family: Variables.generalFont; pixelSize: 20; weight: Font.Bold }

                text: element.title

                elide: Text.ElideRight
                maximumLineCount: 1
            }
        }
    }
}
