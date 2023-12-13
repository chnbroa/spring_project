package com.spring_project.controller;

import com.spring_project.UploadCon;
import com.spring_project.model.contents.ContentsDTO;
import com.spring_project.model.contents.ContentsService;
import com.spring_project.model.member.MemberDTO;
import com.spring_project.model.review.ReviewDTO;
import com.spring_project.model.review.ReviewService;
import com.spring_project.utility.Utility;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

@Controller
public class ContentsController {
	@Autowired
	@Qualifier("com.spring_project.model.contents.ContentsServiceImpl")
	private ContentsService service;


	@Autowired
	@Qualifier("com.spring_project.model.review.ReviewServiceImpl")
	private ReviewService reviewService;


	@GetMapping("/admin/contents/create")
	public String create() {
		
		return "/contents/create";
	}
	
	@PostMapping("/contents/create")
	public String create(ContentsDTO dto) {

		//1.dto Multipartfile, storage경로에 순수파일로, rename을 해서 저장
		long size = dto.getFilenameMF().getSize();
		System.out.println(size);
		if(size >0 ) {
			String filename = Utility.saveFileSpring(dto.getFilenameMF(), UploadCon.getUploadDir());
			dto.setFilename(filename);
		}else {
			dto.setFilename("default.jpg");
		}
		
		int cnt = service.create(dto);
		if(cnt>0) return "redirect:/contents/list";

		return "error";
	}
	
	@RequestMapping("/contents/list")
	public String list(HttpServletRequest request) {
		
		String col = Utility.checkNull(request.getParameter("col"));
		String word = Utility.checkNull(request.getParameter("word"));
		
		if(col.equals("total")) word ="";
		
		int nowPage = 1;
		
		if(request.getParameter("nowPage")!=null) {
			nowPage = Integer.parseInt(request.getParameter("nowPage"));
		}
		
		int eno = 5;
		
		int sno = (nowPage -1) * eno;
		
		Map map = new HashMap();
		map.put("col", col);
		map.put("word", word);
		map.put("sno", sno);
		map.put("eno", eno);
		
		List<ContentsDTO> list = service.list(map);
		int total = service.total(map);
		
		String url = "/contents/list";
		
		String paging = Utility.paging(total, nowPage, eno, col, word, url);
		
		request.setAttribute("list", list);
		request.setAttribute("col", col);
		request.setAttribute("word", word);
		request.setAttribute("nowPage", nowPage);
		request.setAttribute("paging", paging);
		
		return "/contents/list";
		
	}
	
	@GetMapping("/contents/read")
	public String read(int contentsno, Model model) {
		model.addAttribute("dto", service.read(contentsno));
		return "/contents/read";
	}
	
	@GetMapping("/contents/update/{contentsno}")
	public String update(@PathVariable int contentsno, Model model) {
		model.addAttribute("dto", service.read(contentsno));
		
		return "/contents/update";
	}

	@PostMapping("/contents/update")
	public String update(ContentsDTO dto, HttpServletRequest request) {
		String oldfile = request.getParameter("oldfile");
		System.out.println("제발!!!" + oldfile);

		long size = dto.getFilenameMF().getSize();
		System.out.println(size);
		if(size >0 ) {
			//전에 있던 파일삭제
			if(oldfile !=null && !oldfile.equals("default.jpg")) {
				Utility.deleteFile(UploadCon.getUploadDir(), oldfile);
			}
			String filename = Utility.saveFileSpring(dto.getFilenameMF(), UploadCon.getUploadDir());
			dto.setFilename(filename);
			System.out.println("filename::" + filename);
		}
		else {
//			 여기에다 원래 있던파일 로 이름 변경해줘야함...
			dto.setFilename(oldfile);
		}

		System.out.println(dto.toString());
		int cnt = service.update(dto);
		if(cnt>0) return "redirect:/contents/list";
		return "error";

	}

	@GetMapping("/contents/delete/{contentsno}/{oldfile}")
	public String delete(@PathVariable int contentsno, @PathVariable String oldfile) {
		int cnt = service.delete(contentsno);

		if(oldfile !=null && !oldfile.equals("default.jpg")) {
			Utility.deleteFile(UploadCon.getUploadDir(), oldfile);
		}
		if(cnt>0) return "redirect:/contents/list";
		return "error";
	}

	  @GetMapping(value = "/contents/getCategory", produces = "application/json;charset=UTF-8")
	  @ResponseBody
	  public List<Map> getCategory(HttpServletRequest request) {
	          List<Map> list = service.getCategory();

	          return list;
	  }

	  @GetMapping("/contents/category")
	  public String category(HttpServletRequest request){
		  int cateno= Integer.parseInt(request.getParameter("cateno"));
		  int subcateno = Integer.parseInt(request.getParameter("subcateno"));

		  // 검색관련------------------------
		  String col = Utility.checkNull(request.getParameter("col"));
		  String word = Utility.checkNull(request.getParameter("word"));

		  if (col.equals("total")) {
			  word = "";
		  }

		  // 페이지관련-----------------------
		  int nowPage = 1;// 현재 보고있는 페이지
		  if (request.getParameter("nowPage") != null) {
			  nowPage = Integer.parseInt(request.getParameter("nowPage"));
		  }
		  int recordPerPage =4;// 한페이지당 보여줄 레코드갯수

		  //(Oracle) DB에서 가져올 순번-----------------
		  //int sno = ((nowPage - 1) * recordPerPage) + 1;
		  //int eno = nowPage * recordPerPage;

		  //(MySQL) DB에서 가져올 순번-----------------
		  int sno = (nowPage - 1) * recordPerPage;
		  int eno = recordPerPage;

		  Map map = new HashMap();
		  map.put("col", "cateno");
		  map.put("word", cateno);
		  map.put("subcateno" , subcateno);
		  int total = service.categoryTotal(map);

		  map = new HashMap();
		  map.put("col", col);
		  map.put("word", word);
		  map.put("sno", sno);
		  map.put("eno", eno);
		  map.put("cateno", cateno);
		  map.put("subcateno", subcateno);

		  List<ContentsDTO> list = service.categoryList(map);

		  String url = "/contents/category/?cateno=" + cateno+"&subcateno="+subcateno;

		  String paging = Utility.paging2(total, nowPage, recordPerPage, col, word, url);

		  // request에 Model사용 결과 담는다
		  request.setAttribute("list", list);
		  request.setAttribute("nowPage", nowPage);
		  request.setAttribute("col", col);
		  request.setAttribute("word", word);
		  request.setAttribute("paging", paging);
		  request.setAttribute("cateno", cateno);
		  request.setAttribute("subcateno", subcateno);

		  return "/contents/category";

	}
	  
	  @GetMapping("/contents/mainlist/{cateno}")
	  public String mainlist(@PathVariable("cateno") int cateno){

		HashMap map = new HashMap();
	    map.put("cateno", cateno);
	    return "/contents/mainlist";
	 
	  }
	  
	  @GetMapping("/contents/detail/{contentsno}")
	  public String detail(@PathVariable("contentsno") int contentsno, Model model) {
	     model.addAttribute("dto",service.read(contentsno));

		  List<ReviewDTO> reviewDTOList = reviewService.list(contentsno);
		 model.addAttribute("reviewList", reviewDTOList);
	      return "/contents/detail";
	  }




}//class end
