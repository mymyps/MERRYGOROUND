package com.mgr.merry.common.aop;

import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.Signature;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

public class LoggerAspect {

	private Logger log = LoggerFactory.getLogger(this.getClass());
	
//	@Around("pointcutMethod()")
	public Object loggerAdvice(ProceedingJoinPoint joinPoint) throws Throwable{
		
		String signatureStr = joinPoint.getSignature().toShortString();
		
		Signature sig = joinPoint.getSignature();
		
		long st = System.currentTimeMillis();
		
		String type = sig.getDeclaringTypeName();
		String methodName = sig.getName();
		String componentName = "";
		if(type.indexOf("Controller") > -1) {
			componentName = "Controller";
		}else if(type.indexOf("Service") > -1) {
			componentName = "ServiceImpl";
		}else if(type.indexOf("Dao") > -1) {
			componentName = "DaoImpl";
		}
		
//		return joinPoint.proceed();
		
		// 전처리 방식
//		joinPoint.proceed()를 기준으로 전/ 후 처리가 나누어짐
		
		Object obj = joinPoint.proceed();
		log.debug("[after] " + componentName + "|O|" + type + "|O|" + methodName + "(m)");
		
		return obj;
		
	}
	
	public void before(JoinPoint joinpoint) {
		joinpoint.getSignature();
		
		Object[] objs = joinpoint.getArgs();
		for (Object o : objs) {
			log.debug("" + o);
		}
		
		log.debug("joinpoint");
	}
	
}
