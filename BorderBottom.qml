import QtQuick 2.0

Rectangle {
    property int thisIndex

    height: {
        var x = Math.floor(thisIndex/gameboard.getDimensions());
        if (x == 2 || x == 5) return 1
        return 0
    }
    color: gameboard.getBorderColor()
    anchors.bottom: parent.bottom
    anchors.left: parent.left
    anchors.right: parent.right
}
