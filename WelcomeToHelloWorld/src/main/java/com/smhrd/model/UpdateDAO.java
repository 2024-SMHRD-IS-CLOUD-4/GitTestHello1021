package com.smhrd.model;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.smhrd.database.SqlSessionManager;

public class UpdateDAO {
	SqlSessionFactory factory = SqlSessionManager.getSqlSessionFactory();

	public int UpdateContent(UpdateVo m) {
		SqlSession Session = factory.openSession(true);
		int result = Session.update("MemberMapper.UpdateContent", m);
		Session.close();
		return result;
	}
	public int Updateimage(UpdateVo m) {
		SqlSession Session = factory.openSession(true);
		int result = Session.update("MemberMapper.Updateimage", m);
		Session.close();
		return result;
	}

}
