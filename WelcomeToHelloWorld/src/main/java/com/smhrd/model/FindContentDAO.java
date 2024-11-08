package com.smhrd.model;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.smhrd.database.SqlSessionManager;

public class FindContentDAO {
	SqlSessionFactory factory = SqlSessionManager.getSqlSessionFactory();

	public String findcontent(String file_rname) {
		SqlSession Session = factory.openSession(true);
		String result = Session.selectOne("MemberMapper.findcontent", file_rname);
		Session.close();
		return result;
	}
}
