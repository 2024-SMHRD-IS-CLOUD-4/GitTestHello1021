package com.smhrd.model;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.smhrd.database.SqlSessionManager;

public class My_post_img_DAO {
	SqlSessionFactory factory = SqlSessionManager.getSqlSessionFactory();

	public List<PostImage> selectMyPost(String u_id) {
		SqlSession Session = factory.openSession(true);
		List<PostImage> result = Session.selectList("MemberMapper.selectMyPost", u_id);
		Session.close();
		return result;
			
	}
	public String updated_at2(String file_rname) {
		SqlSession Session = factory.openSession(true); 
		String result = Session.selectOne("MemberMapper.updated_at2",file_rname);
		Session.close();
		return result;
	}
}
