package co.hans.app.board.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import co.hans.app.board.domain.BoardAttachVO;
import co.hans.app.board.mapper.BoardAttachMapper;

@Service
public class BoardAttachServiceImpl implements BoardAttachService {

	@Autowired BoardAttachMapper attachMapper;
	
	@Override
	public BoardAttachVO read(String uuid) {
		return attachMapper.read(uuid);
	}

}
