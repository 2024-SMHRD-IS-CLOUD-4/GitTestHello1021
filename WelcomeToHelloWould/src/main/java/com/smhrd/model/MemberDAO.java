package com.smhrd.model;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.smhrd.database.SqlSessionManager;

public class MemberDAO {

	// 회원가입(insert) 기능 메소드
	// 1. SqlSession 객체를 생성 <- SqlsessionFactory에서 만들어준다
	// 2. SqlSession 객체 활용 insert 작업 수행
	// 3. 결과 값을 반환
	
	// 1. factory 가지고 오기!
	SqlSessionFactory factory = SqlSessionManager.getSqlSessionFactory();
	
	// 2. insert 작업 수행 - join이라고 하는 메소드를 작성
	public int join(MavenMemer m) {
		SqlSession sqlSession = factory.openSession(true); // auto commit true -> 커밋 수행
		int result = sqlSession.insert("MemberMapper.insert",m);
		// 세션 반납
		sqlSession.close();
		return result;
	}

	public MavenMemer login(MavenMemer joinMember) {
		SqlSession sqlSession = factory.openSession(true); // auto commit true -> 커밋 수행
		MavenMemer result = sqlSession.selectOne("MemberMapper.login", joinMember);
		sqlSession.close();
		return result;
	}
	
	
	
	
	
	
}
