package com.litemanager.admin;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.web.support.SpringBootServletInitializer;

@SpringBootApplication
@MapperScan("com.litemanager.admin.dao")
public class LitemanagerApplication extends SpringBootServletInitializer {

//	@Override
//	protected SpringApplicationBuilder configure(SpringApplicationBuilder application) {
//		return application.sources(LitemanagerApplication.class);
//	}

	public static void main(String[] args) {
		SpringApplication.run(LitemanagerApplication.class, args);
	}
}
