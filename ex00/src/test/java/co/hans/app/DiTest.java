package co.hans.app;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import lombok.extern.java.Log;

@Log
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("classpath:/spring/*-context.xml")
public class DiTest {
  
  //IoC(역제어) : 객체관리를 컨테이너 함
  //DI : dependency Injection	
  @Autowired Employees emp; //new Employees(); 대신 쓰는거 !
  
  @Test
  public void test1() {
	  log.info(emp.getEmployeeId());
  }
}
