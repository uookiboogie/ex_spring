package com.dbal.app.book.service;

import java.util.List;

import com.dbal.app.book.domain.BookVO;
import com.dbal.app.book.domain.RentVO;

public interface BookService {

	//전체 조회
	public List<BookVO> getList();
	//등록
	public int insert(BookVO vo);
	//도서번호 조회
	public int getNo();
	
	  //대여매출현황
	  public List<RentVO> get2List();
}
