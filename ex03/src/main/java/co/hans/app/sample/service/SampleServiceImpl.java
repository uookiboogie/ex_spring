package co.hans.app.sample.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import co.hans.app.sample.mapper.Sample1Mapper;
import co.hans.app.sample.mapper.Sample2Mapper;

@Service
public class SampleServiceImpl implements SampleService {

	@Autowired Sample1Mapper sample1;
	@Autowired Sample2Mapper sample2;
	
	
	@Override
	//@Transactional  //트랜잭션 쓰는거
	public void addDate(String value) {
		sample1.insert(value);
		sample2.insert(value);

	}

}
