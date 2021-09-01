package co.hans.app.impl;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import co.hans.app.Departments;

@Repository
public interface EmpMapper {
	List<Map> getEmp();
	List<Departments> getDept();
}
