package com.boot.dto;

import java.sql.Timestamp;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class FreeboardDTO {
	private int id;
	private String title;
	private String content;
	private String writer;
	private Timestamp created_at;
}
