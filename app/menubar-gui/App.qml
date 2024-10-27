import QtQuick 2.15
import QtQuick.Controls 2.15

Window {
    width: constants.width
    height: constants.height

    visible: true
    title: "Moonlight"
    flags: Qt.FramelessWindowHint
    color: "transparent"
    opacity: 1

    QtObject {
        id: constants
        property int width: 400
        property int height: 700

    }
    //Represents the fully blurred background
    Rectangle {
        id: rectangle
        width: constants.width
        height: constants.height
        color: constants.backgroundColor
        opacity: 0

    }
}
