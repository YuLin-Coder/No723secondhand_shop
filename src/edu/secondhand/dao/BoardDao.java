package edu.secondhand.dao;

import edu.secondhand.entity.Admin;
import edu.secondhand.entity.Board;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;

public interface BoardDao {
    void updateBoard(@Param("Board") Board board);

    Board selectBoardById(@Param("id") int id);

    void deleteBoard(@Param("id") int id);

    List<Board> selectBoardList(@Param("map") Map<String, Object> maps);

    void addBoard(@Param("Board") Board board);

}
