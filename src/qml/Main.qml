import QtQuick
import QtQuick.Window
import QtQuick.Layouts
import QtQuick.Controls as Controls

import "Reusable"
import "RecordsList"
import "Sidebar"
import "ModalWindows"

Window {
    id: window

    width: Variables.windowWidth
    height: Variables.windowHeight
    visible: true
    title: Variables.applicationName

    RecordsList {
        id: recordsList
    }

    Sidebar {
        id: sidebar
    }

    FolderCreationModal {
        id: createFolderModal
    }
}
