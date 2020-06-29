/**
 * 
 */
package com.zx.service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.zx.bean.Article;
import com.zx.bean.Shopcar;
import com.zx.bean.User;


import com.zx.dao.ShopCarDao1;
import com.zx.util.SqlSessionUtil;

/**
 * @author 罗春龙
 *  2020年3月4日
 *
 * version 1.0
 */
@Service("d")
public class ShopCarService {
	@Autowired
	ShopCarDao1 a;
	/**
	 * @param id
	 * @param id2
	 * @return
	 * 根据用户信息以及商品id查询购物车详情表 判断该商品是否存在于用户的购物车中
	 */
	
	public Shopcar getShopCarByUserIdAndArticeId(int uid, String aid) {
		// TODO Auto-generated method stub
		
		Shopcar b=a.getShopCarByUserIdAndArticeId(uid,Integer.valueOf(aid));
	
	return b;
	}
	/**
	 * @param id
	 * @param id2
	 * @param string
	 * //进行更新操作
	 */
	public void updateShopCar(int uid, String aid, int buynum) {
		// TODO Auto-generated method stub
		
		
		a.updateShopCar(buynum,uid,Integer.valueOf(aid));
		
		
	}
	/**
	 * @param id
	 * @param id2
	 * @param string
	 * //进行添加操作
	 */
	public void addShopCar(int uid, String aid, String buynum) {
		//添加商品至购物车
		
		a.addShopCar(Integer.valueOf(buynum),uid,Integer.valueOf(aid));;

	}
	/**
	 * @param user
	 * @return
	 * 根据用户id获取该用户购物车中商品信息
	 */
	public List<Shopcar> findAllShopCarByUserId(User user) {
		
		List<Shopcar> shopcars = a.findAllShopCarByUserId(user.getId());
	
		return shopcars;
	}
	/**
	 * @param id
	 * @param id2
	 * 进行删除操作
	 */
	public void deleteShopCar(int userId, String articleId) {
		// TODO Auto-generated method stub
		
		a.deleteShopCar(userId,Integer.valueOf(articleId));

	}

	

}
