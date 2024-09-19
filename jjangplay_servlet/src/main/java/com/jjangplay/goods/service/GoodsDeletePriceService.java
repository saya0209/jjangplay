package com.jjangplay.goods.service;


import com.jjangplay.goods.dao.GoodsDAO;
import com.jjangplay.goods.vo.GoodsVO;
import com.jjangplay.main.dao.DAO;
import com.jjangplay.main.service.Service;

public class GoodsDeletePriceService implements Service {

private GoodsDAO dao;
	
	//dao setter
	public void setDAO(DAO dao){
		this.dao = (GoodsDAO) dao;
	}
	
	@Override
	public Object service(Object obj) throws Exception {
		// [GoodsController] -> (Execute) -> GoodsDeleteService -> [GoodsDAO.delete()]
		return dao.deletePrice((Long)obj);
	}

}
