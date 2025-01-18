import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Window 2.15

Window {
    width: Constants.defaultWindowWidth
    height: appContainer.implicitHeight
    id: window
    visible: true
    title: "Moonlight"
    flags: Qt.FramelessWindowHint
    color: "transparent"
    opacity: 1
    minimumHeight: appContainer.implicitHeight
    maximumHeight: appContainer.implicitHeight
    minimumWidth: Constants.defaultWindowWidth
    maximumWidth: Constants.defaultWindowWidth

    Rectangle {
        id: appContainer
        width: window.width
        implicitHeight: column.implicitHeight
        opacity: 1
        color: "transparent"
        clip: true
        Behavior on implicitHeight {
                    NumberAnimation {
                        duration: 300
                        easing.type: Easing.OutQuad
                    }
                }


        Column {
                    id: column
                    anchors.fill: parent

                    Header {
                        id: header
                        width: parent.width
                        height: Constants.defaultWindowWidth * 0.13
                    }

                    //Loads content based on current app state
                    ContentLoader {
                        id: contentLoader
                    }

                }


    }

    Component.onCompleted: {
            console.log("Screen Width:", Constants.screenWidth)
            console.log("Default app width:", Constants.defaultWindowWidth)
        }
}


