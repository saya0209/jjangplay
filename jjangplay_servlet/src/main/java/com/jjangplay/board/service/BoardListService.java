package com.jjangplay.board.service;

import java.util.List;

import com.jjangplay.board.dao.BoardDAO;
import com.jjangplay.board.vo.BoardVO;
import com.jjangplay.main.dao.DAO;
import com.jjangplay.main.service.Service;
import com.jjangplay.util.page.PageObject;

public class BoardListService implements Service {

	
	private BoardDAO dao;
	
	//dao setter
	public void setDAO(DAO dao){
		this.dao = (BoardDAO) dao;
	}
	
	@Override
	public List<BoardVO> service(Object obj) throws Exception {
		// DB Board Table 을 가지고 리스트 쿼리 처리해서 데이터 가져오기(Return)
		// DB 처리는 DAO 에서 처리 - BoardDAO.list()
		// BoardController -> execute() -> [BoardListSevice] - BoardDAO.list()
		System.out.println("--- BoardListService 실행 ---");
		PageObject pageObject = (PageObject)obj;
		
		// 전체페이지 개수 정보를 가져온다.
		pageObject.setTotalRow(dao.getTotalRow(pageObject));
		
		return dao.list(pageObject);
	}

}
