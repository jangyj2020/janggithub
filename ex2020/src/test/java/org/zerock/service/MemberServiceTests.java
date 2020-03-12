package org.zerock.service;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.zerock.domain.MemberVO;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({"file:src/main/webapp/WEB-INF/spring/root-context.xml",
					"file:src/main/webapp/WEB-INF/spring/security-context.xml"})
@Log4j
public class MemberServiceTests {
	
	@Setter(onMethod_= {@Autowired })
	private MemberService service;
	
	@Setter(onMethod_ = @Autowired)
	private PasswordEncoder pwencoder;
	
	@Test
	public void testRegister() {
		
	  MemberVO member = new MemberVO();
	  member.setUserid("jyj");
	  member.setUserpw(pwencoder.encode("pw00"));
	  member.setUserName("장윤진");
	  
	  service.register(member);
	  
	  log.info("새로 생성된 아이디 : " + member.getUserid());
	  
	}
	
}
