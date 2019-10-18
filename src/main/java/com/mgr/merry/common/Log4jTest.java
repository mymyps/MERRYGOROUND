package com.mgr.merry.common;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

//import org.apache.log4j.Logger;

public class Log4jTest {

	private static Logger log = LoggerFactory.getLogger(Log4jTest.class);
	
	public static void main(String[] args) {
		Log4jTest.test();
	}
	
	public static void test() {
		log.debug("debug");
		log.info("info");
		log.warn("warning");
		log.error("error");
	}
}
