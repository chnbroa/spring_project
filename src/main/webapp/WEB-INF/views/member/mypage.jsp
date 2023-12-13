<%--
  Created by IntelliJ IDEA.
  User: chnbr
  Date: 2023-11-09
  Time: 오후 8:27
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <script>
    function updateFile()
    {
      let url = "/member/updateFile";
      url += "?fname=${dto.fname}";
      location.href= url;
    }

    function delete_mypage(){
      let url = "/member/delete";
      url += "?id=${dto.id}";
      url += "&oldfile=${dto.fname}";
      if(confirm("정말 탈퇴하시겠습니까?")){
        location.href = url;
      }

    }
    function update_mypage(){
      let url = "/member/update";
      url += "?id=${dto.id}";

      location.href = url;
    }


  </script>
  <style>
    body{
      font-family: 'Noto Sans KR', sans-serif;
    }
    .mypage-order, .mypage-info{
      font-weight: 700;
    }
    .img-update-btn{
      margin-top: 10px;
      text-decoration: none;
      font-weight: 700;
      font-size: 18px;

    }
    .mypage-price{
      font-weight: 700;
    }
  </style>
</head>
<body>

<div class="container mt-5"  >
  <div class="row" style="margin-top: 150px;">

    <div class="col-sm-3">
      <h4 class="mypage-info"><i class="bi bi-people-fill"></i> 나의 정보</h4>
      <img class="img-rounded" src="/member/storage/${dto.fname}" style="width:280px">
      <div>
        <a href="javascript:updateFile()" class="badge rounded-pill bg-dark img-update-btn" >사진수정</a>
      </div>

      <div class="input-group mb-2 mt-2" >
        <div class="input-group-text">
          ID
        </div>
        <input type="text" class="form-control" id="orderInfo-id" disabled
               value=" ◾ ${dto.id}" readonly>
      </div>
      <div class="input-group mb-2 mt-2" >
        <div class="input-group-text">
          성명
        </div>
        <input type="text" class="form-control" id="orderInfo-name" disabled
               value=" ◾ ${dto.mname}" readonly>
      </div>
      <div class="input-group mb-2 mt-2" >
        <div class="input-group-text">
          배송지
        </div>
        <input type="text" class="form-control" id="orderInfo-add" disabled
               value=" ◾(${dto.zipcode })${dto.address1 }  ${dto.address2}" readonly>
      </div>
    </div>

    <div class="col-sm-6">
      <h4 class="mypage-order"><i class="fa-solid fa-shirt"></i> 주문 내역 및 리뷰 작성</h4>
      <ul class="list-group m-3">
        <c:choose>
        <c:when test="${empty dto.list }">주문한 상품이 없습니다.</c:when>

        <c:otherwise>
        <c:forEach var="order" items="${dto.list}" >
        <p class='h5 mt-3 mb-auto'><i class="bi bi-calendar-date-fill"></i> ${order.odate}<p>
          <li class="list-group-item">결제금액 : <span class="mypage-price">${order.total}원</span> , 주문상태 : ${order.ostate}
          <c:forEach var="detail" items="${order.list}">
        <li class="list-group-item">${detail.pname}, ${detail.quantity}개
          <a href="/contents/detail/${detail.contentsno}"><span class="badge rounded-pill bg-dark">Rivew</span></a></li>
        </c:forEach>
        </c:forEach>
        </c:otherwise>
        </c:choose>
      </ul>
    </div>
    <button class="btn btn-outline-danger" onclick="update_mypage()">회원정보수정</button>
    <button class="btn btn-outline-danger" onclick="delete_mypage()" style="margin-top: 5px">회원탈퇴</button>
  </div>
</div>

</body>
</html>

