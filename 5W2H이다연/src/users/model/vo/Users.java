package users.model.vo;

import java.sql.Date;

public class Users {
   private String userId;
   private String userPwd;
   private String userName;
   private String nickname;
   private String phone;
   private String email;
   private String address;
   private int adminCk;
   private Date enrollDate;
   private Date modifyDate;
   private String status;
   private Date deleteDate;
   
   public Users() {}

   public Users(String userId, String userPwd, String userName, String nickname, String phone, String email,
         String address, int adminCk, Date enrollDate, Date modifyDate, String status, Date deleteDate) {
      super();
      this.userId = userId;
      this.userPwd = userPwd;
      this.userName = userName;
      this.nickname = nickname;
      this.phone = phone;
      this.email = email;
      this.address = address;
      this.adminCk = adminCk;
      this.enrollDate = enrollDate;
      this.modifyDate = modifyDate;
      this.status = status;
      this.deleteDate = deleteDate;
   }

   public String getUserId() {
      return userId;
   }

   public void setUserId(String userId) {
      this.userId = userId;
   }

   public String getUserPwd() {
      return userPwd;
   }

   public void setUserPwd(String userPwd) {
      this.userPwd = userPwd;
   }

   public String getUserName() {
      return userName;
   }

   public void setUserName(String userName) {
      this.userName = userName;
   }

   public String getNickname() {
      return nickname;
   }

   public void setNickname(String nickname) {
      this.nickname = nickname;
   }

   public String getPhone() {
      return phone;
   }

   public void setPhone(String phone) {
      this.phone = phone;
   }

   public String getEmail() {
      return email;
   }

   public void setEmail(String email) {
      this.email = email;
   }

   public String getAddress() {
      return address;
   }

   public void setAddress(String address) {
      this.address = address;
   }

   public int getAdminCk() {
      return adminCk;
   }

   public void setAdminCk(int adminCk) {
      this.adminCk = adminCk;
   }

   public Date getEnrollDate() {
      return enrollDate;
   }

   public void setEnrollDate(Date enrollDate) {
      this.enrollDate = enrollDate;
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

   public Date getDeleteDate() {
      return deleteDate;
   }

   public void setDeleteDate(Date deleteDate) {
      this.deleteDate = deleteDate;
   }

   @Override
   public String toString() {
      return "Users [userId=" + userId + ", userPwd=" + userPwd + ", userName=" + userName + ", nickname=" + nickname
            + ", phone=" + phone + ", email=" + email + ", address=" + address + ", adminCk=" + adminCk
            + ", enrollDate=" + enrollDate + ", modifyDate=" + modifyDate + ", status=" + status + ", deleteDate="
            + deleteDate + "]";
   }
   
   
}