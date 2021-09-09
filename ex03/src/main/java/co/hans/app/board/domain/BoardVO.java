package co.hans.app.board.domain;

import java.util.Date;
import java.util.List;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.fasterxml.jackson.annotation.JsonIgnore;

import lombok.Data;

@Data
public class BoardVO {
  private long bno;         //게시글 번호
  private String title;     //제목
  private String content;   //내용
  private String writer;    //작성자
  @JsonFormat(pattern = "yyyy/MM/dd")
  private Date regdate;     //작성일자
  @JsonIgnore
  private Date updateDate;  //수정일자
  
  private long replycnt;
  
  private List<BoardAttachVO> attachList; //이거 왜넣어? ㅠㅠ 열받아 짜증
}
