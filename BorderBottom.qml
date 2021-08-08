import QtQuick 2.0

Rectangle {
    property int thisIndex

    height: {
        var x = Math.floor(thisIndex/9);
        if (x == 2 || x == 5) {
            return 1
        }
        return 0
    }

    color: "#a1a1a1"
    anchors.bottom: parent.bottom
    anchors.left: parent.left
    anchors.right: parent.right
}
