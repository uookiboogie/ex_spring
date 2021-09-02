package co.hans.app;

import org.springframework.stereotype.Component;

import lombok.Data;

@Data
@Component  //컨테이너 빈 등록
public class Employees {
  private String employeeId;
  private String firstName;
  private String jobId;
}
