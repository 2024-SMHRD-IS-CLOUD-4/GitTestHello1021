package com.smhrd.model;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;



@NoArgsConstructor
@Setter
@Getter
@AllArgsConstructor
public class MavenMemer {
	
	// mybatis를 사용하기 위해서 데이터를 하나로 묶어줄 vo
	
	// id, pw, nickname 이때 태이블의 컬럼명과 똑깥이 적어주어야 한다!!!!!
	String id;
	String pw;
	String nickname;
	
	public MavenMemer(String id, String pw) {
		this.id = id;
		this.pw = pw;
	}

}

