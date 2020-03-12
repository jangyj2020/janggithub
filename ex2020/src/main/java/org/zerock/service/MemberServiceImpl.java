package org.zerock.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.zerock.domain.MemberVO;
import org.zerock.mapper.MemberMapper;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
public class MemberServiceImpl implements MemberService {
	
	@Setter(onMethod_= @Autowired)
	private MemberMapper mapper;
	
	@Setter(onMethod_ = @Autowired )
	private PasswordEncoder pwencoder;

	@Override
	public void register(MemberVO member) {
	
	  String epw = pwencoder.encode(member.getUserpw());
	  
	  member.setUserpw(epw);
	  
	  mapper.insert(member);
	  
	  log.info("register...." + member);
	  
	  return;
	  
	}
	
	@Override
	public MemberVO get(String userName) {
		
		log.info("get......" + userName);
		
		return mapper.read(userName);
	}
	
	@Override
	public boolean modify(MemberVO member) {
		
		log.info("modify......." + member);
		
		String epw = pwencoder.encode(member.getUserpw());
		
		member.setUserpw(epw);
				
		boolean modifyResult = mapper.update(member) == 1;
		
		return modifyResult;
	}
	
}
