package com.smhrd.model;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@NoArgsConstructor
@Setter
@Getter
@AllArgsConstructor
public class UpdateVo {
	String updateimagename;
	String updatecontent;
	String post_content;
    String file_ext;
    long file_size; 
    String file_rname;
    
	public UpdateVo(String updateimagename, String file_ext, long file_size, String file_rname) {
		super();
		this.updateimagename = updateimagename;
		this.file_ext = file_ext;
		this.file_size = file_size;
		this.file_rname = file_rname;
	}

	public UpdateVo(String updatecontent, String post_content) {
		super();
		this.updatecontent = updatecontent;
		this.post_content = post_content;
	}
}
