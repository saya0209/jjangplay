package com.jjangplay.boardreply.service;

import com.jjangplay.boardreply.dao.BoardReplyDAO;
import com.jjangplay.boardreply.vo.BoardReplyVO;
import com.jjangplay.main.dao.DAO;
import com.jjangplay.main.service.Service;

public class BoardReplyUpdateService implements Service {

private BoardReplyDAO dao;
	
	//dao setter
	public void setDAO(DAO dao){
		this.dao = (BoardReplyDAO) dao;
	}
	
	@Override
	public Integer service(Object obj) throws Exception {
		// [BoardReplyController] -> (Execute) -> BoardReplyUpdateService -> [BoardReplyDAO.update()]
		return dao.update((BoardReplyVO)obj);
	}

}
