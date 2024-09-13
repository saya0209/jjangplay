package com.jjangplay.goods.vo;

// DB안의 Board table 의 한행의 데이터을 저장할 수 있는 클래스
public class GoodsVO {
	
	
	// private 변수
	private Long gno;	// 상품번호
	private String name;	// 상품이름
	private String content; // 상품내용
	private String writeDate;	// 작성일
	private String productDate;	// 생산일
	private String modelNo; 	// 모델번호
	private String company;		// 제조사
	private String imageName;	// 이미지 경로?
	private Long delivery_cost; 	// 배달비
	
	// price table
	private Long pno;	// 가격넘버
	private Long std_price;	// 정가
	private Long discount;	// 할인가
	private Double rate;		// 할인률
	private String startDate; //할인시작일
	private String endDate;	//할인종료일
	public Long getGno() {
		return gno;
	}
	public void setGno(Long gno) {
		this.gno = gno;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getWriteDate() {
		return writeDate;
	}
	public void setWriteDate(String writeDate) {
		this.writeDate = writeDate;
	}
	public String getProductDate() {
		return productDate;
	}
	public void setProductDate(String productDate) {
		this.productDate = productDate;
	}
	public String getModelNo() {
		return modelNo;
	}
	public void setModelNo(String modelNo) {
		this.modelNo = modelNo;
	}
	public String getCompany() {
		return company;
	}
	public void setCompany(String company) {
		this.company = company;
	}
	public String getImageName() {
		return imageName;
	}
	public void setImageName(String imageName) {
		this.imageName = imageName;
	}
	public Long getDelivery_cost() {
		return delivery_cost;
	}
	public void setDelivery_cost(Long delivery_cost) {
		this.delivery_cost = delivery_cost;
	}
	public Long getPno() {
		return pno;
	}
	public void setPno(Long pno) {
		this.pno = pno;
	}
	public Long getStd_price() {
		return std_price;
	}
	public void setStd_price(Long std_price) {
		this.std_price = std_price;
	}
	public Long getDiscount() {
		return discount;
	}
	public void setDiscount(Long discount) {
		this.discount = discount;
	}
	public Double getRate() {
		return rate;
	}
	public void setRate(Double rate) {
		this.rate = rate;
	}
	public String getStartDate() {
		return startDate;
	}
	public void setStartDate(String startDate) {
		this.startDate = startDate;
	}
	public String getEndDate() {
		return endDate;
	}
	public void setEndDate(String endDate) {
		this.endDate = endDate;
	}
	@Override
	public String toString() {
		return "GoodsVO [gno=" + gno + ", name=" + name + ", content=" + content + ", writeDate=" + writeDate
				+ ", productDate=" + productDate + ", modelNo=" + modelNo + ", company=" + company + ", imageName="
				+ imageName + ", delivery_cost=" + delivery_cost + ", pno=" + pno + ", std_price=" + std_price
				+ ", discount=" + discount + ", rate=" + rate + ", startDate=" + startDate + ", endDate=" + endDate
				+ "]";
	}

}
