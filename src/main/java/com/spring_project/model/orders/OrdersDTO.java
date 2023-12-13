package com.spring_project.model.orders;

import java.util.List;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;
@AllArgsConstructor
@NoArgsConstructor

@Getter
@Setter
@ToString
public class OrdersDTO {
    private int   orderno              ;
    private String id                  ;
    private String mname               ;
    private String tname               ;
    private String tel                 ;
    private String zipcode             ;
    private String address1            ;
    private String address2            ;
    private String odate               ;
    private String ostate              ;
    private int    total               ;
    private String payment             ;
    private String reqtext             ;

    private List<OrdersdetailDTO> list  ;
}
