<%--
  Created by IntelliJ IDEA.
  User: chnbr
  Date: 2023-12-09
  Time: 오후 1:43
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
<style>
    body{
        font-family: 'Noto Sans KR', sans-serif;

    }
    .step{
        padding: 0;
        margin: 0;
        text-align: center;
    }
    .complete{
        text-align: center;
    }
    .card{

        text-align: center;
    }
    .complete h3{
        font-size: 30px;
        font-weight: 700;
        margin-top: 10px;
    }
    .input-group-text{
        font-weight: 700;
    }
    .form-control{
    text-align: left;

    }
    .form-control p {
        margin: 0px;

        font-size: 18px;
    }

    .price{
        color: red;
        font-size: 20px;
        font-weight: 700;
    }
    .small-p{
        font-size: 16px!important;
        margin-top: 3px!important;
    }
    @media screen and (max-width: 991px) {
        .complete{
            padding: 0 0;
        }
    }
</style>
</head>
<body>
<div class="container mt-5">
    <div class="row complete" style="margin-top: 100px">
            <div class="step">
                <h2><img src="${root}/images/orders/step3.gif" alt="3.구매완료"></h2>
            </div>
            <div class="card">
                <div class="card-header">
                    <h3> 주문 완료 </h3>
                    <span>주문 내역을 확인해주세요.</span>
                </div>
                <div class="card-body">
                    <div class="input-group mb-2">
                        <span class="input-group-text" id="payment">구매내역</span>
                        <div class="form-control">
                            <c:choose>
                                <c:when test="${ordersDTO.payment == 'basic'}">
                                    <p> 일반결제 : 신용카드</p>
                                </c:when>
                                <c:when test="${ordersDTO.payment == 'kakao'}">
                                    <p> 간편결제 : <img src="${root}/images/orders/order_simple_pay_1.png"  alt="카카오페이"> 카카오페이</p>
                                </c:when>
                                <c:when test="${ordersDTO.payment == 'naver'}">
                                    <p> 간편결제 : <img src="${root}/images/orders/order_simple_pay_2.png"  alt="네이버페이"> 네이버페이</p>
                                </c:when>
                            </c:choose>
                            <p class="price"><fmt:formatNumber value="${ordersDTO.total}" pattern="#,###"/>원</p>
                        </div>
                    </div>

                    <div class="input-group mb-2">
                        <span class="input-group-text" id="orderno">주문번호</span>
                        <div class="form-control">
                            <p> ${ordersDTO.orderno}</p>
                        </div>
                    </div>

                    <div class="input-group mb-2">
                        <span class="input-group-text" id="address">배송지</span>
                        <div class="form-control">
                            <p> ${ordersDTO.tname}</p>
                            <p  class="small-p"> ${ordersDTO.tel} </p>
                            <p> ${ordersDTO.address1} ${ordersDTO.address2}</p>
                            <p class="small-p"> (${ordersDTO.zipcode})</p>
                        </div>
                    </div>

                    <div class="input-group mb-2">
                        <span class="input-group-text" id="method">배송방법</span>
                        <div class="form-control">
                            <p> 택배</p>
                        </div>
                    </div>

                    <div class="input-group">
                        <span class="input-group-text" id="reqtext">배송메모</span>
                        <div class="form-control">
                            <p>  ${ordersDTO.reqtext}</p>
                        </div>
                    </div>
                </div>
                <div class="card-footer">
                    <a class="btn btn-danger" style="width: 60%" href="${root}/member/mypage">내 정보페이지</a>
                    <a class="btn btn-danger" style="margin:15px 0px;width: 60%" href="/">홈으로</a>
                </div>
            </div>
        </div>

</div>

</body>
</html>
