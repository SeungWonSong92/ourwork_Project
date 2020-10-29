package com.kh.ourwork.employee.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kh.ourwork.common.Attachment;
import com.kh.ourwork.common.PageInfo;
import com.kh.ourwork.common.mPagination;
import com.kh.ourwork.email.model.vo.RsEmail;
import com.kh.ourwork.employee.model.vo.Search;
import com.kh.ourwork.employee.model.exception.EmployeeException;
import com.kh.ourwork.employee.model.service.EmployeeService;
import com.kh.ourwork.employee.model.vo.Employee;
import com.kh.ourwork.employee.model.vo.Work;
import com.kh.ourwork.pteam.model.vo.Department;

@SessionAttributes({ "loginUser" })
@Controller

public class EmployeeController {

	@Autowired
	private EmployeeService eService;

	private Logger logger = LoggerFactory.getLogger(EmployeeController.class);

	@RequestMapping("eJoin.do")
	public String joinView() {
		return "member/memberJoin";
	}

	@RequestMapping("eCalendar.do")
	public String calendarView() {
		return "member/memberCalendar";
	}

	@RequestMapping("eMypage.do")
	public String mypageView() {
		return "member/memberMypage";
	}

	@RequestMapping("logout.do")
	public String logoutView(HttpSession session) {
		session.invalidate();
		return "common/index";
	}

	@RequestMapping("eUpdate.do")
	public String updateView() {
		return "member/memberUpdate";
	}

	@RequestMapping("ePwdUpdate.do")
	public String ePwdUpdate() {
		return "member/memberUpdatePwd";
	}

	@RequestMapping("memberMypage.do")
	public String myPageView() {
		return "member/memberMypage";
	}

	// 암호화 처리 후 최종 로그인 메소드
	@RequestMapping(value = "login.do", method = RequestMethod.POST)
	public String employeeLogin(Employee e, Model model, RedirectAttributes rd) {
		int result = eService.selectChkId(e);

		System.out.println("서비스에서 result 출력 : " + result);
		/*
		 * if(loginUser == null || loginUser.getStatus().equals("N")) {
		 * model.addAttribute("msg", "아이디와 비밀번호를 확인해주세요."); return "index.do"; }else
		 * if(loginUser != null && loginUser.getStatus().equals("Y")) {
		 * model.addAttribute("loginUser", loginUser); }else if(loginUser != null &&
		 * loginUser.getStatus().equals("I")) { model.addAttribute("msg", "승인 대기중입니다.");
		 * return "index.do"; }
		 */
		if (result > 0) {
			Employee loginUser = eService.loginEmployee(e);
			if (loginUser != null && loginUser.getStatus().equals("Y")) {
				model.addAttribute("loginUser", loginUser);
				return "redirect:home.do";
			} else if (loginUser != null && loginUser.getStatus().equals("I")) {
				model.addAttribute("msg", "승인 대기중입니다.");
				return "common/index";
				//rd.addFlashAttribute("msg", "승인 대기중입니다.");
				//return "redirect:/";
			}
		} else {
			model.addAttribute("msg", "아이디와 비밀번호를 확인해주세요.");
			return "common/index";
		}

		return "redirect:home.do";

	}

	// 회원가입 메소드
	@RequestMapping("memberJoin.do")
	public String employeeInsert(Employee e, RedirectAttributes rd, HttpServletRequest request,
			@RequestParam(value = "reloadFile", required = false) MultipartFile reloadFile, HttpSession session,
			@RequestParam("post") String post, @RequestParam("address1") String address1,
			@RequestParam("address2") String address2) {

		e.setAddress(post + "," + address1 + "," + address2);

		// input type="file"에 파일이 업로드 되었을때
		if (reloadFile != null && !reloadFile.isEmpty()) {
			// 프로필 업로드
			Attachment at = eService.selectAttachment(e.geteId());
			String savePath = "\\images\\profileUploadFiles";
		}

		int result = eService.insertEmployee(e);

		if (result > 0) {
			rd.addFlashAttribute("msg", "회원가입이 완료되었습니다. 로그인 해주세요.");
			return "common/index";

		} else {
			throw new EmployeeException("회원가입에 실패하였습니다.");
		}
	}

	// ID찾기 페이지
	@RequestMapping("findIdPage.do")
	public String findIdView() {
		return "member/memberId";
	}

	// PWD찾기 페이지
	@RequestMapping("findPwdPage.do")
	public String findPwdView() {
		return "member/memberPwd";
	}

	// 로그인 후
	@RequestMapping("main.do")
	public String loginchang() {
		return "common/index";
	}

	// 아이디 찾기
	@RequestMapping("findId.do")
	public ModelAndView findId(HttpServletResponse response, Employee e, Model md, RedirectAttributes rd,
			ModelAndView mv) {
		String eId = eService.getUserId(e);

		if (eId != null) {
			mv.addObject("eName", e.geteName());
			mv.addObject("eId", eId);
			mv.setViewName("member/memberId");
		} else {
			mv.setViewName("common/index");
		}
		return mv;
	}

	// 비밀번호 찾기
	@RequestMapping("findPwd.do")
	public String findPwd(HttpServletResponse response, HttpServletRequest request, Employee e, Model md) {

		System.out.println("e=" + e);
		String name = e.geteName();
		Employee check = eService.getUserPwd(e);

		md.addAttribute("check", check);
		md.addAttribute("eId", e.geteId());
		md.addAttribute("name", name);

		return "member/memberPwd";
	}

	// 비밀번호 찾기 페이지
	@RequestMapping("findPwdUp.do")
	public String findPwdUp(HttpServletResponse response, String eId, Model md, @RequestParam("ePwd") String ePwd) {

		Employee e = eService.selectEmpById(eId);
		e.setePwd(ePwd);

		if (e != null) {
			int result = eService.updatePwd(e);
			if (result > 0) {
				e.setePwd(ePwd);
				return "common/index";
			}
		}
		return "common/errorPage";
	}

	// 파일 저장을 위한 별도 메소드
	private String saveFile(MultipartFile file, HttpServletRequest request) {
		// 파일이 저장 될 경로 설정
		// 해당 resources는 webapp 하위의 resources
		String root = request.getSession().getServletContext().getRealPath("resources");

		String savePath = root + "\\images\\profileUploadFiles";

		File folder = new File(savePath);
		// savePath 폴더를 불러와서
		// 해당 폴더 경로가 존재하는지 확인하고

		if (!folder.exists()) {
			folder.mkdirs();
		}
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
		String originFileName = file.getOriginalFilename();
		String renameFileName = sdf.format(new Date()) + originFileName.substring(originFileName.lastIndexOf("."));

		String renamePath = folder + "\\" + renameFileName;

		try {
			file.transferTo(new File(renamePath));
		} catch (IllegalStateException | IOException e) {
			e.printStackTrace();
		}
		return renameFileName;
	}

	// --------------------------------------------------------------------------------
	// 회원정보 수정 메소드
	@RequestMapping("memberUpdate.do")
	public String employeeUpdate(Model model, HttpServletRequest request,
			@RequestParam(value = "reloadFile", required = false) MultipartFile reloadFile, HttpSession session,
			@RequestParam("post") String post, @RequestParam("address1") String addr1,
			@RequestParam("address2") String addr2, @RequestParam("email") String email,
			@RequestParam("phone") String phone, RedirectAttributes rd) {

		Employee e = (Employee) session.getAttribute("loginUser");

		e.setAddress(post + "," + addr1 + "," + addr2);
		e.setEmail(email);
		e.setPhone(phone);

		// input type="file"에 파일이 업로드 되었을때
		if (reloadFile != null && !reloadFile.isEmpty()) {
			// 프로필 업로드
			Attachment at = eService.selectAttachment(e.geteId());
			String savePath = "\\images\\profileUploadFiles";

			// 등록된 프로필 사진이 없는 경우
			if (at == null) {

				String renameFileName = saveFile(reloadFile, request);

				at = new Attachment(e.geteId(), savePath, reloadFile.getOriginalFilename(), renameFileName);
				int result4 = eService.insertAttachment2(at);

			} else { // 등록된 프로필 사진이 있는 경우 & 변경하기 위해 파일을 업로드 한 경우
				if (at.getChangeName() != null) {
					deleteFile(at.getChangeName(), request);
				}

				String renameFileName = saveFile(reloadFile, request);

				if (renameFileName != null) {
					at = new Attachment(e.geteId(), savePath, reloadFile.getOriginalFilename(), renameFileName);
				}
				int result3 = eService.updateAttachment(at);
			}
			e.setProfile(at);
		}

		int result = eService.updateEmployee(e);

		if (result > 0) {
			/* rd.addFlashAttribute("msg", "회원정보가 수정 되었습니다."); */
			model.addAttribute("loginUser", e);
			return "redirect:memberMypage.do";
		} else {
			throw new EmployeeException("회원 정보 수정에 실패하였습니다");
		}
	}

	// 삭제
	public void deleteFile(String fileName, HttpServletRequest request) {
		String root = request.getSession().getServletContext().getRealPath("resources");
		String savePath = root + "\\images\\profileUploadFiles";

		File deleteFile = new File(savePath + "\\" + fileName);

		if (deleteFile.exists()) {
			deleteFile.delete();
		}
	}

	// 비밀번호 수정
	@RequestMapping("memberUpdatePwd.do")
	public String memberUpdatePwd(HttpServletResponse response, HttpSession session, Model md,
			@RequestParam("ePwd") String ePwd) {

		System.out.println("컨트롤러 ePwd : " + ePwd);
		Employee e = (Employee) session.getAttribute("loginUser");
		e.setePwd(ePwd);

		int result = eService.updatePwd(e);

		System.out.println("비밀번호 바뀐 e=" + e.getePwd());

		if (result > 0) {
			md.addAttribute("e", e);
			return "member/memberUpdatePwd";
		} else {
			return "common/errorPage";
		}
	}

	// 주소록 불러오기
	@RequestMapping("eAddress.do")
	public ModelAndView searchEmployee(Employee e, ModelAndView mv,
			@RequestParam(value = "page", required = false) Integer page) {
		int currentPage = page != null ? page : 1;

		int listCount = eService.selectListCount();

		PageInfo pi = mPagination.getPageInfo(currentPage, listCount);

		ArrayList<Employee> list = eService.selectAllMember(pi);
		ArrayList<Department> dList = eService.selectDept();

		mv.addObject("list", list).addObject("dList", dList).addObject("pi", pi).setViewName("member/memberAddress");

		return mv;
	}

	// 검색불러오기
	@RequestMapping("esearch.do")
	public ModelAndView searchm(Search search, ModelAndView mv,
			@RequestParam(value = "page", required = false) Integer page) {
		int currentPage = page != null ? page : 1;

		int listCount = eService.selectSearchListCount(search);

		PageInfo pi = mPagination.getPageInfo(currentPage, listCount);
		search.setPi(pi);

		ArrayList<Employee> list = eService.selectSearchList(search);

		System.out.println("list=" + list);

		mv.addObject("list", list).addObject("pi", pi).addObject("search", search).setViewName("member/memberAddress");
		return mv;
	}

	// 출근 저장하기
	@RequestMapping(value = "employeeWIn.do")
	public String employeeWIn(Model model, HttpSession session) {

		Work w = new Work();
		Employee e = (Employee) session.getAttribute("loginUser");

		w.seteId(e.geteId());
		int result = eService.employeeWIn(w);

//      System.out.println("work" + w);

		if (w != null) {
			model.addAttribute("worktime", w);

			// 출퇴근 성공시
			if (logger.isDebugEnabled()) {
				logger.info(w.geteId() + "출근시간이 등록되었습니다.");
			}
		} else {
			throw new EmployeeException("출근시간이 등록되지 않았습니다.");
		}
		return "redirect:home.do";
	}

	// 퇴근 저장하기
	@RequestMapping("employeeWOut.do")
	public String employeeWOut(Model model, HttpSession session) {

		Work w = new Work();
		Employee e = (Employee) session.getAttribute("loginUser");

		w.seteId(e.geteId());
		int result = eService.employeeWOut(w);

//      System.out.println("work" + w);

		if (w != null) {
			model.addAttribute("worktime", w);

			// 출퇴근 성공시
			if (logger.isDebugEnabled()) {
				logger.info(w.geteId() + "퇴근시간이 등록되었습니다.");
			}
		} else {
			throw new EmployeeException("퇴근시간이 등록되지 않았습니다.");
		}
		return "common/index";
	}

	// 2. JsonView를 이용한 방법
	// dependency 라이브러리 추가 후 JsonView, BeanNameViewResolver 빈 등록 후 사용
	@RequestMapping("dupid.do")
	public ModelAndView idDuplicateCheck(String eId, ModelAndView mv) {
		boolean isUsable = eService.checkIdDup(eId) == 0 ? true : false;

		Map map = new HashMap();
		map.put("isUsable", isUsable);
		mv.addAllObjects(map);

		mv.setViewName("jsonView");

//      System.out.println(eId);

		return mv;
	}

	@RequestMapping("edupid.do")
	public ModelAndView emailDuplicateCheck(String email, ModelAndView mv) {
		boolean emUsable = eService.checkEmailDup(email) == 0 ? true : false;

		Map map = new HashMap();
		map.put("emUsable", emUsable);
		mv.addAllObjects(map);
		mv.setViewName("jsonView");

//        System.out.println(email);

		return mv;
	}

	@RequestMapping("sendEmail.do")
	public String sendEmailGoId(String eId, Model model, RsEmail r) {
		model.addAttribute("eId", eId);
		return "email/sendEmailForm";
	}

}