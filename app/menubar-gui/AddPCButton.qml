import QtQuick 2.15
import QtQuick.Controls 2.15

Item {
    width: parent.width
    height: parent.height
    property Item footerRect

    Rectangle {
        id: addPCButton
        width: parent.width * 0.38
        height: 40 // Set a fixed height for the button
        // @disable-check M9
        anchors.verticalCenter: parent.verticalCenter
        // @disable-check M9
        anchors.right: parent.right
        anchors.rightMargin: Constants.marginInPixels
        radius: Constants.radiusInPixels / 1.6
        color: pressed
                    ? Colors.accent
                    : (hovered ? Colors.primary : Colors.primaryTransparent)

        // Hover animation
        Behavior on color {
            ColorAnimation {
                duration: 200
                easing.type: Easing.Linear
            }
        }

        // Mouse handling for hover and click
        MouseArea {
            id: buttonMouseArea
            anchors.fill: parent
            hoverEnabled: true


            onClicked: {
                console.log("Button clicked!");
                footerRect.height *= 2;
            }
            onPressed: {
                addPCButton.pressed = true;
            }
            onReleased: {
                addPCButton.pressed = false;
            }
            onEntered: {
                addPCButton.hovered = true;
            }
            onExited: {
                addPCButton.hovered = false;
            }
        }

        property bool hovered: false
        property bool pressed: false

        Text {
                anchors.verticalCenter: parent.verticalCenter
                anchors.left: parent.left
                anchors.leftMargin: Constants.marginInPixels
                text: qsTr("Add PC manually")
                font.pixelSize: Constants.fontSize2
                font.bold: true
                font.family: "SF Pro"
                color: Colors.textSecondary
            }

            Rectangle {
                id: addPCIcon
                color: Colors.button
                width: parent.height / 1.3
                height: parent.height / 1.5
                anchors.verticalCenter: parent.verticalCenter
                anchors.right: parent.right
                anchors.rightMargin: Constants.marginInPixels / 1.3
                radius: Constants.radiusInPixels / 3

                IconImage {
                    source: "qrc:/res/ic_add_to_queue_white_48px.svg"
                    sourceSize {
                        width: parent.width * 0.7
                    }
                    anchors.centerIn: parent
                    anchors.horizontalCenterOffset: parent.width * 0.01
                    color: Colors.textSecondary
                }
            }
    }
}
