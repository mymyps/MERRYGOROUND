package com.mgr.merry.common.aop;

import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.Signature;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.aspectj.lang.annotation.Pointcut;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;

@Component
@Aspect
public class AnoLoggerAspect {

	private Logger log = LoggerFactory.getLogger(this.getClass());
	
	//////////////////////////////////////////////////////////////////
	/*
	//1. pintcut : 실행대상 메소드 표현식 적용
	//@Pointcut("execution(* com.mgr.merry..insert*(..))")
	@Pointcut("execution(* com.mgr.merry..*(..))")
	public void beforeAop() {}
	
	//2. adviece 등록
	@Before("beforeAop()")
	public void testAop(JoinPoint joinpoint) {		//testAop()
		Signature sig = joinpoint.getSignature();
		log.debug("[before testAop ] " + sig);
		
	}
	*/
	//////////////////////////////////////////////////////////////////
	
	@Around("execution(* com.mgr.merry..*(..))")
	public Object loggerAround(ProceedingJoinPoint joinpoint) throws Throwable{
//		log.debug("[before] 망했네");
		Object obj = joinpoint.proceed();
//		log.debug("[after] 두번 망했네");
		
		return obj;
	}
	
	// args
	
	
}
