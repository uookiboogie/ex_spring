package co.hans.app.employees;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import co.hans.app.board.domain.Criteria;
import co.hans.app.employees.mapper.EmployeesMapper;
import lombok.extern.java.Log;

@Log
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("classpath:/spring/*-context.xml")
public class EmployeesMapperClient {
  @Autowired EmployeesMapper employeesMapper;
  
  @Test
  public void getList() {
	  Criteria cri = new Criteria(1, 5);
	  log.info(employeesMapper.getList(cri).toString());
  }
}
