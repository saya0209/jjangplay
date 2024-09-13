package com.jjangplay.goods.service;


import com.jjangplay.image.dao.ImageDAO;
import com.jjangplay.image.vo.ImageVO;
import com.jjangplay.main.dao.DAO;
import com.jjangplay.main.service.Service;

public class GoodsDeleteService implements Service {

private ImageDAO dao;
	
	//dao setter
	public void setDAO(DAO dao){
		this.dao = (ImageDAO) dao;
	}
	
	@Override
	public Integer service(Object obj) throws Exception {
		// [ImageController] -> (Execute) -> ImageDeleteService -> [ImageDAO.delete()]
		return dao.delete((ImageVO)obj);
	}

}
