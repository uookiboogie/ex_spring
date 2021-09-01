package com.yedam.web.impl;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

@Repository
public interface JobMapper {
  List<Map> getJobs();
}
