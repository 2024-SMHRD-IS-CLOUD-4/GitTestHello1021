package com.smhrd.model;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@NoArgsConstructor
@Setter
@Getter
@AllArgsConstructor
public class PostContent {
	
	int post_num;
	String post_title;
	String post_content;
	int post_views;
	int post_likes;
	String u_id;
	
	public PostContent(String post_title, String post_content, int post_views, int post_likes, String u_id) {
		this.post_title = post_title;
		this.post_content = post_content;
		this.post_views = post_views;
		this.post_likes = post_likes;
		this.u_id = u_id;
	}
	

}
