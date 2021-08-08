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

    Q_INVOKABLE int getValue(const size_t &index);
    Q_INVOKABLE const QString getColor(const size_t &index);
    Q_INVOKABLE void setValue(const size_t &index, const size_t &newValue);
    Q_INVOKABLE bool isValueCorrect(const size_t &index);
    Q_INVOKABLE bool isValueDefault(const size_t &index);
    Q_INVOKABLE int getDimensions();

private:
    std::vector<std::vector<size_t>> m_board;
    std::vector<std::vector<size_t>> m_defaultBoard;

    static constexpr size_t dimensions = 9;
    static constexpr size_t baseDifficulty = 3;

    const QString wrongTileColor = "red";
    const QString defaultTileColor = "black";
    const QString newTileColor = "#808080";

    void fillBoard(const size_t &difficulty);
    size_t getX(const size_t &index);
    size_t getY(const size_t &index);
};

#endif // GAMEBOARD_H
