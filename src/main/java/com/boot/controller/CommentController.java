package com.boot.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.boot.dto.CommentDTO;
import com.boot.service.CommentService;

@Controller
public class CommentController {

    @Autowired
    private CommentService commentService;

    @PostMapping("/comment/write")
    public String writeComment(CommentDTO comment, HttpSession session) {
        String userId = (String) session.getAttribute("id");

        if (userId == null) {
            return "redirect:/login";
        }

        comment.setUser_id(userId);  // 세션에서 작성자 ID 설정
        commentService.insertComment(comment);
        
        return "redirect:/freeboard_detail?id=" + comment.getBoardId(); // 상세 페이지로 리다이렉트
    }

    @GetMapping("/comment/delete")
    public String deleteComment(@RequestParam("id") int id, @RequestParam("boardId") int boardId) {
        commentService.deleteComment(id);
        return "redirect:/freeboard_detail?id=" + boardId;
    }
}
