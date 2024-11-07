package com.smhrd.model;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@NoArgsConstructor
@Setter
@Getter
@AllArgsConstructor
public class PostImage {

    String file_ext;
    long file_size; 
    String file_rname;
    int file_num;
    int post_num;
    
	public PostImage(String file_ext, long file_size, String file_rname) {
		super();
		this.file_ext = file_ext;
		this.file_size = file_size;
		this.file_rname = file_rname;
	}

	public PostImage(int POST_NUM, String file_rname, int file_num) {
		super();
		this.post_num = POST_NUM;
		this.file_rname = file_rname;
		this.file_num = file_num;
	}
    
    

}
