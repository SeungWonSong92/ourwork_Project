package com.kh.ourwork.notice.model.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.ourwork.common.Attachment;
import com.kh.ourwork.common.PageInfo;
import com.kh.ourwork.common.Search;
import com.kh.ourwork.notice.model.dao.NoticeDao;
import com.kh.ourwork.notice.model.vo.Notice;
import com.kh.ourwork.notice.model.vo.nReply;
import com.kh.ourwork.pteam.model.vo.Employee1;

@Service("nService")
public class NoticeServiceImpl implements NoticeService {
	@Autowired
	NoticeDao nDao;

	@Override
	public int selectListCount() {
		return nDao.selectListCount();
	}

	@Override
	public ArrayList<Notice> selectList(PageInfo pi) {
		return nDao.selectList(pi);
	}

	// 이거 쿠키 추가
	@Override
	public Notice selectNotice(int nNo, boolean flag) {
		// 조회수 증가 처리
		if (!flag) {
//			nDao.addReadCount(nNo);
		}
		// 게시글 조회
		return nDao.selectNotice(nNo);
	}

	// 게시글 수정
	public int updateNotice(Notice n) {
		return nDao.updateNotice(n);
	}

	// 게시글 삭제
	public int deleteNotice(int nNo) {
		return nDao.deleteNotice(nNo);
	}

	@Override
	public int insertNotice(Notice n) {
		return nDao.insertNotice(n);
	}

	@Override
	public int insertAttachment(Attachment at) {
		return nDao.insertAttachment(at);
	}

	@Override
	public Attachment selectAttachment(int nNo) {
		return nDao.selectAttachment(nNo);
	}

	@Override
	public ArrayList<Notice> searchList(Search search, PageInfo pi) {
		return nDao.searchList(search, pi);
	}

	@Override
	public int insertAttachment2(Attachment at) {
		return nDao.insertAttachment2(at);
	}

	@Override
	public int updateAttachment(Attachment at) {
		return nDao.updateAttachment(at);
	}

	@Override
	public int deleteAttachment(Attachment at) {
		return nDao.deleteAttachment(at);
	}

	@Override
	public int insertReply(nReply r) {
		return nDao.insertReply(r);
	}

	@Override
	public int SselectListCount(Search search) {
		return nDao.SselectListCount(search);
	}

	@Override
	public int deletenotices(int[] nNo) {
		return nDao.deleteNotices(nNo);
	}

	@Override
	public ArrayList<nReply> selectReplyList(int nNo) {
		return nDao.selectReplyList(nNo);
	}

	@Override
	public int deleteAttachment1(int[] nNo) {
		return nDao.deleteAttachment1(nNo);
	}

	@Override
	public int deletenReply(int[] nNo) {
		return nDao.deletenReply(nNo);
	}

	@Override
	public Employee1 selectEmp(String eId) {
		return nDao.selectEmp(eId);

	}

	@Override
	public int tselectListCount(int dId) {
		return nDao.tselectListCount(dId);
	}

	@Override
	public ArrayList<Notice> tselectList(int dId, PageInfo pi) {
		return nDao.tselectList(dId, pi);
	}

	@Override
	public int tselectListCount1(int dId) {
		return nDao.tselectListCount1(dId);
	}

	@Override
	public ArrayList<Notice> tselectList1(int dId, PageInfo pi) {
		return nDao.tselectList1(dId, pi);
	}

	@Override
	public int tselectListCount2(int dId) {
		return nDao.tselectListCount2(dId);
	}

	@Override
	public ArrayList<Notice> tselectList2(int dId, PageInfo pi) {
		return nDao.tselectList2(dId, pi);
	}

	@Override
	public int SselectListCount2(Search search) {
		return nDao.SselectListCount2(search);
	}

	@Override
	public ArrayList<Notice> searchList2(Search search, PageInfo pi) {
		return nDao.searchList2(search, pi);
	}

	@Override
	public int insertNotice2(Notice n) {
		return nDao.insertNotice2(n);
	}

	@Override
	public int updateNotice1(Notice n) {
		return nDao.updaten(n);
	}

	@Override
	public int Update(Notice n) {
		return nDao.Update(n);
	}

	@Override
	public int insertAttachment3(Attachment at) {
		return nDao.insertAttachment3(at);
	}

	@Override
	public ArrayList<Notice> homeselectList() {
		return nDao.homeselectList();
	}

	@Override
	public ArrayList<Notice> hometselectList(int dId) {
		return nDao.hometselectList(dId);
	}
}
