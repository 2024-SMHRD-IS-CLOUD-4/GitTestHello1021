package com.smhrd.model;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.smhrd.database.SqlSessionManager;

public class contentDAO {
SqlSessionFactory factory = SqlSessionManager.getSqlSessionFactory();
	
	public int insertContent(PostContent m) {
		SqlSession Session = factory.openSession(true); 
		int result = Session.insert("MemberMapper.insertContent", m);
		Session.close();
		return result;
	}
}
