package co.hans.app.board.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import co.hans.app.board.domain.Criteria;
import co.hans.app.board.domain.ReplyVO;

public interface ReplyService {
	//====CRUD====
	
	//등록
	public int insert(ReplyVO vo);
	
	//수정
	public int update(ReplyVO vo);
	
	//삭제
	public int delete(ReplyVO vo);
	
	//단건조회
	public ReplyVO read(ReplyVO vo);
	
	//전체 조회
	public List<ReplyVO> getList(@Param("cri") Criteria cri, @Param("bno") Long bno);
	
}
