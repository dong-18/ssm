package com.zx.controller.front;

import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import com.zx.bean.User;
import com.zx.service.UserService;
import com.zx.util.ConstantUtil;


@Controller
public class Register {
	private static final long serialVersionUID = 1L;
	@Autowired
	UserService us;
	@RequestMapping("/register.action")
	public String logoin(ModelMap model,HttpServletRequest request,User user,String password,String okpassword){
		
		if("GET".equals(request.getMethod()))
		{
			return"/WEB-INF/view/front/register";
		}
		else
		{
		 try {
			request.setCharacterEncoding("UTF-8");
		} catch (UnsupportedEncodingException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		} 
			 //获取用户信息
			 
			 
			
			
			 
			 //注册的时候应该校验账号是否存在，建议使用异步请求进行校验
			 
			 
			 if(!user.getPassword().equals(okpassword)) {
				 //注册失败
				 request.setAttribute("message", "两次输入的密码不一致，注册失败！");
			 }else {
				 try {
					 user.setCreateDate(new Date());
					 us.saveUser(user,request.getContextPath());
					 model.addAttribute("message", user.getRole() == 1 ? "注册成功,请登录邮箱【"+user.getEmail()+"】进行激活！" : "注册成功，正在审核中！");
				} catch (Exception e) {
					model.addAttribute("message", e.getMessage());

				}
				 
				 
			 }
			 return"/WEB-INF/view/front/register";
		}
}
	@RequestMapping("/validName.action")
	public String validName(ModelMap model,HttpServletRequest req,HttpServletResponse resp,String loginName ){
	
		try {
			
			//获取登录名
			
            String result = us.getUserByName(loginName);
            resp.setCharacterEncoding("utf-8");
            PrintWriter pw = resp.getWriter();
            pw.write(result);
            return null;
		} catch (Exception e) {
             e.printStackTrace();
		}
		return null;
	}
}
