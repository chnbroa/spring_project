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
public class OrdersdetailDTO {
    private int    odno                 ;
    private int    orderno              ;
    private int    contentsno           ;
    private int    quantity             ;
    private String pname                ;
    private String size                 ;
}
