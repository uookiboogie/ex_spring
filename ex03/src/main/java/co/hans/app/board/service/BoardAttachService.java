package co.hans.app.board.service;

import co.hans.app.board.domain.BoardAttachVO;

public interface BoardAttachService {
	
	//첨부파일 단건조회
	public BoardAttachVO read(String uuid);
}
