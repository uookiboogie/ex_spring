package co.hans.app.employees.service;

import java.util.List;

import co.hans.app.board.domain.Criteria;
import co.hans.app.employees.domain.EmployeesVO;

public interface EmployeesService {
	  //==CRUD==
	  
	  //단건 조회
	  public EmployeesVO read(EmployeesVO vo);
	  //전체 조회
	  public List<EmployeesVO> getList(Criteria cri);
	  //전체 데이터 건수
	  public int getTotalCount(Criteria cri);
}
