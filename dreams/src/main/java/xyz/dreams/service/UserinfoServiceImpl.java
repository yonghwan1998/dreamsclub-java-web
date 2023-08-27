package xyz.dreams.service;

import java.util.List;

import org.mindrot.jbcrypt.BCrypt;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import lombok.RequiredArgsConstructor;
import oracle.jdbc.clio.annotations.Trace;
import xyz.dreams.dao.UserinfoDAO;
import xyz.dreams.dto.Userinfo;

@Service
@RequiredArgsConstructor
public class UserinfoServiceImpl implements UserinfoService{
	private final UserinfoDAO userinfoDAO;

	@Transactional(rollbackFor = Exception.class)
	@Override
	public void addUserinfo(Userinfo userinfo) {
		String hashedPassword = BCrypt.hashpw(userinfo.getPassword(), BCrypt.gensalt());
		userinfo.setPassword(hashedPassword);
		
		userinfoDAO.insertUserinfo(userinfo);
	}

	@Transactional(rollbackFor = Exception.class)
	@Override
	public void modifyUserinfo(Userinfo userinfo) {
		if (userinfo.getPassword() != null && !userinfo.getPassword().equals("")) {
			String hashedPassword = BCrypt.hashpw(userinfo.getPassword(), BCrypt.gensalt());
			userinfo.setPassword(hashedPassword);
		}
		
		userinfoDAO.updateUserinfo(userinfo);
	}

	@Transactional(rollbackFor = Exception.class)
	@Override
	public void removeUserinfo(String userid) {
		userinfoDAO.deleteUserinfo(userid);
	}

	@Override
	public Userinfo getUserinfo(String userid) {
		Userinfo userinfo = userinfoDAO.selectUserinfo(userid);
		
		return userinfo;
	}

	@Override
	public List<Userinfo> getUserinfoList() {
		return userinfoDAO.selectUserinfoList();
	}

	@Override
	public Userinfo loginAuth(Userinfo userinfo) {
		Userinfo authUserinfo = userinfoDAO.selectUserinfo(userinfo.getUserid());
		
		return authUserinfo;
	}
	
	
}
