import "qrc:/menubar-gui" 1.0
import QtQuick 2.15
import QtQuick.Templates 2.15
import QtQuick.Controls
Item {
    Rectangle {
        id: topBarCurved
        width: Constants.defaultWindowWidth
        height: Constants.defaultWindowWidth * 0.05
        //TODO: Set radius of this to whatever macos window radius is to match
        radius: Constants.radiusInPixels
        color: Colors.primary
    }
    IconImage {
        source: "qrc:/res/heading.svg"
        sourceSize {
            width: Constants.defaultWindowWidth
        }
        //Can really have this at 0, but makes sure the radius of the window scales with size
        y: Constants.defaultWindowWidth * 0.001
        color: Colors.primary


        IconImage {
            source: "qrc:/res/moonlight.svg"
            sourceSize {
                width: parent.width * 0.07
            }
            anchors.centerIn: undefined
            anchors.left: parent.left
            anchors.leftMargin: parent.width * 0.033
            //Cannot use anchors for y as easily, using a hacked together header shape
            y: (sourceSize.width / 3)

        }
        IconImage {
            source: "qrc:/res/settings-icon.svg"
            sourceSize {
                width: parent.width * 0.055
            }
            anchors.right: parent.right
            anchors.rightMargin: parent.width * 0.035
            y: (sourceSize.width / 1.8)
        }
    }

}
