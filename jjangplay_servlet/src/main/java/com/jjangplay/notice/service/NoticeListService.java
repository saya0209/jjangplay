package com.jjangplay.notice.service;

import java.util.List;

import com.jjangplay.main.dao.DAO;
import com.jjangplay.main.service.Service;
import com.jjangplay.notice.dao.NoticeDAO;
import com.jjangplay.notice.vo.NoticeVO;
import com.jjangplay.util.page.PageObject;

public class NoticeListService implements Service {

	private NoticeDAO dao;
	
	@Override
	public void setDAO(DAO dao) {
		// TODO Auto-generated method stub
		this.dao = (NoticeDAO)dao;
	}
	
	@Override
	public List<NoticeVO> service(Object obj) throws Exception {
		// TODO Auto-generated method stub
		PageObject pageObject = (PageObject) obj;
		
		pageObject.setTotalRow(dao.getTotalRow(pageObject));
		
		return dao.list(pageObject);
	}

	
		


}
