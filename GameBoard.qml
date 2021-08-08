import QtQuick 2.0

GridView {
    id: root

    cellHeight: height/gameboard.getDimensions()
    cellWidth: width/gameboard.getDimensions()

    model: gameboard.getDimensions()*gameboard.getDimensions()
    focus: true

    delegate:
        Item {
            id: current
            width: cellWidth
            height: cellHeight

            property alias color: tecTile.color
            property alias internalText: tecTile.internalText
            property alias fontColor: tecTile.fontColor

            Keys.onPressed: function(event) {
                if (gameboard.isValueDefault(currentIndex)) return;
                if (event.key === Qt.Key_1) {
                    currentItem.internalText = "1"
                    gameboard.setValue(currentIndex, 1)
                } else if (event.key === Qt.Key_2) {
                    currentItem.internalText = "2"
                    gameboard.setValue(currentIndex, 2)
                } else if (event.key === Qt.Key_3) {
                    currentItem.internalText = "3"
                    gameboard.setValue(currentIndex, 3)
                } else if (event.key === Qt.Key_4) {
                    currentItem.internalText = "4"
                    gameboard.setValue(currentIndex, 4)
                } else if (event.key === Qt.Key_5) {
                    currentItem.internalText = "5"
                    gameboard.setValue(currentIndex, 5)
                } else if (event.key === Qt.Key_6) {
                    currentItem.internalText = "6"
                    gameboard.setValue(currentIndex, 6)
                } else if (event.key === Qt.Key_7) {
                    currentItem.internalText = "7"
                    gameboard.setValue(currentIndex, 7)
                } else if (event.key === Qt.Key_8) {
                    currentItem.internalText = "8"
                    gameboard.setValue(currentIndex, 8)
                } else if (event.key === Qt.Key_9) {
                    currentItem.internalText = "9"
                    gameboard.setValue(currentIndex, 9)
                }  else if (event.key === Qt.Key_Backspace) {
                    currentItem.internalText = ""
                    gameboard.setValue(currentIndex, 0)
                }
                var initialIndex = currentIndex
                for (let i = 0; i<81; i++) {
                    currentIndex = i;
                    currentItem.fontColor = gameboard.getColor(currentIndex);
                }
                currentIndex = initialIndex
            }

            Tile {
                id: tecTile
                anchors.fill: parent

                internalText: {
                    var s = gameboard.getValue(index);
                    if (s === 0) {
                        return ""
                    } else {
                        return s
                    }
                }

                color: {
                    if (index === currentIndex) {
                        return "#fff3f0";
                    }
                    return "#fffbfa";
                }

                fontColor: gameboard.getColor(index)


                MouseArea {
                    anchors.fill: parent
                    cursorShape: {
                        if (parent.internalText === "") {
                            return "PointingHandCursor";
                        }
                        return "ArrowCursor";
                    }
                    onClicked: {
                        currentIndex = index;
                    }
                }
            }
            BorderBottom {
                thisIndex: index
            }
            BorderLeft {
                thisIndex: index
            }


        }

}

