package com.kh.ourwork.pteam.model.service;

import java.util.ArrayList;
import java.util.Date;
import java.util.Map;

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

public interface pteamService {

	int selectListCount();

	ArrayList<Employee1> selectList(PageInfo pi);

	/*Attachment selectAttachment(String eId);*/

	Employee1 selectEmployee(String eId);

	ArrayList<Employee1> selectNList(PageInfo pin);

	int selectnListCount();

	ArrayList<Employee1> searchList(Search search, PageInfo pi);

	ArrayList<Employee> nsearchList(Search search2);

	int SselectListCount(Search search);

	ArrayList<Rank> selectRList();

	ArrayList<Department> selectDList();

	int cinsert(Certifrcate c);

	Certifrcate selectC(String eId);

	int updateCe(Certifrcate c);

	int cainsert(Career ca);

	Career selectCa(String eId);

	int ed1insert(Education ed1);

	Education selected1(String eId);

	int ed1insert2(Education ed1);

	Education selected2(String eId);

	Attachment selectAttachment(String eId);

	int insertAttachment(Attachment at);

	int updateEmp(Employee1 e);

	int updateAttachment(Attachment at);

	int insertDept(String dName);

	int deleteDept(int dId);

	ArrayList<Employee> selectiList();

	ArrayList<Employee1> selectList2(int dId);

	int updateEa(String eId);

	int selectSearchListCount(Map<String, String> map);

//	ArrayList<Employee1> AttendEmployee(String dName, PageInfo pi);

	int selectSearchListCount2();

	ArrayList<Employee1> AttendEmployee(Map<String, String> map, PageInfo pi);

	ArrayList<Employee1> selectNList1(Search search, PageInfo pin);

	int deleteEmp(Employee1 employee);

	int selectnListCount1(Search search);

	int updateEmp1(Employee1 e);



}
