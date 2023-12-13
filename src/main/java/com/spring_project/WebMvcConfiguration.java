package com.spring_project;

//import com.spring_project.model.member.*;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

@Configuration
public class WebMvcConfiguration implements WebMvcConfigurer {
    @Override
    public void addResourceHandlers(ResourceHandlerRegistry registry) {
 

 
        registry.addResourceHandler("/member/storage/**")
                 .addResourceLocations("file:///" + UploadMem.getUploadDir());
    
        registry.addResourceHandler("/ckstorage/files/**")
        		.addResourceLocations("file:///"+UploadCk.getUploadDir()+"/files/");

        registry.addResourceHandler("/contents/storage/**")
                .addResourceLocations("file:///" + UploadCon.getUploadDir());

    
    }
 
}