package com.spring_project.model.contents;

import java.util.List;
import java.util.Map;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("com.spring_project.model.contents.ContentsServiceImpl")
public class ContentsServiceImpl implements ContentsService {

	@Autowired
	private ContentsMapper mapper;
	
	@Override
	public int create(ContentsDTO dto) {
		// TODO Auto-generated method stub
		return mapper.create(dto);
	}

	@Override
	public List<ContentsDTO> list(Map map) {
		// TODO Auto-generated method stub
		return mapper.list(map);
	}

	@Override
	public int total(Map map) {
		// TODO Auto-generated method stub
		return mapper.total(map);
	}

	@Override
	public ContentsDTO read(int contentsno) {
		// TODO Auto-generated method stub
		return mapper.read(contentsno);
	}

	@Override
	public int update(ContentsDTO dto) {
		// TODO Auto-generated method stub
		return mapper.update(dto);
	}

	@Override
	public List<Map> getCategory() {
		// TODO Auto-generated method stub
		return mapper.getCategory();
	}

	@Override
	public List<ContentsDTO> categoryList(Map map) {
		// TODO Auto-generated method stub
		return mapper.categoryList(map);
	}

	@Override
	public int delete(int contentsno) {
		return mapper.delete(contentsno);
	}

	@Override
	public int categoryTotal(Map map) {
		return mapper.categoryTotal(map);
	}
}
