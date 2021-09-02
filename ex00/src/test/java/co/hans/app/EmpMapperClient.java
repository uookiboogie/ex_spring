package co.hans.app;


import java.util.List;
import java.util.Map;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import co.hans.app.impl.EmpMapper;
import lombok.extern.java.Log;

@Log
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("classpath:/spring/*-context.xml")
public class EmpMapperClient {
	
	@Autowired EmpMapper dao;
	@Autowired SqlSessionTemplate mybatis;
	
	@Test
	public void mybatisTest() {
		//List<Departments> list =mybatis.selectList("co.hans.app.impl.EmpMapper.getDept");
		//log.info(list.toString());
		List<Employees> list = mybatis.selectList("co.hans.app.impl.EmpMapper.getEmp", "20");
		log.info(list.get(0).getJobId().toString()); //jsp ${emp.XXXX}
	}
	
	//@Test
	public void test() {
		log.info(dao.getEmp("10").toString());
		log.info(dao.getDept().toString());
	}
	
	//@Test
	public void getTime() {
		log.info("Time=="+dao.getTime());
	}

}
