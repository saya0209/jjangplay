package com.jjangplay.goods.service;


import com.jjangplay.goods.dao.GoodsDAO;
import com.jjangplay.goods.vo.GoodsVO;
import com.jjangplay.main.dao.DAO;
import com.jjangplay.main.service.Service;

public class GoodsImageChangeService implements Service {

private GoodsDAO dao;
	
	//dao setter
	public void setDAO(DAO dao){
		this.dao = (GoodsDAO) dao;
	}
	
	@Override
	public Integer service(Object obj) throws Exception {
		// [GoodsController] -> (Execute) -> GoodsWriteService -> [GoodsDAO.goodsImageChange()]
		// 생성하고 실행한다.
		// Object 로 선언된 obj 를 다운캐스팅해서 넘겨준다.
		return dao.imageChange((GoodsVO)obj);
	}

}
