package com.smhrd.model;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.smhrd.database.SqlSessionManager;

public class user_edit_DAO {
	SqlSessionFactory factory = SqlSessionManager.getSqlSessionFactory();
	
	
	public int UpdateUserinfo(MavenMemer m) {	
		SqlSession Session = factory.openSession(true);
		int result = Session.update("MemberMapper.UpdateUserinfo", m);
		Session.close();
		return result;
	}
}
