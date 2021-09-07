package co.hans.app.employees.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import co.hans.app.employees.mapper.EmployeesMapper;
import co.hans.app.board.domain.Criteria;
import co.hans.app.employees.domain.EmployeesVO;

@Service
public class EmployeesServiceImpl implements EmployeesService {

	@Autowired EmployeesMapper employeesMapper;
	
	@Override
	public EmployeesVO read(EmployeesVO vo) {
		return employeesMapper.read(vo);
	}

	@Override
	public List<EmployeesVO> getList(Criteria cri) {
		return employeesMapper.getList(cri);
	}

	@Override
	public int getTotalCount(Criteria cri) {
		return employeesMapper.getTotalCount(cri);
	}

}
