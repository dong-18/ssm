/**
 * 
 */
package com.zx.util;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import org.apache.commons.dbcp.BasicDataSource;

/**
 * @author 罗春龙
 *  2020年3月4日
 *
 * version 1.0
 */
public class ConnectionFactory {

	//构建数据源
	private static BasicDataSource  dataSource = new BasicDataSource();
     

	static {
		 //指定数据库连接的url地址
	     dataSource.setUrl("jdbc:mysql://127.0.0.1:3306/cosmeticsshop?characterEncoding=utf-8");
	     //指定数据库驱动
	     dataSource.setDriverClassName("com.mysql.jdbc.Driver");
	     //账号
	     dataSource.setUsername("root");
	     //密码
	     dataSource.setPassword("root");
	     //最大活动数
	     dataSource.setMaxActive(100);
	     //最大保留数
	     dataSource.setMaxIdle(50);
	     //超时等待时间
	     dataSource.setMaxWait(5000);
	}
	
	
	
	
	//获取连接
	public static Connection getCon() {
		
		try {
			return dataSource.getConnection();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}
	
	
	//关闭连接
	public static void closeCon(ResultSet rs,PreparedStatement pstm, Connection con) {
		 try {
			 if(rs != null) {
				 rs.close();
			 }
			 
			 if(pstm != null) {
				 pstm.close();
			 }
			 
			 if(con != null) {
				 con.close();
			 }
		} catch (Exception e) {
			e.printStackTrace();
			
		}
		 
	}
}
