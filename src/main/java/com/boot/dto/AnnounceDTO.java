package com.boot.dto;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Data
public class AnnounceDTO {
	private int id;
	private String title;
	private String content;
	private Date created_at;


}
