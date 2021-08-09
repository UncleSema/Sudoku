import QtQuick 2.0

Rectangle {
    property int thisIndex

    width: {
        var y = thisIndex%gameboard.getDimensions();
        if (y == 2 || y == 5) return 1
        return 0
    }
    color: gameboard.getBorderColor()
    anchors.top: parent.top
    anchors.bottom: parent.bottom
    anchors.right: parent.right
}
