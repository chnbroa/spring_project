package com.spring_project.model.orders;

import com.spring_project.model.contents.ContentsDTO;
import com.spring_project.model.member.MemberDTO;
import java.util.List;
import java.util.Map;

public interface OrdersService {
    MemberDTO getMemberDTOById(String id);

    ContentsDTO getContentsDTOByContentsno(int contentsno);

    int saveOrdersDTO(OrdersDTO ordersDTO);

    int saveOrdersdetailDTO(OrdersdetailDTO ordersdetailDTO);

    void updateStock(Map<String, Integer> map);

    int getLastOrderId();

    OrdersDTO getOrdersDTO(int orderno);

    int saveCartDTO(CartDTO cartDTO);

    List<CartDTO> getCartDTO(String id);

    int deleteOrdersDTO(int cartno);

    OrdersdetailDTO getOrdersdetailDTOByCartno(int cartno);

    int getCount(String id);
}
