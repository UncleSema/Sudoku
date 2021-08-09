import QtQuick 2.0

GridView {
    id: root

    cellHeight: height/gameboard.getDimensions()
    cellWidth: width/gameboard.getDimensions()

    model: gameboard.getDimensions()*gameboard.getDimensions()
    focus: true

    Keys.onPressed: function(event) {
        if (gameboard.isValueDefault(currentIndex)) return
        if (event.key === Qt.Key_1)
            gameboard.setValue(currentIndex, 1)
        else if (event.key === Qt.Key_2)
            gameboard.setValue(currentIndex, 2)
        else if (event.key === Qt.Key_3)
            gameboard.setValue(currentIndex, 3)
        else if (event.key === Qt.Key_4)
            gameboard.setValue(currentIndex, 4)
        else if (event.key === Qt.Key_5)
            gameboard.setValue(currentIndex, 5)
        else if (event.key === Qt.Key_6)
            gameboard.setValue(currentIndex, 6)
        else if (event.key === Qt.Key_7)
            gameboard.setValue(currentIndex, 7)
        else if (event.key === Qt.Key_8)
            gameboard.setValue(currentIndex, 8)
        else if (event.key === Qt.Key_9)
            gameboard.setValue(currentIndex, 9)
        else if (event.key === Qt.Key_Backspace)
            gameboard.setValue(currentIndex, 0)

        for (let i = 0; i<81; i++) {
            root.itemAtIndex(i).fontColor = gameboard.getColor(i)
            root.itemAtIndex(i).value = gameboard.getValue(i)
        }
    }

    delegate:
        Tile {
            width: cellWidth
            height: cellHeight
            tileIndex: index
            isCurrentTile: (currentIndex == index)

            MouseArea {
                anchors.fill: parent
                cursorShape: gameboard.getCursorShape(index)
                onClicked: {
                    currentIndex = index;
                }
            }
        }
}

