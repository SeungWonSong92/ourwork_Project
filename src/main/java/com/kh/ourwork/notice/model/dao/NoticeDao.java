package com.kh.ourwork.notice.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.ourwork.common.Attachment;
import com.kh.ourwork.common.PageInfo;
import com.kh.ourwork.common.Search;
import com.kh.ourwork.notice.model.vo.Notice;
import com.kh.ourwork.notice.model.vo.nReply;
import com.kh.ourwork.pteam.model.vo.Employee1;

@Repository("nDao")
public class NoticeDao {
	@Autowired
	SqlSessionTemplate sqlSession;

	public int selectListCount() {
		return sqlSession.selectOne("noticeMapper.selectListCount");
	}

	public ArrayList<Notice> selectList(PageInfo pi) {
		// 몇개의 게시글을 건너 뛸 것인지
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		return (ArrayList) sqlSession.selectList("noticeMapper.selectList", null, rowBounds);
	}

	public void addReadCount(int eId) {
		sqlSession.update("noticeMapper.updateCount", eId);
	}

	public Notice selectNotice(int nNo) {
		return sqlSession.selectOne("noticeMapper.selectOne", nNo);
	}

	public int updateNotice(Notice n) {
		return sqlSession.update("noticeMapper.updateNotice", n);
	}

	public int deleteNotice(int nNo) {
		return sqlSession.update("noticeMapper.deleteNotice", nNo);
	}

	public int insertNotice(Notice n) {
		return sqlSession.insert("noticeMapper.insertNotice", n);
	}

	public int insertAttachment(Attachment at) {
		return sqlSession.insert("noticeMapper.insertAttachment", at);
	}

	public Attachment selectAttachment(int nNo) {
		return sqlSession.selectOne("noticeMapper.selectAttachment", nNo);
	}

	public ArrayList<Notice> searchList(Search search, PageInfo pi) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		return (ArrayList) sqlSession.selectList("noticeMapper.searchList", search, rowBounds);
	}

	public int insertAttachment2(Attachment at) {
		return sqlSession.insert("noticeMapper.insertAttachment2", at);
	}

	public int deleteAttachment(Attachment at) {
		return sqlSession.update("noticeMapper.deleteAttachment", at);
	}

	public int updateAttachment(Attachment at) {
		return sqlSession.update("noticeMapper.updateAttachment", at);
	}

	public int insertReply(nReply r) {
		System.out.println("다오 r : " + r);
		return sqlSession.insert("noticeMapper.insertReply", r);
	}

	public int SselectListCount(Search search) {
		return sqlSession.selectOne("noticeMapper.SselectListCount", search);
	}

	public int deleteNotices(int[] nNo) {

		return sqlSession.delete("noticeMapper.deleteNotices", nNo);
	}

	public ArrayList<nReply> selectReplyList(int nNo) {
		return (ArrayList) sqlSession.selectList("noticeMapper.selectReplyList", nNo);
	}

	public int deleteAttachment1(int[] nNo) {
		return sqlSession.delete("noticeMapper.deleteAttach1", nNo);
	}

	public int deletenReply(int[] nNo) {
		return sqlSession.delete("noticeMapper.deleteReply", nNo);
	}

	public Employee1 selectEmp(String eId) {
		return sqlSession.selectOne("noticeMapper.selectEmp", eId);
	}

	public int tselectListCount(int dId) {
		return sqlSession.selectOne("noticeMapper.tselectListCount", dId);
	}

	public ArrayList<Notice> tselectList(int dId, PageInfo pi) {
		// 몇개의 게시글을 건너 뛸 것인지
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		return (ArrayList) sqlSession.selectList("noticeMapper.tselectList", dId, rowBounds);
	}

	public int tselectListCount1(int dId) {
		return sqlSession.selectOne("noticeMapper.tselectListCount1", dId);
	}

	public ArrayList<Notice> tselectList1(int dId, PageInfo pi) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		return (ArrayList) sqlSession.selectList("noticeMapper.tselectList1", dId, rowBounds);
	}

	public int tselectListCount2(int dId) {
		return sqlSession.selectOne("noticeMapper.tselectListCount2", dId);
	}

	public ArrayList<Notice> tselectList2(int dId, PageInfo pi) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		return (ArrayList) sqlSession.selectList("noticeMapper.tselectList2", dId, rowBounds);
	}

	public int SselectListCount2(Search search) {
		return sqlSession.selectOne("noticeMapper.SselectListCount2", search);
	}

	public ArrayList<Notice> searchList2(Search search, PageInfo pi) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		return (ArrayList) sqlSession.selectList("noticeMapper.searchList2", search, rowBounds);
	}

	public int insertNotice2(Notice n) {
		return sqlSession.insert("noticeMapper.insertNotice2", n);
	}

	public int updaten(Notice n) {
		System.out.println("n : " + n);
		return sqlSession.update("noticeMapper.updaten", n);
	}

	public int Update(Notice n) {
		System.out.println("n : " + n);
		return sqlSession.update("noticeMapper.Update", n);
	}

	public int insertAttachment3(Attachment at) {
		System.out.println("at");
		return sqlSession.insert("noticeMapper.insertAttachment3", at);
	}

	public ArrayList<Notice> homeselectList() {
		return (ArrayList) sqlSession.selectList("noticeMapper.homeselectList");
	}

	public ArrayList<Notice> hometselectList(int dId) {
		return (ArrayList) sqlSession.selectList("noticeMapper.hometselectList", dId);
	}

}
