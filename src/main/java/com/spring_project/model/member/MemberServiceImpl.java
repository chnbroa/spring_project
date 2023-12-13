package com.spring_project.model.member;

import com.spring_project.model.notice.NoticeDTO;
import java.util.List;
import java.util.Map;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("com.spring_project.model.member.MemberServiceImpl")
public class MemberServiceImpl implements MemberService {
    @Autowired
    private MemberMapper mapper;


    @Override
    public int loginCheck(Map<String, String> map) {
        return mapper.loginCheck(map);
    }

    @Override
    public Map<String, String> getGrade(String id) {
        return mapper.getGrade(id);
    }

    @Override
    public int create(MemberDTO dto) {
        return mapper.create(dto);
    }

    @Override
    public int total(Map map) {
        return mapper.total(map);
    }

    @Override
    public List<MemberDTO> list(Map map) {
        return mapper.list(map);
    }

    @Override
    public int duplicatedId(String id) {
        return mapper.duplicatedId(id);
    }

    @Override
    public int duplicatedEmail(String email) {
        return mapper.duplicatedEmail(email);
    }

    @Override
    public String getId(Map<String, String> info) {
        return mapper.getId(info);
    }

    @Override
    public String getPw(Map<String, String> info) {
        return mapper.getPw(info);
    }

    @Override
    public int updateFile(Map map) {
        return mapper.updateFile(map);
    }

    @Override
    public MemberDTO mypage(String id) {
        return mapper.mypage(id);
    }

    @Override
    public MemberDTO read(String id) {
        return mapper.read(id);
    }

    @Override
    public int update(MemberDTO dto) {
        return mapper.update(dto);
    }

    @Override
    public int delete(String id) {
        return mapper.delete(id);
    }

    @Override
    public List<NoticeDTO> noticeList() {
        return mapper.noticeList();
    }
}
