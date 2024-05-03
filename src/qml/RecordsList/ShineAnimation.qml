import QtQuick

Item {
    id: element

    property real gradientRelativeSize: 0.6;
    property real animationInterval: 3000
    property real animationDuration: 1000

    required property string backgroundColor
    required property string foregroundColor

    property bool isRunning: false

    readonly property alias gradient: shine

    Gradient {
        id: shine
        readonly property real gradientStartMargin: element.animationInterval / element.animationDuration

        GradientStop {
            id: firstStop;

            position: -element.gradientRelativeSize * 1.0;
            color: element.backgroundColor;
        }

        GradientStop {
            id: secondStop;

            position: -element.gradientRelativeSize * 0.5;
            color: element.foregroundColor
        }

        GradientStop {
            id: thirdStop;

            position: -element.gradientRelativeSize * 0;
            color: element.backgroundColor
        }

        orientation: Gradient.Horizontal
    }

    ParallelAnimation {
        NumberAnimation {
            property real offset: element.gradientRelativeSize * 0

            target: firstStop
            properties: "position"

            from: -shine.gradientStartMargin + offset
            to: 1 + offset
            duration: element.animationDuration + element.animationInterval
        }

        NumberAnimation {
            property real offset: element.gradientRelativeSize * 0.5

            target: secondStop
            properties: "position"

            from: -shine.gradientStartMargin + offset
            to: 1 + offset
            duration: element.animationDuration + element.animationInterval
        }

        NumberAnimation {
            property real offset: element.gradientRelativeSize * 1.0

            target: thirdStop
            properties: "position"

            from: -shine.gradientStartMargin + offset
            to: 1 + offset
            duration: element.animationDuration + element.animationInterval
        }

        running: element.isRunning
        loops: Animation.Infinite
        alwaysRunToEnd: true
    }
}
