package com.jjangplay.main.controller;

import java.util.HashMap;
import java.util.Map;

import com.jjangplay.board.dao.BoardDAO;
import com.jjangplay.board.service.BoardDeleteService;
import com.jjangplay.board.service.BoardListService;
import com.jjangplay.board.service.BoardUpdateService;
import com.jjangplay.board.service.BoardViewService;
import com.jjangplay.board.service.BoardWriteService;
import com.jjangplay.boardreply.dao.BoardReplyDAO;
import com.jjangplay.boardreply.service.BoardReplyDeleteService;
import com.jjangplay.boardreply.service.BoardReplyListService;
import com.jjangplay.boardreply.service.BoardReplyUpdateService;
import com.jjangplay.boardreply.service.BoardReplyViewService;
import com.jjangplay.boardreply.service.BoardReplyWriteService;
import com.jjangplay.main.dao.DAO;
import com.jjangplay.main.service.Service;
import com.jjangplay.member.dao.MemberDAO;
import com.jjangplay.member.service.MemberConUpdateService;
import com.jjangplay.member.service.MemberDeleteService;
import com.jjangplay.member.service.MemberListService;
import com.jjangplay.member.service.MemberLoginService;
import com.jjangplay.member.service.MemberUpdateAdminService;
import com.jjangplay.member.service.MemberUpdateService;
import com.jjangplay.member.service.MemberViewService;
import com.jjangplay.member.service.MemberWriteService;
import com.jjangplay.notice.dao.NoticeDAO;
import com.jjangplay.notice.service.NoticeDeleteService;
import com.jjangplay.notice.service.NoticeListService;
import com.jjangplay.notice.service.NoticeUpdateService;
import com.jjangplay.notice.service.NoticeViewService;
import com.jjangplay.notice.service.NoticeWriteService;

public class Init {
	
	// Service 를 생성해서 저장하는 객체 <URI, Service>
	private static Map<String, Service> serviceMap = new HashMap<>();
	// dao를 생성해서 저장하는 객체 - <className, dao>
	private static Map<String, DAO> daoMap = new HashMap<>();
	
	// static 메서드에서 초기화 해준다. (1번만 실행됨)
	static {
		// dao 생성
		daoMap.put("boardDAO", new BoardDAO());		// 일반게시판
		daoMap.put("noticeDAO", new NoticeDAO());	// 공지사항
		daoMap.put("memberDAO", new MemberDAO());	// 회원관리
		daoMap.put("boardReplyDAO", new BoardReplyDAO());	// 일반게시판 댓글

		// 1. 일반게시판 service 생성
		serviceMap.put("/board/list.do", new BoardListService());
		serviceMap.put("/board/view.do", new BoardViewService());
		serviceMap.put("/board/write.do", new BoardWriteService());
		serviceMap.put("/board/update.do", new BoardUpdateService());
		serviceMap.put("/board/delete.do", new BoardDeleteService());

		// 조립 dao -> service
		serviceMap.get("/board/list.do").setDAO(daoMap.get("boardDAO"));
		serviceMap.get("/board/view.do").setDAO(daoMap.get("boardDAO"));
		serviceMap.get("/board/write.do").setDAO(daoMap.get("boardDAO"));
		serviceMap.get("/board/update.do").setDAO(daoMap.get("boardDAO"));
		serviceMap.get("/board/delete.do").setDAO(daoMap.get("boardDAO"));

		// 2. 공지사항 service 생성
		serviceMap.put("/notice/list.do", new NoticeListService());
		serviceMap.put("/notice/view.do", new NoticeViewService());
		serviceMap.put("/notice/write.do", new NoticeWriteService());
		serviceMap.put("/notice/update.do", new NoticeUpdateService());
		serviceMap.put("/notice/delete.do", new NoticeDeleteService());

		// 조립 dao -> service
		serviceMap.get("/notice/list.do").setDAO(daoMap.get("noticeDAO"));
		serviceMap.get("/notice/view.do").setDAO(daoMap.get("noticeDAO"));
		serviceMap.get("/notice/write.do").setDAO(daoMap.get("noticeDAO"));
		serviceMap.get("/notice/update.do").setDAO(daoMap.get("noticeDAO"));
		serviceMap.get("/notice/delete.do").setDAO(daoMap.get("noticeDAO"));
		
		// 1-1. 일반게시판 댓글
		serviceMap.put("/boardreply/list.do", new BoardReplyListService());
		serviceMap.put("/boardreply/view.do", new BoardReplyViewService());
		serviceMap.put("/boardreply/write.do", new BoardReplyWriteService());
		serviceMap.put("/boardreply/update.do", new BoardReplyUpdateService());
		serviceMap.put("/boardreply/delete.do", new BoardReplyDeleteService());
		// 조립 dao -> service
		serviceMap.get("/boardreply/list.do").setDAO(daoMap.get("boardReplyDAO"));
		serviceMap.get("/boardreply/view.do").setDAO(daoMap.get("boardReplyDAO"));
		serviceMap.get("/boardreply/write.do").setDAO(daoMap.get("boardReplyDAO"));
		serviceMap.get("/boardreply/update.do").setDAO(daoMap.get("boardReplyDAO"));
		serviceMap.get("/boardreply/delete.do").setDAO(daoMap.get("boardReplyDAO"));

		// 2. 회원관리 service 생성
		serviceMap.put("/member/login.do", new MemberLoginService());
		serviceMap.put("/member/list.do", new MemberListService());
		serviceMap.put("/member/view.do", new MemberViewService());
		serviceMap.put("/member/write.do", new MemberWriteService());
		serviceMap.put("/member/update.do", new MemberUpdateService());
		serviceMap.put("/member/delete.do", new MemberDeleteService());
		serviceMap.put("/member/conUpdate.do", new MemberConUpdateService());
		serviceMap.put("/member/updateAdmin.do", new MemberUpdateAdminService());
		
		// 조립 dao -> service
		serviceMap.get("/member/login.do").setDAO(daoMap.get("memberDAO"));
		serviceMap.get("/member/list.do").setDAO(daoMap.get("memberDAO"));
		serviceMap.get("/member/view.do").setDAO(daoMap.get("memberDAO"));
		serviceMap.get("/member/write.do").setDAO(daoMap.get("memberDAO"));
		serviceMap.get("/member/update.do").setDAO(daoMap.get("memberDAO"));
		serviceMap.get("/member/delete.do").setDAO(daoMap.get("memberDAO"));
		serviceMap.get("/member/conUpdate.do").setDAO(daoMap.get("memberDAO"));
		serviceMap.get("/member/updateAdmin.do").setDAO(daoMap.get("memberDAO"));
	}
	
	public static Service get(String uri) {
		// uri key값으로 주소값을 리턴한다.
		return serviceMap.get(uri);
	}
}
