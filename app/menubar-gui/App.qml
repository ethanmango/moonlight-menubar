import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Window 2.15
import "qrc:/menubar-gui" 1.0

Window {
    width: Constants.defaultWindowWidth
    height: appContainer.implicitHeight // Dynamically set window height
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

                    Rectangle {
                        id: content
                        width: parent.width
                        height: Constants.defaultWindowWidth * 0.17
                        color: "transparent"

                        Text {
                            anchors.centerIn: parent
                            text: "No established connections\nPlease add a new PC below"
                            font.pixelSize: Constants.fontSizePixels
                            font.family: "SF Pro"
                            font.bold: true
                            color: Colors.textSecondary
                        }
                    }

                    Item {
                        width: parent.width
                        implicitHeight: footer.height

                        Rectangle {
                            id: footer
                            width: parent.width
                            height: Constants.defaultWindowWidth * 0.12
                            color: Colors.primary
                            opacity: 0.43
                            radius: Constants.radiusInPixels
                            anchors.bottom: parent.bottom
                        }

                        // Button {
                        //     id: doubleHeightButton
                        //     text: "Double Height"
                        //     anchors.horizontalCenter: footer.horizontalCenter
                        //     anchors.bottom: footer.bottom
                        //     anchors.bottomMargin: 5
                        //     onClicked: {
                        //         content.height *= 2
                        //     }
                        // }
                    }
                }


    }
    Component.onCompleted: {
            console.log("Screen Width:", Constants.screenWidth)
            console.log("Default app width:", Constants.defaultWindowWidth)
        }
}


