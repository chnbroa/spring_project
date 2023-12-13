package com.spring_project.controller;


import com.spring_project.model.contents.ContentsDTO;
import com.spring_project.model.member.MemberDTO;
import com.spring_project.model.orders.CartDTO;
import com.spring_project.model.orders.OrdersDTO;
import com.spring_project.model.orders.OrdersService;
import com.spring_project.model.orders.OrdersdetailDTO;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class OrdersController {

    @Autowired
    @Qualifier("com.spring_project.model.orders.OrdersServiceImpl")
    private OrdersService ordersService;

    @PostMapping("/orders/buynow")
    public String buynow(OrdersdetailDTO ordersdetailDTO , HttpServletRequest request , Model model){
        String id = request.getParameter("id");
//        System.out.println("바로 구매 테스트 : " + ordersdetailDTO.toString());
        List<OrdersdetailDTO> ordersdetailList = new ArrayList<>();
        ordersdetailList.add(ordersdetailDTO);
        List<ContentsDTO> contentsDTOList = new ArrayList<>();
        ContentsDTO contentsDTO = ordersService.getContentsDTOByContentsno(ordersdetailDTO.getContentsno());
        contentsDTOList.add(contentsDTO);
        MemberDTO memberDTO = ordersService.getMemberDTOById(id);
        model.addAttribute("ordersdetailList", ordersdetailList);
        model.addAttribute("memberDTO", memberDTO);
        model.addAttribute("contentsDTOList", contentsDTOList);

        return "/orders/buynow";
    }

    @GetMapping("/orders/cart")
    public String cart(HttpServletRequest request, Model model){
        String id = request.getParameter("id");
        List<CartDTO> cartDTOList = ordersService.getCartDTO(id);
        model.addAttribute("cartDTOList", cartDTOList);


        return "/orders/cart";


    }

    @PostMapping("/orders/cart")
    public String cart(CartDTO cartDTO, Model model){
//        System.out.println("장바구니 테스트입니다"+cartDTO.toString());

        int saveCartDTO = ordersService.saveCartDTO(cartDTO);

        if(saveCartDTO == 0 )
        {
            System.out.println("CartDTO저장오류");
            return "error";
        }
        //id를 통해 리스트로 불러와서
        List<CartDTO> cartDTOList = ordersService.getCartDTO(cartDTO.getId());


        model.addAttribute("cartDTOList", cartDTOList);
        return "/orders/cart";
    }


//    장바구니 카운트 가져오기 (ID로)

    @PostMapping("/orders/complete")
    public String complete(OrdersDTO ordersDTO ,  Model model)
    {
        int ordersDTOsave = ordersService.saveOrdersDTO(ordersDTO);
        int orderno = ordersService.getLastOrderId();

        if(ordersDTOsave == 0){
            return "error";
        }


        for(OrdersdetailDTO ordersdetailDTO : ordersDTO.getList()){
            ordersdetailDTO.setOrderno(orderno);

            //디체일 저장
            int ordersdetailDTOsave = ordersService.saveOrdersdetailDTO(ordersdetailDTO);
            if(ordersdetailDTOsave == 0){
                return "error";
            }
            //재고 차감
            Map<String,Integer> map = new HashMap<>();
            map.put("contentsno",ordersdetailDTO.getContentsno());
            map.put("quantity",ordersdetailDTO.getQuantity());
            ordersService.updateStock(map);
        }

        //다시 불러와 모델에 넣어주기
        OrdersDTO savedOrdersDTO = ordersService.getOrdersDTO(orderno);


        //디테일 리스트 전달?
        savedOrdersDTO.setList(ordersDTO.getList());
        model.addAttribute("ordersDTO", savedOrdersDTO);


        return "/orders/complete";
    }

    @GetMapping("/orders/cart/selectdelete")
    public String selectDelete(@RequestParam List<Integer> cartno , @RequestParam String id)
    {
        for(int index : cartno){
            if(ordersService.deleteOrdersDTO(index) == 0){
                return "error";
            }
        }
        return "redirect:/orders/cart?id=" + id;
    }

    @PostMapping("/orders/cart/buy")
    public String cartBuy(@RequestParam List<Integer> cartno  , HttpServletRequest request , Model model){
        String id = request.getParameter("id");

        List<OrdersdetailDTO> ordersdetailList = new ArrayList<>();
        for(int index : cartno) {
            OrdersdetailDTO ordersdetailDTO = ordersService.getOrdersdetailDTOByCartno(index);
            ordersdetailList.add(ordersdetailDTO);
            if(ordersService.deleteOrdersDTO(index) == 0){
                return "error";
            }
        }

        List<ContentsDTO> contentsDTOList = new ArrayList<>();
        for(OrdersdetailDTO ordersdetailDTO :  ordersdetailList)
        {
            ContentsDTO contentsDTO = ordersService.getContentsDTOByContentsno(ordersdetailDTO.getContentsno());
            contentsDTOList.add(contentsDTO);
        }


        MemberDTO memberDTO = ordersService.getMemberDTOById(id);
        model.addAttribute("ordersdetailList", ordersdetailList);
        model.addAttribute("memberDTO", memberDTO);
        model.addAttribute("contentsDTOList", contentsDTOList);

        return "/orders/buynow";
    }

    @PostMapping("/orders/count")
    @ResponseBody
    public Map<String,Integer> count(HttpServletRequest request){
        Map<String,Integer> map = new HashMap<>();
        String id = request.getParameter("id");
        int cnt = ordersService.getCount(id);
        map.put("str",cnt);
        return map;
    }

}
