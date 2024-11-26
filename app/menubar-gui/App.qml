import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Window 2.15
import "qrc:/menubar-gui" 1.0

Window {
    width: Constants.defaultWindowWidth
    height: Constants.defaultWindowWidth
    id: window

    visible: true
    title: "Moonlight"
    flags: Qt.FramelessWindowHint
    color: "transparent"
    opacity: 1


    Rectangle {
        id: appContainer
        width: window.width
        height: window.height
        opacity: 1
        color: "transparent"
        radius: 1

        Header {
            id: header
        }

    }
    Component.onCompleted: {
            console.log("Screen Width:", Constants.screenWidth)
        }
}

