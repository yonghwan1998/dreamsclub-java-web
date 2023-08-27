package xyz.dreams.dao;

import java.util.List;

import xyz.dreams.dto.Userinfo;

public interface UserinfoDAO {
	int insertUserinfo(Userinfo userinfo);

	int updateUserinfo(Userinfo userinfo);

	int deleteUserinfo(String userid);

	Userinfo selectUserinfo(String userid);

	List<Userinfo> selectUserinfoList();
}
