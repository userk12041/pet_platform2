package com.boot.dao;

import com.boot.dto.CommentDTO;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface CommentDAO {
    void insertComment(CommentDTO dto);
    List<CommentDTO> getCommentByBoardId(int boardId);
    void deleteComment(int id);
}
