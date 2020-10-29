package com.kh.ourwork.approval.model.dao;

import java.util.ArrayList;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.ourwork.approval.model.vo.Approval;
import com.kh.ourwork.approval.model.vo.ApprovalPeople;
import com.kh.ourwork.approval.model.vo.Certificate;
import com.kh.ourwork.approval.model.vo.Draft;
import com.kh.ourwork.approval.model.vo.Expenditurecc;
import com.kh.ourwork.approval.model.vo.Holiday;
import com.kh.ourwork.approval.model.vo.Line;
import com.kh.ourwork.approval.model.vo.LineAttachment;
import com.kh.ourwork.approval.model.vo.LineList;
import com.kh.ourwork.common.Attachment;
import com.kh.ourwork.common.PageInfo;
import com.kh.ourwork.employee.model.vo.Employee;

@Repository("aDao")
public class ApprovalDao {
	@Autowired
	SqlSessionTemplate sqlSession;
	
	public ArrayList selectWaitingList(Employee m) {
		return (ArrayList)sqlSession.selectList("approvalMapper.selectWList",m);
	}

	public ArrayList selectRequestList(Employee m) {
		return (ArrayList)sqlSession.selectList("approvalMapper.selectRList",m);
	}
	
	public ArrayList<LineList> selectLineList() {
		return (ArrayList)sqlSession.selectList("approvalMapper.selectLineList");
	}

	public ApprovalPeople selectApprovalPeople(String eId) {
		return sqlSession.selectOne("approvalMapper.selectApprovalPeople", eId);
	}

	public int insertApproval(Approval a) {
		return sqlSession.insert("approvalMapper.insertApproval", a);
	}
	
	public int insertAttachment(ArrayList<Attachment> list) {
		return sqlSession.insert("approvalMapper.insertAttachment", list);
	}

	public int deleteAttachment(String aId) {
		return sqlSession.delete("approvalMapper.deleteAttachment", aId);
	}

	public ArrayList<Attachment> selectAttachment(String aId) {
		return (ArrayList)sqlSession.selectList("approvalMapper.selectAttachment", aId);
	}
	
	public int insertSaveAttachment(ArrayList<Attachment> list) {
		return sqlSession.insert("approvalMapper.insertSaveAttachment", list);
	}

	public int insertLine(ArrayList<Line> llist) {
		return sqlSession.insert("approvalMapper.insertLine", llist);
	}

	public int insertHoliday(Holiday h) {
		return sqlSession.insert("approvalMapper.insertHoliday", h);
	}

	public int selectRequestListCount(Employee m) {
		return sqlSession.selectOne("approvalMapper.selectRequestListCount",m);
	}
	
	public int selectRequestiListCount(Employee m) {
		return sqlSession.selectOne("approvalMapper.selectRequestiListCount",m);
	}

	public int selectRequestyListCount(Employee m) {
		return sqlSession.selectOne("approvalMapper.selectRequestyListCount",m);
	}

	public int selectRequestnListCount(Employee m) {
		return sqlSession.selectOne("approvalMapper.selectRequestnListCount",m);
	}

	public ArrayList<Approval> selectRequestList(PageInfo pi, Employee m) {
		int offset = (pi.getCurrentPage()-1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		return (ArrayList)sqlSession.selectList("approvalMapper.selectRequestList", m, rowBounds);
	}
	
	public ArrayList<Approval> selectRequestiList(PageInfo ipi, Employee m) {
		int offset = (ipi.getCurrentPage()-1) * ipi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, ipi.getBoardLimit());
		return (ArrayList)sqlSession.selectList("approvalMapper.selectRequestiList", m, rowBounds);
	}

	public ArrayList<Approval> selectRequestyList(PageInfo ypi, Employee m) {
		int offset = (ypi.getCurrentPage()-1) * ypi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, ypi.getBoardLimit());
		return (ArrayList)sqlSession.selectList("approvalMapper.selectRequestyList", m, rowBounds);
	}

	public ArrayList<Approval> selectRequestnList(PageInfo npi, Employee m) {
		int offset = (npi.getCurrentPage()-1) * npi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, npi.getBoardLimit());
		return (ArrayList)sqlSession.selectList("approvalMapper.selectRequestnList", m, rowBounds);
	}

	public int selectSearchListCount(Map<String, String> map) {
		return sqlSession.selectOne("approvalMapper.selectSearchListCount",map);
	}

	public ArrayList<Approval> selectSearchList(Map<String, String> map, PageInfo pi) {
		int offset = (pi.getCurrentPage()-1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		System.out.println("map : " + map);
		return (ArrayList)sqlSession.selectList("approvalMapper.selectSearchList", map, rowBounds);	
	}

	public int saveApproval(Approval a) {
		return sqlSession.insert("approvalMapper.insertApproval",a);
	}

	public int selectSaveListCount(Employee m) {
		return sqlSession.selectOne("approvalMapper.selectSaveListCount",m);
	}

	public ArrayList<Approval> selectSaveList(PageInfo pi, Employee m) {
		int offset = (pi.getCurrentPage()-1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		return (ArrayList)sqlSession.selectList("approvalMapper.selectSaveList",m, rowBounds);
	}

	public int deleteSaveApproval(String[] aId) {
		return sqlSession.delete("approvalMapper.deleteSaveApproval", aId);
	}
	
	public int deleteLine(String aId) {
		return sqlSession.delete("approvalMapper.deleteLine", aId);
	}

	public Approval selectApproval(String aId) {
		return sqlSession.selectOne("approvalMapper.selectApproval", aId);
	}

	public ArrayList<Line> selectLine(String aId) {
		return (ArrayList)sqlSession.selectList("approvalMapper.selectLine", aId);
	}

	public Holiday selectHoliday(String aId) {
		return sqlSession.selectOne("approvalMapper.selectHoliday", aId);
	}

	public int updateApproval(Approval a) {
		return sqlSession.update("approvalMapper.updateApproval", a);
	}

	public int updateHoliday(Holiday h) {
		return sqlSession.update("approvalMapper.updateHoliday", h);
	}

	public int dleteSaveLine(String aId) {
		return sqlSession.delete("approvalMapper.deleteSaveLine", aId);
	}

	public int insertSaveLine(ArrayList<Line> llist) {
		return sqlSession.insert("approvalMapper.insertSaveLine", llist);
	}

	public int selectWaitingListCount(Employee m) {
		return sqlSession.selectOne("approvalMapper.selectWaitingListCount",m);
	}

	public ArrayList selectWaitingList(PageInfo pi,Employee m) {
		int offset = (pi.getCurrentPage()-1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		return (ArrayList)sqlSession.selectList("approvalMapper.selectWaitingList", m, rowBounds);
	}

	public int selectRefListCount(Employee m) {
		return sqlSession.selectOne("approvalMapper.selectRefListCount", m);
	}

	public ArrayList<Approval> selectRefList(PageInfo pi, Employee m) {
		int offset = (pi.getCurrentPage()-1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		return (ArrayList)sqlSession.selectList("approvalMapper.selectRefList", m,rowBounds);
	}

	public int deleteSaveApproval(String aId) {
		return sqlSession.delete("approvalMapper.deleteApproval",aId);
	}

	public int updateLine(Line l) {
		return sqlSession.update("approvalMapper.updateLine",l);
	}

	public int insertLineAttachment(ArrayList<LineAttachment> list) {
		return sqlSession.insert("approvalMapper.insertLineAttachment",list);
	}

	public int selectReceptionCount(Employee m) {
		return sqlSession.selectOne("approvalMapper.selectReceptionCount", m);
	}

	public ArrayList<Approval> selectReception(PageInfo pi, Employee m) {
		int offset = (pi.getCurrentPage()-1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		return (ArrayList)sqlSession.selectList("approvalMapper.selectReceptionList", m, rowBounds);
	}

	public int selectExpectedCount(Employee m) {
		return sqlSession.selectOne("approvalMapper.selectExpectedCount", m);
	}

	public ArrayList<Approval> selectExpectedList(PageInfo pi, Employee m) {
		int offset = (pi.getCurrentPage()-1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		return (ArrayList)sqlSession.selectList("approvalMapper.selectExpectedList", m, rowBounds);
	}

	public int updateNoApproval(String aId) {
		return sqlSession.update("approvalMapper.updateNoApproval",aId);
	}
	
	public int updateNextLine(Line l) {
		return sqlSession.update("approvalMapper.updateNextLine",l);
	}

	public int updateYesApproval(String aId) {
		return sqlSession.update("approvalMapper.updateYesApproval",aId);
	}

	public int updateCertificate(Certificate c) {
		return sqlSession.update("approvalMapper.updateCertificate",c);
	}

	public int insertCertificate(Certificate c) {
		return sqlSession.insert("approvalMapper.insertCertificate",c);
	}

	public Certificate selectCertificate(String aId) {
		return sqlSession.selectOne("approvalMapper.selectCertificate",aId);
	}

	public int updateDraft(Draft d) {
		return sqlSession.update("approvalMapper.updateDraft",d);
	}

	public int insertDraft(Draft d) {
		return sqlSession.insert("approvalMapper.insertDraft",d);
	}

	public Draft selectDraft(String aId) {
		return sqlSession.selectOne("approvalMapper.selectDraft",aId);
	}

	public ArrayList<Attachment> selectEAttachment() {
		return (ArrayList)sqlSession.selectList("approvalMapper.selectEAttachment");
	}

	public Attachment selectAttachment(Attachment at) {
		return sqlSession.selectOne("approvalMapper.selectCAttachment");
	}

	public int updateExpend(Expenditurecc ex) {
		return sqlSession.update("approvalMapper.updateExpend", ex);
	}

	public int insertExpend(Expenditurecc ex) {
		return sqlSession.insert("approvalMapper.insertExpend", ex);
	}

	public Expenditurecc selectExpend(String aId) {
		return sqlSession.selectOne("approvalMapper.selectExpend", aId);
	}

}
