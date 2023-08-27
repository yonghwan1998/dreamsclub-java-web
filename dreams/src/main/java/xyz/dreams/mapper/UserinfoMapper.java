package xyz.dreams.mapper;

import java.util.List;

import xyz.dreams.dto.Userinfo;

public interface UserinfoMapper {
	int insertUserinfo(Userinfo userinfo);

	int updateUserinfo(Userinfo userinfo);

	int deleteUserinfo(String userid);

	Userinfo selectUserinfo(String userid);

	List<Userinfo> selectUserinfoList();
}
