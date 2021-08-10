#include "gameboard.h"

GameBoard::GameBoard(QObject *parent)
{
    Q_UNUSED(parent);
    srand(clock());
    m_board.resize(dimensions, std::vector<size_t>(dimensions));
    fillBoard(baseDifficulty);
}

void GameBoard::fillBoard(const size_t &difficulty)
{
    // Try to open the file
    const std::string fileName = "sudoku/"+std::to_string(difficulty) + ".txt";
    QFile file(fileName.c_str());
    if (!file.open(QIODevice::ReadOnly | QIODevice::Text)) {
        qDebug() << ("We cannot open the file " + fileName).c_str();
        throw 1;
    }

    // Read from file
    QTextStream in(&file);
    std::vector<std::string> lines;
    while (!in.atEnd()) {
        lines.push_back(in.readLine().toStdString());
    }

    // Fill our board with the read value
    size_t linesNumber = lines.size();
    std::string board = lines[rand()%linesNumber];
    for (size_t index = 0; index<dimensions*dimensions; index++) {
        size_t x = getX(index), y = getY(index);
        m_board[x][y] = board[index]-'0';
    }
    m_defaultBoard = m_board;
}

const QString GameBoard::getValue(const size_t &index)
{
    size_t x = getX(index), y = getY(index);
    return (m_board[x][y] == 0 ? "" : QString::number(m_board[x][y]));
}

void GameBoard::setValue(const size_t &index, const size_t &newValue)
{
    size_t x = getX(index), y = getY(index);
    m_board[x][y] = newValue;
}

bool GameBoard::isValueCorrect(const size_t &index)
{
    size_t x = getX(index), y = getY(index);
    if (m_board[x][y] == 0) return true;

    //Check whether there is the same value in the same raw/column
    for (size_t i = 0; i<dimensions; i++) {
        if ((y != i && m_board[x][y] == m_board[x][i]) || (i != x && m_board[i][y] == m_board[x][y])) {
            return false;
        }
    }

    //Check whether there is the same value in the same square
    size_t x_square = x/3, y_square = y/3;
    const size_t leftSquareBoundX = x_square*3, leftSquareBoundY = y_square*3;
    const size_t rightSquareBoundX = (x_square+1)*3, rightSquareBoundY = (y_square+1)*3;
    for (size_t i = leftSquareBoundX; i<rightSquareBoundX; i++) {
        for (size_t j = leftSquareBoundY; j<rightSquareBoundY; j++) {
            if (m_board[i][j] == m_board[x][y] && (i!=x || j != y)) return false;
        }
    }
    return true;
}

const QString GameBoard::getColor(const size_t &index)
{
    if (!isValueCorrect(index)) return wrongFontColor;
    if (isValueDefault(index)) return defaultFontColor;
    return newFontColor;
}

bool GameBoard::isValueDefault(const size_t &index)
{
    size_t x = getX(index), y = getY(index);
    return static_cast<bool>(m_defaultBoard[x][y]);
}

size_t GameBoard::getX(const size_t &index)
{
    return index/dimensions;
}

size_t GameBoard::getY(const size_t &index)
{
    return index%dimensions;
}

int GameBoard::getDimensions()
{
    return static_cast<int>(dimensions);
}

const QString GameBoard::getCursorShape(const size_t &index)
{
    if (isValueDefault(index)) return "ArrowCursor";
    return "PointingHandCursor";
}

const QString GameBoard::getBackgroundColor()
{
    return backgroundColor;
}

const QString GameBoard::getTileColor(const bool &isCurrentTile)
{
    if (isCurrentTile) return currentTileColor;
    return tileColor;
}

const QString GameBoard::getBorderColor()
{
    return borderColor;
}
