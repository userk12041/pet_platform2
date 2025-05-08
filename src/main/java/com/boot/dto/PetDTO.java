package com.boot.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class PetDTO {
	private int id;
    private String name;
    private String gender; 
    private String type;
    private int age;
    private String description;
    private String user_id;
}
