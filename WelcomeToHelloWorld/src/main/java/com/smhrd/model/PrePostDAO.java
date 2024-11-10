package com.smhrd.model;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.smhrd.database.SqlSessionManager;

public class PrePostDAO {
	SqlSessionFactory factory = SqlSessionManager.getSqlSessionFactory();

	public List<PostImage> PrePost(int file_num) {
		SqlSession Session = factory.openSession(true);
		List<PostImage> result = Session.selectList("MemberMapper.PrePost", file_num);
		Session.close();
		return result;
	}

	public PostContent NextcPost(int post_num) {
		SqlSession Session = factory.openSession(true);
		PostContent result = Session.selectOne("MemberMapper.NextcPost", post_num);
		Session.close();
		return result;
	}

	public String NextNick(int post_num) {
		SqlSession Session = factory.openSession(true);
		String result = Session.selectOne("MemberMapper.NextNick", post_num);
		Session.close();
		return result;
	}

	public String updated_at(int post_num) {
		SqlSession Session = factory.openSession(true);
		String result = Session.selectOne("MemberMapper.updated_at", post_num);
		Session.close();
		return result;
	}

}
