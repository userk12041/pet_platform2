package com.boot.service;

import java.util.List;

import com.boot.dto.CommentDTO;

public interface CommentService {
	void insertComment(CommentDTO dto);
    List<CommentDTO> getCommentsByBoardId(int boardId);
    void deleteComment(int id);
}
