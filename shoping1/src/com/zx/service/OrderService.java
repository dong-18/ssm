/**
 * 
 */
package com.zx.service;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.zx.bean.Article;
import com.zx.bean.Order;
import com.zx.bean.OrderItem;
import com.zx.bean.User;


import com.zx.dao.OrderDao1;
import com.zx.page.PagerModel;
import com.zx.util.SqlSessionUtil;

/**
 * @author 罗春龙
 *  2020年3月4日
 *
 * version 1.0
 */
@Service("c")
public class OrderService {
	@Autowired
	OrderDao1 a;
	/**
	 * @param totalAmount
	 * @param articleInfo
	 * 保存订单
	 */
	public void saveOrder(String totalAmount, String articleInfo,User user) {
		
		 Order order = new Order();
		 
		 SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
		 
		 StringBuffer sb = new StringBuffer();
		 sb.append("PO-").append(sdf.format(new Date())).append(user.getId());
		 
		 //设置订单编号  OR-yyyymmddhhmmss-userId
		 order.setOrderCode(sb.toString());
		//设置下单时间
		 order.setCreateDate(new Date());
		 //指定用户信息
		 order.setUserId(user.getId());
		 //指定订单总金额
		 order.setAmount(Double.valueOf(totalAmount));
		 
		 //保存订单并获取订单id
		 a.saveOrder(order);
		 int orderId = order.getId();
		
		 //保存订单之后获取订单id ，插入至订单明细中 #2_1#1_1 ==> 2_1#1_1
		 articleInfo = articleInfo.substring(1);
		 //按照 # 进行切分  {2_1,1_1}
		 String[] aInfos = articleInfo.split("#");
	
		 for(String info : aInfos) {
			 //获取商品id与购买数量
			 String[] id_num = info.split("_");
			 OrderItem item = new OrderItem();
			 item.setArticleId(Integer.valueOf(id_num[0]));
			 item.setOrderNum(Integer.valueOf(id_num[1]));
			 item.setOrderId(orderId);
			 a.saveItem(item);
		 }
	
	}
	/**
	 * @param id
	 * @return
	 * 根据用户的id获取订单信息
	 */
	public List<Order> getOrdersByUserId(int id) {
		
		List<Order> orders = a.getOrdersByUserId(id);
		for(int i=0;i<orders.size();i++) {
			//根据订单id获取订单详情
			System.out.println(orders.get(i).getOrderCode());
			List<OrderItem> items = a.getItemsByorderId(orders.get(i).getId());
		    //将订单详情存放在 订单中
			orders.get(i).setItems(items);
		}
	
		return orders;
	}
	public List<Order> findAllOrder(PagerModel pageModel, String payStatus, String ordeCode) {
		// TODO Auto-generated method stub
pageModel.setPageSize(10);
		
		//查询订单总记录数
		//查询总记录数
		int totalNum = a.getTotalNum(payStatus,ordeCode);
		//将总记录数封装至pageModel对象中
		pageModel.setTotalNum(totalNum);
		
		List<Order> orders = a.findAllOrder(pageModel.getStartSize(),pageModel.getPageSize(),payStatus,ordeCode);
		for(int i=0;i<orders.size();i++) {
			//根据订单id获取订单详情
			List<OrderItem> items = a.getItemsByorderId(orders.get(i).getId());
		    //将订单详情存放在 订单中
			orders.get(i).setItems(items);
		}
		return orders;
	}
	public void checkOrder(String id, String status) {
		// TODO Auto-generated method stub
		a.checkOrder(Integer.valueOf(id),status,new Date());
	}

	

}
