package edu.secondhand.service.impl;

import edu.secondhand.dao.CommentsDao;
import edu.secondhand.entity.Comments;
import edu.secondhand.service.CommentsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

@Service
public class CommentsServiceImpl implements CommentsService {

    @Autowired
    CommentsDao dao;

    @Override
    public void addComments(Comments comments) {
        dao.addComments(comments);
    }

    @Override
    public List<Comments> selectCommentsList(Map<String, Object> maps) {
        return   dao.selectCommentsList(maps);
    }

    @Override
    public void deleteComments(int id) {
        dao.deleteComments(id);
    }

    @Override
    public Comments selectCommentsById(int id) {
        return  dao.selectCommentsById(id);
    }

    @Override
    public void updateComments(Comments comments) {
        dao.updateComments(comments);
    }

    @Override
    public List<Comments> selectAllComments() {
        return    dao.selectAllComments();
    }

}
