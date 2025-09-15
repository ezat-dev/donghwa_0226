package com.ace.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.ace.domain.Permission;
import com.ace.domain.Users;
import com.ace.service.UserService;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;


@Controller
public class UserController {

	@Autowired
	private UserService userService;
	
	public static int USER_CODE = 0;
	public static String USER_NAME = "";
	
	private static final Logger logger = LoggerFactory.getLogger(UserController.class);
	
	
	/*-----인원 및 안전관리-----*/
	//사용자 로그인 관리
	 @RequestMapping(value = "/user/login/check", method = RequestMethod.POST) 
	 @ResponseBody 
	 public Map<String, Object> userLoginCheck(@ModelAttribute Users users, HttpSession session) {
		 Map<String, Object> rtnMap = new HashMap<String, Object>();
		 
		 if("".equals(users.getUser_id())){
			 rtnMap.put("data","ID를 입력해주십시오!");
			 
			 return rtnMap;
		 }
		 
		 if("".equals(users.getUser_pw())){
			 rtnMap.put("data","PW를 입력해주십시오!");
			 
			 return rtnMap;
		 }
		 
		 Users loginUser = userService.userLoginCheck(users);
		 
		 if(loginUser == null) {
			 rtnMap.put("data","등록되지 않은 사용자입니다.");
			 
			 return rtnMap;			 
		 }
		 
		 
		// 로그인한 대상의 page정보 세션저장
		 Permission loginPermission = userService.userLoginPermission(loginUser);

		 // 세션에 저장
		 session.setAttribute("loginUser", loginUser);
		 System.out.println("세션 저장: loginUser = " + loginUser);

		 session.setAttribute("loginUserPage", loginPermission);
		 System.out.println("user_code: " + loginUser.getUser_code());
		 System.out.println("user_id: " + loginUser.getUser_id());
		 System.out.println("user_name: " + loginUser.getUser_name());
		 System.out.println("user_level: " + loginUser.getUser_level());

		 UserController.USER_CODE = Integer.parseInt(loginUser.getUser_code());
		 UserController.USER_NAME = loginUser.getUser_name(); 
		 // 반환용 맵 구성
		 rtnMap.put("data", loginUser);
		 rtnMap.put("loginUserPage", loginPermission);

		 return rtnMap;

	 }	
	 
	 
	 
	 //사용자 등록 조회 
	 @RequestMapping(value = "/user/userInsert", method = RequestMethod.GET)
	 public String userInsertList(Users users) {
		 return "/user/userInsert.jsp";	       
	 }
	 
	// 전체 사용자목록 조회
	 @RequestMapping(value = "/user/userInsert/select", method = RequestMethod.POST)
	 @ResponseBody
	 public List<Users> userInsertSelect(Users users) {
	     // System.out.println("======= [userInsertSelect 호출됨] =======");
	     // System.out.println("user_name: " + users.getUser_name());
	     // System.out.println("startDate: " + users.getStartDate());
	     // System.out.println("=======================================");

	     List<Users> result = userService.userInsertSelect(users);

	     // System.out.println("======= [반환 데이터 목록] =======");
	     // for (Users u : result) {
	     //     System.out.println(
	     //         "ID: " + u.getUser_id() +
	     //         ", 이름: " + u.getUser_name() +
	     //         ", 입사일: " + u.getSt_day() +
	     //         ", 부서: " + u.getUser_busu()
	     //     );
	     // }
	     // System.out.println("총 개수: " + result.size());
	     // System.out.println("===================================");

	     return result;
	 }

	 @RequestMapping(value = "/user/userInsert/delete", method = RequestMethod.POST)
	 @ResponseBody
	 public String deleteUser(@RequestBody Users user) {
	     System.out.println("======= [deleteUser 호출됨] =======");
	     System.out.println("삭제 대상 user_code: " + user.getUser_code());
	     System.out.println("===================================");

	     try {
	    	 userService.userInsertDel(user); 
	         return "success";
	     } catch (Exception e) {
	         e.printStackTrace();
	         return "fail";
	     }
	 }
	 
	 //사용자 등록 입력
	 @RequestMapping(value = "/user/userInsert/insert", method = RequestMethod.POST)
	 @ResponseBody
	 public Map<String, Object> userInsertInsert(@ModelAttribute Users users) {
		 Map<String, Object> rtnMap = new HashMap<>();

		 //아이디 입력했는지		 
		 if("".equals(users.getUser_id())){
			 rtnMap.put("data","아이디를 입력해주십시오!");
			 
			 return rtnMap;
		 }
		 		 
		 //비밀번호 입력했는지		 
		 if("".equals(users.getUser_pw())){
			 rtnMap.put("data","비밀번호를 입력해주십시오!");
			 
			 return rtnMap;
		 }
		 
		 //동일한 사용자가 있는지
		 Users duplicateUser = userService.userDuplicateCheck(users);
		 
		 if(duplicateUser != null) {
			 rtnMap.put("data","이미 등록된 아이디입니다.");
			 
			 return rtnMap;			 
		 }
		 
		 userService.userInsertInsert(users);
		 
		 
		 return rtnMap; 
	 }
	 
	 //권한부여
	 @RequestMapping(value = "/user/userPermission", method = RequestMethod.GET)
	 public String userPermission(Users users) {
		 return "/user/userPermission.jsp";	       
	 }
	 
	 //사원별 권한등록 사용자 선택
	 @RequestMapping(value = "/user/userPermission/userSelectPermission", method = RequestMethod.POST)
	 @ResponseBody
	 public Map<String, Object> userPermissionUserSelectPerm(
			 @RequestParam(required = false) String  user_code){
		 Map<String, Object> rtnMap = new HashMap<String, Object>();
		 
		 Users users = new Users();
		 users.setUser_code(user_code);
		 
		 Permission selectPermission = userService.userLoginPermission(users);
		 
		 rtnMap.put("data", selectPermission);

		 return rtnMap;
	 }	 
	 
	 //사용자별 권한등록 사용자 선택 후 수정
	 @RequestMapping(value = "/user/userPermission/update", method = RequestMethod.POST)
	 @ResponseBody
	 public Map<String, Object> userPermissionUpdate(@ModelAttribute Permission permission){
		 Map<String, Object> rtnMap = new HashMap<String, Object>();

		 System.out.println(permission.getUser_code());
		 /*		 System.out.println(permission.getA01());
		 System.out.println(permission.getB01());
*/
		 userService.userPermissionUpdate(permission);
		 
		 return rtnMap;
	 }
	 
	 
	 //전체 사용자목록 조회
	 @RequestMapping(value = "/user/userPermission/userSelect", method = RequestMethod.POST) 
	 @ResponseBody 
	 public Map<String, Object> userPermissionUserSelect() {
		 Map<String, Object> rtnMap = new HashMap<String, Object>();
		 
		 List<Users> userList = userService.userPermissionUserSelect();
		 
		 List<HashMap<String, Object>> rtnList = new ArrayList<HashMap<String, Object>>();
		 for(int i=0; i<userList.size(); i++) {
			 HashMap<String, Object> rowMap = new HashMap<String, Object>();
			 rowMap.put("idx", (i+1));
			 rowMap.put("user_id", userList.get(i).getUser_id());
			 rowMap.put("user_busu", userList.get(i).getUser_busu());
			 rowMap.put("user_code", userList.get(i).getUser_code());
			 rowMap.put("user_jick", userList.get(i).getUser_jick());
			 rowMap.put("user_name", userList.get(i).getUser_name());
			 rtnList.add(rowMap);
		 }
		 
		 rtnMap.put("last_page",1);
		 rtnMap.put("data",rtnList);
		 
		 return rtnMap; 
	 }
	 
	 
	 @RequestMapping(value = "/user/info", method = RequestMethod.POST)
	 @ResponseBody
	 public Map<String, Object> getUserInfo(HttpSession session) {
	     Map<String, Object> result = new HashMap<>();
	     
	     // 세션에서 데이터 가져오기
	     Users loginUser = (Users) session.getAttribute("loginUser");
	     Permission loginPermission = (Permission) session.getAttribute("loginUserPage");

	 
	     if (loginUser != null) {
	         result.put("loginUser", loginUser);
	     }
	     if (loginPermission != null) {
	         result.put("loginUserPage", loginPermission);
	     }
	     
	     return result;
	 }


	 
}