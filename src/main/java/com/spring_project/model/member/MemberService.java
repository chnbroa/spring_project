package com.spring_project.model.member;

import com.spring_project.model.notice.NoticeDTO;
import java.util.List;
import java.util.Map;

public interface MemberService{
    int loginCheck(Map<String,String> map);
    Map<String,String> getGrade(String id);

    int create(MemberDTO dto);

    int total(Map map);

    List<MemberDTO> list(Map map);

    int duplicatedId(String id);
    int duplicatedEmail(String email);

    String getId(Map<String, String> info);

    String getPw(Map<String, String> info);

    int updateFile(Map map);

    MemberDTO mypage(String id);

    MemberDTO read(String id);

    int update(MemberDTO dto);

    int delete(String id);

    List<NoticeDTO> noticeList();
}
