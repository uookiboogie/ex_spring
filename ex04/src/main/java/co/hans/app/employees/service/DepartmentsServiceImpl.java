package co.hans.app.employees.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import co.hans.app.employees.domain.DepartmentsVO;
import co.hans.app.employees.mapper.DepartmentsMapper;

@Service
public class DepartmentsServiceImpl implements DepartmentsService {

	@Autowired DepartmentsMapper departmentsmapper;
	
	@Override
	public List<DepartmentsVO> getDeptList() {
		return departmentsmapper.getDeptList();
	}

}
