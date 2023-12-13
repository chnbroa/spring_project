package com.spring_project.model.orders;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@AllArgsConstructor

@Setter
@Getter
@ToString
public class CartDTO {
    private int    cartno                ;
    private int    contentsno           ;
    private String id;
    private int    quantity             ;
    private int price;
    private String pname                ;
    private String size                 ;
    private String filename ;
}
