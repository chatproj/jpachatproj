package com.example.chatproj.chatproj.repository;

import java.util.List;
import java.util.Optional;

import javax.persistence.EntityManager;

import org.springframework.data.jpa.repository.Modifying;

import com.example.chatproj.chatproj.domain.Chatroom_Table;
import com.example.chatproj.chatproj.domain.User;
import com.example.chatproj.chatproj.domain.User_Profileimg;

public class JpaUserRepository implements UserRepository{

	private final EntityManager em;
	
	public JpaUserRepository(EntityManager em) {
		this.em = em;
	}
	
	// 회원가입 (insert user_table)
	@Override
	public User save(User user) {
		em.persist(user);
		return user;
	}
	
	// 회원가입_이미지저장 (insert user_profileimg)
	@Override
	public User_Profileimg imgsave(User_Profileimg userimg) {
		em.persist(userimg);
		return userimg;
	}
	
	// log조회_userprofileimg
	@Override
	public Optional<User_Profileimg> getUnumbyFilenum(int sessionNum) {
		List<User_Profileimg> result = em.createQuery("select m from User_Profileimg m where m.unum = :sessionNum", User_Profileimg.class).setParameter("sessionNum", sessionNum).getResultList();
		return result.stream().findAny();
	}

	// 채팅방 참여자 목록 (userinfo)
	@Override
	public List<User> chatinuserinfo(int unum) {
		List<User> result = em.createQuery("select m from User m where m.unum = :unum", User.class)
				.setParameter("unum", unum)
				.getResultList();
		return result;
	}
	
	// 채팅방 참여자 목록 (userprofileimg)
	@Override
	public List<User_Profileimg> chatinuserimginfo(int unum) {
		List<User_Profileimg> result = em.createQuery("select m from User_Profileimg m where m.unum = :unum", User_Profileimg.class)
				.setParameter("unum", unum)
				.getResultList();
		return result;
	}
	
	// filenum 기반 파일 정보 조회
	@Override
	public Optional<User_Profileimg> findimage(int filenum) {
		User_Profileimg result = em.find(User_Profileimg.class, filenum);
		return Optional.ofNullable(result);
	}

	// uid 기반 유저 정보
	@Override
	public Optional<User> findById(String uid) {
		List<User> result = em.createQuery("select m from User m where m.uid = :uid", User.class).setParameter("uid", uid).getResultList();
		return result.stream().findAny();
	}
	
	// email 기반 유저 정보
	@Override
	public Optional<User> findByEmail(String email){
		List<User> result = em.createQuery("select m from User m where m.email = :email", User.class).setParameter("email", email).getResultList();
		return result.stream().findAny();
	}	
	
	// unum 기반 유저 정보
	@Override
	public Optional<User> findByNum(int unum) {
		User result = em.find(User.class, unum);
		return Optional.ofNullable(result);
	}

	// 채팅방 초대1 (select myid, inviteuserid)
	@Override
	public List<User> getIdbyUid(String sessionName, String inviteuser) {
		List<User> result = em.createQuery("select m from User m where m.uid in (:sessionName, :inviteuser)", User.class)
				.setParameter("sessionName", sessionName)
				.setParameter("inviteuser", inviteuser)
				.getResultList();
		return result;
	}
	
	// id찾기 (id ,email 기준)
	@Override
	public Optional<User> findUser(String uname, String email) {
		List<User> result = em.createQuery("select m from User m where m.uname = :uname and m.email = :email", User.class)
				.setParameter("uname", uname)
				.setParameter("email", email)
				.getResultList();	
		return result.stream().findAny();
	}
	
	// 
	@Override
	public Optional<User_Profileimg> deleteprofileimg(int sessionNum) {
		List<User_Profileimg> result = em.createQuery("select m from User_Profileimg m where m.unum = :sessionNum", User_Profileimg.class)
				.setParameter("sessionNum", sessionNum)
				.getResultList();
		
		return result.stream().findAny();
	}
	
	// 회원탈퇴
	@Override
	public void deleteuser(int sessionNum) {
		em.createQuery("delete from User m where m.unum = :sessionNum")
			.setParameter("sessionNum", sessionNum)
			.executeUpdate();
	}
	
	@Override
	@Modifying
	public void modifyUser(String uid, String upw, String uname, String email, String phone_num) {
		em.createQuery("update User m set m.upw = :upw, m.uname = :uname, m.email = :email, m.phone_num = :phone_num where m.uid = :uid")
			.setParameter("uid", uid)
			.setParameter("upw", upw)
			.setParameter("uname", uname)
			.setParameter("email", email)
			.setParameter("phone_num", phone_num)
			.executeUpdate();
	}
	
	// 회원정보수정
	@Override
	@Modifying
	public void userimgupdate(int unum, String filename, String original_filename, String file_url) {
		em.createQuery("update User_Profileimg m set m.filename = :filename, m.original_filename = :original_filename, m.file_url = :file_url where m.unum = :unum")
			.setParameter("unum", unum)
			.setParameter("filename", filename)
			.setParameter("original_filename", original_filename)
			.setParameter("file_url", file_url)
			.executeUpdate();
	}
	
	// 회원정보수정_userimg
	@Override
	@Modifying
	public void chatuserimgupdate(int unum, String filename) {
		em.createQuery("update Chatlog_Table m set m.filename = :filename where m.unum = :unum")
			.setParameter("unum", unum)
			.setParameter("filename", filename)
			.executeUpdate();
	}


}
