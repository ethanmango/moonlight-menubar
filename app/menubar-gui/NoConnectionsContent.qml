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
        Rectangle {
            id: spinnerContainer
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.top: parent.children[0].bottom
            anchors.topMargin: -1 * parent.height * 0.235
            width: parent.width * 0.12
            height: parent.width * 0.12
            color: "transparent"

            // Use a Canvas for the circle
            Canvas {
                anchors.fill: parent

                onPaint: {
                    var ctx = getContext("2d");
                    ctx.clearRect(0, 0, width, height);
                    ctx.lineWidth = width/21;
                    ctx.strokeStyle = Colors.textSecondary;

                    ctx.beginPath();
                    ctx.arc(width / 2, height / 2, width/10.7, 0, Math.PI * 1.5, false);
                    ctx.stroke();
                }
            }

            // Rotation animation for spinning
            RotationAnimator {
                target: spinnerContainer
                from: 0
                to: 360
                duration: 1000
                loops: Animation.Infinite
                running: true
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
