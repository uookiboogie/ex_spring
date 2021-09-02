package co.hans.app.impl;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Repository;

import co.hans.app.Departments;

@Repository //DAO
public interface EmpMapper {
	List<Map> getEmp(String deptid);
	List<Departments> getDept();
	
	//쿼리를 이렇게 쓸수 도 있다.
	@Select("select sysdate from dual")
	public String getTime();
}
