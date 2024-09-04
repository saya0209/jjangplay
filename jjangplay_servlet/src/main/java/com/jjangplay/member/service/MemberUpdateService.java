package com.jjangplay.member.service;

import com.jjangplay.main.dao.DAO;
import com.jjangplay.main.service.Service;
import com.jjangplay.member.dao.MemberDAO;
import com.jjangplay.member.vo.MemberVO;

public class MemberUpdateService implements Service {

	private MemberDAO dao;
	
	@Override
	public void setDAO(DAO dao) {
		// TODO Auto-generated method stub
		this.dao = (MemberDAO)dao;
	}
	@Override
	public Integer service(Object obj) throws Exception {
		// TODO Auto-generated method stub
		// MemberController -> Execute -> 여기 (MemberUpdateService)
		// 여기 -> MemberDAO().update(MemberVO)
		return dao.update((MemberVO)obj);
	}

}
