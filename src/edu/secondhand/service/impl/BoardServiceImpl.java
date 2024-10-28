package edu.secondhand.service.impl;

import edu.secondhand.dao.BoardDao;
import edu.secondhand.entity.Admin;
import edu.secondhand.entity.Board;
import edu.secondhand.service.BoardService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

@Service
public class BoardServiceImpl implements BoardService {

    @Autowired
    BoardDao dao;

    @Override
    public void addBoard(Board board) {
        dao.addBoard(board);
    }

    @Override
    public List<Board> selectBoardList(Map<String, Object> maps) {
        return   dao.selectBoardList(maps);
    }

    @Override
    public void deleteBoard(int id) {
        dao.deleteBoard(id);
    }

    @Override
    public Board selectBoardById(int id) {
        return  dao.selectBoardById(id);
    }

    @Override
    public void updateBoard(Board board) {
        dao.updateBoard(board);
    }

}
