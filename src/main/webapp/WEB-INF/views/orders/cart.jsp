<%--
  Created by IntelliJ IDEA.
  User: chnbr
  Date: 2023-12-09
  Time: 오후 4:27
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <script>
        function selectDelete() {
            let form = document.cartForm;
            form.method = "get";
            form.action = "/orders/cart/selectdelete";

            let radios = document.getElementsByName('cartno');

            let selected = Array.from(radios).find(radio => radio.checked);

            if (selected == null){
                alert("삭제할 상품을 선택하세요.");
                return false;
            }
            form.submit();

        }
        function buy() {
            let form = document.cartForm;
            form.method = "post";
            form.action = "/orders/cart/buy";

            let radios = document.getElementsByName('cartno');

            let selected = Array.from(radios).find(radio => radio.checked);

            if (selected == null){
                alert("구매할 상품을 선택하세요");
                return false;
            }

            form.submit();

        }
    </script>
    <style>
        body{
            font-family: 'Noto Sans KR', sans-serif;
        }
        .cart-step{
            padding: 0;
            margin: 0;
            text-align: center;
        }
        .cart{
            padding: 0 190px;
        }
        .cart h3{
            font-size: 20px;
            margin-top: 20px;
            font-weight: 700;
        }
        .cart a{
            text-decoration: none;
            color: black;
            font-size: 15px;
        }
        .cart-list{
            font-size: 15px;

        }

        .cart-list  td{
            vertical-align: middle!important;
        }
        .order-info-img{
            width: 84px;
            height: 84px;
            border: 1px solid #cbcbcb;
        }
        .order-info{
            display: flex;

        }
        .order-info-span{
            display: flex;
            flex-direction: column;
            padding-left: 8px;
            color: #B30023;
            font-size: 13px;
            margin-top: 5px;
        }
        .order-info-content{
            margin: 5px 7px;
        }
        .order-info-content a{
            padding-left: 8px;
            font-weight: 700;
            font-size: 16px;
        }
        .order-info-content a:hover{
            text-decoration: underline;
        }
        .info-price{
            padding-right: 15px;
        }
        .info-price-total{
            font-weight: 700;
            padding-right: 15px;
            color: #ff0000;
        }
        .cart-btn{
            display: flex;
            justify-content: space-between;
            text-align: center;

        }
        .right-btn{
            display: flex;

        }
        .cart-btn p{
            color: white;
            font-weight: 700;
            font-size: 20px;
            margin: 0;

        }
        .cart-select-delete-bnt , .cart-continue-btn{
            display: flex;
            width: 115px;
            height: 46px;
            background-color: #b1b1b1;
            justify-content:center; /*가운데정렬*/
            align-items:center; /*세로정렬*/

        }
        .cart-continue-btn{
            margin-right: 15px;

        }
        .cart-continue-btn p{
            align-items: center;
            font-size: 17px;
        }
        .cart-buy-btn{
            width: 158px;
            height: 46px;
            background-color: #fa0001;
            display: flex;
            justify-content:center; /*가운데정렬*/
            align-items:center; /*세로정렬*/
        }
        @media screen and (max-width: 991px) {
            .cart{
                padding: 0 0;
            }
        }
    </style>
</head>
<body>
<div class="container mt-5">
    <div class="row cart" style="margin-top: 100px;">
        <div class="cart-step">
            <h2><img src="${root}/images/orders/step1.gif" alt="1.장바구니"></h2>
        </div>
        <h3> 장바구니 </h3>
        <div class="cart-list">
            <form name="cartForm">
                <input type="hidden" name="id" value="${sessionScope.id}">

            <table class="table">
                <thead>
                <tr>
                    <th>선택</th>
                    <th>상품정보</th>
                    <th>가격</th>
                    <th>수량</th>
                    <th>소계</th>
                </tr>
                </thead>

                <tbody class="cart-contents">
                <c:set var = "total_result" value = "0" />
                <c:forEach var="cartDTO" items="${cartDTOList}" varStatus="status">
                    <c:choose>
                        <c:when test="${empty cartDTO}">
                            <tr> <td colspan="5">장바구니 담긴 물건이 없습니다.</td></tr>
                        </c:when>
                        <c:otherwise>

                            <tr>
                                <td>
                                    <div class="form-check">
                                        <input class="form-check-input" type="checkbox" name="cartno" value="${cartDTO.cartno}" id="flexCheckDefault">
                                    </div>
                                </td>
                                <td class="order-info">
                                    <div class="order-info-img">
                                        <img src="/contents/storage/${cartDTO.filename}" alt="사진1" width="82" height="82">
                                    </div>
                                    <div class="order-info-content">
                                        <a href="/contents/detail/${cartDTO.contentsno}">${cartDTO.pname}</a>
                                        <div class="order-info-span">
                                            <span class="order-info-no"> • 상품번호 : ${cartDTO.contentsno}</span>
                                            <span class="order-info-size"> • 사이즈 : ${cartDTO.size}</span>
                                        </div>

                                    </div>
                                </td>
                                <td class=" align-middle"> <span  class="info-price">[판매가]<fmt:formatNumber value="${cartDTO.price}" pattern="#,###"/>원</span> </td>
                                <td> ${cartDTO.quantity}</td>
                                <c:set var="total" value="${cartDTO.price * cartDTO.quantity}"/>

                                <c:set var= "total_result" value="${total_result + total}"/>
                                <td> <span  class="info-price-total"><fmt:formatNumber value="${total}" pattern="#,###"/>원</span></td>
                            </tr>
                        </c:otherwise>
                    </c:choose>
                </c:forEach>
                </tbody>
            </table>
            </form>
        </div>


        <div class="cart-btn" >
            <a href="javascript:selectDelete()" class="cart-select-delete-bnt">
                <p>선택 삭제</p>
            </a>



            <div class="right-btn">
                <a onclick="history.back()"  class="cart-continue-btn" >
                    <p>계속 쇼핑하기</p>
                </a>


                <a href="javascript:buy()" class="cart-buy-btn" >
                    <p>주문하기</p>
                </a>

            </div>

        </div>

    </div>

</div>
</body>
</html>
