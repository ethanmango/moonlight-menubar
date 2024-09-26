import QtQuick 2.15
import QtQuick.Controls 2.15

Window {
    width: constants.width
    height: constants.height

    visible: true
    title: "Moonlight"

    QtObject {
        id: constants
        property int width: 400
        property int height: 300
        property color backgroundColor: "#fff1f0"
    }

    Rectangle {
        id: rectangle
        width: constants.width
        height: constants.height
        color: constants.backgroundColor
        opacity: 0.8

    }
}
