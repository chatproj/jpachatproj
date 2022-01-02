package com.example.chatproj.chatproj.repository;

import java.util.List;
import java.util.Optional;

import javax.persistence.EntityManager;

import com.example.chatproj.chatproj.domain.Chatroom_Table;
import com.example.chatproj.chatproj.domain.User;
import com.example.chatproj.chatproj.domain.User_Profileimg;

public class JpaUserRepository implements UserRepository{

	private final EntityManager em;
	
	public JpaUserRepository(EntityManager em) {
		this.em = em;
	}
	
	@Override
	public User save(User user) {
		em.persist(user);
		return user;
	}
	
	@Override
	public User_Profileimg imgsave(User_Profileimg userimg) {
		em.persist(userimg);
		return userimg;
	}
	
	@Override
	public Optional<User_Profileimg> getUnumbyFilenum(int sessionNum) {
		List<User_Profileimg> result = em.createQuery("select m from User_Profileimg m where m.unum = :sessionNum", User_Profileimg.class).setParameter("sessionNum", sessionNum).getResultList();
		return result.stream().findAny();
	}
	
	@Override
	public Optional<User_Profileimg> findimage(int filenum) {
		User_Profileimg result = em.find(User_Profileimg.class, filenum);
		return Optional.ofNullable(result);
	}

	@Override
	public Optional<User> findByNum(int unum) {
		User result = em.find(User.class, unum);
		return Optional.ofNullable(result);
	}

	@Override
	public Optional<User> findById(String uid) {
		List<User> result = em.createQuery("select m from User m where m.uid = :uid", User.class).setParameter("uid", uid).getResultList();
		return result.stream().findAny();
	}
	
	@Override
	public Optional<User> findByEmail(String email){
		List<User> result = em.createQuery("select m from User m where m.email = :email", User.class).setParameter("email", email).getResultList();
		return result.stream().findAny();
	}

	@Override
	public List<User> getIdbyUid(String sessionName, String inviteuser) {
		List<User> result = em.createQuery("select m from User m where m.uid in (:sessionName, :inviteuser)", User.class)
				.setParameter("sessionName", sessionName)
				.setParameter("inviteuser", inviteuser)
				.getResultList();
		return result;
	}
	
	@Override
	public Optional<User> findUser(String uname, String email){
		List<User> result = em.createQuery("select m from User m where m.uname = :uname and m.email = :email", User.class)
				.setParameter("uname", uname)
				.setParameter("email", email)
				.getResultList();	
		return result.stream().findAny();
	}

}
