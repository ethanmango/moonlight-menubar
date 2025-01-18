import QtQuick 2.15
import StreamingPreferences 1.0
import QtQuick.Controls 2.15
import "qrc:/menubar-gui" 1.0

//Content of app when no connections are made yet

Column  {
    id: columnnn
    spacing: 0
    width: parent.width

    //Top margin (after header)
    Rectangle {
            width: parent.width
            height: parent.width * 2
            color: "transparent"
        }

    Column {
        spacing: parent.width * 0.025
        width: parent.width
        Text {
            width: parent.width * 0.6
            wrapMode: Text.WordWrap
            horizontalAlignment: Text.AlignHCenter
            anchors.horizontalCenter: parent.horizontalCenter

            text: StreamingPreferences.enableMdns ? qsTr("Seeeeework...")
                                                  : qsTr("Automatieeely.")
            font.pixelSize: Constants.fontSize1
            font.family: "SF Pro"
            font.bold: true
            color: Colors.textSecondary

        }
        Rectangle {
            id: spinnerContainer
            anchors.horizontalCenter: parent.horizontalCenter
            width: parent.width * 0.035
            height: parent.width * 0.035
            color: "transparent"

            Canvas {
                anchors.fill: parent

                onPaint: {
                    var ctx = getContext("2d");
                    ctx.clearRect(0, 0, width, height);
                    ctx.lineWidth = width/6;
                    ctx.strokeStyle = Colors.textSecondary;
                    var radius = (width - ctx.lineWidth) / 2;

                    ctx.beginPath();
                    ctx.arc(width / 2, height / 2, radius, 0, Math.PI * 1.5, false);
                    ctx.stroke();
                }
            }

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
    //Bottom margin (before footer)
    Rectangle {
            width: parent.width
            height: parent.width * 0.04
            color: "transparent"
        }


    Item {
        id: footer
        width: parent.width
        height: Constants.defaultWindowWidth * 0.43

        Rectangle {
            id: background
            width: parent.width
            height: parent.height
            color: Colors.primary
            opacity: 0.43
            radius: Constants.radiusInPixels
        }


    }
}

