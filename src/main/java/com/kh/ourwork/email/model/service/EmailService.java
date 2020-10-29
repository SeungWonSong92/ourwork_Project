package com.kh.ourwork.email.model.service;

import java.util.ArrayList;

import com.kh.ourwork.common.Attachment;
import com.kh.ourwork.common.PageInfo;
import com.kh.ourwork.email.model.vo.Email;
import com.kh.ourwork.email.model.vo.EmailAddr;
import com.kh.ourwork.email.model.vo.Ereceiver;
import com.kh.ourwork.email.model.vo.RsEmail;
import com.kh.ourwork.email.model.vo.SearchEmail;

public interface EmailService {
	
	public int selectReceiveListCount(String id);
	
	public int selectSendListCount(String id);
	
	public int selectTempListCount(String id);

	public ArrayList<RsEmail> selectReceiveList(String id, PageInfo pi);

	public ArrayList<RsEmail> selectSendList(RsEmail r, PageInfo pi);

	public ArrayList<RsEmail> selectTempList(String id, PageInfo pi);

	public int selectEmpListCount();

	public ArrayList<EmailAddr> selectEmpAddrList();

	public RsEmail sEmailDetail(int mId);

	public ArrayList<Ereceiver> receiverList(int mId);

	public ArrayList<Ereceiver> refList(int mId);

	public ArrayList<Ereceiver> hideList(int mId);

	public String selectSendId(int mId);

	public int insertEmail(Email e);

	public int insertRec(ArrayList<Ereceiver> rlist);

	public int insertRef(ArrayList<Ereceiver> flist);

	public int insertHid(ArrayList<Ereceiver> hlist);

	public int insertTemp(Email e);

	public ArrayList<Email> checkmId(String id);

	public int deleteReceiver(int m);

	public int againTemp(Email e);

	public int updateTempRec(ArrayList<Ereceiver> rlist);

	public int updateTempRef(ArrayList<Ereceiver> flist);

	public int updateTempHid(ArrayList<Ereceiver> hlist);

	public int updateTempToSend(Email e);

	public ArrayList<RsEmail> searchR(SearchEmail se, PageInfo pi);

	public int searchReceiveEmailCount(SearchEmail se);

	public int searchRefEmailCount(SearchEmail se);

	public ArrayList<RsEmail> searchF(SearchEmail se, PageInfo pi);

	public int searchHidEmailCount(SearchEmail se);

	public ArrayList<RsEmail> searchH(SearchEmail se, PageInfo pi);

	public int rEmailDelete(ArrayList<Email> rlist);

	public int tEmailDelete(ArrayList<Email> tlist);

	public int tEmailReceiverDelete(ArrayList<Ereceiver> elist);

	public int sEmailDelete(ArrayList<Email> slist);

	public int insertAttachment(ArrayList<Attachment> alist);

	public int insertSaveAttachment(ArrayList<Attachment> alist);

	public int deleteAttachment(int mId);

	public ArrayList<Attachment> atList(int mId);

	public RsEmail reply(int mId);

	public ArrayList<Attachment> selectafList(ArrayList<Attachment> afList);

	public Attachment selectafaf(Attachment atmt);

	public ArrayList<RsEmail> selectReceiveListHome(String geteId);

}
