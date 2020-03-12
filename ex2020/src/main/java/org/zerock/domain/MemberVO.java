package org.zerock.domain;

import java.util.Date;
import java.util.List;



import lombok.Data;

@Data
public class MemberVO {
  
  private String userid;
  private String userpw;
  private String userName;
  private boolean enabled;
  //private String user_Addr;
  private String user_Email;
  private String postcode;
  private String roadAddress;
  private String jibunAddress;
  private String detailAddress;
  private String extraAddress;
  
  private Date regDate;
  private Date updateDate;
  private List<AuthVO> authList;
  
}
