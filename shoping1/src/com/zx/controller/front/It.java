package com.zx.controller.front;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import com.zx.bean.Article;
import com.zx.service.ArticleService;
import com.zx.service.UserService;
import com.zx.util.ConstantUtil;
import com.zx.util.SpringUtil;

@Controller
public class It {
	@Autowired
	ArticleService as;
	@Autowired
	UserService us;
	@RequestMapping("/detail.action")
	public String detail(ModelMap model,HttpServletRequest req,String id){

		//根据商品id获取商品信息
		Article article = as.getArticleById(id);
		//将商品信息存储
		model.addAttribute("article", article);
		//跳转至商品详情页面
		return"/WEB-INF/view/front/detail";
	}
	@RequestMapping("/userActive.action")
	public String userActive(ModelMap model,HttpServletRequest req,String id){
	
		
		try {
			
			//获取激活码
			String activeCode = req.getParameter("active");
			us.activeUser(activeCode);
			model.addAttribute("mess", "恭喜您，激活成功！");
		} catch (Exception e) {
			model.addAttribute("mess", "本次激活失败："+e.getMessage());
		}
		
		
		//跳转至登录
		return "/WEB-INF/view/front/login";
	}
}
