/**
 * 
 */
package com.zx.service;

import java.util.List;
import java.util.Properties;
import java.util.UUID;

import javax.mail.Authenticator;
import javax.mail.Message.RecipientType;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sun.mail.smtp.SMTPMessage;
import com.zx.bean.Article;
import com.zx.bean.User;


import com.zx.dao.UserDao1;
import com.zx.util.SqlSessionUtil;

/**
 * @author 罗春龙
 *  2020年3月4日
 *
 * version 1.0
 */
@Service("e")
public class UserService {
	@Autowired
	UserDao1 a;
	/**
	 * @param loginName
	 * @param passWord
	 * @return
	 * //根据账号密码获取用户信息
	 */
	public User getUserByNameAndPass(String loginName, String passWord) {
		
		User h= a.getUserByNameAndPass(loginName,passWord);

	return h;
	}
	/**
	 * @param us
	 * 保存用户信息
	 */
	public void saveUser(User user,String proPath) {
		try {
			
			//通过uuid生成激活码
			String active = UUID.randomUUID().toString();
			user.setActive(active);
			a.saveUser(user);
			//判断用户的角色，如果是普通会员则发送邮件给用户
			if(user.getRole() == 1) {
				//发送邮件
				sendMail(user,proPath);
				
			}
	
		} catch (Exception e) {
			e.printStackTrace();
			throw new RuntimeException("注册失败:"+e.getMessage());
		}
		
	}
	
	/**
	 * 发送邮件
	 */
	private void sendMail(User user,String proPath) {
		try {
			//1、创建 Properties对象，用于封装邮件发送相关信息
			Properties props = new Properties();
			// 服务器地址
			props.setProperty("mail.smtp.host", "smtp.126.com");
			// 服务器需要鉴权
			props.setProperty("mail.smtp.auth", "true");
			
			// 2).创建Authenticator的实例，实现账户、密码的鉴权。
	        Authenticator auth = new Authenticator(){
	            protected PasswordAuthentication getPasswordAuthentication()
	            {
	                return new PasswordAuthentication("luochunlong666@126.com", "luochunlong123");
	            }
	        };
	        
	        //3、创建Session对象
	        Session session = Session.getInstance(props, auth);
	        //4).创建SMTPMessage，通过SMTPMessage指定收件人|发送人|邮件内容等信息，要提供session(连接)
	        SMTPMessage msg = new SMTPMessage(session);
	        //指定邮件的主体
	        msg.setSubject("用户注册激活邮件，请勿回复，按照提示进行操作即可");
	        //指定邮件内容
	        msg.setContent("<a href='http://127.0.0.1:8080"+proPath+"/userActive.action?active="+user.getActive()+"' target='_blank'>点击该连接进行激活</a>","text/html;charset=UTF-8");
	        //指定发件人
	        msg.setFrom(new InternetAddress("luochunlong666@126.com"));
	        //指定收件人   接收者类型由：TO(收件人)、CC(抄送)、BCC(密送)
	        msg.setRecipient(RecipientType.TO, new InternetAddress(user.getEmail()));
	        
	        //5、发送邮件
	        Transport.send(msg);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		
	}
	/**
	 * @param activeCode
	 * 用户信息激活
	 */
	public void activeUser(String activeCode) {
		// TODO Auto-generated method stub
		
		a.activeUser(activeCode);
	
	}
	public String getUserByName(String loginName) {

        boolean flag = a.getUserByName(loginName);
		return flag ? "用户已存在" : "";
	}
	public List<User> getAllManageUser() {
		// TODO Auto-generated method stub
		List<User> users = a.getAllManageUser();
		return users;
	}
	public void activeUser(String id, String disabled) {
		// TODO Auto-generated method stub
		a.activeUser1(disabled,id);
	}

}


