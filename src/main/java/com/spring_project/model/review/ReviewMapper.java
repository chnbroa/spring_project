package com.spring_project.model.review;

import java.util.List;

public interface ReviewMapper {
    List<ReviewDTO> list(int contentsno);
    int totalCnt(int contentsno);
    int create(ReviewDTO dto);
    int updateAvg(int contentsno);
    int delete(int rnum);
    int update(ReviewDTO dto);
}
