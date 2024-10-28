package edu.secondhand.dao;

import edu.secondhand.entity.Comments;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;

public interface CommentsDao {
    void updateComments(@Param("Comments") Comments comments);

    Comments selectCommentsById(@Param("id") int id);

    void deleteComments(@Param("id") int id);

    List<Comments> selectCommentsList(@Param("map") Map<String, Object> maps);

    void addComments(@Param("Comments") Comments comments);

    List<Comments> selectAllComments();
}
