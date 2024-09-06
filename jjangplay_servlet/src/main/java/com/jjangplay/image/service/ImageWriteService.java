package com.jjangplay.image.service;


import com.jjangplay.image.dao.ImageDAO;
import com.jjangplay.image.vo.ImageVO;
import com.jjangplay.main.dao.DAO;
import com.jjangplay.main.service.Service;

public class ImageWriteService implements Service {

private ImageDAO dao;
	
	//dao setter
	public void setDAO(DAO dao){
		this.dao = (ImageDAO) dao;
	}
	
	@Override
	public Integer service(Object obj) throws Exception {
		// [BoardController] -> (Execute) -> BoardWriteService -> [BoardDAO.write()]
		// 생성하고 실행한다.
		// Object 로 선언된 obj 를 다운캐스팅해서 넘겨준다.
		return dao.write((ImageVO)obj);
	}

}
