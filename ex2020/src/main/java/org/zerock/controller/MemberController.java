package org.zerock.controller;

import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.zerock.domain.MemberVO;
import org.zerock.mapper.MemberMapper;
import org.zerock.service.MemberService;

import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/member/*")
@AllArgsConstructor
public class MemberController {
	private MemberService service;
	
	@Setter(onMethod_ = @Autowired)
	private DataSource ds;
	
	@Setter(onMethod_ = @Autowired)
	private MemberMapper memberMapper;
	
	@PostMapping("/register")
	public String register(MemberVO member, RedirectAttributes rttr) {
	  
	  
	  String sql = "insert into tbl_member_auth (userid, auth) values (?, ?)";
	  
	  log.info("register : " + member);
		
	  service.register(member);
	  
	  rttr.addFlashAttribute("result", member.getUserid());
	  
	  
	  Connection con = null;
	  PreparedStatement pstmt = null;
	  
	  try {
		  
	  con = ds.getConnection();
	  pstmt = con.prepareStatement(sql);
	  
	  pstmt.setString(1, member.getUserid());
	  pstmt.setString(2, "ROLE_USER");
	  
	 
	  pstmt.executeUpdate();
	  
	  }catch(Exception e) {
		  e.printStackTrace();
	  }finally {
		  if(pstmt != null) { try { pstmt.close(); } catch(Exception e) {} }
		  if(con != null) { try { con.close(); } catch(Exception e) {} }
		  
	  }
	  
	  
	  return "redirect:/customLogin";
	  
	  
	}
	
	@GetMapping("/register")
	public void register() {
		
	}
	
	@GetMapping({"/get","/modify"})
	public void get(@RequestParam(value="username", required=false) String userName, Model model) {
		
		log.info("/get or modify");
		model.addAttribute("member", service.get(userName));
	}
	
	/*@PreAuthorize("principal.username == #member.userid")*/
	@PostMapping("/modify")
	public String modify(MemberVO member, RedirectAttributes rttr) {
		log.info("modify:" + member);
		
		if(service.modify(member)) {
			rttr.addFlashAttribute("result", "success");
		}
		
		
		return "redirect:/";
	}
}
