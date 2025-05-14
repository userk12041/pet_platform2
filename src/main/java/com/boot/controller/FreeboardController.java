package com.boot.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.boot.dto.CommentDTO;
import com.boot.dto.FreeboardDTO;
import com.boot.service.CommentService;
import com.boot.service.FreeboardService;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class FreeboardController {
	
	@Autowired
	private FreeboardService freeboardService;
	@Autowired
	private CommentService commentService;
	
	@GetMapping("/freeboard")
	public String list(Model model) {
		List<FreeboardDTO> freeboard =  freeboardService.getAllFreeboardDTO();
		model.addAttribute("freeboard", freeboard);
		log.info(freeboard.toString());
		return "freeboard/freeboard";
	}
	
	
	@GetMapping("/freeboard_write")
	public String showAnnounce_writeForm() {
	    return "freeboard/freeboard_write";
	}

	@PostMapping("/freeboard_write")
	public String writeAnnounce(FreeboardDTO freeboard, HttpSession session) {
	    String userId = (String) session.getAttribute("id");
	    log.info(userId);
	    if (userId == null) {
	        return "redirect:/login";
	    }

	    freeboardService.insertFreeboard(freeboard);

	    return "redirect:/freeboard";
	}
	
	@GetMapping("/freeboard_update")
	 public String showUpdateForm(@RequestParam int id, Model model) {
		FreeboardDTO freeboard = (FreeboardDTO) freeboardService.getFreeboardDTOById(id);
		 model.addAttribute("freeboard", freeboard);
		 return "freeboard/freeboard_update";
	 }
	  @PostMapping("/freeboard_update")
	    public String updateAnnounce(
	            @RequestParam("id") int id,
	            @RequestParam("title") String title,
	            @RequestParam("content") String content
	    ) {
		   FreeboardDTO freeboard = new FreeboardDTO();
		   freeboard.setId(id);
		   freeboard.setTitle(title);
		   freeboard.setContent(content);
	        
	        

		   freeboardService.updateFreeboard(freeboard);

	        return "redirect:/freeboard";
	    }
	
	@GetMapping("/freeboard_detail")
	  public String viewFreeboard(@RequestParam("id") int id, Model model) {
		FreeboardDTO freeboard = freeboardService.getFreeboardDTOById(id);
	      model.addAttribute("freeboard", freeboard);
	      List<CommentDTO> comment = commentService.getCommentsByBoardId(id);
	      model.addAttribute("CommentList", comment);
	      return "freeboard/freeboard_detail";
	  }
	
	@GetMapping("/freeboard_delete")
	 public String deleteFreeboard(@RequestParam int id) {
		 freeboardService.deleteFreeboard(id);
		 return "redirect:/freeboard";
	 }
	
}
