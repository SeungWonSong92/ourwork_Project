package com.kh.ourwork.email.model.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.ourwork.common.Attachment;
import com.kh.ourwork.common.PageInfo;
import com.kh.ourwork.email.model.dao.EmailDao;
import com.kh.ourwork.email.model.vo.Email;
import com.kh.ourwork.email.model.vo.EmailAddr;
import com.kh.ourwork.email.model.vo.Ereceiver;
import com.kh.ourwork.email.model.vo.RsEmail;
import com.kh.ourwork.email.model.vo.SearchEmail;

@Service("eService")
public class EmailServiceImpl implements EmailService {
	@Autowired
	private EmailDao mDao;

	@Override
	public int selectReceiveListCount(String id) {
		return mDao.selectReceiveListCount(id);
	}
	
	@Override
	public int selectSendListCount(String id) {
		return mDao.selectSendListCount(id);
	}
	
	@Override
	public int selectTempListCount(String id) {
		return mDao.selectTempListCount(id);
	}

	@Override
	public ArrayList<RsEmail> selectReceiveList(String id, PageInfo pi) {
		return mDao.selectReceiveList(id, pi);
	}

	@Override
	public ArrayList<RsEmail> selectSendList(RsEmail r, PageInfo pi) {
		return mDao.selectSendList(r, pi);
	}

	@Override
	public ArrayList<RsEmail> selectTempList(String id, PageInfo pi) {
		return mDao.selectTempList(id, pi);
	}

	@Override
	public int selectEmpListCount() {
		return mDao.selectEmpListCount();
	}

	@Override
	public ArrayList<EmailAddr> selectEmpAddrList() {
		return mDao.selectEmpAddrList();
	}

	@Override
	public RsEmail sEmailDetail(int mId) {
		return mDao.sEmailDetail(mId);
	}

	@Override
	public ArrayList<Ereceiver> receiverList(int mId) {
		return mDao.receiverList(mId);
	}

	@Override
	public ArrayList<Ereceiver> refList(int mId) {
		return mDao.refList(mId);
	}

	@Override
	public ArrayList<Ereceiver> hideList(int mId) {
		return mDao.hideList(mId);
	}

	@Override
	public String selectSendId(int mId) {
		return mDao.selectSendId(mId);
	}

	@Override
	public int insertEmail(Email e) {
		return mDao.insertEmail(e);
	}

	@Override
	public int insertRec(ArrayList<Ereceiver> rlist) {
		return mDao.insertRec(rlist);
	}

	@Override
	public int insertRef(ArrayList<Ereceiver> flist) {
		return mDao.insertRef(flist);
	}

	@Override
	public int insertHid(ArrayList<Ereceiver> hlist) {
		return mDao.insertHid(hlist);
	}

	@Override
	public int insertTemp(Email e) {
		return mDao.insertTemp(e);
	}

	@Override
	public ArrayList<Email> checkmId(String id) {
		return mDao.checkmId(id);
	}

	@Override
	public int deleteReceiver(int m) {
		return mDao.deleteReceiver(m);
	}

	@Override
	public int againTemp(Email e) {
		return mDao.againTemp(e);
	}

	@Override
	public int updateTempRec(ArrayList<Ereceiver> rlist) {
		return mDao.updateTempRec(rlist);
	}

	@Override
	public int updateTempRef(ArrayList<Ereceiver> flist) {
		return mDao.updateTempRef(flist);
	}

	@Override
	public int updateTempHid(ArrayList<Ereceiver> hlist) {
		return mDao.updateTempHid(hlist);
	}

	@Override
	public int updateTempToSend(Email e) {
		return mDao.updateTempToSend(e);
	}

	@Override
	public ArrayList<RsEmail> searchR(SearchEmail se, PageInfo pi) {
		return mDao.searchR(se, pi);
	}

	@Override
	public int searchReceiveEmailCount(SearchEmail se) {
		return mDao.searchReceiveEmailCount(se);
	}

	@Override
	public int searchRefEmailCount(SearchEmail se) {
		return mDao.searchRefEmailCount(se);
	}

	@Override
	public ArrayList<RsEmail> searchF(SearchEmail se, PageInfo pi) {
		return mDao.searchF(se, pi);
	}

	@Override
	public int searchHidEmailCount(SearchEmail se) {
		return mDao.searchHidEmailCount(se);
	}

	@Override
	public ArrayList<RsEmail> searchH(SearchEmail se, PageInfo pi) {
		return mDao.searchH(se, pi);
	}

	@Override
	public int rEmailDelete(ArrayList<Email> rlist) {
		return mDao.rEmailDelete(rlist);
	}

	@Override
	public int tEmailDelete(ArrayList<Email> tlist) {
		return mDao.tEmailDelete(tlist);
	}

	@Override
	public int tEmailReceiverDelete(ArrayList<Ereceiver> elist) {
		return mDao.tEmailReceiverDelete(elist);
	}

	@Override
	public int sEmailDelete(ArrayList<Email> slist) {
		return mDao.sEmailDelete(slist);
	}

	@Override
	public int insertAttachment(ArrayList<Attachment> alist) {
		return mDao.insertAttachment(alist);
	}

	@Override
	public int insertSaveAttachment(ArrayList<Attachment> alist) {
		return mDao.insertSaveAttachment(alist);
	}

	@Override
	public int deleteAttachment(int mId) {
		return mDao.deleteAttachment(mId);
	}

	@Override
	public ArrayList<Attachment> atList(int mId) {
		return mDao.atList(mId);
	}

	@Override
	public RsEmail reply(int mId) {
		return mDao.reply(mId);
	}

	@Override
	public ArrayList<Attachment> selectafList(ArrayList<Attachment> afList) {
		return mDao.selectafList(afList);
	}

	@Override
	public Attachment selectafaf(Attachment atmt) {
		return mDao.selectafaf(atmt);
	}

	@Override
	public ArrayList<RsEmail> selectReceiveListHome(String id) {
		return mDao.selectReceiveListHome(id);
	}

}
