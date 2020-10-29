package com.kh.ourwork.notice.model.service;

import java.util.ArrayList;

import com.kh.ourwork.common.Attachment;
import com.kh.ourwork.common.PageInfo;
import com.kh.ourwork.common.Search;
import com.kh.ourwork.notice.model.vo.Notice;
import com.kh.ourwork.notice.model.vo.nReply;
import com.kh.ourwork.pteam.model.vo.Employee1;

public interface NoticeService {

	// 게시글 개수
	int selectListCount();
		
	// 게시글 조회(페이징)
	ArrayList<Notice> selectList(PageInfo pi);


	// 상세보기 이거 쿠키 추가
	Notice selectNotice(int nNo, boolean flag);

	// 게시판 업데이트
	int updateNotice(Notice n);

	// 게시글 삭제
	int deleteNotice(int nNo);

	// 게시글 추가
	int insertNotice(Notice n);

	int insertAttachment(Attachment at);

	Attachment selectAttachment(int nNo);

	ArrayList<Notice> searchList(Search search, PageInfo pi);

	// 수정시 기존 파일 없을때 insert
	int insertAttachment2(Attachment at);

	int updateAttachment(Attachment at);

	int deleteAttachment(Attachment at);

	//댓글 입력
	int insertReply(nReply r);

	int SselectListCount(Search search);

	int deletenotices(int[] nNo);

	ArrayList<nReply> selectReplyList(int nNo);

	int deleteAttachment1(int[] nNo);

	int deletenReply(int[] nNo);

	Employee1 selectEmp(String eId);

	int tselectListCount(int dId);

	ArrayList<Notice> tselectList(int dId, PageInfo pi);

	int tselectListCount1(int dId);

	ArrayList<Notice> tselectList1(int dId, PageInfo pi);

	int tselectListCount2(int dId);

	ArrayList<Notice> tselectList2(int dId, PageInfo pi);

	int SselectListCount2(Search search);

	ArrayList<Notice> searchList2(Search search, PageInfo pi);

	int insertNotice2(Notice n);

	int updateNotice1(Notice n);

	int Update(Notice n);

	int insertAttachment3(Attachment at);

	ArrayList<Notice> homeselectList();

	ArrayList<Notice> hometselectList(int dId);

	

	

}
