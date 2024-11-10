package com.smhrd.model;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.smhrd.database.SqlSessionManager;

public class DelPageDAO {
	SqlSessionFactory factory = SqlSessionManager.getSqlSessionFactory();

	public int DeleteImage(String file_rname) {
		SqlSession Session = factory.openSession(true);
		System.out.println("DelPageDAO");
		int result = Session.delete("MemberMapper.DeleteImage", file_rname);
		Session.close();
		return result;
	}
}
