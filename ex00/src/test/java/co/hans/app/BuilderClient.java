package co.hans.app;

import static org.junit.Assert.*;

import org.junit.Test;

public class BuilderClient {

	@Test
	public void test() {
		//fail("Not yet implemented");
	}
	@Test
	public void member() {
		Member member =Member.builder().id("aa").pw("1234").build();
		assertEquals(member.getId(),"aa");
	}

}
