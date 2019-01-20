package kr.or.ddit.vo;

import java.util.List;

import org.apache.ibatis.type.Alias;

import lombok.Data;
import lombok.NoArgsConstructor;

@Alias("review_replyVO")
@Data
@NoArgsConstructor
public class Review_ReplyVO {
	private Long review_reply_no;
	private Long review_no;
	private String review_reply_mem_id;
	private String review_reply_pass;
	private String review_reply_content;
	private String review_reply_date;
	private List<PersonVO> personList;
}
