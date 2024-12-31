import QtQuick 2.15
import StreamingPreferences 1.0
import QtQuick.Controls 2.15
import "qrc:/menubar-gui" 1.0

//Content of app when no connections are made yet
Item {
    width: parent.width
    implicitHeight: content.height + footer.height
    Rectangle {
        id: content
        width: parent.width
        height: Constants.defaultWindowWidth * 0.17
        color: "transparent"

        Text {
            anchors.centerIn: parent
            width: parent.width * 0.6
            wrapMode: Text.WordWrap
            horizontalAlignment: Text.AlignHCenter
            anchors.horizontalCenter: parent.horizontalCenter

            text: StreamingPreferences.enableMdns ? removeTrailingDots(qsTr("Searching for compatible hosts on your local network..."))
                                                  : qsTr("Automatic PC discovery is disabled. Add your PC manually.")
            font.pixelSize: Constants.fontSize1
            font.family: "SF Pro"
            font.bold: true
            color: Colors.textSecondary

            function removeTrailingDots(translatedText) {
                        return translatedText.replace(/\.*$/, ""); // Remove trailing dots
            }
        }
        Text {
                id: dotsText
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.top: parent.children[0].bottom
                anchors.topMargin: -1 * parent.height * 0.08
                font.pixelSize: Constants.fontSize2
                font.family: "SF Pro"
                font.bold: true
                color: Colors.textSecondary

                text: dots

                property string dots: "..."

                Timer {
                    id: loadingTimer
                    interval: 500
                    running: StreamingPreferences.enableMdns
                    repeat: true
                    onTriggered: {
                        if (dotsText.dots === "...") {
                            dotsText.dots = "";
                        } else if (dotsText.dots === "") {
                            dotsText.dots = ".";
                        } else {
                            dotsText.dots += ".";
                        }
                    }
                }

                Component.onCompleted: {
                    loadingTimer.start();
                }

            }
    }


    Item {
        id: footer
        width: parent.width
        height: Constants.defaultWindowWidth * 0.11
        anchors.bottom: parent.bottom

        Rectangle {
            id: background
            width: parent.width
            height: parent.height
            color: Colors.primary
            opacity: 0.43
            radius: Constants.radiusInPixels
        }

        AddPCButton {
            id: addPCButton
            width: parent.width
            height: parent.height
            footerRect: footer
        }
    }

}
