package com.jjangplay.boardreply.service;

import com.jjangplay.board.vo.BoardVO;
import com.jjangplay.boardreply.dao.BoardReplyDAO;
import com.jjangplay.boardreply.vo.BoardReplyVO;
import com.jjangplay.main.dao.DAO;
import com.jjangplay.main.service.Service;

public class BoardReplyWriteService implements Service {

private BoardReplyDAO dao;
	
	//dao setter
	public void setDAO(DAO dao){
		this.dao = (BoardReplyDAO) dao;
	}
	
	@Override
	public Integer service(Object obj) throws Exception {
		// [BoardReplyController] -> (Execute) -> BoardReplyWriteService -> [BoardReplyDAO.write()]
		// 생성하고 실행한다.
		// Object 로 선언된 obj 를 다운캐스팅해서 넘겨준다.
		return dao.write((BoardReplyVO)obj);
	}

}
