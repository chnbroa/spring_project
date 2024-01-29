package com.spring_project;
import java.io.File;
 
public class UploadCk {
 
    // Windows, VMWare, AWS cloud 절대 경로 설정
    public static synchronized String getUploadDir() {
        String path = "";
        if (File.separator.equals("\\")) {

            path = "D:/fullstack/web/deploy/project2/contents/ckstorage/";
           
            System.out.println("Windows 10: " + path);
            
        } else {
             System.out.println("Linux");
            path = "/home/ubuntu/deploy/contents/ckstorage/";
        }
        
        return path;
    }
    
}