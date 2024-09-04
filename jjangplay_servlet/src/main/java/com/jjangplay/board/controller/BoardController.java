package com.jjangplay.board.controller;

import javax.servlet.http.HttpServletRequest;

import com.jjangplay.board.vo.BoardVO;
import com.jjangplay.main.controller.Init;
import com.jjangplay.util.exe.Execute;
import com.jjangplay.util.page.PageObject;

// Board(일반게시판) 의 메뉴를 선택하고, 데이터 수집(기능별), 예외처리
public class BoardController {

	public String execute(HttpServletRequest request) {
		System.out.println("BoardController.execute()------------------");

			// 메뉴입력(uri)
			String uri = request.getRequestURI();
			
			// 데이터 수집을 위한 객체선언
			// 초기값 null 을 주어서 데이터를 받았는지 체크하고 처리한다.
			Object result = null;
			
			Long no = 0L;
			
			// 이동할 jsp 주소를 담아둘 주소
			String jsp = null; // 기본 초기화
			
			try {
			
				switch (uri) {
				case "/board/list.do":
					System.out.println("1. 일반게시판 리스트");
					//[BoardController] -> (Execute) -> BoardListService -> BoardDAO.list()
					System.out.println("----주소창에 localhost/board/list.do 실행 (Start)----");
					
					// 페이지 처리를 위한 객체, 넘어오는 페이지와 검색정보를 세팅
					PageObject pageObject = PageObject.getInstance(request);
					
					result = Execute.execute(Init.get(uri), pageObject);
					// 가져온 데이터를 request에 담는다
					request.setAttribute("list", result);
					
					request.setAttribute("pageObject", pageObject);
					
					System.out.println("----주소창에 localhost/board/list.do 실행 (End)----");
					// "/WEB-INF/view/"+ board/list".jsp"
					jsp = "board/list";
					break;
				case "/board/view.do":
					System.out.println("2. 일반게시판 글보기");
					// 조회수증가, 상세글보기
					//[BoardController] -> (Execute) ->
					// BoardViewService -> BoardDAO.increase()
					// BoardViewService -> BoardDAO.view()
					no = Long.parseLong( request.getParameter("no"));
					Long inc = Long.parseLong( request.getParameter("inc"));
					
					// 전달데이터는 글번호, 증가를 위한 값 1 (1:증가, 0:증가안함)
					result = Execute.execute(Init.get(uri),
							new Long[]{no, inc});
					// DB에서 가져온 데이터를 답는다.
					request.setAttribute("vo", result);
					// DispatcherServlet에서 "/WEB-INF/views/board/view.jsp" 경로를 만들어서 forword한다.
					jsp="board/view";
					
					break;
				case "/board/writeForm.do":
					System.out.println("3. 일반게시판 글쓰기 폼");
					jsp="board/writeForm";
					break;
				case "/board/write.do":
					System.out.println("3. 일반게시판 글쓰기 처리");
					
					// 데이터 수집(키보드) : 제목, 내용, 작성자, 비밀번호
					String title = request.getParameter("title");
					String content = request.getParameter("content");
					String writer = request.getParameter("writer");
					String pw = request.getParameter("pw");
					
					// 입력받은 데이터를 BoardVO 안에 저장(세팅) => DB에 넘겨주기위한
					BoardVO vo = new BoardVO();
					vo.setTitle(title);
					vo.setContent(content);
					vo.setWriter(writer);
					vo.setPw(pw);
					
					//[BoardController] -> (Execute) ->
					// BoardWriteService -> BoardDAO.write()
					Execute.execute(Init.get(uri), vo);
					// jsp 정보앞에 "redirect:" 가 붙어있으면 redirect로 처리한다 없으면 forword
					jsp = "redirect:list.do";
					break;
				case "/board/updateForm.do":
					System.out.println("4. 일반게시판 글수정 폼");					
					no = Long.parseLong(request.getParameter("no"));
					inc = 0L;
					// BoardViewService()를 실행하기 위한 uri를 직접코딩 
					result = Execute.execute(Init.get("/board/view.do"), new Long[]{no, inc});
					// 가져온 데이터를 updateForm.jsp 으로 보내기 위해 담는다. 
					request.setAttribute("vo", result);
					// 이동한다.
					jsp = "board/updateForm";
					break;
				case "/board/update.do":
					System.out.println("4. 일반게시판 글수정 처리");
					
					// updateForm에 적은 데이터를 가져온다.
					no = Long.parseLong(request.getParameter("no"));
					title = request.getParameter("title");
					content = request.getParameter("content");
					writer = request.getParameter("writer");
					pw = request.getParameter("pw");
					
					vo = new BoardVO();
					vo.setNo(no);
					vo.setTitle(title);
					vo.setContent(content);
					vo.setWriter(writer);
					vo.setPw(pw);
					
					Execute.execute(Init.get(uri), vo);
					
					jsp = "redirect:view.do?no="+no+"&inc=0";
					
					break;
				case "/board/delete.do":
					System.out.println("5. 일반게시판 글삭제");
					// 데이터 수집 : 삭제할 글번호, 확인용 비밀번호
					vo = new BoardVO();
					
					vo.setNo(Long.parseLong(request.getParameter("no")));
					vo.setPw(request.getParameter("pw"));
					
					// DB처리
					result =Execute.execute(Init.get(uri), vo);
					
					// 결과표시
					if ((Integer) result == 1) {
						System.out.println();
						System.out.println("***********************");
						System.out.println("** " + vo.getNo() + "번 글이 삭제되었습니다.");
						System.out.println("***********************");
					}
					else {
						System.out.println();
						System.out.println("########################");
						System.out.println("## " + vo.getNo() + "번 글이 삭제되지 않았습니다.");
						System.out.println("########################");
					}
					jsp = "redirect:list.do";
					break;
				
				default:
					System.out.println("잘못된 메뉴를 선택하셨습니다.");
					System.out.println("[0~5] 번호를 선택해야 합니다.");
				} // end of switch
			} catch (Exception e) {
				// TODO: handle exception
				e.printStackTrace();
				System.out.println("$%@$%@$%@$%@$%@$%@$%@$%@$%@$%@");
				System.out.println("$%@    <오류 출력> ");
				System.out.println("$%@$%@$%@$%@$%@$%@$%@$%@$%@$%@");
				// getSimpleName() : 클래스 이름만 보여주는 메서드(패키지는 안보여준다)
				System.out.println("$%@ 타입 : " + e.getClass().getSimpleName());
				// getMessage() : 예외의 내용을 보여주는 메서드
				System.out.println("$%@ 내용 : " + e.getMessage() );
				System.out.println("$%@ 조치 : 데이터 확인해 보세요");
				System.out.println("$%@       계속 오류가 나면 전산담당자에게 문의하세요.");
				System.out.println("$%@$%@$%@$%@$%@$%@$%@$%@$%@$%@");
			}
			
			
			return jsp;
		
	} // end of execute
} // end of class
