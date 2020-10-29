package com.kh.ourwork.notice.model.vo;

import java.sql.Date;

public class Notice {
   private int nNo; // 글 번호
   private String eId; //작성자
   private int no; //구분 번호
   private String nTitle; //제목
   private String nContent; //내용
   private int nCount; //조회수
   private Date nDate; //작성일
   private Date modifyDate; // 수정일
   private String status; // 삭제 여부
   
   private String eName; // 작성자 이름
   private String rName; // 직급
   
   public Notice() {}

   public Notice(int nNo, String eId, int no, String nTitle, String nContent, int nCount, Date nDate, Date modifyDate,
         String status, String eName) {
      super();
      this.nNo = nNo;
      this.eId = eId;
      this.no = no;
      this.nTitle = nTitle;
      this.nContent = nContent;
      this.nCount = nCount;
      this.nDate = nDate;
      this.modifyDate = modifyDate;
      this.status = status;
      this.eName = eName;
   }

   public Notice(int nNo, String eId, int no, String nTitle, String nContent, int nCount, Date nDate, Date modifyDate,
         String status, String eName, String rName) {
      super();
      this.nNo = nNo;
      this.eId = eId;
      this.no = no;
      this.nTitle = nTitle;
      this.nContent = nContent;
      this.nCount = nCount;
      this.nDate = nDate;
      this.modifyDate = modifyDate;
      this.status = status;
      this.eName = eName;
      this.rName = rName;
   }

   public int getnNo() {
      return nNo;
   }

   public void setnNo(int nNo) {
      this.nNo = nNo;
   }

   public String geteId() {
      return eId;
   }

   public void seteId(String eId) {
      this.eId = eId;
   }

   public int getNo() {
      return no;
   }

   public void setNo(int no) {
      this.no = no;
   }

   public String getnTitle() {
      return nTitle;
   }

   public void setnTitle(String nTitle) {
      this.nTitle = nTitle;
   }

   public String getnContent() {
      return nContent;
   }

   public void setnContent(String nContent) {
      this.nContent = nContent;
   }

   public int getnCount() {
      return nCount;
   }

   public void setnCount(int nCount) {
      this.nCount = nCount;
   }

   public Date getnDate() {
      return nDate;
   }

   public void setnDate(Date nDate) {
      this.nDate = nDate;
   }

   public Date getModifyDate() {
      return modifyDate;
   }

   public void setModifyDate(Date modifyDate) {
      this.modifyDate = modifyDate;
   }

   public String getStatus() {
      return status;
   }

   public void setStatus(String status) {
      this.status = status;
   }

   public String geteName() {
      return eName;
   }

   public void seteName(String eName) {
      this.eName = eName;
   }

   public String getrName() {
      return rName;
   }

   public void setrName(String rName) {
      this.rName = rName;
   }

   @Override
   public String toString() {
      return "Notice [nNo=" + nNo + ", eId=" + eId + ", no=" + no + ", nTitle=" + nTitle + ", nContent=" + nContent
            + ", nCount=" + nCount + ", nDate=" + nDate + ", modifyDate=" + modifyDate + ", status=" + status
            + ", eName=" + eName + ", rName=" + rName + "]";
   }
   
   
}