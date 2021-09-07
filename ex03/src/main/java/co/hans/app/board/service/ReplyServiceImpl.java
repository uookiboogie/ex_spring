package co.hans.app.board.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import co.hans.app.board.domain.Criteria;
import co.hans.app.board.domain.ReplyVO;
import co.hans.app.board.mapper.ReplyMapper;

@Service
public class ReplyServiceImpl implements ReplyService {

	@Autowired ReplyMapper replyMapper;
	
	@Override
	public int insert(ReplyVO vo) {
		return replyMapper.insert(vo);
	}

	@Override
	public int update(ReplyVO vo) {
		return replyMapper.update(vo);
	}

	@Override
	public int delete(ReplyVO vo) {
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

}
