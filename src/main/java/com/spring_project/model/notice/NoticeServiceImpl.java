package com.spring_project.model.notice;

import com.spring_project.model.member.MemberDTO;
import java.util.List;
import java.util.Map;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("com.spring_project.model.notice.NoticeServiceImpl")
public class NoticeServiceImpl implements NoticeService {

    @Autowired
    private NoticeMapper mapper;


    @Override
    public int total(Map map) {
        return mapper.total(map);
    }

    @Override
    public List<MemberDTO> list(Map map) {
        return mapper.list(map);
    }

    @Override
    public NoticeDTO read(int noticeno) {
        return mapper.read(noticeno);
    }

    @Override
    public void upViewcnt(int noticeno) {
        mapper.upViewcnt(noticeno);
    }

    @Override
    public int create(NoticeDTO dto) {
        return mapper.create(dto);
    }

    @Override
    public int update(NoticeDTO dto) {
        return mapper.update(dto);
    }

    @Override
    public int delete(int noticeno) {
        return mapper.delete(noticeno);
    }
}
