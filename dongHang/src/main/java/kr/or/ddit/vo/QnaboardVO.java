package kr.or.ddit.vo;

import java.util.List;

import org.apache.ibatis.type.Alias;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Alias("qnaboardVO")
public class QnaboardVO {
	private Long qnaboard_no;
	private String qnaboard_title;
	private String qnaboard_content;
	private String qnaboard_date;
	private String mem_id;
	
	private List<PersonVO> personList;
	
}