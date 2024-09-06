package com.jjangplay.image.vo;

import lombok.Data;
// DB안의 Board table 의 한행의 데이터을 저장할 수 있는 클래스
@Data
public class ImageVO {
	
	
	// private 변수
	private Long no;
	private String title;
	private String content;
	private String id;
	private String name; // member table에서 id를 가지고 찾습니다.
	private String writer;
	private String writeDate;
	private String fileName; // 위치정보를 포함한 파일명(서버기준)
	
	
	
}
