package com.kh.ourwork;

import java.util.ArrayList;
import java.util.Locale;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.kh.ourwork.approval.model.service.ApprovalService;
import com.kh.ourwork.approval.model.vo.Approval;
import com.kh.ourwork.email.model.service.EmailService;
import com.kh.ourwork.email.model.vo.RsEmail;
import com.kh.ourwork.employee.model.exception.EmployeeException;
import com.kh.ourwork.employee.model.service.EmployeeService;
import com.kh.ourwork.employee.model.vo.Employee;
import com.kh.ourwork.notice.model.service.NoticeService;
import com.kh.ourwork.notice.model.vo.Notice;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	@Autowired
	private EmployeeService eService;
	
	@Autowired
	private EmailService mService;
	
	@Autowired
	private ApprovalService aService;
	
	@Autowired
	private NoticeService nService;
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/home.do", method = RequestMethod.GET)
	public String home(Locale locale, Model model,HttpSession session) {
		Employee loginUser= (Employee)session.getAttribute("loginUser");
		
		ArrayList<RsEmail> rlist = mService.selectReceiveListHome(loginUser.geteId());
		ArrayList<Approval> alist = aService.selectWaitingList(loginUser);
		ArrayList<Notice> list = nService.homeselectList();
	    int dId = loginUser.getdId();
	    ArrayList<Notice> Blist = nService.hometselectList(dId);
		
		if (loginUser != null) {
			model.addAttribute("loginUser", loginUser);
			model.addAttribute("rlist", rlist);
			model.addAttribute("alist", alist);
			model.addAttribute("Blist", Blist);
	        model.addAttribute("list", list);
		} else {
			throw new EmployeeException("로그인에 실패하였습니다.");
		}
		return "home";
	}
	
	@RequestMapping(value = "/index.do", method = RequestMethod.GET)
	public String index(Locale locale, Model model) {

		return "index";
	}
	
	
}
