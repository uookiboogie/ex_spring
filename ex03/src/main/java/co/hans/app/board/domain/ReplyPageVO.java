package co.hans.app.board.domain;

import java.util.List;

import lombok.Data;

@Data
public class ReplyPageVO {
  private int replyCnt;
  private List<ReplyVO> list;
}
