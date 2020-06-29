	package com.zx.dao;

	import java.sql.Connection;
	import java.sql.PreparedStatement;
	import java.sql.ResultSet;
	import java.util.ArrayList;
	import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.zx.bean.Article;
	import com.zx.util.ConnectionFactory;

public interface ArticleDao1 {

	/**
	 * 
	 */


	/**
	 * @author 罗春龙
	 *  2020年3月4日
	 *
	 * version 1.0
	 */


		/**
		 * 获取所有的商品信息
		 * @param string 
		 * @return
		 */
	
		public List<Article> getAllArticle(String typeCode,String keyword,@Param("a")String string,Integer a,Integer b ) ;

		/**
		 * @param valueOf
		 * @return
		 * 根据商品id获取商品信息
		 */
		public Article getArticleById(Integer id) ;

		public int getTotalNum(String typeCode, String keyword);

		public void save(com.zx.bean.Article a);

		public void update(Article a);

		public void removeOrPutArticleServlet(String disabled,Integer valueOf);

	


}
