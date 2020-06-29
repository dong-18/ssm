package com.zx.controller.front;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import com.zx.bean.Shopcar;
import com.zx.bean.User;
import com.zx.service.ShopCarService;
import com.zx.util.ConstantUtil;
import com.zx.util.SpringUtil;
@Controller
public class ShopCar {
	private static final long serialVersionUID = 1L;
	@Autowired
	ShopCarService shopCarService;
	@RequestMapping("/addToCar.do")
	public String AddShopCarServlet(ModelMap model,HttpServletRequest request,String id,String number) {
		 
		   //获取页面传递的参数
		   //商品id
		  
		  //获取用户信息
		  User user = (User)request.getSession().getAttribute(ConstantUtil.SESSION_USER);
		  //根据用户信息以及商品id查询购物车详情表 判断该商品是否存在于用户的购物车中
		  Shopcar shopcar = shopCarService.getShopCarByUserIdAndArticeId(user.getId(),id);
	      
		  if(shopcar != null) {
			  //进行更新操作
			  shopCarService.updateShopCar(user.getId(),id,Integer.valueOf(number)+shopcar.getBuynum());
			  
		  }else {
			  //进行添加操作
			  shopCarService.addShopCar(user.getId(),id,number);
		  }
		  
		  //从定向至展示购物车中商品信息页面
		  return "redirect:/showShopCap.do";
    }
	@RequestMapping("/showShopCap.do")
	public String showShopCap(ModelMap model,HttpServletRequest request,String id,String number) {
		 
		   //获取页面传递的参数
		   //商品id
		  
		  //获取用户信息
		
		 
		 //从session中获取用户信息
		 User user = (User)request.getSession().getAttribute(ConstantUtil.SESSION_USER);
		 //根据用户id获取该用户购物车中商品信息
		 List<Shopcar> list = shopCarService.findAllShopCarByUserId(user);
		 model.addAttribute("list", list);
		 return "/WEB-INF/view/front/shopcar";
    }
	@RequestMapping("/deleteShopCar.do")
	public String deleteShopCar(ModelMap model,HttpServletRequest request,String articleId,String number) {
		 
		
		   //商品id
		  
		 
		  //获取用户信息
		  User user = (User)request.getSession().getAttribute(ConstantUtil.SESSION_USER);	
		  //进行更新操作
		  shopCarService.deleteShopCar(user.getId(),articleId);

		  //从定向至展示购物车中商品信息页面
		  return "redirect:/showShopCap.do";
    }
	@RequestMapping("/updateShopCar.do")
	public String updateShopCar(ModelMap model,HttpServletRequest request,String articleId,String buynum) {
		 
		
		 
		   //获取页面传递的参数
		   //商品id
		  
		  //购买数量

		  //获取用户信息
		  User user = (User)request.getSession().getAttribute(ConstantUtil.SESSION_USER);
	      
		  //进行更新操作
		 shopCarService.updateShopCar(user.getId(),articleId,Integer.valueOf(buynum));
			  
		 
		  
		  //从定向至展示购物车中商品信息页面
		 return "redirect:/showShopCap.do";
    }

}
