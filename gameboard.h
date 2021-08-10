#ifndef GAMEBOARD_H
#define GAMEBOARD_H

#include <QObject>
#include <vector>
#include <QFile>
#include <QTextStream>
#include <QDebug>

class GameBoard : public QObject
{
    Q_OBJECT
public:
    GameBoard(QObject *parent = nullptr);

    Q_INVOKABLE void setValue(const size_t &index, const size_t &newValue);
    Q_INVOKABLE bool isValueDefault(const size_t &index);
    Q_INVOKABLE int getDimensions();
    Q_INVOKABLE const QString getTileColor(const bool &isCurrentTile);
    Q_INVOKABLE const QString getBackgroundColor();
    Q_INVOKABLE const QString getBorderColor();
    Q_INVOKABLE const QString getCursorShape(const size_t &index);
    Q_INVOKABLE const QString getValue(const size_t &index);
    Q_INVOKABLE const QString getColor(const size_t &index);

private:
    std::vector<std::vector<size_t>> m_board;
    std::vector<std::vector<size_t>> m_defaultBoard;

    static constexpr size_t dimensions = 9;
    static constexpr size_t baseDifficulty = 3;

    const QString wrongFontColor = "red";
    const QString defaultFontColor = "black";
    const QString newFontColor = "#808080";
    const QString tileColor = "white";
    const QString currentTileColor = "#e8e8e8";
    const QString backgroundColor = "#f5f5f5";
    const QString borderColor = "#a1a1a1";

    void fillBoard(const size_t &difficulty);
    size_t getX(const size_t &index);
    size_t getY(const size_t &index);
    bool isValueCorrect(const size_t &index);
};

#endif // GAMEBOARD_H
