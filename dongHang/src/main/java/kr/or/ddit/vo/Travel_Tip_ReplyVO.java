package kr.or.ddit.vo;

import java.util.List;

import org.apache.ibatis.type.Alias;

import lombok.Data;
import lombok.NoArgsConstructor;

@Alias("travel_tip_replyVO")
@Data
@NoArgsConstructor
public class Travel_Tip_ReplyVO {
	private Long travel_tip_reply_no;
	private Long travel_tip_no;
	private String travel_tip_mem_id;
	private String travel_tip_reply_pass;
	private String travel_tip_reply_content;
	private String travel_tip_reply_date;
	private List<PersonVO> personList;
}
