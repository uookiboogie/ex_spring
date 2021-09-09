package co.hans.app.board.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import co.hans.app.board.domain.Criteria;
import co.hans.app.board.domain.ReplyPageVO;
import co.hans.app.board.domain.ReplyVO;
import co.hans.app.board.mapper.BoardMapper;
import co.hans.app.board.mapper.ReplyMapper;

@Service
public class ReplyServiceImpl implements ReplyService {

	@Autowired ReplyMapper replyMapper;
	@Autowired BoardMapper boardmapper;
	
	@Override
	public int insert(ReplyVO vo) {
		boardmapper.updateReplycnt(vo.getBno(), 1L);
		return replyMapper.insert(vo);
	}

	@Override
	public int update(ReplyVO vo) {
		return replyMapper.update(vo);
	}

	@Override
	public int delete(ReplyVO vo) {
		vo = replyMapper.read(vo);
		boardmapper.updateReplycnt(vo.getBno(), -1L);
		return replyMapper.delete(vo);
	}

	@Override
	public ReplyVO read(ReplyVO vo) {
		return replyMapper.read(vo);
	}

	@Override
	public List<ReplyVO> getList(Criteria cri, Long bno) {
		return replyMapper.getList(cri, bno);
	}
	
	@Override
	public ReplyPageVO getListWithPaging(Criteria cri, Long bno) {
		ReplyPageVO vo = new ReplyPageVO();
		vo.setReplyCnt(replyMapper.getCountByBno(bno));
		vo.setList(replyMapper.getList(cri, bno));
		return vo;
	}
	

}
