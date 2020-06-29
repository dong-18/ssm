/**
 * 
 */
package com.zx.service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.google.gson.Gson;
import com.zx.bean.Article;
import com.zx.bean.ArticleType;
import com.zx.dao.ArticleDao1;
import com.zx.dao.ArticleTypeDao1;
import com.zx.page.PagerModel;
import com.zx.util.SqlSessionUtil;


/**
 * @author 罗春龙
 *  2020年3月4日
 *
 * version 1.0
 */
@Service("a")
public class ArticleService {

	@Autowired
	ArticleDao1 articleDao;
	@Autowired
	 ArticleTypeDao1  typeDao;
	/**
	 * @param pageModel 
	 * @return
	 * 获取所有的商品信息
	 */
	public List<Article> getAllArticle(String typeCode,String keyword,PagerModel pageModel,String string) {
		typeCode = typeCode == null ? "%" : typeCode + "%";
		keyword = keyword == null ? "%%" : "%"+keyword+"%";
		int totalNum = articleDao.getTotalNum(typeCode,keyword);
		//将总记录数封装至pageModel对象中
		pageModel.setTotalNum(totalNum);
	List<Article> articles = articleDao.getAllArticle(typeCode,keyword,string,pageModel.getStartSize(),pageModel.getPageSize());
		
		return articles;
	}

	/**
	 * @param id
	 * @return
	 * 根据商品id获取商品信息
	 */
	public Article getArticleById(String id) {

		Article t= articleDao.getArticleById(Integer.valueOf(id));

	return t;
	}

	public String getAllSecondTypeByCode(String code) {
		List<ArticleType> types = typeDao.getSecondTypesByFCode(code+"%");
		   Gson gson=new Gson();
		
		String jsonstr = gson.toJson(types);

		return jsonstr;
	}

	public void saveArticle(com.zx.bean.Article a) {
		// TODO Auto-generated method stub
		articleDao.save(a);
	}

	public void updateArticle(Article a) {
		// TODO Auto-generated method stub
		articleDao.update(a);
	}

	public void removeOrPutArticleServlet(String id, String disabled) {
		// TODO Auto-generated method stub
		articleDao.removeOrPutArticleServlet(disabled,Integer.valueOf(id));
	}

}
