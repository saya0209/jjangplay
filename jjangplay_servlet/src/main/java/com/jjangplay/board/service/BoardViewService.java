package com.jjangplay.board.service;

import com.jjangplay.board.dao.BoardDAO;
import com.jjangplay.main.dao.DAO;
import com.jjangplay.main.service.Service;

public class BoardViewService implements Service {

private BoardDAO dao;
	
	//dao setter
	public void setDAO(DAO dao){
		this.dao = (BoardDAO) dao;
	}
	
	@Override
	public Object service(Object obj) throws Exception {
		// 넘어오는 데이터의 구조 obj - Long[] ; obj[0] = no, obj[1] = inc (1 or 0)
		Long[] objs = (Long[]) obj;
		Long no = objs[0];
		Long inc = objs[1];
		
		// 조회수를 1증가해야할때
		// BoardController -> execute() -> [BoardViewSevice] - BoardDAO.increase()
		if (inc == 1) dao.increase(no);
		// BoardController -> execute() -> [BoardViewSevice] - BoardDAO.view()
		return dao.view(no);

	}

}
