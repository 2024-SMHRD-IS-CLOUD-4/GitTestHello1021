package com.smhrd.model;


import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.smhrd.database.SqlSessionManager;

public class MemberDAO {

	SqlSessionFactory factory = SqlSessionManager.getSqlSessionFactory();


	public int join(MavenMemer m) {
		SqlSession Session = factory.openSession(true); 
		int result = Session.insert("MemberMapper.join", m);
		Session.close();
		return result;
	}
	
	public MavenMemer login(MavenMemer m1) {
		SqlSession Session = factory.openSession(true);
		MavenMemer result = Session.selectOne("MemberMapper.login", m1);
		Session.close();
		return result;
	}
	
	
	
	
	
	
	
	
	
	
	
	

}
