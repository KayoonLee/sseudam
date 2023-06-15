package com.pet.sseudam;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@SpringBootApplication
@MapperScan(basePackages = "com.pet.sseudam")
public class SseudamApplication {

	public static void main(String[] args) {

		SpringApplication.run(SseudamApplication.class, args);
	}

}
