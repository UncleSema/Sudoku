import QtQuick 2.0

Rectangle {
    property int thisIndex

    width: {
        var y = thisIndex%9;
        if (y == 2 || y == 5) {
            return 1
        }
        return 0
    }
    color: "#a1a1a1"
    anchors.top: parent.top
    anchors.bottom: parent.bottom
    anchors.right: parent.right
}
