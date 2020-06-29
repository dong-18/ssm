package com.zx.controller.back;

import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import com.zx.bean.User;
import com.zx.service.UserService;
@Controller
public class UserB {
	@Autowired
	UserService us;
	@RequestMapping("/userList.do")
	public String userList(ModelMap model,HttpServletResponse req,String code,String disabled ){
		
		 List<User> users = us.getAllManageUser();
		 model.addAttribute("users", users);
		 return "/WEB-INF/view/back/user/list";
	
		
	}
	@RequestMapping("/activeServlet.do")
	public String activeServlet(ModelMap model,HttpServletResponse req,String id,String disabled ){
		

		//获取激活状态
		
		
		
		us.activeUser(id,disabled);
		
		
		//跳转用户列表
		return"redirect:/userList.do";
	
		
	}
}
