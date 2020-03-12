package org.zerock.mapper;

import org.zerock.domain.MemberVO;

public interface MemberMapper {

  public MemberVO read(String userName);
  
  public void insert(MemberVO member);
  
  public int update(MemberVO member);
  
}
