package co.hans.app.board;

import static org.junit.Assert.*;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.annotation.Rollback;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import co.hans.app.board.domain.BoardVO;
import co.hans.app.board.domain.Criteria;
import co.hans.app.board.mapper.BoardMapper;
import co.hans.app.board.service.BoardService;
import lombok.extern.java.Log;

@Log
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("classpath:/spring/*-context.xml")
public class BoardMapperClient {

	@Autowired BoardMapper boardMapper;
	//@Autowired BoardService boardMapper;
	
	@Test
	public void getList() {
		Criteria cri = new Criteria(1, 10);
		cri.setType("C");
		cri.setKeyword("hi");
		log.info(boardMapper.getList(cri).toString());
	}
	//@Test
	public void insert() {
		BoardVO boardVO = new BoardVO();
		boardVO.setTitle("테스트제목");
		boardVO.setContent("테스트내용");
		boardVO.setWriter("테스트작성자");
		
		boardMapper.insert(boardVO);
		
		log.info(boardVO.toString());
		log.info(Long.toString(boardVO.getBno()));
	}
	
	//@Test
	public void read() {
		BoardVO boardVO = new BoardVO();
		boardVO.setBno(1);
		
		log.info(boardMapper.read(boardVO).toString());
		
	}
	
	//@Test
	public void delete() {
		BoardVO boardVO = new BoardVO();
		boardVO.setBno(2);
		
		int r=boardMapper.delete(boardVO);
		boardMapper.read(boardVO);
		assertEquals(r, 1); // 막대색깔 보는거 , r이 1이 맞는지 확인
	}
	//@Test
	public void update() {
		BoardVO boardVO = new BoardVO();
		boardVO.setTitle("테스트수정");
	    boardVO.setContent("테스트수정내용");
        boardVO.setWriter("테스트수정작성자");
	    boardVO.setBno(2);
		
		boardMapper.update(boardVO);
		boardMapper.read(boardVO);
	}

}
