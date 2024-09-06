package com.jjangplay.boardreply.service;

import com.jjangplay.board.vo.BoardVO;
import com.jjangplay.boardreply.dao.BoardReplyDAO;
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
		// [BoardController] -> (Execute) -> BoardUpdateService -> [BoardDAO.update()]
		return dao.update((BoardVO)obj);
	}

}
