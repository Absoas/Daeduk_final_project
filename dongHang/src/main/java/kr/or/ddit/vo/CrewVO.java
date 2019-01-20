package kr.or.ddit.vo;

import org.apache.ibatis.type.Alias;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Alias("crewVO")
public class CrewVO {
	private Long crew_no;
	private String mem_id;
	private String crew_name;
	private Long crew_limit;
	private String crew_date;
	private String crew_content;
}
