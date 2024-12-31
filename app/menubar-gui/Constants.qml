import QtQuick 2.15
pragma Singleton

QtObject {
    id: sizes
    property int screenWidth: Screen.width
    //TODO: Change defaultWindowWidth based on dpi (scale the pixel width up the smaller the display is, with a max size)
    // Assuming displays are same pixel size but difference physical size, smaller display should take up more pixels so its not too tiny
    property int defaultWindowWidth: Screen.width * 0.21
    property double radiusInPixels: Screen.width * .0039

}
