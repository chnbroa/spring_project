package com.spring_project.controller;

import com.spring_project.UploadMem;
import com.spring_project.model.member.MemberDTO;
import com.spring_project.model.member.MemberService;
import com.spring_project.model.review.ReviewDTO;
import com.spring_project.model.review.ReviewService;
import com.spring_project.utility.Utility;
import java.util.HashMap;
import java.util.Map;
import javax.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class ReviewController {

    @Autowired
    @Qualifier("com.spring_project.model.review.ReviewServiceImpl")
    private ReviewService service;

    @PostMapping("/review/totalcnt")
    @ResponseBody
    public Map<String,Integer> totalcnt(HttpServletRequest request){
        int contentsno = Integer.parseInt(request.getParameter("contentsno"));

        int cnt = service.totalCnt(contentsno);
        Map<String, Integer> map = new HashMap<>();
        if(cnt == 0) {
            map.put("cnt",0);
            return map;
        }

        map.put("cnt",cnt);
        return map;
    }

    @PostMapping("/review/create")
    public String create(ReviewDTO dto) {
        int CreateReview = service.create(dto);
        int UpdateAvg =  service.updateAvg(dto.getContentsno());
        if (CreateReview > 0 && UpdateAvg > 0 )  {
            return "redirect:/contents/detail/"+dto.getContentsno();
        }
        return "error";
    }// create() end

    @GetMapping("/review/delete")
    public String delete(HttpServletRequest request){
        int rnum = Integer.parseInt(request.getParameter("rnum"));
        int contentsno = Integer.parseInt(request.getParameter("contentsno"));

        int deleteReview= service.delete(rnum);

        int UpdateAvg =  service.updateAvg(contentsno);


        if(deleteReview > 0 && UpdateAvg > 0) {
            return "redirect:/contents/detail/" + contentsno;
        }
        return "error";
    }


    @PostMapping("/review/update")
    public String update(ReviewDTO dto) {
        int UpdateReview = service.update(dto);
        int UpdateAvg =  service.updateAvg(dto.getContentsno());

        if (UpdateReview > 0 && UpdateAvg > 0 )  {
            return "redirect:/contents/detail/"+dto.getContentsno();
        }
        return "error";
    }// update() end

}
