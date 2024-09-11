package com.jjangplay.notice.controller;


import javax.servlet.http.HttpServletRequest;

import com.jjangplay.main.controller.Init;
import com.jjangplay.notice.vo.NoticeVO;
import com.jjangplay.util.exe.Execute;
import com.jjangplay.util.page.PageObject;

public class NoticeController {

	@SuppressWarnings("null")
	public String execute(HttpServletRequest request) {
		// 공지사항 나가는 명령 줄때까지 무한반복
		
			// uri
			String uri = request.getRequestURI();
			// 이동할 주소
			String jsp = null;
			
			// 데이터 수집을 위한 변수
			Object result = null;
			
			// 입력 받는 데이터 (글번호를 위한)
			Long no = 0L;
			
			try {
				switch (uri) {
				case "/notice/list.do":
					// NoticeController -> execute -> NoticeListService
					// -> NoticeDAO.list()
					System.out.println("1. 공지사항 리스트");
					// 페이지 처리를 위한 객체, 넘어오는 페이지와 검색정보를 세팅
					PageObject pageObject = PageObject.getInstance(request);
					// DB에서 데이터 가져오기
					result = Execute.execute(Init.get(uri), pageObject);
					// 가져온 데이터 담기
					request.setAttribute("list", result);
					request.setAttribute("pageObject", pageObject);
					// "/WEB-INF/view/"+ notice/list".jsp"
					jsp = "notice/list";
					break;
				case "/notice/view.do":
					System.out.println("2. 공지사항 글보기");
					// NoticeController -> execute -> NoticeViewService
					// -> NoticeDAO.view()
					// 공지사항은 조회수가 없으므로 increase()메서드가 없다.
					no = Long.parseLong( request.getParameter("no"));
					// DB에서 데이터를 가져오기
					result = Execute.execute(Init.get(uri), no);
					request.setAttribute("vo", result);
					
					jsp="notice/view";

					break;
				case "/notice/writeForm.do":
					System.out.println("3. 일반게시판 글쓰기 폼");
					jsp="notice/writeForm";
					break;
				case "/notice/write.do":
					System.out.println("3. 공지사항 글쓰기");
					// 데이터 수집
					// 제목, 내용, 게시시작일, 게시종료일
					String title = request.getParameter("title");
					String content = request.getParameter("content");
					String startDate = request.getParameter("startDate");
					String endDate = request.getParameter("endDate");
					
					NoticeVO vo = new NoticeVO();
					vo.setTitle(title);
					vo.setContent(content);
					vo.setStartDate(startDate);
					vo.setEndDate(endDate);
					
					// NoticeController -> execute -> NoticeWriteService
					// -> NoticeDAO.write()
					Execute.execute(Init.get(uri), vo);
					// jsp 정보앞에 "redirect:" 가 붙어있으면 redirect로 처리한다 없으면 forword
					jsp = "redirect:list.do";
					
					break;
				case "/notice/updateForm.do":
					System.out.println("4. 공지사항 글수정 폼");
					// 수정 글번호
					no = Long.parseLong(request.getParameter("no"));
					// 수정할 데이터 가져오기
					result = Execute.execute(Init.get("/notice/view.do"), no);
					// 가져온 데이터 담기
					request.setAttribute("vo", result);
					// 가져온 데이터를 jsp로 보낸다
					jsp = "notice/updateForm";
					break;
				case "/notice/update.do":
					System.out.println("4. 공지사항 글수정 처리");
					// 수정 글번호
					no = Long.parseLong(request.getParameter("no"));
					// updateForm에서 수정한 데이터를 가져온다.
					title = request.getParameter("title");
					content = request.getParameter("content");
					startDate = request.getParameter("startDate");
					endDate = request.getParameter("endDate");
					
					vo = new NoticeVO();
					vo.setNo(no);
					vo.setTitle(title);
					vo.setContent(content);
					vo.setStartDate(startDate);
					vo.setEndDate(endDate);
					
					// DB에 수정내용 저장
					Execute.execute(Init.get(uri), vo);
					if((Integer)result != 0) {
						System.out.println("*****수정이 완료되었습니다.******");
					}
					jsp = "redirect:view.do?no="+no;
					
					break;
				case "/notice/delete.do":
					System.out.println("5. 공지사항 글삭제");
					// 삭제할 글번호 수집
					no = Long.parseLong(request.getParameter("no"));
					
					// DB처리
					result = Execute.execute(Init.get(uri), no);
					if ((Integer)result != 0) {
						System.out.println();
						System.out.println("***  글이 삭제 되었습니다. ***");
					}
					jsp = "redirect:list.do";
					break;
				
				default:
					request.setAttribute("uri", uri);
					jsp = "error/404";
				} // end of switch
			} catch (Exception e) {
				// TODO: handle exception
				e.printStackTrace();
				// 예외객체를 jsp에서 사용하기 위해 request에 담는다.
				request.setAttribute("e", e);
				jsp = "error/500";
			}
			
			return jsp;
	} // end of execute()
} // end of class
