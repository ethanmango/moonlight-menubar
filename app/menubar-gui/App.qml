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
                    spacing: 10 // Adjust spacing between rows if needed

                    Header {
                        id: header
                        width: parent.width
                        height: 50 // Example height for the header
                    }

                    Rectangle {
                        id: content
                        width: parent.width
                        height: 200 // Example height for content
                        color: "transparent"
                        Text {
                            anchors.centerIn: parent
                            text: "Content Area"
                            font.pixelSize: 16
                            color: "white"
                        }
                    }

                    Rectangle {
                        id: footer
                        width: parent.width
                        height: 50 // Example height for the footer
                        color: "transparent"
                        Button {
                                    id: doubleHeightButton
                                    text: "Double Height"
                                    anchors.horizontalCenter: parent.horizontalCenter
                                    anchors.bottom: parent.bottom
                                    anchors.bottomMargin: 10
                                    onClicked: {
                                        content.height *= 2
                                    }
                                }
                    }
                }


    }
    Component.onCompleted: {
            console.log("Screen Width:", Constants.screenWidth)
        }
}


