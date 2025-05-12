package com.boot.controller;

import java.sql.Timestamp;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.Mapping;
import org.springframework.web.bind.annotation.PathVariable;
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
	
	@GetMapping("/announce")
	public String list(Model model) {
		List<AnnounceDTO> announce =  announceService.getAllAnnounce();
		model.addAttribute("announce", announce);
		log.info(announce.toString());
		return "announce/announce";
	}
	
	@GetMapping("/announce_admin")
	public String list_admin(Model model) {
		List<AnnounceDTO> announce =  announceService.getAllAnnounce();
		model.addAttribute("announce", announce);
		log.info(announce.toString());
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
