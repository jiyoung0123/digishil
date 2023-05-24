package com.kbstar;


import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

//외부 디렉토리를 프로젝트 안에서 쓸 수 있도록 등록
@Configuration
public class WebMvcConfig implements WebMvcConfigurer {
//    다른 디렉토리도 웹에서 접근할 수 있도록 추가한것

    @Value("${imgdir}")
    String imgdir;
    @Value("${logdir}")
    String logdir;

    @Override
    public void addResourceHandlers(ResourceHandlerRegistry registry) {
        registry.addResourceHandler("/uimg/**").addResourceLocations(imgdir);
        registry.addResourceHandler("/logs/**").addResourceLocations(logdir);
    }
}