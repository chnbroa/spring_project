package com.spring_project.model.review;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("com.spring_project.model.review.ReviewServiceImpl")
public class ReivewServiceImpl implements ReviewService{

    @Autowired
    private ReviewMapper mapper;

    @Override
    public List<ReviewDTO> list(int contentsno) {
        return mapper.list(contentsno);
    }

    @Override
    public int totalCnt(int contentsno) {
        return mapper.totalCnt(contentsno);
    }

    @Override
    public int create(ReviewDTO dto) {
        return mapper.create(dto);
    }

    @Override
    public int updateAvg(int contentsno) {
        return mapper.updateAvg(contentsno);
    }

    @Override
    public int delete(int rnum) {
        return mapper.delete(rnum);
    }

    @Override
    public int update(ReviewDTO dto) {
        return mapper.update(dto);
    }
}
