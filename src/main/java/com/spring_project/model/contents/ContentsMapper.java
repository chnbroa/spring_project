package com.spring_project.model.contents;

import java.util.List;
import java.util.Map;

public interface ContentsMapper {
	int create(ContentsDTO dto);
	List<ContentsDTO> list(Map map);
	int total(Map map);
	ContentsDTO read(int contentsno);
	int update(ContentsDTO dto);
	List<Map> getCategory();
	List<ContentsDTO> categoryList(Map map);
	int delete(int contentsno);
	int categoryTotal(Map map);
}
