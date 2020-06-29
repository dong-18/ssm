package com.zx.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.zx.bean.ArticleType;
import com.zx.page.PagerModel;
import com.zx.util.ConnectionFactory;

public interface ArticleTypeDao1 {
	/**
	 * @return
	 */
	public List<ArticleType> getAllFType() ;
	

	/**
	 * @param string
	 * @return
	 * 根据一级商品类型获取对应的二级商品类型
	 */
	public List<ArticleType> getSecondTypesByFCode(String code) ;


	public int getTotalNum();


	public List<ArticleType> getAllTypes(int a,int b);


	public String findMaxFcode();


	public String findMaxScode(@Param("va")String parentCode);


	public ArticleType getArticleType(String code);


	public void updateType(String name, String remark, String code);


	public void saveType(ArticleType type);
	public void updateType1(String a,String b);
	public void deleteType1(String a);


	public int findArticleByCode(String code);


	public void deleteType(String code);
}
