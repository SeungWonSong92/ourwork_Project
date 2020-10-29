package com.kh.ourwork.employee.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.ourwork.client.model.vo.Client;
import com.kh.ourwork.common.Attachment;
import com.kh.ourwork.common.PageInfo;
import com.kh.ourwork.employee.model.vo.Employee;
import com.kh.ourwork.employee.model.vo.Search;
import com.kh.ourwork.employee.model.vo.Work;
import com.kh.ourwork.pteam.model.vo.Department;



// @Repository라는 어노테이션 또한 DB와 접근하는 클래스에 부여하는 어노테이션으로
// @Component의 구체화 된 개념이다
@Repository("eDao")	 
public class EmployeeDao {
	// root-context.xml에서 작성한 bean으로 생성 된다
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	public ArrayList<Employee> selectList(PageInfo pi) {
		
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		
		return (ArrayList)sqlSession.selectList("memberMapper.selectList", null, rowBounds);
	}

	public Employee selectEmployee(Employee e) {
		return sqlSession.selectOne("memberMapper.selectOne", e);
	}

	public int insertEmployee(Employee e) {
		return sqlSession.insert("memberMapper.insertEmployee", e);
	}

	public int updateEmployee(Employee e) {
		return sqlSession.update("memberMapper.updateEmployee", e);
	}

	public int checkIdDup(String id) {
		return sqlSession.selectOne("memberMapper.idCheck", id);
	}
	
	public int checkEmailDup(String email) {
		return sqlSession.selectOne("memberMapper.emailCheck", email);
	}
	
	public int insertAttachment(Attachment at) {		
		return sqlSession.insert("memberMapper.insertAttachment", at);
	}
	
	public Attachment selectAttachment(String eId) {		
		return sqlSession.selectOne("memberMapper.selectAttachment", eId);
	}
	
	public int updateAttachment(Attachment at) {
		return sqlSession.update("memberMapper.updateAttachment", at);
	}
	
	public int deleteAttachment(Attachment at) {		
		return sqlSession.update("memberMapper.deleteAttachment", at);
	}

	public int insertAttachment2(Attachment at) {		
		return sqlSession.insert("memberMapper.insertAttachment2", at);
	}
	
	public int employeeWIn(Work w) {
		return sqlSession.insert("memberMapper.employeeWIn", w);
	}

	public int employeeWOut(Work w) {
		return sqlSession.insert("memberMapper.employeeWOut", w);
	}
	
	public Work selectWork(String eId) {		
		return sqlSession.selectOne("memberMapper.selectWork", eId);
	}

	public ArrayList<Employee> selectAllMember(PageInfo pi) {
		
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		
		return (ArrayList)sqlSession.selectList("memberMapper.selectAllMember", null, rowBounds);
	}

	public ArrayList<Department> selectDepMember() {
		return (ArrayList)sqlSession.selectList("memberMapper.selectDepMember", null);
	}

	public int selectListCount() {
		return sqlSession.selectOne("memberMapper.selectListCount");
	}

	public Employee selectEmp(String eName) {
		return sqlSession.selectOne("memberMapper.selectEmp", eName);
	}
	
	public Employee findId(Employee e) {
		return sqlSession.selectOne("memberMapper.findId", e);
	}

	public String getUserId(Employee e) {
		return sqlSession.selectOne("memberMapper.getUserId", e);
	}

	public int updatePwd(Employee e) {
		return sqlSession.update("memberMapper.updatePwd", e);
	}

	public Employee getUserPwd(Employee e) {
		return sqlSession.selectOne("memberMapper.getUserPwd", e);
	}


	public Employee selectEmpById(String eId) {
		return sqlSession.selectOne("memberMapper.selectEmpById", eId);
	}

	
	public int selectSearchListCount(Search search) {
		return sqlSession.selectOne("memberMapper.selectSearchListCount", search);
	}

	public ArrayList<Employee> selectSearchList(Search search) {
		
		int offset = (search.getPi().getCurrentPage() - 1) * search.getPi().getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, search.getPi().getBoardLimit());
		return (ArrayList)sqlSession.selectList("memberMapper.selectSearchList", search, rowBounds);
	}

	public int selectChkId(Employee e) {
		
		int result = sqlSession.selectOne("memberMapper.selectChkId", e);
		System.out.println("Dao에서 출력!! : "+result);
		 return result;
	}

	

}
