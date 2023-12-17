import QtQuick
import QtQuick.Window

import "RecordsList"

Window {
    id: window

    width: Variables.windowWidth
    height: Variables.windowHeight
    visible: true
    title: Variables.applicationName

    RecordsList {
        id: recordsList
    }
}
