package edu.secondhand.service;


import edu.secondhand.entity.Admin;
import edu.secondhand.entity.Board;

import java.util.List;
import java.util.Map;

public interface BoardService {
    void addBoard(Board board);

    List<Board> selectBoardList(Map<String, Object> maps);

    void deleteBoard(int id);

    Board selectBoardById(int id);

    void updateBoard(Board board);

}
