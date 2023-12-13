package com.spring_project.model.contents;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;
import org.springframework.web.multipart.MultipartFile;

@NoArgsConstructor
@AllArgsConstructor
@Setter
@Getter
@ToString
@Builder
public class ContentsDTO {
	private int contentsno;
	private int cateno;
	private int subcateno;
	private String pname;
	private int price;
	private String filename;
	private MultipartFile filenameMF;
	private String detail;
	private String rdate;
	private int stock;
	private float gradepoint;
}
