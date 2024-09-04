package com.jjangplay.board.service;

import com.jjangplay.board.dao.BoardDAO;
import com.jjangplay.board.vo.BoardVO;
import com.jjangplay.main.dao.DAO;
import com.jjangplay.main.service.Service;

public class BoardWriteService implements Service {

private BoardDAO dao;
	
	//dao setter
	public void setDAO(DAO dao){
		this.dao = (BoardDAO) dao;
	}
	
	@Override
	public Integer service(Object obj) throws Exception {
		// [BoardController] -> (Execute) -> BoardWriteService -> [BoardDAO.write()]
		// 생성하고 실행한다.
		// Object 로 선언된 obj 를 다운캐스팅해서 넘겨준다.
		return dao.write((BoardVO)obj);
	}

}
