package com.smhrd.model;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.smhrd.database.SqlSessionManager;

public class ImageDAO {
	SqlSessionFactory factory = SqlSessionManager.getSqlSessionFactory();
	
	public int insertImage(PostImage m) {
		SqlSession Session = factory.openSession(true); 
		int result = Session.insert("MemberMapper.insertImage", m);
		Session.close();
		return result;
	}
	
	public int updateImage(PostImage m) {
		SqlSession Session = factory.openSession(true); 
		int result = Session.update("MemberMapper.updateImage", m);
		Session.close();
		return result;
	}

}
