package com.smhrd.model;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.smhrd.database.SqlSessionManager;

public class NextPostDAO {
	SqlSessionFactory factory = SqlSessionManager.getSqlSessionFactory();


	public List<PostImage> NextPost() {
		SqlSession Session = factory.openSession(true); 
		List<PostImage> result = Session.selectList("MemberMapper.NextPost");
		Session.close();
		return result;
	}
}
