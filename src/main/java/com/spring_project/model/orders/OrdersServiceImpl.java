package com.spring_project.model.orders;


import com.spring_project.model.contents.ContentsDTO;
import com.spring_project.model.member.MemberDTO;
import java.util.List;
import java.util.Map;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("com.spring_project.model.orders.OrdersServiceImpl")
public class OrdersServiceImpl implements OrdersService {
    @Autowired
    private OrdersMapper mapper;

    @Override
    public MemberDTO getMemberDTOById(String id) {
        return mapper.getMemberDTOById(id);
    }

    @Override
    public ContentsDTO getContentsDTOByContentsno(int contentsno) {
        return mapper.getContentsDTOByContentsno(contentsno);
    }

    @Override
    public int saveOrdersDTO(OrdersDTO ordersDTO) {
        return mapper.saveOrdersDTO(ordersDTO);
    }

    @Override
    public int saveOrdersdetailDTO(OrdersdetailDTO ordersdetailDTO) {
        return mapper.saveOrdersdetailDTO(ordersdetailDTO);
    }

    @Override
    public void updateStock(Map<String, Integer> map) {
        mapper.updateStock(map);
    }

    @Override
    public int getLastOrderId() {
        return mapper.getLastOrderId();
    }

    @Override
    public OrdersDTO getOrdersDTO(int orderno) {
        return mapper.getOrdersDTO(orderno);
    }

    @Override
    public int saveCartDTO(CartDTO cartDTO) {
        return mapper.saveCartDTO(cartDTO);
    }

    @Override
    public List<CartDTO> getCartDTO(String id) {
        return mapper.getCartDTO(id);
    }

    @Override
    public int deleteOrdersDTO(int cartno) {
        return mapper.deleteOrdersDTO(cartno);
    }

    @Override
    public OrdersdetailDTO getOrdersdetailDTOByCartno(int cartno) {
        return mapper.getOrdersdetailDTOByCartno(cartno);
    }

    @Override
    public int getCount(String id) {
        return mapper.getCount(id);
    }
}
