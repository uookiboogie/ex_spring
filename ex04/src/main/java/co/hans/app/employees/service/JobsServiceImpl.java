package co.hans.app.employees.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import co.hans.app.employees.domain.JobsVO;
import co.hans.app.employees.mapper.JobsMapper;

@Service
public class JobsServiceImpl implements JobsService {

	@Autowired JobsMapper jobsMapper;
	
	@Override
	public List<JobsVO> getJobsList() {
		return jobsMapper.getJobsList();
	}

}
