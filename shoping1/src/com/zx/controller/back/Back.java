package com.zx.controller.back;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import com.zx.bean.Article;
import com.zx.bean.ArticleType;
import com.zx.page.PagerModel;
import com.zx.service.ArticleService;
import com.zx.service.ArticleTypeService;
import com.zx.util.ConstantUtil;

@Controller
public class Back {
	@Autowired
	ArticleService as;
	@Autowired
	ArticleTypeService articleTypeService ;
	@RequestMapping("/mindex.do")
	public String itemEdit(ModelMap model,HttpServletRequest req,String typeCode,String title,String pageIndex ){
	
		
		model.addAttribute("typeCode", typeCode);
		//获取查询关键字
		
		//将用户输入的关键字存储
		model.addAttribute("title", title);
		
		//创建分页实体    用于封装分页相关的信息
		PagerModel pageModel = new PagerModel();
		
		//获取页码
		
		if(pageIndex != null && !pageIndex.equals("")) {
			pageModel.setPageIndex(Integer.valueOf(pageIndex));
		}
		 
		//创建服务层对象
		
		//创建商品类型服务层对象
		
		
		//获取所有的商品信息
		List<Article> articles = as.getAllArticle(typeCode,title,pageModel,"1");
		//将商品信息存放至request对象中
		model.addAttribute("articles", articles);
		model.addAttribute("pageModel", pageModel);
		//获取商品的一级类型
		List<ArticleType> types = articleTypeService.getAllFType();
		//将一级商品类型的信息存储
		model.addAttribute("types", types);
		//跳转至首页
		return"/WEB-INF/view/back/article/list";
	}
	@RequestMapping("/ajaxLoadSeTypes.do")
	public String ajaxLoadSeTypes(ModelMap model,HttpServletResponse req,String code){
		
		   
		  //获取一级商品类型的code
	
		   //获取二级商品类型信息
		   String jsonStr =  as.getAllSecondTypeByCode(code);
		   //System.out.println("jsonStr:"+jsonStr);
		   //将数据写出至前台页面
		   try {
			req.getWriter().write(jsonStr);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		};
		   return null;
	}
}
