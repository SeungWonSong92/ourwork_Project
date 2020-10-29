package com.kh.ourwork.notice.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.codec.multipart.SynchronossPartHttpMessageReader;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.annotation.JsonCreator.Mode;
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.kh.ourwork.common.Attachment;
import com.kh.ourwork.common.PageInfo;
import com.kh.ourwork.common.Pagination;
import com.kh.ourwork.common.Search;
import com.kh.ourwork.employee.model.vo.Employee;
import com.kh.ourwork.notice.model.exception.NoticeException;
import com.kh.ourwork.notice.model.service.NoticeService;
import com.kh.ourwork.notice.model.vo.Notice;
import com.kh.ourwork.notice.model.vo.nReply;
import com.kh.ourwork.pteam.model.service.pteamService;
import com.kh.ourwork.pteam.model.vo.Employee1;

@Controller
public class NoticeController {
	@Autowired
	private NoticeService nService;
	
	private Logger logger = LoggerFactory.getLogger(NoticeController.class);
	
	@RequestMapping("noticeMain.do")
	public ModelAndView noticeList(ModelAndView mv, HttpSession session,
			@RequestParam(value="page", required=false) Integer page) {
		
		int currentPage = page != null ? page : 1;
		
		Employee loginUser = (Employee)session.getAttribute("loginUser");
		
		
		// 1. 전체 게시글 개수 수 리턴 받기
		int listCount = nService.selectListCount();
		
		// 페이징 정보 만들기
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount);
		
		
		ArrayList<Notice> list = nService.selectList(pi);
		
		if(list != null) {
			mv.addObject("list", list);
			mv.addObject("loginUser", loginUser);
			mv.addObject("pi", pi);
//			여기에 loginUser담아가야함
			mv.setViewName("notice/noticeMain");
		} else {
			mv.addObject("msg", "공지사항 목록 조회에 실패하였습니다.");
			mv.setViewName("common/errorPage");
		}
		
		return mv;
	}
	
	// 팀별 게시판 이동 팀별게시판 보기
	@RequestMapping("tnoticeMain.do")
	public ModelAndView tNoticeList(ModelAndView mv, HttpSession session,
			@RequestParam(value="page", required=false) Integer page) {
		int currentPage = page != null ? page : 1;
		
		Employee loginUser = (Employee)session.getAttribute("loginUser");
		
		String eId = loginUser.geteId();
		
		Employee1 Employee = nService.selectEmp(eId);
		
		int dId = Employee.getdId();
		
		int listCount = nService.tselectListCount2(dId);
		
		// 페이징 정보 만들기
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount);
		
		ArrayList<Notice> list = nService.tselectList2(dId, pi);
		
		if(list != null) {
			mv.addObject("list", list);
			mv.addObject("loginUser", Employee);
			mv.addObject("pi", pi);
			mv.setViewName("notice/teamNotice");
		} else {
			mv.addObject("msg", "공지사항 목록 조회에 실패하였습니다.");
			mv.setViewName("common/errorPage");
		}
		return mv;
	}
	
	// 팀별 공지사항 이동
		@RequestMapping("tBoardMain.do")
		public ModelAndView tBoardList(ModelAndView mv, HttpSession session,
				@RequestParam(value="page", required=false) Integer page) {
			int currentPage = page != null ? page : 1;
			
			Employee loginUser = (Employee)session.getAttribute("loginUser");
			
			String eId = loginUser.geteId();
			
			Employee1 Employee = nService.selectEmp(eId);
			
			int dId = Employee.getdId();
			
			int listCount = nService.tselectListCount1(dId);
			
			// 페이징 정보 만들기
			PageInfo pi = Pagination.getPageInfo(currentPage, listCount);
			
			ArrayList<Notice> list = nService.tselectList1(dId, pi);
			
			if(list != null) {
				mv.addObject("list", list);
				mv.addObject("loginUser", Employee);
				mv.addObject("pi", pi);
				mv.setViewName("notice/teamBoard");
			} else {
				mv.addObject("msg", "공지사항 목록 조회에 실패하였습니다.");
				mv.setViewName("common/errorPage");
			}
			return mv;
		}
	
	

	@RequestMapping("detail.do")
	public ModelAndView notice(ModelAndView mv, int nNo, HttpSession session,
			@RequestParam("page") Integer page,
			HttpServletRequest request, HttpServletResponse response) {
		
		int currentPage = page != null ? page : 1;
		
		Employee loginUser = (Employee)session.getAttribute("loginUser");
		
		Attachment at = nService.selectAttachment(nNo);
		
		
		Notice notice = null;
		boolean flag= false;
		
		
		notice = nService.selectNotice(nNo, flag);
		
		
		if(notice != null) {
			mv.addObject("notice", notice)
			  .addObject("loginUser", loginUser)
			  .addObject("at", at)
			  .addObject("currentPage", currentPage)
			  .setViewName("notice/noticeDetail");
		}else {
			throw new NoticeException("게시글 상세조회에 실패하였습니다.");
		}
		
		return mv;
	}
	
	// 팀 게시판 디테일 쪽
	@RequestMapping("tdetail.do")
	public ModelAndView tnotice(ModelAndView mv, int nNo, HttpSession session,
			@RequestParam("page") Integer page,
			HttpServletRequest request, HttpServletResponse response) {
		
		
		int currentPage = page != null ? page : 1;
		
		Employee loginUser = (Employee)session.getAttribute("loginUser");
		
		Attachment at = nService.selectAttachment(nNo);
		
		Notice notice = null;
		boolean flag= false;
		
		
		notice = nService.selectNotice(nNo, flag);
		
		
		if(notice != null) {
			mv.addObject("notice", notice)
			.addObject("loginUser", loginUser)
			.addObject("at", at)
			.addObject("currentPage", currentPage)
			.setViewName("notice/tnoticeDetail");
		}else {
			throw new NoticeException("게시글 상세조회에 실패하였습니다.");
		}
		
		return mv;
	}
	
	// 작성하기 페이지 이동
	@RequestMapping("noticeInsert.do")
	public String noticeInsertV() {
		return "notice/noticeInsert";
	}
	
	// 팀 게시판 작성하기 페이지 이동
	@RequestMapping("tnoticeInsert.do")
	public String tnoticeInsertV() {
		return "notice/tnoticeInsert";
	}
	
	
	// detail에서 수정하기 버튼 눌렀을 때
	@RequestMapping("upno.do")
	public ModelAndView noticeUpdateV(ModelAndView mv, int nNo, 
									@RequestParam("page") Integer page,
									HttpServletRequest request, HttpServletResponse response) {
		Notice notice = nService.selectNotice(nNo, true);
		
		Attachment at = nService.selectAttachment(nNo);
		
		mv.addObject("notice", notice)
		  .addObject("currentPage", page)
		  .addObject("at", at)
		  .setViewName("notice/noticeUpdate");
		
		return mv;
	}
	
	// detail에서 수정하기 버튼 눌렀을때 파일 없을때!!
	@RequestMapping("upnono.do")
	public ModelAndView noticenofileUp(ModelAndView mv, int nNo,@RequestParam("page") Integer page,
			HttpServletRequest request, HttpServletResponse response) {
		System.out.println("여기 파일 없을떄");
		Notice notice = nService.selectNotice(nNo, true);
		
		Attachment at = nService.selectAttachment(nNo);
		System.out.println("at : " + at);
		mv.addObject("notice", notice)
		  .addObject("currentPage", page)
		  .addObject("at", at)
		  .setViewName("notice/noticeUpdate2");
		return mv;
	}
	
	// 파일 없을때 수정 버튼 누를때 들어오는곳
	@RequestMapping("uupnot.do")
	public String updateNo(Notice n, HttpServletRequest request,
							   @RequestParam(value="reloadFile", required=false) MultipartFile file) {
		String root = request.getSession().getServletContext().getRealPath("resources");
		String savePath = root + "/images/noticeUploadFiles";
		File folder = new File(savePath);
		int result1 = nService.Update(n);
//		System.out.println("result1 " + result1);
		
		if(!file.getOriginalFilename().equals("")&& result1 >0) {
			String renameFileName = saveFile(file, request);
			String renamePath = folder + "/" + renameFileName;
			
			
			if(renameFileName != null) {
				
				Attachment at = new Attachment(renamePath, file.getOriginalFilename(), renameFileName, new Date(), 70);
				
				at.setnNo(n.getnNo());
				System.out.println("at : " + at);
				int result2 = nService.insertAttachment3(at);
				System.out.println("result2 : " + result2);
			}
		}
		if(result1>0) {
			return "redirect:noticeMain.do";
		}else {
			throw new NoticeException("게시물 등록에 실패하였습니다.");
		}
	
	}
	
	// 팀 게시글  detail에서 수정하기 버튼 눌렀을 때
	@RequestMapping("tupno.do")
	public ModelAndView tnoticeUpdateV(ModelAndView mv, int nNo, 
			@RequestParam("page") Integer page,
			HttpServletRequest request, HttpServletResponse response) {
		Notice notice = nService.selectNotice(nNo, true);
		
		Attachment at = nService.selectAttachment(nNo);
		
		mv.addObject("notice", notice)
		.addObject("currentPage", page)
		.addObject("at", at)
		.setViewName("notice/tnoticeUpdate");
		
		return mv;
	}
	
	// 게시판 등록
	@RequestMapping("ninsert.do")
	public String noticeInsert(Notice n, HttpServletRequest request,
							   @RequestParam(value="reloadFile", required=false) MultipartFile file) {
		
		String root = request.getSession().getServletContext().getRealPath("resources");
		String savePath = root + "/images/noticeUploadFiles";
		File folder = new File(savePath);
		
		int result1 = nService.insertNotice(n);
		
		if(!file.getOriginalFilename().equals("")&& result1 >0) {
			String renameFileName = saveFile(file, request);
			String renamePath = folder + "/" + renameFileName;
			
			System.out.println("이프문 들어옴?");
			if(renameFileName != null) {
				Attachment at = new Attachment(renamePath, file.getOriginalFilename(), renameFileName, new Date(), 70);
				int result2 = nService.insertAttachment(at);
				System.out.println("여기 result2: " + result2);
			}
		}
		
		if(result1>0) {
			return "redirect:noticeMain.do";
		}else {
			throw new NoticeException("게시물 등록에 실패하였습니다.");
		}
		
	}
	
	// 팀별  게시판 게시글 등록
	@RequestMapping("tninsert.do")
	public String tnoticeInsert(Notice n, HttpServletRequest request,HttpSession session,
			@RequestParam(value="uploadFile", required=false) MultipartFile file) {
		
		String root = request.getSession().getServletContext().getRealPath("resources");
		String savePath = root + "/images/noticeUploadFiles";
		File folder = new File(savePath);
		
		Employee loginUser = (Employee)session.getAttribute("loginUser");
		
		n.setNo(loginUser.getdId());
		
		int result1 = nService.insertNotice2(n);
		
		
		if(!file.getOriginalFilename().equals("")&& result1 >0) {
			String renameFileName = saveFile(file, request);
			String renamePath = folder + "/" + renameFileName;
			
			
			if(renameFileName != null) {
				Attachment at = new Attachment(renamePath, file.getOriginalFilename(), renameFileName, new Date(), 70);
				int result2 = nService.insertAttachment(at);
			}
		}
		
		if(result1>0) {
			return "redirect:tnoticeMain.do";
		}else {
			throw new NoticeException("게시물 등록에 실패하였습니다.");
		}
		
	}
	
	
	// 파일 저장 메소드
	private String saveFile(MultipartFile file, HttpServletRequest request) {
		
		String root = request.getSession().getServletContext().getRealPath("resources");
		
		String savePath = root + "/images/noticeUploadFiles";
		
		File folder = new File(savePath);
		
		if(!folder.exists()) {
			folder.mkdirs();
		}
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
		String originFileName = file.getOriginalFilename();
		String renameFileName = sdf.format(new Date()) + originFileName.substring(originFileName.lastIndexOf("."));
	
		String renamePath = folder + "/" + renameFileName;
		
		try {
			file.transferTo(new File(renamePath));
		} catch (IllegalStateException | IOException e) {
			e.printStackTrace();
		}
		return renameFileName;
	}
	
	
	
	
	// 수정페이지에서 수정을 눌럿을때
	@RequestMapping("updateno.do")
	public ModelAndView noticeUpdate(Notice n,HttpServletRequest request, @RequestParam(value="page") Integer page,
			@RequestParam(value="reloadFile", required=false) MultipartFile reloadFile,
			  ModelAndView mv) { // noticeUpdate.jsp에서 파일추가해야함!
		
		int currentPage = page != null ? page : 1;
		
		Attachment at = nService.selectAttachment(n.getnNo());
		
		if(at == null) {
			String root = request.getSession().getServletContext().getRealPath("resources");
			String savePath = root + "/images/noticeUploadFiles";
			File folder = new File(savePath);
			
			if(reloadFile != null && !reloadFile.isEmpty()) {
				String renameFileName = saveFile(reloadFile, request);
				String renamePath = folder + "/" + renameFileName;
				Attachment att = new Attachment(n.getnNo(), renamePath, reloadFile.getOriginalFilename(), renameFileName, 70);
				int result4 = nService.insertAttachment2(att);
				
				System.out.println("dddddd"+result4);
							}
		}
		System.out.println("여기 사이 ");
		
//		System.out.println("at: " + at.getChangeName());
		if(reloadFile != null && !reloadFile.isEmpty()) {
			System.out.println(at.getChangeName());
			System.out.println("여긴 들어와?");
			if(!at.getChangeName().equals("")) {
				System.out.println("여긴 안들?");
				deleteFile(at.getChangeName(), request);
			}
			System.out.println("여긴 사이 : ");
			
			String savePath = saveFile(reloadFile, request);
			File folder = new File(savePath);
			String renamePath = folder + "/" + at.getChangeName();
			if(savePath != null) {
				System.out.println("여기 savePath 사이");
				at.setChangeName(savePath);
				at.setOriginName(reloadFile.getOriginalFilename());
				at.setFilePath(renamePath);
				at.setnNo(n.getnNo());
				
			}
		}
		
		System.out.println("요기요n : " + n);
		int result = nService.updateNotice1(n);
		int result3 = nService.updateAttachment(at);
		
		System.out.println("ddd"+result);
		if(result > 0) {
			mv.setViewName("redirect:noticeMain.do");
		}else {
			throw new NoticeException("게시글 수정에 실패하였습니다.");
		}
		return mv;
	
	}
	
	
	// 팀 게시판 게시글 수정페이지에서 수정을 눌럿을때
	@RequestMapping("tupdateno.do")
	public ModelAndView tnoticeUpdate(Notice n,HttpServletRequest request, @RequestParam(value="page") Integer page,
			@RequestParam(value="reloadFile", required=false) MultipartFile reloadFile,
			ModelAndView mv) { // noticeUpdate.jsp에서 파일추가해야함!
		
		int currentPage = page != null ? page : 1;
		Attachment at = nService.selectAttachment(n.getnNo());
		
		
		if(at == null) {
			String root = request.getSession().getServletContext().getRealPath("resources");
			String savePath = root + "/images/noticeUploadFiles";
			File folder = new File(savePath);
			
			if(reloadFile != null && !reloadFile.isEmpty()) {
				String renameFileName = saveFile(reloadFile, request);
				String renamePath = folder + "/" + renameFileName;
				at = new Attachment(n.getnNo(), renamePath, reloadFile.getOriginalFilename(), renameFileName);
				int result4 = nService.insertAttachment2(at);
			}
		}
		
		
		if(reloadFile != null && !reloadFile.isEmpty()) {
			if(at.getChangeName() != null) {
				deleteFile(at.getChangeName(), request);
			}
			
			String savePath = saveFile(reloadFile, request);
			File folder = new File(savePath);
			String renamePath = folder + "/" + at.getChangeName();
			
			if(savePath != null) {
				at.setChangeName(savePath);
				at.setOriginName(reloadFile.getOriginalFilename());
				at.setFilePath(renamePath);
				at.setnNo(n.getnNo());
			}
		}
		
		
		int result = nService.updateNotice(n);
		int result3 = nService.updateAttachment(at);
		
		if(result > 0) {
			mv.addObject("page", page)
			.setViewName("redirect:tnoticeMain.do");
		}else {
			throw new NoticeException("게시글 수정에 실패하였습니다.");
		}
		
		return mv;
	}
	
	
	// 파일 삭제용 메소드
		public void deleteFile(String fileName, HttpServletRequest request) {
			String root = request.getSession().getServletContext().getRealPath("resources");
			String savePath = root + "/images/noticeUploadFiles";
			
			File deleteFile = new File(savePath + "/" + fileName);
			
			if(deleteFile.exists()) {
				deleteFile.delete();
			}
		}
	
	
	// 게시판 삭제
	@RequestMapping("deno.do")
	public String NoticeDelete(int nNo, HttpServletRequest request) {
		
		// 여기에 파일 삭제 메소드 추가!! 해야함 BoardController에 다있음!
		Attachment at = nService.selectAttachment(nNo);
		
		int result = nService.deleteNotice(nNo);
		int result2 = nService.deleteAttachment(at);
		
		if(result > 0) {
			return "redirect:noticeMain.do";
		}else {
			throw new NoticeException("게시물 삭제에 실패하였습니다.");
		}
	}
	
	
	// 검색 기능
	@RequestMapping("nsearch.do")
	public String noticeSearch(Search search, Model model, HttpSession session,
			@RequestParam(value="page", required=false) Integer page) {
		
		Employee loginUser = (Employee)session.getAttribute("loginUser");
		
		int currentPage = page != null ? page : 1;
		
		// 검색된거 카운트 가져오기
		int listCount = nService.SselectListCount(search);
		
		// 갯수 가저오기
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount);
		

		ArrayList<Notice> searchList = nService.searchList(search, pi);
		
		
		model.addAttribute("list", searchList);
		model.addAttribute("search", search);
		model.addAttribute("pi", pi);
		model.addAttribute("loginUser", loginUser);
		
		return "notice/noticeSearchList";
	}
	
	// 팀 게시판 검색 기능
		@RequestMapping("tnsearch.do")
		public String tnoticeSearch(Search search, Model model, HttpSession session,
				@RequestParam(value="page", required=false) Integer page) {
			
			Employee loginUser = (Employee)session.getAttribute("loginUser");
			int currentPage = page != null ? page : 1;
			String eId =loginUser.geteId();
			Employee1 e = nService.selectEmp(eId);
			// 검색된거 카운트 가져오기
			int listCount = nService.SselectListCount2(search);
			
			// 갯수 가저오기
			PageInfo pi = Pagination.getPageInfo(currentPage, listCount);
			

			ArrayList<Notice> searchList = nService.searchList2(search, pi);
			
			for(int i = 0; i <searchList.size(); i++) {
				System.out.println(searchList.get(i));
			}
			model.addAttribute("list", searchList);
			model.addAttribute("search", search);
			model.addAttribute("pi", pi);
			model.addAttribute("loginUser", e);
			
			return "notice/teamNoticeSearch";
		}
	
	
	// 선택 삭제
	@RequestMapping("noticesDelete.do")
	   public String NoticesDelete(String check) {
	      String[] chk1 = check.split(",");
	      
	      int[] nNo = new int[chk1.length];
	      
	      
	      for(int i=0;i<chk1.length; i++){ 
	    	  nNo[i] = Integer.parseInt(chk1[i]); 
	    	 }
	      
	      
	      // 게시글 첨부파일 삭제
	     int result1 = nService.deleteAttachment1(nNo);
	      
	      int result2 = nService.deletenReply(nNo);
	      
	      // 게시판 삭제
	      int result = nService.deletenotices(nNo);
	      
	      return "redirect:noticeMain.do";
	   }
	
	
	// 팀 게시판 게시글 선택 삭제
	@RequestMapping("tnoticesDelete.do")
	public String tNoticesDelete(String check) {
		String[] chk1 = check.split(",");
		
		int[] nNo = new int[chk1.length];
		
		
		for(int i=0;i<chk1.length; i++){ 
			nNo[i] = Integer.parseInt(chk1[i]); 
		}
		
		// 게시글 첨부파일 삭제
		int result1 = nService.deleteAttachment1(nNo);
		
		int result2 = nService.deletenReply(nNo);
		
		// 게시판 삭제
		int result = nService.deletenotices(nNo);
		
		return "redirect:tnoticeMain.do";
	}
	
	
	// 게시판 댓글 불러오기
	@RequestMapping("rList.do")
	@ResponseBody
	public String getReplyList(int nNo) {
		ArrayList<nReply> rList = nService.selectReplyList(nNo);
		
		Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd").create();
		return gson.toJson(rList);		
	}
	
	// 댓글 입력
	@RequestMapping("addReply.do")
	@ResponseBody
	public String addReply(nReply r, HttpSession session) {
		Employee loginUser = (Employee) session.getAttribute("loginUser");
		String rWriter = loginUser.geteName();
		
		r.setNrWriter(rWriter);
		int result = nService.insertReply(r);
		
		if(result > 0) {
			return "success";
		}else {
			return "fail";
		}
	
	}
	
}
