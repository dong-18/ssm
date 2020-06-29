package com.zx.controller.back;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import com.zx.bean.ArticleType;
import com.zx.page.PagerModel;
import com.zx.service.ArticleTypeService;
@Controller
public class ArticleTypef {
	@Autowired
	ArticleTypeService ats;
	@RequestMapping("/articleTypeList.do")
	public String articleTypeList(ModelMap model,HttpServletResponse req,String pageIndex,String disabled ){
		
		   
		

		
		PagerModel pageModel = new PagerModel();
		
		//获取页码
		
		if(pageIndex != null && !pageIndex.equals("")) {
			pageModel.setPageIndex(Integer.valueOf(pageIndex));
		}
		model.addAttribute("pageModel", pageModel);
		//获取所有的商品类型
		List<ArticleType> types = ats.getAllTypes(pageModel);
		model.addAttribute("types", types);
		//跳转至商品类型列表页面
		return "/WEB-INF/view/back/articleType/list";
		
	}
	   @RequestMapping("/addOrUpdateArticleType.do")
      public String addOrUpdateArticleType(ModelMap model,HttpServletRequest req,String code,String disabled ){
		
		   if("GET".equals(req.getMethod()))
		   {
			   
				 if(code!=null  && !code.equals("")) {
					//根据商品类型的code获取商品类型
					 ArticleType type = ats.getArticleType(code);
					 model.addAttribute("articleType", type);
				 }
				
				 List<ArticleType> types = ats.getAllFType();
				 model.addAttribute("types", types);

				return"/WEB-INF/view/back/articleType/view";
			   
		   }
		   else
		   {
			   

				  //获取父级商品类型的code
			    String parentCode = req.getParameter("parentCode");
			    //获取 商品类型名称
			    String name = req.getParameter("name");
			    //获取备注信息
			    String remark = req.getParameter("remark");
			    
			    //获取商品类型的code
			    
			    if(code != null && !code.equals("")) {
			    	/*
			    	 * 进行更新操作
			    	 * 判断用户有没有更换上级类型
			    	 * 
			    	 * */
			    	
			    	//获取 历史 上级类型  和当前选择的上级类型进行比较 
			    	String oldPcode = code.substring(0,code.length() - 4);
			    	if(oldPcode.equals(parentCode)) {
			    		//说明并未更改上级类型
			    		ats.updateType(name,remark,code);
			    	}else {
			    		//需要更换上级类型
			    		ats.updateType2(name,remark,code,parentCode);
			    	}
			    }else {
			    	//进行添加操作
				    ats.addArticleType(parentCode,name,remark);

			    }
			    //重定向至首页
			    return "redirect:/articleTypeList.do";
			    
		   }
		

		
		
		
	}
	   @RequestMapping("/deleteType.do")
		public String deleteType(ModelMap model,HttpServletResponse req,String code,String disabled ){
		   try {
				 
					
				//获取商品类型的code
				
				 ats.deleteArticle(code);
				 model.addAttribute("message", "删除成功！");
			} catch (Exception e) {
				// TODO: handle exception
			
				model.addAttribute("message", e.getMessage());
			}
			
	          //重定向至商品类型列表页面
			return "forward:/articleTypeList.do";
			
		}
}
