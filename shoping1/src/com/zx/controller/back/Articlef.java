package com.zx.controller.back;

import java.io.File;
import java.io.IOException;
import java.util.Date;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import com.zx.bean.ArticleType;
import com.zx.service.ArticleService;
import com.zx.service.ArticleTypeService;
import com.zx.util.ConstantUtil;

@Controller
public class Articlef {
	@Autowired
	ArticleService as;
	@Autowired
	ArticleTypeService ats;
	@RequestMapping("/addArticle.do")
	public String addArticle(ModelMap model,HttpServletRequest req,MultipartFile pic,com.zx.bean.Article a){
		//获取Part对象   文件的信息
		String name = UUID.randomUUID().toString();
		// 图片原名字
		String oldName = pic.getOriginalFilename();
		System.out.println(oldName);
		// 后缀名
		String exeName = oldName.substring(oldName.lastIndexOf("."));

		File pi = new File(req.getServletContext().getRealPath("/resources/image/article/") + name + exeName);
		// 保存图片到本地磁盘
		//System.out.println(req.getServletContext().getRealPath("/resources/image/article/") + name + exeName);
		try {
			pic.transferTo(pi);
		} catch (IllegalStateException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} 
		// 更新商品图片信息
		
				
		        a.setImage(name + exeName);
		        Date aa=new Date();
		       a.setCreateDate(aa);
		        //保存商品信息
		        as.saveArticle(a);

				//跳转至首页
				return "redirect:/mindex.do";
	}
	@RequestMapping("/showArticleUpdate.do")
	public String itemEdit(ModelMap model,HttpServletRequest req){
	
		List<ArticleType> types = ats.getAllFType();
		model.addAttribute("types", types);
		//获取商品的id
		String id = req.getParameter("id");
		com.zx.bean.Article article = as.getArticleById(id);
		model.addAttribute("article", article);
		System.out.println(article.getTypeCode());
		return "/WEB-INF/view/back/article/updateArticle";
	}
	@RequestMapping("/articleUpdate.do")
	public String articleUpdate(ModelMap model,HttpServletRequest req,com.zx.bean.Article a,MultipartFile pic){
	
		
		String name = UUID.randomUUID().toString();
		// 图片原名字
		String oldName = pic.getOriginalFilename();
		if(oldName != null && !oldName.equals("")) {
			//通过UUID生成新的文件名
			String exeName = oldName.substring(oldName.lastIndexOf("."));

			File pi = new File(req.getServletContext().getRealPath("/resources/image/article/") + name + exeName);
			// 保存图片到本地磁盘
			//System.out.println(req.getServletContext().getRealPath("/resources/image/article/") + name + exeName);
		a.setImage(name + exeName);
		
			try {
				pic.transferTo(pi);
			} catch (IllegalStateException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} 
		}
		
		
		// 后缀名
		
       //获取Part对象   文件的信息
		
		
		//获取文件的原始名称    1.jpg
		
		
		
		
		 //获取二级商品类型
       
		
     
       //更新商品信息
		as.updateArticle(a);
		return "redirect:/mindex.do";
		
	}
	@RequestMapping("/removeOrPutArticle.do")
	public String removeOrPutArticle(ModelMap model,HttpServletResponse req,String id,String disabled ){
		
		   
		
		 //获取商品id
		 
		 
		 //获取上架或下架标记
		 
		 as.removeOrPutArticleServlet(id,disabled);
		 
		 //重定向至首页
		 return "redirect:/mindex.do";
	}
}
