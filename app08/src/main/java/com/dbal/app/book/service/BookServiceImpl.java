package com.dbal.app.book.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dbal.app.book.domain.BookVO;
import com.dbal.app.book.domain.RentVO;
import com.dbal.app.book.mapper.BookMapper;

@Service
public class BookServiceImpl implements BookService {
    
	@Autowired BookMapper bookMapper;
	
	@Override
	public List<BookVO> getList() {
		return bookMapper.getList();
	}

	@Override
	public int insert(BookVO vo) {
		return bookMapper.insert(vo);
	}

	@Override
	public int getNo() {
		return bookMapper.getNo();
	}

	@Override
	public List<RentVO> get2List() {
		return bookMapper.get2List();
	}

}
