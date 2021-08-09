import QtQuick 2.0

Item {
    property int tileIndex
    property bool isCurrentTile: false
    property alias fontColor: internalText.color
    property alias value: internalText.text

    Rectangle {
        anchors.margins: 1
        anchors.fill: parent

        color: gameboard.getTileColor(isCurrentTile)

        Text {
            id: internalText
            anchors.centerIn: parent
            font.pointSize: Math.max(10, parent.height/2)

            text: gameboard.getValue(index);
            color: gameboard.getColor(index)
        }
    }
    BorderBottom {
        thisIndex: tileIndex
    }
    BorderLeft {
        thisIndex: tileIndex
    }
}
