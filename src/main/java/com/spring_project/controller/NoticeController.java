package com.spring_project.controller;

import com.spring_project.model.member.MemberDTO;
import com.spring_project.model.notice.NoticeDTO;
import com.spring_project.model.notice.NoticeService;
import com.spring_project.utility.Utility;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class NoticeController {
    @Autowired
    @Qualifier("com.spring_project.model.notice.NoticeServiceImpl")
    private NoticeService service;


    @RequestMapping("/notice/list")
    public String list(HttpServletRequest request ){
        String col = Utility.checkNull(request.getParameter("col"));
        String word = Utility.checkNull(request.getParameter("word"));

        if (col.equals("total")) {
            word = "";
        }

        int nowPage = 1;// 현재 보고있는 페이지
        if (request.getParameter("nowPage") != null) {
            nowPage = Integer.parseInt(request.getParameter("nowPage"));
        }
        int recordPerPage = 15;// 한페이지당 보여줄 레코드갯수

        int sno = (nowPage - 1) * recordPerPage;
        int eno = recordPerPage;

        Map map = new HashMap();
        map.put("col", col);
        map.put("word", word);
        map.put("sno", sno);
        map.put("eno", eno);

        int total = service.total(map);

        List<MemberDTO> list = service.list(map);
        String url = "list";

        String paging = Utility.paging(total, nowPage, recordPerPage, col, word, url);

        // request에 Model사용 결과 담는다
        request.setAttribute("list", list);
        request.setAttribute("nowPage", nowPage);
        request.setAttribute("col", col);
        request.setAttribute("word", word);
        request.setAttribute("paging", paging);

        return "/notice/list";
    }

    @GetMapping("/notice/read")
    public String read(HttpServletRequest request){
        String col = Utility.checkNull(request.getParameter("col"));
        String word = Utility.checkNull(request.getParameter("word"));
        int nowPage = 1;
        if(request.getParameter("nowPage") != null)
        {
            nowPage = Integer.parseInt(request.getParameter("nowPage"));
        }

        int noticeno = Integer.parseInt(request.getParameter("noticeno"));

        NoticeDTO noticeDTO = service.read(noticeno);
        service.upViewcnt(noticeno);

        request.setAttribute("dto", noticeDTO);
        request.setAttribute("nowPage", nowPage);
        request.setAttribute("col", col);
        request.setAttribute("word", word);


        return "/notice/read";
    }

    @PostMapping("/notice/create")
    public String create(NoticeDTO dto){
        int createNotice = service.create(dto);
        if(createNotice > 0){
            return "redirect:/notice/list";
        }
        return "error";
    }

    @PostMapping("/notice/update")
    public String update(NoticeDTO dto){
        int updateNotice = service.update(dto);
        if(updateNotice > 0){
            return "redirect:/notice/read?noticeno=" + dto.getNoticeno();
        }
        return "error";
    }

    @GetMapping("/notice/delete")
    public String delete(HttpServletRequest request){
        int noticeno = Integer.parseInt(request.getParameter("noticeno"));
        int deleteNotice = service.delete(noticeno);
        if(deleteNotice > 0){
            return "redirect:/notice/list";
        }
        return "error";
    }
}
