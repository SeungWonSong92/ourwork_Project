package com.kh.ourwork.pteam.model.service;

import java.util.ArrayList;
import java.util.Date;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.ourwork.common.Attachment;
import com.kh.ourwork.common.PageInfo;
import com.kh.ourwork.common.Search;
import com.kh.ourwork.employee.model.vo.Employee;
import com.kh.ourwork.pteam.model.dao.pteamDao;
import com.kh.ourwork.pteam.model.vo.Career;
import com.kh.ourwork.pteam.model.vo.Certifrcate;
import com.kh.ourwork.pteam.model.vo.Department;
import com.kh.ourwork.pteam.model.vo.Education;
import com.kh.ourwork.pteam.model.vo.Employee1;
import com.kh.ourwork.pteam.model.vo.Rank;

@Service("pService")
public class pteamServiceImpl implements pteamService{
	@Autowired pteamDao pDao;

	@Override
	public int selectListCount() {
		return pDao.selectListCount();
	}
	
	@Override
	public ArrayList<Employee1> selectList(PageInfo pi) {
		return pDao.selectLis(pi);
	}

	@Override
	public Employee1 selectEmployee(String eId) {
		return pDao.selectEmployee(eId);
	}

	@Override
	public ArrayList<Employee1> selectNList(PageInfo pin) {
		return pDao.selectNList(pin);
	}

	@Override
	public int selectnListCount() {
		return pDao.selectnListCount();
	}

	@Override
	public ArrayList<Employee1> searchList(Search search, PageInfo pi) {
		return pDao.searchList(search, pi);
	}

	@Override
	public ArrayList<Employee> nsearchList(Search search2) {
		return pDao.nselectList(search2);
	}

	@Override
	public int SselectListCount(Search search) {
		return pDao.sselectListCount(search);
	}

	@Override
	public ArrayList<Rank> selectRList() {
		return pDao.selectRList();
	}

	@Override
	public ArrayList<Department> selectDList() {
		return pDao.selectDList();
	}

	@Override
	public int cinsert(Certifrcate c) {
		return pDao.insertCe(c);
	}

	@Override
	public Certifrcate selectC(String eId) {
		return pDao.selectC(eId);
	}

	@Override
	public int updateCe(Certifrcate c) {
		return pDao.updateCe(c);
	}

	@Override
	public int cainsert(Career ca) {
		return pDao.insertCa(ca);
	}

	@Override
	public Career selectCa(String eId) {
		return pDao.selectCa(eId);
	}

	@Override
	public int ed1insert(Education ed1) {
		return pDao.ed1insert(ed1);
	}

	@Override
	public Education selected1(String eId) {
		return pDao.selected1(eId);
	}

	@Override
	public int ed1insert2(Education ed1) {
		return pDao.ed2insert(ed1);
	}

	@Override
	public Education selected2(String eId) {
		return pDao.selected2(eId);
	}

	@Override
	public Attachment selectAttachment(String eId) {
		return pDao.selectAttachment(eId);
	}

	@Override
	public int insertAttachment(Attachment at) {
		return pDao.insertAttachment(at);
	}

	@Override
	public int updateEmp(Employee1 e) {
		return pDao.updateEmp(e);
	}

	@Override
	public int updateAttachment(Attachment at) {
		return pDao.updateAttachment(at);
	}

	@Override
	public int insertDept(String dName) {
		return pDao.insertDept(dName);
	}

	@Override
	public int deleteDept(int dId) {
		return pDao.deleteDept(dId);
	}

	@Override
	public ArrayList<Employee> selectiList() {
		return pDao.selectiList();
	}

	@Override
	public ArrayList<Employee1> selectList2(int dId) {
		return pDao.selectEmp1(dId);
	}

	@Override
	public int updateEa(String eId) {
		return pDao.updateEmpi(eId);
	}

	@Override
	public int selectSearchListCount(Map<String, String> map) {
		return pDao.selectSearchListC(map);
	}

	/*@Override
	public ArrayList<Employee1> AttendEmployee(String dName, PageInfo pi) {
		return pDao.selectAttend(dName, pi);
	}*/

	@Override
	public ArrayList<Employee1> AttendEmployee(Map<String, String> map, PageInfo pi) {
		return pDao.selectAttend(map, pi);
	}
	
	
	@Override
	public int selectSearchListCount2() {
		return pDao.selectAttend2();
	}

	@Override
	public ArrayList<Employee1> selectNList1(Search search, PageInfo pin) {
		return pDao.selectNList1(search, pin);
	}

	@Override
	public int deleteEmp(Employee1 employee) {
		return pDao.updatedeemp(employee);
	}

	@Override
	public int selectnListCount1(Search search) {
		return pDao.selectnListCount1(search);
	}

	@Override
	public int updateEmp1(Employee1 e) {
		return pDao.updateEmp1(e);
	}



	

	

}
