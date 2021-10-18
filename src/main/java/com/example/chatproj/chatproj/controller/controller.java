package com.example.chatproj.chatproj.controller;

import java.util.List;
import java.util.Optional;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.example.chatproj.chatproj.domain.Chatroom_Table;
import com.example.chatproj.chatproj.domain.UC_Table;
import com.example.chatproj.chatproj.domain.User;
import com.example.chatproj.chatproj.repository.ChatRepository;
import com.example.chatproj.chatproj.service.UserService;
import com.example.chatproj.chatproj.service.ChatService;

@Controller
public class controller {

	private final UserService userService;
	private final ChatService chatService;
	
	@Autowired
	public controller(UserService userService, ChatService chatService) {
		this.userService = userService;
		this.chatService = chatService;
	}
	
	// 회원가입
	@GetMapping("/signup")
	public String signup() {
		return "signup";
	}
	
	@PostMapping("/signup")
	public String create_user(SignupForm form) {
		User user = new User();
		user.setUid(form.getUid());
		user.setUpw(form.getUpw());
		user.setUname(form.getUname());
		user.setEmail(form.getEmail());
		user.setPhone_num(form.getPhone_num());
		
		userService.join(user);
		
		return "redirect:/signin";
	}
	
	// 로그인
	@RequestMapping("/signin")
	public String signin() {
		return "signin";
	}
	
	@PostMapping("/signin")
	public String login_user(SigninForm form, HttpServletRequest request) {
		User user = new User();
		user.setUid(form.getUid());
		user.setUpw(form.getUpw());
		
		String result = userService.login(user);
		
		System.out.println("result : " + result );
		
		if(result.equals("matchX")) {
			return "redirect:/signin?message=FAILURE_matchX";
		}else if(result.equals("noid")) {
			return "redirect:/signin?message=FAILURE_noid";
		}else {
			HttpSession session = request.getSession();
			String name = form.getUid();
			session.setAttribute("sessionId", name);
			return "redirect:/";
		}	
	}
	
	// 아이디 찾기
	@RequestMapping("/findid")
	public String findid() {
		return "find_id";
	}
	
	// 비밀번호 찾기
	@RequestMapping("/findpw")
	public String findpass() {
		return "find_password";
	}
	
	// 채팅룸
	@RequestMapping("/chatroom")
	public String chatroom() {
		return "ChatRoom";
	}
	
	// 초대
	@RequestMapping("/inviteuser")
	public String inviteuser() {
		return "InviteUser";
	}
	
	@PostMapping("/inviteuser")
	public String invite_user(SigninForm form, InviteUserForm form1, HttpServletRequest request) {
		User user = new User();
		user.setUid(form.getUid());
		
		String result = userService.article(user);
		
		if(result.equals("matchX")) {
			return "redirect:/signin?message=FAILURE_matchX";
		}else if(result.equals("noid")) {
			return "redirect:/signin?message=FAILURE_noid";
		}else {
			// session
			HttpSession session = request.getSession();
			String sessionName = (String)session.getAttribute("sessionId");		
			
			// insert chatroom_table
			Optional<Chatroom_Table> ct = chatService.join();
			System.out.println("ct....." + ct);
			
			Chatroom_Table user1 = new Chatroom_Table();
			user1.setCnum(ct.get().getCnum() + 1);
			user1.setCname(form1.getCname());			
			chatService.insChatTable(user1);
			
			// select m from user_table m where uid in ( 내 id값, 초대한 사람의 id값);
			String inviteuser = form1.getCname();
			
			List<User> result2 = userService.getIdbyUid(sessionName, inviteuser);
			System.out.println("Session : " + sessionName);
			
			System.out.println("SessionNum : " + result2.get(0).getUnum());
			System.out.println("Invite : " + result2.get(1).getUnum());
			
			// session, invite 기반 insert
			
			for(int i = 0; i<result2.size(); i++) {
				UC_Table user2 = new UC_Table();
				user2.setUnum(result2.get(i).getUnum());
				user2.setCnum(ct.get().getCnum() + 1);
				chatService.insUCTable(user2);
			}
			
			return "redirect:/chatpg";
		}	
	
	}
	
	// 채팅방
	@RequestMapping("/chatpg")
	public String chatpg() {
		return "ChatPg";
	}
	
}

