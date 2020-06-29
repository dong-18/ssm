/**
 * 
 */
package com.zx.service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.zx.bean.Article;
import com.zx.bean.ArticleType;


import com.zx.dao.ArticleTypeDao1;
import com.zx.page.PagerModel;
import com.zx.util.SqlSessionUtil;

/**
 * @author 罗春龙
 *  2020年3月4日
 *
 * version 1.0
 */
@Service("b")
public class ArticleTypeService {
	@Autowired
	ArticleTypeDao1 a;
	
	/**
	 * @return
	 * 获取所有的一级类型
	 */
	public List<ArticleType> getAllFType() {
		
		List<ArticleType> types = a.getAllFType();
	
		return types;
	}
public ArticleType calcType(String parentCode, String name, String remark) {
		
		ArticleType type = new ArticleType();
		type.setName(name);
		type.setRemark(remark);
		//
		if(parentCode == null || parentCode.equals("")) {
			//当前添加的是一级商品类型
			
			/*
			 * 获取最大的一级类型code    
			 * 0015 --->15  --->16  -->0016
			 * 0005 --->5   --->6   -->0006
			 * */
			String maxCode = a.findMaxFcode();
			
			//计算当前的code
			int curCode = Integer.valueOf(maxCode) + 1;//16
			System.out.println("curCode:"+curCode);
			String strCurCode = String.valueOf(curCode); // "16"
			System.out.println("strCurCode:"+strCurCode);

			//进行补零操作
			for(int i=0;i<maxCode.length() - String.valueOf(curCode).length(); i++) {
				//进行补零操作
				strCurCode = "0" + strCurCode;
			}			
			System.out.println("strCurCode:"+strCurCode);

			type.setCode(strCurCode);
		}else {
			/***
			 *添加二级商品类型
			 *
			 * 00010008  ==》0008 ==》8 ==》9  ==》 00010009
			 * */
			
			//根据一级类型获取最大的二级类型   0017  00170001
			String maxSecode = a.findMaxScode(parentCode);
			if(maxSecode == null || maxSecode.equals("")) {
				type.setCode(parentCode + "0001");
			}else {
				//进行截取   截取后四位
				String  code = maxSecode.substring(4); // 0008
				
				int curCode = Integer.valueOf(code) + 1;//9
				
				String strCurCode = String.valueOf(curCode); // "16"

				//进行补零操作
				for(int i=0;i<4 - String.valueOf(curCode).length(); i++) {
					//进行补零操作
					strCurCode = "0" + strCurCode;
				}
				
				type.setCode(parentCode + strCurCode);
			}
			
			
		}
		return type;
	}
	/**
	 * @param typeCode
	 * @return
	 * 根据一级商品类型获取对应的二级商品类型
	 */
	public List<ArticleType> getSecondTypesByFCode(String typeCode) {
		
		List<ArticleType> types = a.getSecondTypesByFCode(typeCode+"%");
	
		return types;
	}

	public List<ArticleType> getAllTypes(PagerModel pageModel) {
		// TODO Auto-generated method stub
		int totalNum = a.getTotalNum();
		//将总记录数封装至pageModel对象中
		pageModel.setTotalNum(totalNum);
		
		List<ArticleType> types = a.getAllTypes(pageModel.getStartSize(),pageModel.getPageSize());

		return types;
	}
	public ArticleType getArticleType(String code) {
		// TODO Auto-generated method stub
		
			  ArticleType type = a.getArticleType(code);
			  return type;
		
	}
	public void updateType(String name, String remark, String code) {
		a.updateType(name,remark,code);
		
	}
	public void addArticleType(String parentCode, String name, String remark) {
		ArticleType type = this.calcType(parentCode, name, remark);
		//保存商品类型
		a.saveType(type);
		
	}
	public void updateType2(String name, String remark, String code, String parentCode) {
		ArticleType type = this.calcType(parentCode, name, remark);
        
	  
	     a.saveType(type);
	     a.updateType1(type.getCode(), code);
	     a.deleteType1(code);
		
	}
	public void deleteArticle(String code)  {
		//判断商品类型下是否存在上架的商品信息
		 int  flag = a.findArticleByCode(code);
		 if(flag!=0) {
			 //该商品类型下还存在上架的商品信息
			 throw new RuntimeException("删除失败:该商品类型下存在上架的商品信息，商品下架后才可删除该类型！");
		 }
		 
		 //进行   逻辑  删除商品类型信息
		 a.deleteType(code);
		
	}

	

}
