package com.boot.controller;

import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.boot.dto.AnnounceDTO;
import com.boot.service.AnnounceService;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class AnnounceController {
	@Autowired
	private AnnounceService announceService;
	
//	@GetMapping("/announce")
//	public String list(Model model) {
//		List<AnnounceDTO> announce =  announceService.getAllAnnounce();
//		model.addAttribute("announce", announce);
//		log.info(announce.toString());
//		return "announce/announce";
//	}
	
	@GetMapping("/announce")
	public String list(
		    @RequestParam(value = "page", defaultValue = "1") int page,
		    @RequestParam(value = "sortField", defaultValue = "id") String sortField,
		    @RequestParam(value = "order", defaultValue = "asc") String order,
		    @RequestParam(value = "searchField", required = false) String searchField,
		    @RequestParam(value = "keyword", required = false) String keyword,
		    Model model
		) {
		    int pageSize = 10;

		    // 검색과 정렬에 따른 데이터 조회
		    int totalCount = (keyword != null && !keyword.isEmpty())
		        ? announceService.getSearchCount(searchField, keyword)
		        : announceService.getTotalCount();

		    List<AnnounceDTO> announceList = (keyword != null && !keyword.isEmpty())
		        ? announceService.getPagedSearchResults(searchField, keyword, sortField, order, page, pageSize)
		        : announceService.getPagedUsersSorted(sortField, order, page, pageSize);

		    int totalPage = (int) Math.ceil((double) totalCount / pageSize);
		    int pageBlock = 10;
		    int startPage = ((page - 1) / pageBlock) * pageBlock + 1;
		    int endPage = Math.min(startPage + pageBlock - 1, totalPage);

		    model.addAttribute("announce", announceList);
		    model.addAttribute("currentPage", page);
		    model.addAttribute("startPage", startPage);
		    model.addAttribute("endPage", endPage);
		    model.addAttribute("hasPrev", startPage > 1);
		    model.addAttribute("hasNext", endPage < totalPage);
		    model.addAttribute("sortField", sortField);
		    model.addAttribute("order", order);
		    model.addAttribute("searchField", searchField);
		    model.addAttribute("keyword", keyword);

		    
		    // 검색 필드/정렬 필드 목록 전달
		    Map<String, String> searchFields = new LinkedHashMap<>();
		    searchFields.put("title", "제목");

		    Map<String, String> sortFields = new LinkedHashMap<>();
		    sortFields.put("id", "번호");

		    model.addAttribute("searchFields", searchFields);
		    model.addAttribute("sortFields", sortFields);
		    
		    log.info("@#searchFields=>"+searchFields);
		    log.info("@#sortFields=>"+sortFields);
		    
			return "announce/announce";
		}
//	@GetMapping("/announce_admin")
//	public String list_admin(Model model) {
//		List<AnnounceDTO> announce =  announceService.getAllAnnounce();
//		model.addAttribute("announce", announce);
//		log.info(announce.toString());
//		return "announce/announce_admin";
//	}
	
	@GetMapping("announce_admin")
	public String list_admin(
	    @RequestParam(value = "page", defaultValue = "1") int page,
	    @RequestParam(value = "sortField", defaultValue = "id") String sortField,
	    @RequestParam(value = "order", defaultValue = "asc") String order,
	    @RequestParam(value = "searchField", required = false) String searchField,
	    @RequestParam(value = "keyword", required = false) String keyword,
	    Model model
	) {
	    int pageSize = 10;

	    // 검색과 정렬에 따른 데이터 조회
	    int totalCount = (keyword != null && !keyword.isEmpty())
	        ? announceService.getSearchCount(searchField, keyword)
	        : announceService.getTotalCount();

	    List<AnnounceDTO> announceList = (keyword != null && !keyword.isEmpty())
	        ? announceService.getPagedSearchResults(searchField, keyword, sortField, order, page, pageSize)
	        : announceService.getPagedUsersSorted(sortField, order, page, pageSize);

	    int totalPage = (int) Math.ceil((double) totalCount / pageSize);
	    int pageBlock = 10;
	    int startPage = ((page - 1) / pageBlock) * pageBlock + 1;
	    int endPage = Math.min(startPage + pageBlock - 1, totalPage);

	    model.addAttribute("announce", announceList);
	    model.addAttribute("currentPage", page);
	    model.addAttribute("startPage", startPage);
	    model.addAttribute("endPage", endPage);
	    model.addAttribute("hasPrev", startPage > 1);
	    model.addAttribute("hasNext", endPage < totalPage);
	    model.addAttribute("sortField", sortField);
	    model.addAttribute("order", order);
	    model.addAttribute("searchField", searchField);
	    model.addAttribute("keyword", keyword);

	    
	    // 검색 필드/정렬 필드 목록 전달
	    Map<String, String> searchFields = new LinkedHashMap<>();
	    searchFields.put("title", "제목");

	    Map<String, String> sortFields = new LinkedHashMap<>();
	    sortFields.put("id", "번호");

	    model.addAttribute("searchFields", searchFields);
	    model.addAttribute("sortFields", sortFields);
	    
	    log.info("@#searchFields=>"+searchFields);
	    log.info("@#sortFields=>"+sortFields);
		
		return "announce/announce_admin";
	}
	
	
	@GetMapping("/announce_write")
	public String showAnnounce_writeForm() {
	    return "announce/announce_write";
	}

	@PostMapping("/announce_write")
	public String writeAnnounce(AnnounceDTO announce, HttpSession session) {
	    String userId = (String) session.getAttribute("id");
	    log.info(userId);
	    if (userId == null) {
	        return "redirect:/login";
	    }

	    announceService.insertAnnounce(announce);

	    return "redirect:/announce_admin";
	}
	 
	 
	  @GetMapping("/announce_detail")
	  public String viewAnnounce(@RequestParam("id") int id, Model model) {
	      AnnounceDTO announce = announceService.getAnnounceById(id);
	      model.addAttribute("announce", announce);
	      return "announce/announce_detail";
	  }
	  
	  @GetMapping("/announce_detail_admin")
	  public String viewAnnounce_admin(@RequestParam("id") int id, Model model) {
	      AnnounceDTO announce = announceService.getAnnounceById(id);
	      model.addAttribute("announce", announce);
	      return "announce/announce_detail_admin";
	  }
	  
	 @GetMapping("/announce_update")
	 public String showUpdateForm(@RequestParam int id, Model model) {
		 AnnounceDTO announce = (AnnounceDTO) announceService.getAnnounceById(id);
		 model.addAttribute("announce", announce);
		 return "announce/announce_update";
	 }
	  @PostMapping("/announce_update")
	    public String updateAnnounce(
	            @RequestParam("id") int id,
	            @RequestParam("title") String title,
	            @RequestParam("content") String content
	    ) {
	        AnnounceDTO announce = new AnnounceDTO();
	        announce.setId(id);
	        announce.setTitle(title);
	        announce.setContent(content);
	        
	        

	        announceService.updateAnnounce(announce);

	        return "redirect:/announce_admin";
	    }
	 
	

	  @GetMapping("/announce_delete")
		 public String showDeleteForm(@RequestParam int id) {
			 announceService.deleteAnnounce(id);
			 return "redirect:/announce_admin";
		 }
	  @GetMapping("/faq")
	  public String faq() {
		  return "/announce/faq";
	  }
	  


}
