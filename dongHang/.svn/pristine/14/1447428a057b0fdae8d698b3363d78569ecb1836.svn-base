package kr.or.ddit.vo;

import java.util.List;

import org.apache.ibatis.type.Alias;
import org.hibernate.validator.constraints.NotBlank;

import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@Alias("freereplyVO")
public class Free_ReplyVO{
	private Long board_reply_no;
	private Long board_no;
	private String board_reply_mem_id;
//	private String board_reply_pass;
	@NotBlank
	private String board_reply_content;
	private String board_reply_date;
	private String board_reply_mem_name;
	private List<PersonVO> personList;
}
