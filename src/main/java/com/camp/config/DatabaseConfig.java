package com.camp.config;

import javax.sql.DataSource;

import org.apache.ibatis.session.SqlSessionFactory;
import org.mybatis.spring.SqlSessionFactoryBean;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.context.ApplicationContext;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.PropertySource;

import com.zaxxer.hikari.HikariConfig;
import com.zaxxer.hikari.HikariDataSource;

@Configuration // Bean 설정
@PropertySource("classpath:/application.properties")
public class DatabaseConfig {
	
	@Autowired
	private ApplicationContext applicationContext; //IoC 컨테이너

	@Bean // <bean id="" 과 같은 기능
	@ConfigurationProperties(prefix="spring.datasource.hikari")
	public HikariConfig hikariConfig() {
		HikariConfig config = new HikariConfig(); // 데이터베이스 연결 정보 설정		
		return config;
	}
	
	@Bean
	public DataSource dataSource() {
		DataSource dataSource = new HikariDataSource(hikariConfig());
		return dataSource;
	}
	
	////////////////////////////////////////////////////////////
	
	@Bean
	@ConfigurationProperties(prefix = "mybatis.configuration")
	public org.apache.ibatis.session.Configuration mybatisConfig() {

		return new org.apache.ibatis.session.Configuration();		 
	
	}
	
	@Bean
	public SqlSessionFactory sqlSessionFactory(DataSource dataSource) throws Exception {
		SqlSessionFactoryBean factoryBean = new SqlSessionFactoryBean();
		factoryBean.setDataSource(dataSource());
		
		factoryBean.setMapperLocations(
				applicationContext.getResources("classpath:/com/camp/mapper/**/*-mapper.xml"));
		
		factoryBean.setConfiguration(mybatisConfig());
		
		return factoryBean.getObject();
	}
	
}











