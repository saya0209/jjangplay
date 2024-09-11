package com.jjangplay.image.service;

import com.jjangplay.image.dao.ImageDAO;
import com.jjangplay.main.dao.DAO;
import com.jjangplay.main.service.Service;

public class ImageViewService implements Service {

private ImageDAO dao;
	
	//dao setter
	public void setDAO(DAO dao){
		this.dao = (ImageDAO) dao;
	}
	
	@Override
	public Object service(Object obj) throws Exception {
		// ImageController -> execute() -> [ImageViewSevice] - ImageDAO.view()
		return dao.view((Long)obj);

	}

}
