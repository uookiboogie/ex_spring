package co.hans.app.employees.domain;

import lombok.Data;

@Data
public class DepartmentsVO {
	private String departmentId;
	private String departmentName;
	private String managerId;
	private String locationId;
}
