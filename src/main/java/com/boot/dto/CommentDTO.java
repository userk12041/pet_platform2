package com.boot.dto;

import java.sql.Timestamp;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;


@Data
@AllArgsConstructor
@NoArgsConstructor
public class CommentDTO {
	private Long id;
	private Long boardId;
	private String user_id;
	private String content;
	private Timestamp created_at;
}
