package com.spring_project.model.notice;

import com.spring_project.model.member.MemberDTO;
import java.util.List;
import java.util.Map;

public interface NoticeMapper {
    int total(Map map);

    List<MemberDTO> list(Map map);
    NoticeDTO read(int noticeno);

    void upViewcnt(int noticeno);
    int create(NoticeDTO dto);
    int update(NoticeDTO dto);
    int delete(int noticeno);
}
