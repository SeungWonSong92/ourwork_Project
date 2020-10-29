package com.kh.ourwork.pteam.controller;

import java.io.File;
import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.Locale;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.kh.ourwork.common.Attachment;
import com.kh.ourwork.common.PageInfo;
import com.kh.ourwork.common.Pagination;
import com.kh.ourwork.common.Search;
import com.kh.ourwork.employee.model.vo.Employee;
import com.kh.ourwork.pteam.model.exception.PteamException;
import com.kh.ourwork.pteam.model.service.pteamService;
import com.kh.ourwork.pteam.model.vo.Career;
import com.kh.ourwork.pteam.model.vo.Certifrcate;
import com.kh.ourwork.pteam.model.vo.Department;
import com.kh.ourwork.pteam.model.vo.Education;
import com.kh.ourwork.pteam.model.vo.Employee1;
import com.kh.ourwork.pteam.model.vo.Rank;

@Controller
public class PteamController {
   @Autowired
   private pteamService pService;

   private Logger logger = LoggerFactory.getLogger(PteamController.class);


   // 부서 관리 페이지 이동
   @RequestMapping("dept.do")
   public ModelAndView deptpage(ModelAndView mv) {
      ArrayList<Department> dNameList = pService.selectDList();

      int result1=0;
      mv.addObject("result1", result1)
        .addObject("dList", dNameList)
        .setViewName("pteam/DepartmentPage");
      
      return mv;
   }

   @RequestMapping("employeeE.do")
   public ModelAndView employeeEList(ModelAndView mv, HttpSession session,
         @RequestParam(value = "page", required = false) Integer page, String tabValue
         ) {
      
      int currentPage = page != null ? page : 1;


      Employee loginUser = (Employee) session.getAttribute("loginUser");

      // 재직사원 countlist
      int listCount = pService.selectListCount();
      
      PageInfo pi = Pagination.getPageInfo(currentPage, listCount);


      // 퇴직사원 countlist
      int nListCount = pService.selectnListCount();
      
      PageInfo pin = Pagination.getPageInfo(currentPage, nListCount);

      // 재직중인 사원select 부분
      ArrayList<Employee1> Ylist = pService.selectList(pi);

      // 퇴직사원 select부분
      ArrayList<Employee1> Nlist = pService.selectNList(pin);
      // 회원가입후 승인 대기 사원
      ArrayList<Employee> Ilist = pService.selectiList();

      if (Ylist != null) {
         mv.addObject("Ylist", Ylist);
         mv.addObject("Nlist", Nlist);
         mv.addObject("Ilist", Ilist);
         mv.addObject("loginUser", loginUser);
         mv.addObject("pi", pi);
         mv.addObject("pin", pin);
         mv.addObject("tabValue", tabValue);
         mv.setViewName("pteam/employeeE");
      } else {
         mv.addObject("msg", "인사관리 목록 조회에 실패하였습니다.");
         mv.setViewName("common/errorPage");
      }

      return mv;
   }

   @RequestMapping("edetail.do")
   public ModelAndView employeeD(ModelAndView mv, String eId, HttpSession session, @RequestParam("page") Integer page,
         HttpServletRequest request, HttpServletResponse response) {
      int currentPage = page != null ? page : 1;
      Employee loginUser = (Employee) session.getAttribute("loginUser");
      System.out.println("loginUser : " + loginUser);
      Employee1 employee = null;
      System.out.println("employee : " + employee);
      
//      Attachment at =pService.selectAttachment(eId);

      Certifrcate c = pService.selectC(eId);
      employee = pService.selectEmployee(eId);
      Education ed2 = pService.selected1(eId);
      Education ed3 = pService.selected2(eId);
      Career ca = pService.selectCa(eId);
      Attachment at = pService.selectAttachment(eId);
      if (employee != null) {
         mv.addObject("employee", employee).addObject("loginUser", loginUser).addObject("c", c).addObject("ed2", ed2)
               .addObject("ed3", ed3).addObject("ca", ca).addObject("currentPage", currentPage)
               .addObject("at", at)
               .setViewName("pteam/eDetail");

      } else {
         throw new PteamException("사원 상세조회에 실패하였습니다.");
      }
      return mv;
   }

   // 검색 기능 재직중!
   @RequestMapping("esearch1.do")
   public String employeeSearch(Search search, Model model, @RequestParam("page") Integer page,
         @RequestParam(value = "pagen", required = false) Integer pagen) {
      
      System.out.println("요기요 ! search : " + search);
      int currentPage = page != null ? page : 1;
      
      
      int listCount = pService.SselectListCount(search);

      PageInfo pi = Pagination.getPageInfo(currentPage, listCount);
      
      ArrayList<Employee1> searchList = pService.searchList(search, pi);
      
      
      // 퇴직사원 select부분
      int currentPagen = pagen != null ? pagen : 1;
      
      int nListCount = pService.selectnListCount1(search);
      
      PageInfo pin = Pagination.getPageInfo(currentPagen, nListCount);
      
      ArrayList<Employee1> Nlist = pService.selectNList1(search, pin);
      
      
      // 회원가입후 승인 대기 사원
      ArrayList<Employee> Ilist = pService.selectiList();
      
      model.addAttribute("Ylist", searchList);
      model.addAttribute("Nlist", Nlist);
      model.addAttribute("Ilist", Ilist);
      model.addAttribute("pi", pi);
      model.addAttribute("search1", search);
      return "pteam/employeeSearchE";
   }

   // 검색 기능 퇴사사원!
   /*
    * @RequestMapping("esearch2.do") public String nemployeeSearch(Search search2,
    * Model model) { ArrayList<Employee> searchList =
    * pService.nsearchList(search2);
    * 
    * 
    * model.addAttribute("Nlist", searchList); model.addAttribute("search",
    * search2);
    * 
    * return "pteam/employeeE"; }
    */

   // detail에서 수정하기 눌렀을 때 
   @RequestMapping("upe.do")
   public ModelAndView employeeUpdate(ModelAndView mv, String eId, Education ed1, @RequestParam("page") Integer page,
         HttpServletRequest request, HttpServletResponse response) {

      int currentPage = page != null ? page : 1;

      Employee1 employee = pService.selectEmployee(eId);
      
      System.out.println("employee : " + employee);
      
      // 부서, 직급 list 가져오기
      ArrayList<Rank> rNameList = pService.selectRList();

      ArrayList<Department> dNameList = pService.selectDList();

      Certifrcate c = pService.selectC(eId);

      Education ed2 = pService.selected1(eId);

      Education ed3 = pService.selected2(eId);

      Career ca = pService.selectCa(eId);

      Attachment at = pService.selectAttachment(eId);
      
      if (c == null) {
         System.out.println("여기맞잖아? : ");
         mv.addObject("employee", employee).addObject("page", currentPage).addObject("rName", rNameList)
               .addObject("dName", dNameList).addObject("ed2", ed2).addObject("ed3", ed3).addObject("c", c)
               .addObject("at", at)
               .addObject("ca", ca).setViewName("pteam/eUpdate");
      } else {
         mv.addObject("employee", employee).addObject("page", currentPage).addObject("rName", rNameList).addObject("at", at)
               .addObject("dName", dNameList).addObject("c", c).addObject("ca", ca).addObject("ed2", ed2)
               .addObject("ed3", ed3).setViewName("pteam/eCUpdate");
      }

      return mv;
   }

   // 자격증 등록 메소드
   @RequestMapping("ceinsert.do")
   public String cInsert(Certifrcate c, HttpServletRequest resquest, Model model, HttpSession session, String rName,
         String dName, String eId, @RequestParam("page") Integer page) {

      int currentPage = page != null ? page : 1;

      Employee loginUser = (Employee) session.getAttribute("loginUser");

      Employee1 employee = pService.selectEmployee(eId);

      int result = pService.cinsert(c);

      c = pService.selectC(eId);

      if (result > 0) {
         model.addAttribute("eId", eId);
         model.addAttribute("employee", employee);
         model.addAttribute("rName", rName);
         model.addAttribute("dName", dName);
         model.addAttribute("c", c);
         model.addAttribute("page", currentPage);
         return "redirect:upe.do";
      } else {
         throw new PteamException("자격증 등록에 실패하였습니다");
      }

   }

   // 고등학교 입력
   @RequestMapping("edhinsert.do")
   public String deInsert1(Education ed1, HttpServletRequest resquest, Model model, HttpSession session, String rName,
         String dName, String eId, @RequestParam("page") Integer page) {
      int currentPage = page != null ? page : 1;
      Employee1 employee = pService.selectEmployee(eId);

      int result = pService.ed1insert(ed1);


      if (result > 0) {
         model.addAttribute("eId", eId);
         model.addAttribute("employee", employee);
         model.addAttribute("rName", rName);
         model.addAttribute("dName", dName);
         model.addAttribute("ed1", ed1);
         model.addAttribute("page", currentPage);
         return "redirect:upe.do";
      } else {
         throw new PteamException("학력 등록에 실패하였습니다.");
      }
   }

   // 경력
   @RequestMapping("cainsert.do")
   public String caInsert(Career ca, HttpServletRequest resquest, Model model, HttpSession session, String rName,
         String dName, String eId, @RequestParam("page") Integer page) {
      int currentPage = page != null ? page : 1;

      Employee1 employee = pService.selectEmployee(eId);

      int result = pService.cainsert(ca);


      ca = pService.selectCa(eId);

      if (result > 0) {
         model.addAttribute("eId", eId);
         model.addAttribute("employee", employee);
         model.addAttribute("rName", rName);
         model.addAttribute("dName", dName);
         model.addAttribute("ca", ca);
         model.addAttribute("page", currentPage);
         return "redirect:upe.do";
      } else {
         throw new PteamException("격력 등록에 실패하였습니다.");
      }

   }

   @RequestMapping("ceupdate.do")
   public ModelAndView CeUpdateV(Certifrcate c, ModelAndView mv, String eId, HttpServletRequest request,
         HttpServletResponse response, @RequestParam("page") Integer page) {

      int currentPage = page != null ? page : 1;

      Employee1 employee = pService.selectEmployee(eId);

      int result = pService.updateCe(c);

      if (result > 0) {
         mv.addObject("page", currentPage).addObject("emplpyee", employee).addObject("eId", eId)
               .setViewName("redirect:upe.do");
      } else {
         throw new PteamException("자격증 수정에 실패하였습니다.");
      }

      return mv;
   }

   // 대학교입력
   @RequestMapping("ed3Uinsert.do")
   public String deInsert2(Education ed1, HttpServletRequest resquest, Model model, HttpSession session, String rName,
         String dName, String eId, @RequestParam("page") Integer page) {
      int currentPage = page != null ? page : 1;
      Employee1 employee = pService.selectEmployee(eId);

      int result = pService.ed1insert2(ed1);


      if (result > 0) {
         model.addAttribute("eId", eId);
         model.addAttribute("employee", employee);
         model.addAttribute("rName", rName);
         model.addAttribute("dName", dName);
         model.addAttribute("ed1", ed1);
         model.addAttribute("page", currentPage);
         return "redirect:upe.do";
      } else {
         throw new PteamException("학력 등록에 실패하였습니다.");
      }
   }

   // 업데이트 페이지에서 수정 눌렀을 떄 !!!!!!!!!!!!!!!!!!!!!!!!!여기요
   @RequestMapping("updemployee.do")
   public String employeeUp(Employee1 e, HttpServletRequest request, @RequestParam(value = "page") Integer page,
         @RequestParam(value = "uploadFile", required = false) MultipartFile rfile, Model model) {
      System.out.println("수정에서 수정 눌렀을 떄 들어는 왔니? ");
      
      int currentPage = page != null ? page : 1;
      System.out.println("e : " + e);
      
      
      String eId = e.geteId();
      // selectEmployee
        String root = request.getSession().getServletContext().getRealPath("resources"); 
        /*String savePath = root + "/images/CertifrcateUploadFiles"; 
        File folder = new File(savePath);
        String renamePath = folder + "/" + at.getChaneName();*/
        int result = pService.updateEmp(e);
        System.out.println("result : " + result);
        Attachment at = pService.selectAttachment(eId);
        
        Certifrcate c = pService.selectC(eId);
        
        Education ed2 = pService.selected1(eId);
        
        Education ed3 = pService.selected2(eId);
        
        Career ca = pService.selectCa(eId);
        
        ArrayList<Rank> rNameList = pService.selectRList();

         ArrayList<Department> dNameList = pService.selectDList();
         
         
         
         if(at == null) {
            if(!rfile.getOriginalFilename().equals("")&& result >0) {
               String renameFileName = saveFile(rfile, request);
                String renamePath = root + "/" + renameFileName;
                File folder = new File(renamePath);
               
               
               if(renameFileName != null) {
                    at = new Attachment(renamePath, rfile.getOriginalFilename(), renameFileName, new Date(), 70); 
                    at.seteId(eId);
                    
                    int result2 = pService.insertAttachment(at);
               }
            }
         }
         
         if(rfile != null && !rfile.isEmpty()) {
            if(at.getChangeName() != null) {
               deleteFile(at.getChangeName(), request);
            }
            
            String savePath = saveFile(rfile, request);
            File folder = new File(savePath);
            String renamePath = folder+"/"+at.getChangeName();
            
            if(savePath != null) {
               at.setChangeName(savePath);
               at.setOriginName(rfile.getOriginalFilename());
               at.setFilePath(renamePath);
               at.seteId(eId);
            }
         }
         
         System.out.println("맨 아래까지 오나요?");
      
        
        
        
        if(result> 0) {
           model.addAttribute("page", page);
           model.addAttribute("employee", e);
           model.addAttribute("at", at);
           model.addAttribute("c", c);
           model.addAttribute("ed2", ed2);
           model.addAttribute("ed3", ed3);
           model.addAttribute("ca", ca);
           model.addAttribute("rName", rNameList);
           model.addAttribute("dName", dNameList);
           return "redirect:employeeE.do";
           }else {
              throw new PteamException("회원 정보수정에 실패하였습니다.");
           }
       
   }

   // 파일 저장 메소드
   private String saveFile(MultipartFile file, HttpServletRequest request) {

      String root = request.getSession().getServletContext().getRealPath("resources");

      String savePath = root + "/images/CertifrcateUploadFiles";

      File folder = new File(savePath);

      if (!folder.exists()) {
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

   // 파일 삭제용 메소드
   public void deleteFile(String fileName, HttpServletRequest request) {
      String root = request.getSession().getServletContext().getRealPath("resources");
      String savePath = root + "/images/CertifrcateUploadFiles";

      File deleteFile = new File(savePath + "/" + fileName);

      if (deleteFile.exists()) {
         deleteFile.delete();
      }
   }

   // deptinsert.do
   @RequestMapping("deptinsert.do")
   public String deptInsert(String dName) {
      int result = pService.insertDept(dName);

      if (result > 0) {
         return "redirect:dept.do";
      } else {
         throw new PteamException("부서 등록에 실패하였습니다.");
      }
   }

   // 부서 삭제버튼
   @RequestMapping("deptd.do")
   public ModelAndView DeptDelete(ModelAndView mv,int dId) {

      
      ArrayList<Department> dNameList = pService.selectDList();

      ArrayList<Employee1> Ylist = pService.selectList2(dId);
      int result1 = 2;
      
      
      if (Ylist.isEmpty()) {
         int result = pService.deleteDept(dId);
         if (result > 0) {
            result1 = 1;

            mv.addObject("result1", result1)
              .addObject("dList", dNameList)
              .setViewName("pteam/DepartmentPage");
         } else {
            throw new PteamException("부서삭제에 실패하였습니다.");
         }
      } else {
           mv.addObject("result1", result1)
             .addObject("dList", dNameList);
           mv.setViewName("pteam/DepartmentPage");
      }
      return mv;
   }

   // 근퇴 page 이동
   @RequestMapping("attend.do")
   public ModelAndView attendview(ModelAndView mv, HttpSession session,
         @RequestParam(value = "page", required = false) Integer page) {

      int currentPage = page != null ? page : 1;

      
      int listCount = pService.selectSearchListCount2();
      
      PageInfo pi = Pagination.getPageInfo(currentPage, listCount);
      ArrayList<Department> dNameList = pService.selectDList();

      ArrayList<Employee1> Ylist = pService.selectList(pi);

      if (Ylist != null) {
         mv.addObject("dList", dNameList).addObject("Ylist", Ylist).addObject("pi", pi)
               .setViewName("pteam/Attendance");
      } else {
         mv.addObject("msg", "근태관리 목록 조회 실패").setViewName("common/errorPage");
      }
      return mv;
   }

   @RequestMapping("ea.do")
   public ModelAndView employeeA(ModelAndView mv, String eId, HttpSession session,
         @RequestParam(value = "page", required = false) Integer page,
         @RequestParam(value = "pagen", required = false) Integer pagen) {
      
      int currentPage = page != null ? page : 1;

      int currentPagen = pagen != null ? pagen : 1;

      Employee loginUser = (Employee) session.getAttribute("loginUser");

      // 재직사원 countlist
      int listCount = pService.selectListCount();
      PageInfo pi = Pagination.getPageInfo(currentPage, listCount);


      // 퇴직사원 countlist
      int nListCount = pService.selectnListCount();
      PageInfo pin = Pagination.getPageInfo(currentPagen, nListCount);

      // 재직중인 사원select 부분
      ArrayList<Employee1> Ylist = pService.selectList(pi);

      // 퇴직사원 select부분
      ArrayList<Employee1> Nlist = pService.selectNList(pin);

      // 회원가입후 승인 대기 사원
      ArrayList<Employee> Ilist = pService.selectiList();
      
      int result = pService.updateEa(eId);
      
      if(result > 0) {
         mv.addObject("Ylist", Ylist)
         .addObject("Nlist", Nlist)
         .addObject("Ilist", Ilist)
         .addObject("loginUser", loginUser)
         .addObject("pi", pi)
         .addObject("pin", pin)
         .setViewName("redirect:employeeE.do");
      }else {
         mv.addObject("msg", "승인요청에 실패하였습니다");
         mv.setViewName("common/errorPage");
      }
      return mv;
   }
   
   @RequestMapping("searchAttend.do")
   public ModelAndView searchAttend(ModelAndView mv,String dName, String date,
         @RequestParam(value = "page", required = false) Integer page) {
      
      int currentPage = page != null ? page : 1;
      
      
      Map<String, String> map = new HashMap<String, String>();
      
      String y = date.substring(2,4);
      String m = date.substring(5,7);
      String d = date.substring(8,10);
      
      String searchday = y+"/"+m+"/"+d;
      
      map.put("dName", dName);
      map.put("searchday", searchday);
      
      int listCount = pService.selectSearchListCount(map);
      
      
      PageInfo pi = Pagination.getPageInfo(currentPage, listCount);
      
      ArrayList<Employee1> Ylist = pService.AttendEmployee(map, pi);
      for(int i = 0; i < Ylist.size(); i++) {
    	  if(!Ylist.get(i).getwIn().equals(null)) {
    		  Ylist.get(i).setwIn(Ylist.get(i).getwIn().substring(0,16));
    	  }
    	  if(Ylist.get(i).getwOut() != null) {
    		  Ylist.get(i).setwOut(Ylist.get(i).getwOut().substring(0,16));
    	  }
      }
      ArrayList<Department> dNameList = pService.selectDList();
      
      if(Ylist != null) {
         mv.addObject("Ylist", Ylist)
           .addObject("dList", dNameList)
           .addObject("day", searchday)
           .addObject("pi", pi)
           .setViewName("pteam/AttendanceSearch");
      }else {
         mv.addObject("msg", "근태검색을 실패하였습니다.")
           .setViewName("common/errorPage");
      }
      
      return mv;
   }
   
   // 퇴사시키기!
   @RequestMapping("deemp.do")
   ModelAndView employeeUpdatedel(ModelAndView mv, String eId,HttpSession session,
         HttpServletRequest request, HttpServletResponse response, String tabValue,
         @RequestParam(value = "page", required = false) Integer page
         ) {
      
      int currentPage = page != null ? page : 1;
      
      Employee1 employee = pService.selectEmployee(eId);
      
      Employee loginUser = (Employee) session.getAttribute("loginUser");

      // 재직사원 countlist
      int listCount = pService.selectListCount();
      
      PageInfo pi = Pagination.getPageInfo(currentPage, listCount);


      // 퇴직사원 countlist
      int nListCount = pService.selectnListCount();
      
      PageInfo pin = Pagination.getPageInfo(currentPage, nListCount);

      // 재직중인 사원select 부분
      ArrayList<Employee1> Ylist = pService.selectList(pi);

      // 퇴직사원 select부분
      ArrayList<Employee1> Nlist = pService.selectNList(pin);
      // 회원가입후 승인 대기 사원
      ArrayList<Employee> Ilist = pService.selectiList();
      
      
      
      int result = pService.deleteEmp(employee); 
      
      
      
      
      
      if(result > 0) {
         mv.addObject("Ylist", Ylist);
         mv.addObject("Nlist", Nlist);
         mv.addObject("Ilist", Ilist);
         mv.addObject("loginUser", loginUser);
         mv.addObject("pi", pi);
         mv.addObject("pin", pin);
         mv.addObject("tabValue", tabValue);
         mv.setViewName("redirect:employeeE.do");
      }else {
         mv.addObject("msg", "인사관리 목록 조회에 실패하였습니다.");
         mv.setViewName("common/errorPage");
      }
      return mv;
   }
   
}