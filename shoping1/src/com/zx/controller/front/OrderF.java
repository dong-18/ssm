package com.zx.controller.front;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import com.zx.bean.Order;
import com.zx.bean.User;
import com.zx.service.OrderService;
import com.zx.util.ConstantUtil;
@Controller
public class OrderF {
	@Autowired
	OrderService os;
	@RequestMapping("/saveOrder.do")
	public String saveOrder(ModelMap model,HttpServletRequest req,String totalAmount,String articleInfo){
	

		
		User user = (User)req.getSession().getAttribute(ConstantUtil.SESSION_USER);
		//获取订单总金额
		
		os.saveOrder(totalAmount,articleInfo,user);
		//重定向至展示订单信息页面
		 return "redirect:/showOrder.do";
	}
	@RequestMapping("/showOrder.do")
	public String showOrder(ModelMap model,HttpServletRequest req,String totalAmount,String articleInfo){
	

		

		
		User user = (User)req.getSession().getAttribute(ConstantUtil.SESSION_USER);
		//根据用户的id获取订单信息
		List<Order>  orders = os.getOrdersByUserId(user.getId());
		//将订单信息进行存储
		req.setAttribute("orders", orders);
		//跳转至展示订单信息的页面
		return "/WEB-INF/view/front/order";
	}
}
