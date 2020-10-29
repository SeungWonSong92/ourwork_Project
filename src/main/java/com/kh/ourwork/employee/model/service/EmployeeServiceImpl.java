package com.kh.ourwork.employee.model.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import com.kh.ourwork.common.Attachment;
import com.kh.ourwork.common.PageInfo;
import com.kh.ourwork.employee.model.dao.EmployeeDao;
import com.kh.ourwork.employee.model.vo.Employee;
import com.kh.ourwork.employee.model.vo.Search;
import com.kh.ourwork.employee.model.vo.Work;
import com.kh.ourwork.pteam.model.vo.Department;

// @Component는 단순한 빈으로 등록하기 위한 어노테이션이라면
// @Service는 보다 구체화 된 즉, Service의 의미를 가지는 클래스라는 것을 보여주기 위한 어노테이션
// (" ")를 통해 빈으로 등록할 때의 이름을 지정해 줄 수 있음
@Service("mService")
public class EmployeeServiceImpl implements EmployeeService {
	// 암호화 처리 후 bcryptPasswordEncoder 객체 DI
	@Autowired
	private BCryptPasswordEncoder bcryptPasswordEncoder;
	
	@Autowired
	private EmployeeDao eDao;
	
	private Employee employee;

	@Override
	public Employee loginEmployee(Employee e) {

		Employee loginUser = eDao.selectEmployee(e);
		
		/*System.out.println("EmployeeServiceImpl"+e);
		System.out.println("EmployeeServiceImpl"+loginUser); */
		
		if(!bcryptPasswordEncoder.matches(e.getePwd(), loginUser.getePwd())) {
//			if(loginUser != null && !bcryptPasswordEncoder.matches(e.getePwd(), loginUser.getePwd())) {
			// 첫번째 인자로 로그인시 입력한 pwd 평문
			// 두번째 인자로 회원가입시 생성 된 pwd 다이제스트
			// match되지 않으면 비밀번호 틀린 것이므로 loginUser를 null처리
			loginUser = null;
		}
//		this.employee = loginUser;
		return loginUser;
	}
	
	@Override
	public Employee findEmployee() {
		return employee;
	}

	@Override
	public int insertEmployee(Employee e) {
		// pwd의 값 암호화 처리
		String encPwd = bcryptPasswordEncoder.encode(e.getePwd());
		e.setePwd(encPwd);
		return eDao.insertEmployee(e);
	}

	@Override
	public int updateEmployee(Employee e) {		
		return eDao.updateEmployee(e);
	}

	@Override
	public int checkIdDup(String id) {
		return eDao.checkIdDup(id);
	}
	
	@Override
	public int checkEmailDup(String email) {
		return eDao.checkEmailDup(email);
	}
	
	
	@Override
	public int insertAttachment(Attachment at) {		
		return eDao.insertAttachment(at);
	}
	
	@Override
	public Attachment selectAttachment(String eId) {
		return eDao.selectAttachment(eId);
	}
	
	@Override
	public int updateAttachment(Attachment at) {		
		return eDao.updateAttachment(at);
	}
	
	@Override
	public int deleteAttachment(Attachment at) {		
		return eDao.deleteAttachment(at);
	}
	
	@Override
	public int insertAttachment2(Attachment at) {		
		return eDao.insertAttachment2(at);
	}

	@Override
	public int employeeWIn(Work w) {
		return eDao.employeeWIn(w);
	}

	@Override
	public int employeeWOut(Work w) {
		return eDao.employeeWOut(w);
	}

	@Override
	public Work selectWork(String eId) {
		return eDao.selectWork(eId);
	}

	@Override
	public ArrayList<Department> selectDept() {
		return eDao.selectDepMember();
	}
	

	@Override
	public int selectListCount() {
		return eDao.selectListCount();
	}

	@Override
	public ArrayList<Employee> selectAllMember(PageInfo pi) {
		
		return eDao.selectAllMember(pi);
	}

	@Override
	public Employee selectEmp(String eName) {
		return eDao.selectEmp(eName);
	}

	@Override
	public String getUserId(Employee e) {
		return eDao.getUserId(e);
	}

	@Override
	public int updatePwd(Employee e) {
		String encPwd = bcryptPasswordEncoder.encode(e.getePwd()); 
		e.setePwd(encPwd); 
		
		return eDao.updatePwd(e); 
	}

	@Override
	public Employee getUserPwd(Employee e) {
		return eDao.getUserPwd(e);
	}

	@Override
	public Employee selectEmpById(String eId) {
		return eDao.selectEmpById(eId);
	}


	@Override
	public int selectSearchListCount(Search search) {
		return eDao.selectSearchListCount(search);
	}

	@Override
	public ArrayList<Employee> selectSearchList(Search search) {
		return eDao.selectSearchList(search);
	}

	@Override
	public int selectChkId(Employee e) {
		return eDao.selectChkId(e);
	}




}
