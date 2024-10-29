package com.smhrd.database;

import java.io.IOException;
import java.io.Reader;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

// sqlsession을 생성해주는 공장 역할
public class SqlSessionManager {

	// SqlSession -> DB 관련한 작업을(한 가지)
	// SqlSession 객체 : DB 연결, sql 실행과 같은 DB에 관련된 한가지 작업을 수행하는 객체

	public static SqlSessionFactory sqlSessionFactory;

	// mybatis-config.xml(설정)에 작성되어 있는 값을 가지고 공장을 생성!
	// -> 클래스가 로딩되면 딱 한번만 실행되고 실행하지 않음!

	static {
		// 1. 설정 파일을 읽어오기
		String resource = "com/smhrd/database/mybatis-config.xml";
		try {
			Reader reader = Resources.getResourceAsReader(resource);
			sqlSessionFactory = new SqlSessionFactoryBuilder().build(reader);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

	// 생성된 Factory 반환 메소드
	public static SqlSessionFactory getSqlSessionFactory() {
		return sqlSessionFactory;
	}

}
