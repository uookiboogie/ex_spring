package co.hans.app.advice;

import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.annotation.AfterReturning;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.aspectj.lang.annotation.Pointcut;
import org.springframework.stereotype.Component;

import lombok.extern.java.Log;

@Log
@Component
//@Aspect
public class LogAdvice {

	@Pointcut("execution(* co.hans.app..*ServiceImpl.*(..))") //포인트컷 만들기 
	public void allpointcut( ) { }
	
	@Before("execution(* co.hans.app..*ServiceImpl.*(..))")  //모든 서비스 메서드
	public void logBefore(JoinPoint jp) {
		log.info("[before]====================================================");
		
		String methodName = jp.getSignature().getName();
		Object[] arg = jp.getArgs();
		
		String str = methodName +":arg="+ (arg !=null && arg.length > 0 ? arg[0] : " ");
		log.info(str);
		
	}
	
	@AfterReturning(pointcut = "allpointcut()", returning ="obj" ) //포인트 컷으로 쓰기
	public void logAfter(JoinPoint jp, Object obj) { //리턴값 받아오기
		log.info("[after]======================================");
		String methodName = jp.getSignature().getName();
		String str = methodName + ":return="+ (obj !=null ? obj : "");
		log.info(str);
	}
}
