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

	String post_title;
	String post_content;
	int post_views;
	int post_likes;
	String u_id;

}
