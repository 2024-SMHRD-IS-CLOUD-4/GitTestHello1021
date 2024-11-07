package com.smhrd.model;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.smhrd.database.SqlSessionManager;

public class FindNumberDAO {
	SqlSessionFactory factory = SqlSessionManager.getSqlSessionFactory();
	
	public List<FindNumber> findnumer() {
		SqlSession Session = factory.openSession(true); 
		List<FindNumber> result = Session.selectList("MemberMapper.FindNumber");
		Session.close();
		return result;
	}

	
}
