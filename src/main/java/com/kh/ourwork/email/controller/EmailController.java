package com.kh.ourwork.email.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.kh.ourwork.common.Attachment;
import com.kh.ourwork.common.PageInfo;
import com.kh.ourwork.common.Pagination;
import com.kh.ourwork.email.model.exception.EmailException;
import com.kh.ourwork.email.model.service.EmailService;
import com.kh.ourwork.email.model.vo.Email;
import com.kh.ourwork.email.model.vo.EmailAddr;
import com.kh.ourwork.email.model.vo.Ereceiver;
import com.kh.ourwork.email.model.vo.RsEmail;
import com.kh.ourwork.email.model.vo.SearchEmail;
import com.kh.ourwork.employee.model.vo.Employee;

@Controller
public class EmailController {
	@Autowired
	private EmailService eService;
	
	@RequestMapping("receiveMailList.do")
	public ModelAndView receiveEmailList(ModelAndView mv,
			@RequestParam(value="page", required=false) Integer page, HttpSession session) {
		Employee loginUser = (Employee)session.getAttribute("loginUser");
		String id = loginUser.geteId();
		int currentPage = page != null ? page : 1;
		int listCount = eService.selectReceiveListCount(id);
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount);
		ArrayList<RsEmail> list = eService.selectReceiveList(id, pi);
		if(list != null) {
			mv.addObject("list", list);
			mv.addObject("pi", pi);
			mv.setViewName("email/receiveEmailListView");
		} else {
			throw new EmailException("받은메일함 조회 실패");
		}
		return mv;
	}
	
	@RequestMapping("sendMailList.do")
	public ModelAndView sendEmailList( ModelAndView mv, RsEmail r,
			@RequestParam(value="page", required=false) Integer page, HttpSession session) {
		Employee loginUser = (Employee)session.getAttribute("loginUser");
		String id = loginUser.geteId();
		r.setEeId(id);
		int currentPage = page != null ? page : 1;
		int listCount = eService.selectSendListCount(id);
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount);
		ArrayList<RsEmail> list = eService.selectSendList(r, pi);
		
		if(list != null) {
			mv.addObject("list", list);
			mv.addObject("pi", pi);
			mv.setViewName("email/sendEmailListView");
		} else {
			throw new EmailException("받은메일함 조회 실패");
		}
		return mv;
	}
	
	@RequestMapping("temporaryEmailList.do")
	public ModelAndView temporaryEmailList(ModelAndView mv,
			@RequestParam(value="page", required=false) Integer page, HttpSession session) {
		Employee loginUser = (Employee)session.getAttribute("loginUser");
		String id = loginUser.geteId();
		int currentPage = page != null ? page : 1;
		int listCount = eService.selectTempListCount(id);
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount);
		ArrayList<RsEmail> list = eService.selectTempList(id, pi);
		if(list != null) {
			mv.addObject("list", list);
			mv.addObject("pi", pi);
			mv.setViewName("email/temporaryEmailListView");
		} else {
			throw new EmailException("받은메일함 조회 실패");
		}
		return mv;
	}
	
	@RequestMapping("sendMail.do")
	public String boardInsertView() {
		return "email/sendEmailForm";
	}
	
	@RequestMapping("sendEmailDetailView.do")
	public String sendEmailDetailView(int mId, RsEmail r, Model model, HttpSession session) {
		Employee loginUser = (Employee)session.getAttribute("loginUser");
		String sendId = loginUser.geteId();
		ArrayList<Ereceiver> receiver = eService.receiverList(mId);
		ArrayList<Ereceiver> ref = eService.refList(mId);
		ArrayList<Ereceiver> hide = eService.hideList(mId);
		ArrayList<Attachment> alist = eService.atList(mId);
		r = eService.sEmailDetail(mId);
		
		if(r != null) {
			model.addAttribute("sendId", sendId);
			model.addAttribute("receiver", receiver);
			model.addAttribute("ref", ref);
			model.addAttribute("hide", hide);
			model.addAttribute("email", r);
			model.addAttribute("alist", alist);
			return "email/sendEmailDetailView";
		} else {
			model.addAttribute("msg", "보낸메일 상세보기 실패했습니다.");
			return "common/errorPage";
		}
	}
	
	@RequestMapping("receiveEmailDetailView.do")
	public String receiveEmailDetailView(int mId, RsEmail r, Model model, HttpSession session) {
		Employee loginUser = (Employee)session.getAttribute("loginUser");
		String id = loginUser.geteId();
		String sendId = eService.selectSendId(mId);
		ArrayList<Ereceiver> receiver = eService.receiverList(mId);
		ArrayList<Ereceiver> ref = eService.refList(mId);
		ArrayList<Ereceiver> hide = eService.hideList(mId);
		ArrayList<Attachment> alist = eService.atList(mId);
		for(int i = 0; i < alist.size(); i++) {
			System.out.println(alist.get(i));
		}
		r = eService.sEmailDetail(mId);
		if(r != null) {
			model.addAttribute("sendId", sendId);
			model.addAttribute("id", id);
			model.addAttribute("receiver", receiver);
			model.addAttribute("ref", ref);
			model.addAttribute("hide", hide);
			model.addAttribute("email", r);
			model.addAttribute("alist", alist);
			return "email/receiveEmailDetailView";
		} else {
			model.addAttribute("msg", "받은메일 상세보기 실패했습니다.");
			return "common/errorPage";
		}
	}
	
	@RequestMapping("emailAddr.do")
	public ModelAndView emailAddrView(ModelAndView mv) {
		ArrayList<EmailAddr> list = eService.selectEmpAddrList();
		if(list != null) {
			mv.addObject("list", list);
			mv.setViewName("email/emailAddr");
		} else {
			throw new EmailException("주소록 조회 실패");
		}
		return mv;
	}
	
	@RequestMapping("sendEmailGoId.do")
	public String sendEmailGoId(String eId, Model model, RsEmail r) {
		model.addAttribute("eId", eId);
		return "email/sendEmailForm";
	}
	
	@RequestMapping("esend.do")
	public String emailInsert(String[] reId, String[] feId, String[] heId, Email e, HttpServletRequest request,
			@RequestParam(value="uploadFile", required=false) MultipartFile[] files, HttpSession session) {
		ArrayList<Attachment> alist = new ArrayList<>();
		
		String root = request.getSession().getServletContext().getRealPath("resources");
		String savePath = root + "\\eUploadFiles";
		File folder = new File(savePath);
		for(int i = 0; i < files.length; i++) {
			System.out.println(files[i]);
		}
		for (MultipartFile file : files) {
			if(!file.getOriginalFilename().isEmpty()) {
				String renameFileName = saveFile(file, request);
				String renamePath = folder + "\\" + renameFileName;
				
				if (renameFileName != null) {
					Attachment at = new Attachment();
					at.setOriginName(file.getOriginalFilename());
					at.setChangeName(renameFileName);
					at.setFilePath(renamePath);
					alist.add(at);
				}
			}
		}
		System.out.println(alist);
		Employee loginUser = (Employee)session.getAttribute("loginUser");
		String id = loginUser.geteId();
		e.setEeId(id);
		ArrayList<Ereceiver> rlist = new ArrayList<Ereceiver>();
		ArrayList<Ereceiver> flist = new ArrayList<Ereceiver>();
		ArrayList<Ereceiver> hlist = new ArrayList<Ereceiver>();
		int eresult = eService.insertEmail(e);
		
		if(reId != null) {
			for(int i = 0; i < reId.length; i++) {
				Ereceiver r = new Ereceiver();
				String[] rr = reId[i].split("@");
				r.seteId(rr[0]);
				rlist.add(r);
			}
			int rresult = eService.insertRec(rlist);
		}
		
		if(feId != null) {
			for(int i = 0; i < feId.length; i++) {
				Ereceiver f = new Ereceiver();
				String[] ff = feId[i].split("@");
				f.seteId(ff[0]);
				flist.add(f);
			}
			int fresult = eService.insertRef(flist);
		}
		
		if(heId != null) {
			for(int i = 0; i < heId.length; i++) {
				Ereceiver h = new Ereceiver();
				String[] hh = heId[i].split("@");
				h.seteId(hh[0]);
				hlist.add(h);
			}
			int hresult = eService.insertHid(hlist);
		}
		
		if(!alist.isEmpty()) {
			int atresult = eService.insertAttachment(alist);
		}
		return "redirect:sendMailList.do";
	}
	
	@RequestMapping("etemp.do")
	public String tempInsert(String[] reId, String[] feId, String[] heId, Email e, HttpServletRequest request,
			@RequestParam(value="uploadFile", required=false) MultipartFile[] files, HttpSession session) {
		ArrayList<Attachment> alist = new ArrayList<>();
		
		String root = request.getSession().getServletContext().getRealPath("resources");
		String savePath = root + "\\eUploadFiles";
		File folder = new File(savePath);
		
		for (MultipartFile file : files) {
			if(!file.getOriginalFilename().isEmpty()) {
				String renameFileName = saveFile(file, request);
				String renamePath = folder + "\\" + renameFileName;
				
				if (renameFileName != null) {
					Attachment at = new Attachment();
					at.setOriginName(file.getOriginalFilename());
					at.setChangeName(renameFileName);
					at.setFilePath(renamePath);
					alist.add(at);
				}
			}
		}
		
		Employee loginUser = (Employee)session.getAttribute("loginUser");
		String id = loginUser.geteId();
		e.setEeId(id);
		ArrayList<Ereceiver> rlist = new ArrayList<Ereceiver>();
		ArrayList<Ereceiver> flist = new ArrayList<Ereceiver>();
		ArrayList<Ereceiver> hlist = new ArrayList<Ereceiver>();
		
		int eresult = eService.insertTemp(e);
		
		if(reId != null) {
			for(int i = 0; i < reId.length; i++) {
				Ereceiver r = new Ereceiver();
				String[] rr = reId[i].split("@");
				r.seteId(rr[0]);
				rlist.add(r);
			}
			int rresult = eService.insertRec(rlist);
		}
		
		if(feId != null) {
			for(int i = 0; i < feId.length; i++) {
				Ereceiver f = new Ereceiver();
				String[] ff = feId[i].split("@");
				f.seteId(ff[0]);
				flist.add(f);
			}
			int fresult = eService.insertRef(flist);
		}
		
		if(heId != null) {
			for(int i = 0; i < heId.length; i++) {
				Ereceiver h = new Ereceiver();
				String[] hh = heId[i].split("@");
				h.seteId(hh[0]);
				hlist.add(h);
			}
			int hresult = eService.insertHid(hlist);
		}
		if(!alist.isEmpty()) {
			int atresult = eService.insertAttachment(alist);
		}
		return "redirect:temporaryEmailList.do";
	}
	
	// 파일 저장을 위한 별도 메소드
		public String saveFile(MultipartFile file, HttpServletRequest request) {
			// 파일이 저장 될 경로 설정
			// 해당 resources는 webapp 하위의 resources
			int rnum = ((int)(Math.random()*10000)+1);
			String root = request.getSession().getServletContext().getRealPath("resources");

			String savePath = root + "\\eUploadFiles";

			File folder = new File(savePath); // savePath 폴더를 불러와서
			// 해당 폴더 경로가 존재하는지 확인하고
			if (!folder.exists()) {// 존재하지 않는다면
				folder.mkdirs(); // 해당 경로를 먼저 생성한다
			}

			// 파일 rename 규칙 -> 년월일시분초.확장자
			SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
			String originFileName = file.getOriginalFilename();
			String renameFileName = sdf.format(new Date()) + rnum + originFileName.substring(originFileName.lastIndexOf("."));

			String renamePath = folder + "\\" + renameFileName;
			// 실제 저장 될 파일 경로 + "\\" + 넘어온 파일명

			
			// 이 메소드가 실행되는 순간 해당 경로(filePath)에 넘어온 MultipartFile이 저장된다
			try {
				file.transferTo(new File(renamePath));
			} catch (IllegalStateException | IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

			return renameFileName;
		}
	
	@RequestMapping("tempDetail.do")
	public String tempDetail(int mId, RsEmail r, Model model, HttpSession session) {
		Employee loginUser = (Employee)session.getAttribute("loginUser");
		String id = loginUser.geteId();
		String sendId = eService.selectSendId(mId);
		ArrayList<Ereceiver> receiver = eService.receiverList(mId);
		ArrayList<Ereceiver> ref = eService.refList(mId);
		ArrayList<Ereceiver> hide = eService.hideList(mId);
		ArrayList<Attachment> alist = eService.atList(mId);
		r = eService.sEmailDetail(mId);
		if(r != null) {
			model.addAttribute("sendId", sendId);
			model.addAttribute("id", id);
			model.addAttribute("receiver", receiver);
			model.addAttribute("ref", ref);
			model.addAttribute("hide", hide);
			model.addAttribute("email", r);
			model.addAttribute("alist", alist);
			return "email/tempEmailDetailForm";
		} else {
			model.addAttribute("msg", "받은메일 상세보기 실패했습니다.");
			return "common/errorPage";
		}
	}
	
	/* 임시저장 또다시 임시저장 */
	@RequestMapping("updateTemp.do")
	public String updateTemp(String[] reId, String[] feId, String[] heId, Email e, HttpServletRequest request,
			@RequestParam(value="uploadFile", required=false) MultipartFile[] files, HttpSession session,
			String[] uploadFile2, Attachment a) {
		ArrayList<Attachment> alist = new ArrayList<>();
		for(int i = 0; i < files.length; i++) {
			System.out.println(files[i]);
		}
		if(uploadFile2 != null) {
		for(int i = 0; i < uploadFile2.length; i++) {
			Attachment atmt = new Attachment();
			atmt.setmId(e.getmId());
			atmt.setChangeName(uploadFile2[i]);
			a = eService.selectafaf(atmt);
			alist.add(a);
		}
		}
		/*alist = eService.selectafList(afList);*/
		
		String root = request.getSession().getServletContext().getRealPath("resources");
		String savePath = root + "\\eUploadFiles";
		File folder = new File(savePath);
		
		for (MultipartFile file : files) {
			if(!file.getOriginalFilename().isEmpty()) {
				String renameFileName = saveFile(file, request);
				String renamePath = folder + "\\" + renameFileName;
				
				if (renameFileName != null) {
					Attachment at = new Attachment();
					at.setOriginName(file.getOriginalFilename());
					at.setChangeName(renameFileName);
					at.setFilePath(renamePath);
					at.setmId(e.getmId());
					alist.add(at);
				}
			}
		}
		
		
		Employee loginUser = (Employee)session.getAttribute("loginUser");
		String id = loginUser.geteId();
		ArrayList<Email> elist = new ArrayList<Email>();
		elist = eService.checkmId(id);
		e.setEeId(id);
		ArrayList<Ereceiver> rlist = new ArrayList<Ereceiver>();
		ArrayList<Ereceiver> flist = new ArrayList<Ereceiver>();
		ArrayList<Ereceiver> hlist = new ArrayList<Ereceiver>();
		
		int m = e.getmId();
		System.out.println(m);
		int eresult = eService.againTemp(e);
		
		if(eresult > 0) {
			int deleteResult = eService.deleteReceiver(m);
		}
			
		if(reId != null) {
			for(int i = 0; i < reId.length; i++) {
				Ereceiver r = new Ereceiver();
				String[] rr = reId[i].split("@");
				r.setmId(m);
				r.seteId(rr[0]);
				rlist.add(r);
			}
			int rresult = eService.updateTempRec(rlist);
		}
		
		if(feId != null) {
			for(int i = 0; i < feId.length; i++) {
				Ereceiver f = new Ereceiver();
				String[] ff = feId[i].split("@");
				f.setmId(m);
				f.seteId(ff[0]);
				flist.add(f);
			}
			int fresult = eService.updateTempRef(flist);
		}
		
		if(heId != null) {
			for(int i = 0; i < heId.length; i++) {
				Ereceiver h = new Ereceiver();
				String[] hh = heId[i].split("@");
				h.setmId(m);
				h.seteId(hh[0]);
				hlist.add(h);
			}
			int hresult = eService.updateTempHid(hlist);
		}
		if(!alist.isEmpty()) {
			int atresult2 = eService.deleteAttachment(e.getmId());
			int atresult = eService.insertSaveAttachment(alist);
		}
		return "redirect:temporaryEmailList.do";
	}
	
	/* 임시저장 전송 */
	@RequestMapping("updateTempToSend.do")
	public String updateTempToSend(String[] reId, String[] feId, String[] heId, Email e, HttpServletRequest request,
			@RequestParam(value="uploadFile", required=false) MultipartFile[] files, HttpSession session,
			String[] uploadFile2, Attachment a) {
		ArrayList<Attachment> alist = new ArrayList<>();
		for(int i = 0; i < files.length; i++) {
			System.out.println(files[i]);
		}
		if(uploadFile2 != null) {
		for(int i = 0; i < uploadFile2.length; i++) {
			Attachment atmt = new Attachment();
			atmt.setmId(e.getmId());
			atmt.setChangeName(uploadFile2[i]);
			a = eService.selectafaf(atmt);
			alist.add(a);
		}
		}
		String root = request.getSession().getServletContext().getRealPath("resources");
		String savePath = root + "\\eUploadFiles";
		File folder = new File(savePath);
		
		for (MultipartFile file : files) {
			if(!file.getOriginalFilename().isEmpty()) {
				String renameFileName = saveFile(file, request);
				String renamePath = folder + "\\" + renameFileName;
				
				if (renameFileName != null) {
					Attachment at = new Attachment();
					at.setOriginName(file.getOriginalFilename());
					at.setChangeName(renameFileName);
					at.setFilePath(renamePath);
					at.setmId(e.getmId());
					alist.add(at);
				}
			}
		}
		
		Employee loginUser = (Employee)session.getAttribute("loginUser");
		String id = loginUser.geteId();
		ArrayList<Email> elist = new ArrayList<Email>();
		elist = eService.checkmId(id);
		e.setEeId(id);
		ArrayList<Ereceiver> rlist = new ArrayList<Ereceiver>();
		ArrayList<Ereceiver> flist = new ArrayList<Ereceiver>();
		ArrayList<Ereceiver> hlist = new ArrayList<Ereceiver>();
		
		int m = e.getmId();
		System.out.println(m);
		int eresult = eService.updateTempToSend(e);
		
		if(eresult > 0) {
			int deleteResult = eService.deleteReceiver(m);
		}
			
		if(reId != null) {
			for(int i = 0; i < reId.length; i++) {
				Ereceiver r = new Ereceiver();
				String[] rr = reId[i].split("@");
				r.setmId(m);
				r.seteId(rr[0]);
				rlist.add(r);
			}
			int rresult = eService.updateTempRec(rlist);
		}
		
		if(feId != null) {
			for(int i = 0; i < feId.length; i++) {
				Ereceiver f = new Ereceiver();
				String[] ff = feId[i].split("@");
				f.setmId(m);
				f.seteId(ff[0]);
				flist.add(f);
			}
			int fresult = eService.updateTempRef(flist);
		}
		
		if(heId != null) {
			for(int i = 0; i < heId.length; i++) {
				Ereceiver h = new Ereceiver();
				String[] hh = heId[i].split("@");
				h.setmId(m);
				h.seteId(hh[0]);
				hlist.add(h);
			}
			int hresult = eService.updateTempHid(hlist);
		}
		if(!alist.isEmpty()) {
			int atresult2 = eService.deleteAttachment(e.getmId());
			int atresult = eService.insertSaveAttachment(alist);
		}
		return "redirect:sendMailList.do";
	}
	
	@RequestMapping("searchR.do")
	public ModelAndView receiveSearch(SearchEmail se, ModelAndView mv, HttpSession session,
			@RequestParam(value="page", required=false) Integer page) {
		Employee loginUser = (Employee)session.getAttribute("loginUser");
		String id = loginUser.geteId();
		se.seteId(id);
		
		int currentPage = page != null ? page : 1;
		int listCount = eService.searchReceiveEmailCount(se);
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount);
		
		ArrayList<RsEmail> searchList = eService.searchR(se, pi);
		
		if(searchList != null) {
			mv.addObject("list", searchList);
			mv.addObject("pi", pi);
			mv.addObject("se", se);
			mv.setViewName("email/receiveEmailListView");
		} else {
			throw new EmailException("검색 실패");
		}
		return mv;
	}
	
	@RequestMapping("searchF.do")
	public ModelAndView refSearch(SearchEmail se, ModelAndView mv, HttpSession session,
			@RequestParam(value="page", required=false) Integer page) {
		Employee loginUser = (Employee)session.getAttribute("loginUser");
		String id = loginUser.geteId();
		se.seteId(id);
		
		int currentPage = page != null ? page : 1;
		int listCount = eService.searchRefEmailCount(se);
		System.out.println("currentPage : " + currentPage);
		System.out.println(listCount);
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount);
		
		ArrayList<RsEmail> searchList = eService.searchF(se, pi);
		
		if(searchList != null) {
			mv.addObject("list", searchList);
			mv.addObject("pi", pi);
			mv.addObject("se", se);
			mv.setViewName("email/sendEmailListView");
		} else {
			throw new EmailException("검색 실패");
		}
		return mv;
	}
	
	@RequestMapping("searchH.do")
	public ModelAndView hideSearch(SearchEmail se, ModelAndView mv, HttpSession session,
			@RequestParam(value="page", required=false) Integer page) {
		Employee loginUser = (Employee)session.getAttribute("loginUser");
		String id = loginUser.geteId();
		se.seteId(id);
		
		int currentPage = page != null ? page : 1;
		int listCount = eService.searchHidEmailCount(se);
		System.out.println("currentPage : " + currentPage);
		System.out.println(listCount);
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount);
		
		ArrayList<RsEmail> searchList = eService.searchH(se, pi);
		System.out.println(searchList);
		if(searchList != null) {
			mv.addObject("list", searchList);
			mv.addObject("pi", pi);
			mv.addObject("se", se);
			mv.setViewName("email/temporaryEmailListView");
		} else {
			throw new EmailException("검색 실패");
		}
		return mv;
	}
	
	/* 받은메일함 선택삭제 */
	@RequestMapping("rEmailDelete.do")
	public String rEmailDelete(String check, HttpSession session) {
		Employee loginUser = (Employee)session.getAttribute("loginUser");
		String id = loginUser.geteId();
		String[] sArr = check.split(",");
		int[] iArr = Arrays.stream(sArr).mapToInt(Integer::parseInt).toArray();
		ArrayList<Email> rlist = new ArrayList<>();
		for(int i = 0; i < iArr.length; i++) {
			Email e = new Email();
			e.setmId(iArr[i]);
			e.setEeId(id);
			rlist.add(e);
		}
		int result = eService.rEmailDelete(rlist);
		return "redirect:receiveMailList.do";
	}
	
	/* 보낸메일 선택삭제 */
	@RequestMapping("sEmailDelete.do")
	public String sEmailDelete(String check, HttpSession session) {
		Employee loginUser = (Employee)session.getAttribute("loginUser");
		String id = loginUser.geteId();
		String[] sArr = check.split(",");
		int[] iArr = Arrays.stream(sArr).mapToInt(Integer::parseInt).toArray();
		ArrayList<Email> slist = new ArrayList<>();
		for(int i = 0; i < iArr.length; i++) {
			Email e = new Email();
			e.setmId(iArr[i]);
			e.setEeId(id);
			slist.add(e);
		}
		int result = eService.sEmailDelete(slist);
		return "redirect:sendMailList.do";
	}
	
	/* 임시저장 선택삭제 */
	@RequestMapping("tEmailDelete.do")
	public String tEmailDelete(String check, HttpSession session) {
		Employee loginUser = (Employee)session.getAttribute("loginUser");
		String id = loginUser.geteId();
		String[] sArr = check.split(",");
		int[] iArr = Arrays.stream(sArr).mapToInt(Integer::parseInt).toArray();
		ArrayList<Email> tlist = new ArrayList<>();
		ArrayList<Ereceiver> elist = new ArrayList<>();
		for(int i = 0; i < iArr.length; i++) {
			Email e = new Email();
			Ereceiver r = new Ereceiver();
			e.setmId(iArr[i]);
			e.setEeId(id);
			tlist.add(e);
			r.setmId(iArr[i]);
			elist.add(r);
		}
		int eresult = eService.tEmailReceiverDelete(elist);
		int result = eService.tEmailDelete(tlist);
		return "redirect:temporaryEmailList.do";
	}
	
	@RequestMapping("replyEmailDetailForm.do")
	public String replyEmailDetailForm(int mId, String sendId, Model model) {
		RsEmail re = eService.reply(mId);
		ArrayList<Attachment> alist = eService.atList(mId);
		model.addAttribute("eId", sendId);
		model.addAttribute("email", re);
		model.addAttribute("alist", alist);
		return "email/replyEmailDetailForm";
	}
	
	@RequestMapping("delEmailDetailForm.do")
	public String delEmailDetailForm(int mId, Model model) {
		RsEmail re = eService.reply(mId);
		ArrayList<Attachment> alist = eService.atList(mId);
		model.addAttribute("email", re);
		model.addAttribute("alist", alist);
		return "email/delEmailDetailForm";
	}
	
	@RequestMapping("del.do")
	public String delEmail(String[] reId, String[] feId, String[] heId, Email e, HttpServletRequest request,
			@RequestParam(value="uploadFile", required=false) MultipartFile[] files, HttpSession session,
			String[] uploadFile2, Attachment a) {
		ArrayList<Attachment> alist = new ArrayList<>();
		
		if(uploadFile2 != null) {
			for(int i = 0; i < uploadFile2.length; i++) {
				Attachment atmt = new Attachment();
				atmt.setmId(e.getmId());
				atmt.setChangeName(uploadFile2[i]);
				a = eService.selectafaf(atmt);
				alist.add(a);
			}
		}
		
		String root = request.getSession().getServletContext().getRealPath("resources");
		String savePath = root + "\\eUploadFiles";
		File folder = new File(savePath);
		for(int i = 0; i < files.length; i++) {
			System.out.println(files[i]);
		}
		for (MultipartFile file : files) {
			if(!file.getOriginalFilename().isEmpty()) {
				String renameFileName = saveFile(file, request);
				String renamePath = folder + "\\" + renameFileName;
				
				if (renameFileName != null) {
					Attachment at = new Attachment();
					at.setOriginName(file.getOriginalFilename());
					at.setChangeName(renameFileName);
					at.setFilePath(renamePath);
					alist.add(at);
				}
			}
		}
		Employee loginUser = (Employee)session.getAttribute("loginUser");
		String id = loginUser.geteId();
		e.setEeId(id);
		ArrayList<Ereceiver> rlist = new ArrayList<Ereceiver>();
		ArrayList<Ereceiver> flist = new ArrayList<Ereceiver>();
		ArrayList<Ereceiver> hlist = new ArrayList<Ereceiver>();
		int eresult = eService.insertEmail(e);
		
		if(reId != null) {
			for(int i = 0; i < reId.length; i++) {
				Ereceiver r = new Ereceiver();
				String[] rr = reId[i].split("@");
				r.seteId(rr[0]);
				rlist.add(r);
			}
			int rresult = eService.insertRec(rlist);
		}
		
		if(feId != null) {
			for(int i = 0; i < feId.length; i++) {
				Ereceiver f = new Ereceiver();
				String[] ff = feId[i].split("@");
				f.seteId(ff[0]);
				flist.add(f);
			}
			int fresult = eService.insertRef(flist);
		}
		
		if(heId != null) {
			for(int i = 0; i < heId.length; i++) {
				Ereceiver h = new Ereceiver();
				String[] hh = heId[i].split("@");
				h.seteId(hh[0]);
				hlist.add(h);
			}
			int hresult = eService.insertHid(hlist);
		}
		
		if(!alist.isEmpty()) {
			int atresult = eService.insertAttachment(alist);
		}
		return "redirect:sendMailList.do";
	}
	
	@RequestMapping("delTemp.do")
	public String delTemp(String[] reId, String[] feId, String[] heId, Email e, HttpServletRequest request,
			@RequestParam(value="uploadFile", required=false) MultipartFile[] files, HttpSession session,
			String[] uploadFile2, Attachment a) {
		ArrayList<Attachment> alist = new ArrayList<>();
		
		if(uploadFile2 != null) {
			for(int i = 0; i < uploadFile2.length; i++) {
				Attachment atmt = new Attachment();
				atmt.setmId(e.getmId());
				atmt.setChangeName(uploadFile2[i]);
				a = eService.selectafaf(atmt);
				alist.add(a);
			}
		}
		
		String root = request.getSession().getServletContext().getRealPath("resources");
		String savePath = root + "\\eUploadFiles";
		File folder = new File(savePath);
		
		for (MultipartFile file : files) {
			if(!file.getOriginalFilename().isEmpty()) {
				String renameFileName = saveFile(file, request);
				String renamePath = folder + "\\" + renameFileName;
				
				if (renameFileName != null) {
					Attachment at = new Attachment();
					at.setOriginName(file.getOriginalFilename());
					at.setChangeName(renameFileName);
					at.setFilePath(renamePath);
					alist.add(at);
				}
			}
		}
		
		Employee loginUser = (Employee)session.getAttribute("loginUser");
		String id = loginUser.geteId();
		e.setEeId(id);
		ArrayList<Ereceiver> rlist = new ArrayList<Ereceiver>();
		ArrayList<Ereceiver> flist = new ArrayList<Ereceiver>();
		ArrayList<Ereceiver> hlist = new ArrayList<Ereceiver>();
		
		int eresult = eService.insertTemp(e);
		
		if(reId != null) {
			for(int i = 0; i < reId.length; i++) {
				Ereceiver r = new Ereceiver();
				String[] rr = reId[i].split("@");
				r.seteId(rr[0]);
				rlist.add(r);
			}
			int rresult = eService.insertRec(rlist);
		}
		
		if(feId != null) {
			for(int i = 0; i < feId.length; i++) {
				Ereceiver f = new Ereceiver();
				String[] ff = feId[i].split("@");
				f.seteId(ff[0]);
				flist.add(f);
			}
			int fresult = eService.insertRef(flist);
		}
		
		if(heId != null) {
			for(int i = 0; i < heId.length; i++) {
				Ereceiver h = new Ereceiver();
				String[] hh = heId[i].split("@");
				h.seteId(hh[0]);
				hlist.add(h);
			}
			int hresult = eService.insertHid(hlist);
		}
		if(!alist.isEmpty()) {
			int atresult = eService.insertAttachment(alist);
		}
		return "redirect:temporaryEmailList.do";
	}
	
}
