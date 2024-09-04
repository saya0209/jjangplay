package com.jjangplay.notice.service;

import com.jjangplay.main.dao.DAO;
import com.jjangplay.main.service.Service;
import com.jjangplay.notice.dao.NoticeDAO;
import com.jjangplay.notice.vo.NoticeVO;

public class NoticeUpdateService implements Service {

private NoticeDAO dao;
	
	@Override
	public void setDAO(DAO dao) {
		// TODO Auto-generated method stub
		this.dao = (NoticeDAO)dao;
	}
	@Override
	public Integer service(Object obj) throws Exception {
		// NoticeDAO().update()
		return dao.update((NoticeVO)obj);
	}

}
