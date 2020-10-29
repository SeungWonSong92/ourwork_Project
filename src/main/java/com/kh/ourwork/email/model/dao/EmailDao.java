package com.kh.ourwork.email.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.ourwork.common.Attachment;
import com.kh.ourwork.common.PageInfo;
import com.kh.ourwork.email.model.vo.Email;
import com.kh.ourwork.email.model.vo.EmailAddr;
import com.kh.ourwork.email.model.vo.Ereceiver;
import com.kh.ourwork.email.model.vo.RsEmail;
import com.kh.ourwork.email.model.vo.SearchEmail;

@Repository("mDao")
public class EmailDao {
	@Autowired
	SqlSessionTemplate sqlSession;
	
	public int selectReceiveListCount(String id) {
		return sqlSession.selectOne("emailMapper.selectReceiveListCount", id);
	}
	
	public int selectSendListCount(String id) {
		return sqlSession.selectOne("emailMapper.selectSendListCount", id);
	}
	
	public int selectTempListCount(String id) {
		return sqlSession.selectOne("emailMapper.selectTempListCount", id);
	}

	public ArrayList<RsEmail> selectReceiveList(String id, PageInfo pi) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		return (ArrayList)sqlSession.selectList("emailMapper.selectReceiveList", id, rowBounds);
	}

	public ArrayList<RsEmail> selectSendList(RsEmail r, PageInfo pi) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		System.out.println(rowBounds);
		return (ArrayList)sqlSession.selectList("emailMapper.selectSendList", r, rowBounds);
	}

	public ArrayList<RsEmail> selectTempList(String id, PageInfo pi) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		return (ArrayList)sqlSession.selectList("emailMapper.selectTempList", id, rowBounds);
	}

	public int selectEmpListCount() {
		return sqlSession.selectOne("emailMapper.selectEmpListCount");
	}

	public ArrayList<EmailAddr> selectEmpAddrList() {
		return (ArrayList)sqlSession.selectList("emailMapper.selectEmpAddrList");
	}

	public RsEmail sEmailDetail(int mId) {
		return sqlSession.selectOne("emailMapper.sEmailDetail", mId);
	}

	public ArrayList<Ereceiver> receiverList(int mId) {
		return (ArrayList)sqlSession.selectList("emailMapper.receiverList", mId);
	}

	public ArrayList<Ereceiver> refList(int mId) {
		return (ArrayList)sqlSession.selectList("emailMapper.refList", mId);
	}

	public ArrayList<Ereceiver> hideList(int mId) {
		return (ArrayList)sqlSession.selectList("emailMapper.hideList", mId);
	}

	public String selectSendId(int mId) {
		return sqlSession.selectOne("emailMapper.selectSendId", mId);
	}

	public int insertEmail(Email e) {
		return sqlSession.insert("emailMapper.insertEmail", e);
	}

	public int insertRec(ArrayList<Ereceiver> rlist) {
		return sqlSession.insert("emailMapper.insertRec", rlist);
	}

	public int insertRef(ArrayList<Ereceiver> flist) {
		return sqlSession.insert("emailMapper.insertRef", flist);
	}

	public int insertHid(ArrayList<Ereceiver> hlist) {
		return sqlSession.insert("emailMapper.insertHid", hlist);
	}

	public int insertTemp(Email e) {
		return sqlSession.insert("emailMapper.insertTemp", e);
	}

	public ArrayList<Email> checkmId(String id) {
		return (ArrayList)sqlSession.selectList("emailMapper.checkmId", id);
	}

	public int deleteReceiver(int m) {
		return sqlSession.delete("emailMapper.deleteReceiver", m);
	}

	public int againTemp(Email e) {
		return sqlSession.update("emailMapper.againTemp", e);
	}

	public int updateTempRec(ArrayList<Ereceiver> rlist) {
		return sqlSession.insert("emailMapper.updateTempRec", rlist);
	}

	public int updateTempRef(ArrayList<Ereceiver> flist) {
		return sqlSession.insert("emailMapper.updateTempRef", flist);
	}

	public int updateTempHid(ArrayList<Ereceiver> hlist) {
		return sqlSession.insert("emailMapper.updateTempHid", hlist);
	}

	public int updateTempToSend(Email e) {
		return sqlSession.update("emailMapper.updateTempToSend", e);
	}

	public ArrayList<RsEmail> searchR(SearchEmail se, PageInfo pi) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		return (ArrayList)sqlSession.selectList("emailMapper.searchR", se, rowBounds);
	}

	public int searchReceiveEmailCount(SearchEmail se) {
		return sqlSession.selectOne("emailMapper.searchReceiveEmailCount", se);
	}

	public int searchRefEmailCount(SearchEmail se) {
		return sqlSession.selectOne("emailMapper.searchRefEmailCount", se);
	}

	public ArrayList<RsEmail> searchF(SearchEmail se, PageInfo pi) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		return (ArrayList)sqlSession.selectList("emailMapper.searchF", se, rowBounds);
	}

	public int searchHidEmailCount(SearchEmail se) {
		return sqlSession.selectOne("emailMapper.searchHidEmailCount", se);
	}

	public ArrayList<RsEmail> searchH(SearchEmail se, PageInfo pi) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		return (ArrayList)sqlSession.selectList("emailMapper.searchH", se, rowBounds);
	}

	public int rEmailDelete(ArrayList<Email> rlist) {
		return sqlSession.update("emailMapper.deleteR", rlist);
	}

	public int tEmailDelete(ArrayList<Email> tlist) {
		return sqlSession.update("emailMapper.deleteT", tlist);
	}

	public int tEmailReceiverDelete(ArrayList<Ereceiver> elist) {
		return sqlSession.delete("emailMapper.deleteTreceiver", elist);
	}

	public int sEmailDelete(ArrayList<Email> slist) {
		return sqlSession.update("emailMapper.deleteS", slist);
	}

	public int insertAttachment(ArrayList<Attachment> alist) {
		return sqlSession.insert("emailMapper.insertAttachment", alist);
	}

	public int insertSaveAttachment(ArrayList<Attachment> alist) {
		return sqlSession.insert("emailMapper.insertSaveAttachment", alist);
	}

	public int deleteAttachment(int mId) {
		return sqlSession.delete("emailMapper.deleteAttachment", mId);
	}

	public ArrayList<Attachment> atList(int mId) {
		return (ArrayList)sqlSession.selectList("emailMapper.atList", mId);
	}

	public RsEmail reply(int mId) {
		return sqlSession.selectOne("emailMapper.reply", mId);
	}

	public ArrayList<Attachment> selectafList(ArrayList<Attachment> afList) {
		return (ArrayList)sqlSession.selectList("emailMapper.selectafList", afList);
	}

	public Attachment selectafaf(Attachment atmt) {
		return sqlSession.selectOne("emailMapper.selectafaf", atmt);
	}

	public ArrayList<RsEmail> selectReceiveListHome(String id) {
		return (ArrayList)sqlSession.selectList("emailMapper.selectReceiveListHome", id);
	}

}
