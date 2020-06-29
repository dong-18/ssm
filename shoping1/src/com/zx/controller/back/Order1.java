package com.zx.controller.back;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import com.zx.bean.Order;
import com.zx.page.PagerModel;
import com.zx.service.OrderService;

@Controller
public class Order1 {
	@Autowired
	OrderService os;
	@RequestMapping("/mOrderList.do")
	public String mOrderList(ModelMap model,HttpServletResponse req,String payStatus,String ordeCode){
		
		   
		
		
		//创建分页实体
		PagerModel pageModel = new PagerModel();
		
		
		//订单分页查询
		List<Order>  orderList = os.findAllOrder(pageModel,payStatus,ordeCode);
		model.addAttribute("orderList", orderList);
		model.addAttribute("pageModel", pageModel);
		

		
		//跳转至展示订单信息页面
		return "/WEB-INF/view/back/order/list";
	}
	@RequestMapping("/checkOrder.do")
	public String checkOrder(ModelMap model,HttpServletResponse req,String id,String status){
		
		   
		
		
		
		//获取订单id
		
		os.checkOrder(id,status);
		//重定向至订单列表
		return "redirect:/mOrderList.do";
	}
}
