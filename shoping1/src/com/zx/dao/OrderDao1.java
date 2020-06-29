package com.zx.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.zx.bean.Article;
import com.zx.bean.Order;
import com.zx.bean.OrderItem;
import com.zx.page.PagerModel;
import com.zx.util.ConnectionFactory;

public interface OrderDao1 {
	/**
	 * @param order
	 * @return
	 * 保存订单
	 */
	public int saveOrder(Order order) ;
		

	/**
	 * @param item
	 * 保存订单详情
	 */
	public void saveItem(OrderItem item) ;

	/**
	 * @param id
	 * @return
	 * 根据用户的id获取订单信息
	 */
	public List<Order> getOrdersByUserId(int id) ;

	/**
	 * @param id
	 * @return
	 * 根据订单id获取订单详情
	 */
	public List<OrderItem> getItemsByorderId(int id) ;


	public int getTotalNum(@Param("a")String a, @Param("b")String b);
//
//
	public List<Order> findAllOrder(@Param("startSize")int startSize,@Param("pageSize")int pageSize, @Param("a")String a, @Param("b")String b);


	public void checkOrder(@Param("a")Integer valueOf, @Param("b")String status,@Param("c")Date a);
}
