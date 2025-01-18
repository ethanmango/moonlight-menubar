import QtQuick 2.15

Loader {
    id: contentLoader
    width: parent.width

    property int currentState: AppState.noConnections

    source: {
        switch (currentState) {
            case AppState.noConnections:
                return "NoConnectionsContent.qml";
            case AppState.connected:
                return "ConnectedContent.qml";
        }
    }

    onLoaded: {
        if (contentLoader.item && contentLoader.item.type === "NoConnectionsContent") {
            contentLoader.item.addPCButtonClickedFromContent.connect(function() {
                contentLoader.currentState = AppState.connected;
            });
        }
    }
}
