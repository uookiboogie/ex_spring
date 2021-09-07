package co.hans.app.board.domain;

import java.util.Date;

import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.Data;

@Data
public class ReplyVO {
  private long rno;
  private long bno;
  
  private String reply;
  private String replyer;
  
  @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss", timezone = "Asia/Seoul")
  private Date replyDate;
  private Date updateDate;
}
