package edu.secondhand.service;


import edu.secondhand.entity.Comments;

import java.util.List;
import java.util.Map;

public interface CommentsService {
    void addComments(Comments comments);

    List<Comments> selectCommentsList(Map<String, Object> maps);

    void deleteComments(int id);

    Comments selectCommentsById(int id);

    void updateComments(Comments comments);

    List<Comments> selectAllComments();

}
