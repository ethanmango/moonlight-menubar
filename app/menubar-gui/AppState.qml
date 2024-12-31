import QtQuick 2.15
pragma Singleton

QtObject {
    id: states

    readonly property int noConnections: 0
    readonly property int connected: 1
    readonly property int settings: 2
}
