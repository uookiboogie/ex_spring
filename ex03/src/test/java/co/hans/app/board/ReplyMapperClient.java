package co.hans.app.board;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import co.hans.app.board.domain.Criteria;
import co.hans.app.board.mapper.ReplyMapper;
import co.hans.app.board.service.ReplyService;
import lombok.extern.java.Log;

@Log
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("classpath:/spring/*-context.xml")
public class ReplyMapperClient {

  @Autowired ReplyMapper replyMapper;
  @Autowired ReplyService replyService;
  
  //@Test
  public void getList() {
	  Criteria cri = new Criteria(1,5);
	  log.info(replyService.getList(cri, 30l).toString());
  }
  @Test
  public void getListWithPaging() {
	  Criteria cri = new Criteria(1,10);
	  log.info(replyMapper.getListWithPaging(cri, 30L).toString());
  }
}
