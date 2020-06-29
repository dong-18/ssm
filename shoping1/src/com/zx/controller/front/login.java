package com.zx.controller.front;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.zx.bean.Article;
import com.zx.bean.ArticleType;
import com.zx.bean.User;
import com.zx.page.PagerModel;
import com.zx.service.ArticleService;
import com.zx.service.ArticleTypeService;
import com.zx.service.UserService;
import com.zx.util.ConstantUtil;
import com.zx.util.SpringUtil;

@Controller
public class login {
	
	@Autowired
	ArticleService as;
	@Autowired
	UserService us;
	@RequestMapping("/index")
	public ModelAndView itemList(HttpServletRequest req,HttpServletResponse response,String typeCode,String keyword){
		System.out.println("2");
		ModelAndView mav = new ModelAndView();
		//创建分页实体    用于封装分页相关的信息
				PagerModel pageModel = new PagerModel();
				
				//获取页码
				String pageIndex = req.getParameter("pageIndex");
				if(pageIndex != null && !pageIndex.equals("")) {
					pageModel.setPageIndex(Integer.valueOf(pageIndex));
				}
		mav.addObject("typeCode", typeCode);		
		mav.addObject("keyword", keyword);
		ArticleTypeService articleTypeService = (ArticleTypeService)SpringUtil.a().getBean("b");
		//获取所有的商品信息
		List<Article> articles = as.getAllArticle(typeCode,keyword,pageModel,"0");
		mav.addObject("articles", articles);
		//获取商品的一级类型
		List<ArticleType> types = articleTypeService.getAllFType();
		//将一级商品类型的信息存储
		mav.addObject("types", types);
		mav.addObject("pageModel", pageModel);
		if(typeCode != null && !typeCode.equals("")) {
			//获取一级类型的code
			String firstCode = typeCode.substring(0, 4);
			
			mav.addObject("firstCode", firstCode);
			//根据一级商品类型获取对应的二级商品类型   0001 == >0001  00010001 == >0001
			List<ArticleType> seTypes = articleTypeService.getSecondTypesByFCode(firstCode);
			
			mav.addObject("seTypes", seTypes);
			
		}
		//跳转至首页
		mav.setViewName("/WEB-INF/view/front/artileIndex");
		return mav;
	}
	@RequestMapping("/logout")
	public String itemEdit(ModelMap model,HttpServletRequest req){
	
		req.getSession().removeAttribute(ConstantUtil.SESSION_USER);
		return "forward:/index.action";
	}
	@RequestMapping("/login")
	public String logoin(ModelMap model,HttpServletRequest req,String loginName,String passWord){
		if("GET".equals(req.getMethod()))
		{
			return"/WEB-INF/view/front/login";
		}
		else
		{
			   //根据账号密码获取用户信息
			   User user = us.getUserByNameAndPass(loginName,passWord);
			   if(user == null) {
				   //跳转至登录页面
				   model.addAttribute("mess", "账号或密码不正确！");
				   return"/WEB-INF/view/front/login";
			   }else if(user.getDisabled().equals("0")){
				   //跳转至登录页面
				   model.addAttribute("mess", user.getRole() == 1 ? "您尚未激活，请登录邮箱【"+user.getEmail()+"】进行激活!" : "请联系超级管理员进行审核!");
				   return"/WEB-INF/view/front/login";
			   }else {
				   req.getSession().setAttribute(ConstantUtil.SESSION_USER, user);
	               //重定向至首页
				   return "redirect:/index.action";
			   }
		}
		
	}
}
