package co.hans.app;

public class BuilderTest {

	public static void main(String[] args) {
		Member member =Member.builder().id("aa").pw("1234").build();
	}

}
