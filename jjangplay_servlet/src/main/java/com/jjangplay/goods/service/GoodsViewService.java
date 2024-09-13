package com.jjangplay.goods.service;

import com.jjangplay.goods.dao.GoodsDAO;
import com.jjangplay.main.dao.DAO;
import com.jjangplay.main.service.Service;

public class GoodsViewService implements Service {

private GoodsDAO dao;
	
	//dao setter
	public void setDAO(DAO dao){
		this.dao = (GoodsDAO) dao;
	}
	
	@Override
	public Object service(Object obj) throws Exception {
		// ImageController -> execute() -> [ImageViewSevice] - ImageDAO.view()
		return dao.view((Long)obj);

	}

}
