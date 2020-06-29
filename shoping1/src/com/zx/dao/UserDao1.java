package com.zx.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.List;

import com.zx.bean.User;
import com.zx.util.ConnectionFactory;

public interface UserDao1 {


	/**
	 * @param loginName
	 * @param passWord
	 * @return
	 */
	public User getUserByNameAndPass(String loginName, String passWord) ;
	/**
	 * @param user
	 * 保存用户
	 */
	public void saveUser(User user);

	/**
	 * @param activeCode
	 */
	public void activeUser(String activeCode) ;
	public boolean getUserByName(String loginName);
	public List<User> getAllManageUser();
	public void activeUser1(String id, String disabled);
		
	

}
