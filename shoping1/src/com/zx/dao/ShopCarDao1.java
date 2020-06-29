package com.zx.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.zx.bean.Article;
import com.zx.bean.Shopcar;
import com.zx.util.ConnectionFactory;

public interface ShopCarDao1 {

	/**
	 * @param uid
	 * @param aid
	 * @return
	 * 根据用户信息以及商品id查询购物车详情表 判断该商品是否存在于用户的购物车中
	 */
	public Shopcar getShopCarByUserIdAndArticeId(@Param("uid") int uid, @Param("aid") int aid) ;

	/**
	 * @param uid
	 * @param valueOf
	 * @param buynum
	 * 更新购物车中商品的购买数量
	 */
	public void updateShopCar( int uid, int aid, int buynum) ;

	/**
	 * @param id
	 * @param aid
	 * @param buynum
	 */
	public void addShopCar(@Param("A") int uid,@Param("b")  int aid,@Param("c") int buynum) ;

	/**
	 * @param id
	 * @return
	 * 根据用户id获取该用户购物车中所有的商品信息
	 */
	public List<Shopcar> findAllShopCarByUserId(int id) ;
	/**
	 * @param userId
	 * @param articleId
	 * 进行删除操作
	 */
	public void deleteShopCar(int userId, int articleId) ;
}
