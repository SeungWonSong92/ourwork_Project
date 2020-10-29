package com.kh.ourwork.pteam.model.dao;

import java.util.ArrayList;
import java.util.Date;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.ourwork.common.Attachment;
import com.kh.ourwork.common.PageInfo;
import com.kh.ourwork.common.Search;
import com.kh.ourwork.employee.model.vo.Employee;
import com.kh.ourwork.pteam.model.vo.Career;
import com.kh.ourwork.pteam.model.vo.Certifrcate;
import com.kh.ourwork.pteam.model.vo.Department;
import com.kh.ourwork.pteam.model.vo.Education;
import com.kh.ourwork.pteam.model.vo.Employee1;
import com.kh.ourwork.pteam.model.vo.Rank;

@Repository("pDao")
public class pteamDao {
	@Autowired SqlSessionTemplate sqlSession;
	
	/*public int selectListCount() {
		System.out.println("dao.들어는 옵니까?");
		return sqlSession.selectOne("pteamMapper.selectListCount");
	}*/
	
	public int selectListCount() {
		return sqlSession.selectOne("pteamMapper.EselectListCount");
	}

	public ArrayList<Employee1> selectLis(PageInfo pi) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit() ;
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		return (ArrayList)sqlSession.selectList("pteamMapper.EselectList", null, rowBounds);
	}

	public Attachment selectAttachment(String eId) {

		return sqlSession.selectOne("pteamMapper.selectAttachment", eId);
	}

	public Employee1 selectEmployee(String eId) {
		return sqlSession.selectOne("pteamMapper.selectOne", eId);
	}

	public ArrayList<Employee1> selectNList(PageInfo pin) {
		int offset = (pin.getCurrentPage() - 1) * pin.getBoardLimit() ;
		RowBounds rowBounds = new RowBounds(offset, pin.getBoardLimit());
		return (ArrayList)sqlSession.selectList("pteamMapper.NselectList", null, rowBounds);
	}

	public int selectnListCount() {
		return sqlSession.selectOne("pteamMapper.NselectListCount");
	}

	public ArrayList<Employee1> searchList(Search search, PageInfo pi) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit() ;
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		return (ArrayList)sqlSession.selectList("pteamMapper.searchList", search, rowBounds);
	}

	public ArrayList<Employee> nselectList(Search search2) {
		return (ArrayList)sqlSession.selectList("pteamMapper.nsearchList", search2);
	}

	public int sselectListCount(Search search) {
		return sqlSession.selectOne("pteamMapper.SselectListCount", search);
	}

	public ArrayList<Rank> selectRList() {
		return (ArrayList)sqlSession.selectList("pteamMapper.selectrList");
	}

	public ArrayList<Department> selectDList() {
		return (ArrayList)sqlSession.selectList("pteamMapper.selectdList");
	}

	public int insertCe(Certifrcate c) {
		return sqlSession.insert("pteamMapper.insertCe",c);
	}

	public Certifrcate selectC(String eId) {
		return sqlSession.selectOne("pteamMapper.selectCe", eId);
	}

	public int updateCe(Certifrcate c) {
		return sqlSession.update("pteamMapper.updateCe", c);
	}

	public int insertCa(Career ca) {
		return sqlSession.insert("pteamMapper.insertCa", ca);
	}

	public Career selectCa(String eId) {
		return sqlSession.selectOne("pteamMapper.selectCa", eId);
	}

	public int ed1insert(Education ed1) {
		return sqlSession.insert("pteamMapper.insered1", ed1);
	}

	public Education selected1(String eId) {
		return sqlSession.selectOne("pteamMapper.selectde1", eId);
	}

	public int ed2insert(Education ed1) {
		return sqlSession.insert("pteamMapper.insered2", ed1);
	}

	public Education selected2(String eId) {
		return sqlSession.selectOne("pteamMapper.selectde2", eId);
	}

	public int insertAttachment(Attachment at) {
		return sqlSession.insert("pteamMapper.insertAttachment", at);
	}

	public int updateEmp(Employee1 e) {
		return sqlSession.update("pteamMapper.updateEmp", e);
	}

	public int updateAttachment(Attachment at) {
		return sqlSession.update("pteamMapper.updateAttachment", at);
	}

	public int insertDept(String dName) {
		return sqlSession.insert("pteamMapper.insertDept", dName);
	}

	public int deleteDept(int dId) {
		return sqlSession.delete("pteamMapper.deleteDept", dId);
	}

	public ArrayList<Employee> selectiList() {
		return (ArrayList)sqlSession.selectList("pteamMapper.iselect");
	}

	public ArrayList<Employee1> selectEmp1(int dId) {
		return (ArrayList)sqlSession.selectList("pteamMapper.Empl2", dId);
	}

	public int updateEmpi(String eId) {
		return sqlSession.update("pteamMapper.updateEmpi", eId);
	}

	public int selectSearchListC(Map<String, String> map) {
		return sqlSession.selectOne("pteamMapper.searchAttend", map);
	}


	// 여기
	public int selectAttend2() {
		return sqlSession.selectOne("pteamMapper.Attend");
	}

	public ArrayList<Employee1> selectAttend(Map<String, String> map, PageInfo pi) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit() ;
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		return (ArrayList)sqlSession.selectList("pteamMapper.selectAttend", map,rowBounds);
	}

	public ArrayList<Employee1> selectNList1(Search search, PageInfo pin) {
		int offset = (pin.getCurrentPage() - 1) * pin.getBoardLimit() ;
		RowBounds rowBounds = new RowBounds(offset, pin.getBoardLimit());
		return (ArrayList)sqlSession.selectList("pteamMapper.NselectList1", search, rowBounds);
	}

	public int updatedeemp(Employee1 employee) {
		return sqlSession.update("pteamMapper.updatedeemp", employee);
	}

	public int selectnListCount1(Search search) {
		return sqlSession.selectOne("pteamMapper.NselectListCount1", search);
	}

	public int updateEmp1(Employee1 e) {
		return sqlSession.update("pteamMapper.updateEmp1", e);
	}


}
