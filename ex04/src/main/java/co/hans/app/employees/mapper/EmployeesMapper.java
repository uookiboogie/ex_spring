package co.hans.app.employees.mapper;

import java.util.List;

import co.hans.app.employees.domain.Criteria;
import co.hans.app.employees.domain.EmployeesVO;

public interface EmployeesMapper {
  //==CRUD==
  
  
  //등록
  public int insert(EmployeesVO vo);
  //수정
  public int update(EmployeesVO vo);
  //삭제
  public int delete(EmployeesVO vo);
  
  //단건 조회
  public EmployeesVO read(EmployeesVO vo);
  //전체 조회
  public List<EmployeesVO> getList(Criteria cri);
  //전체 데이터 건수
  public int getTotalCount(Criteria cri);
}
