package com.spring_project.model.review;


import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;


@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
@Builder
@ToString
public class ReviewDTO {
   private int rnum;
   private String title;
   private String content;
   private String regdate;
   private String id;
   private float gradepoint;
   private int contentsno;
   private String ordersize;
}
