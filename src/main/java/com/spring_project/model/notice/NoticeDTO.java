package com.spring_project.model.notice;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
@Builder

@AllArgsConstructor
@NoArgsConstructor
public class NoticeDTO {
   private int noticeno  ;
   private String title  ;
   private String content;
   private String id     ;
   private int cnt       ;
   private String rdate  ;
};
