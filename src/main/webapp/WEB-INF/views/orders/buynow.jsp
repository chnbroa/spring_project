<%--
  Created by IntelliJ IDEA.
  User: chnbr
  Date: 2023-12-07
  Time: 오후 4:34
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
  <script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
  <script>
    function sample6_execDaumPostcode() {
      new daum.Postcode({
        oncomplete: function(data) {
          // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

          // 각 주소의 노출 규칙에 따라 주소를 조합한다.
          // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
          var addr = ''; // 주소 변수
          var extraAddr = ''; // 참고항목 변수

          //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
          if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
            addr = data.roadAddress;
          } else { // 사용자가 지번 주소를 선택했을 경우(J)
            addr = data.jibunAddress;
          }

          // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
          if(data.userSelectedType === 'R'){
            // 법정동명이 있을 경우 추가한다. (법정리는 제외)
            // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
            if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
              extraAddr += data.bname;
            }
            // 건물명이 있고, 공동주택일 경우 추가한다.
            if(data.buildingName !== '' && data.apartment === 'Y'){
              extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
            }
            // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
            if(extraAddr !== ''){
              extraAddr = ' (' + extraAddr + ')';
            }
            // 조합된 참고항목을 해당 필드에 넣는다.
            //document.getElementById("sample6_extraAddress").value = extraAddr;

          } else {
            //document.getElementById("sample6_extraAddress").value = '';
          }

          // 우편번호와 주소 정보를 해당 필드에 넣는다.
          document.getElementById('sample6_postcode').value = data.zonecode;
          document.getElementById("sample6_address").value = addr;
          // 커서를 상세주소 필드로 이동한다.
          document.getElementById("sample6_detailAddress").focus();
        }
      }).open();
    }
  </script>
  <style>
    body{
      font-family: 'Noto Sans KR', sans-serif;
    }
    .order-step{
      padding: 0;
      margin: 0;
      text-align: center;
    }
    .order{
      padding: 0 190px;
    }
    .order h3{
      font-size: 20px;
      margin-top: 20px;
      font-weight: 700;
    }


    .order-contents{
      align-items: center;

    }
    .order-contents >tr td{
      line-height : 95%
    }

    .order-info-img{
      border: 1px solid #cbcbcb;
      width: 45px;
      height: 45px;
      box-sizing: border-box;
    }
    .cart-list, .member-list, .payment-list{
      border-top: 2px solid #9B9B9B;
    }
    .order-info{
      display: flex;
      line-height : 100%

    }
    .order-info-content{
      display: flex;
      flex-direction: column;
      margin-left: 12px;
      box-sizing: border-box;
    }
    .order-info-content > a{
      text-decoration: none;
      color: black;
      font-size: 16px;
      padding-left: 8px;
      margin-bottom: 5px;
      box-sizing: border-box;
    }
    .order-info-span{
      display: flex;
      flex-direction: column;
      padding-left: 8px;
      color: #B30023;
      font-size: 13px;
      margin-bottom: 10px;
      box-sizing: border-box;
    }
    .info-price{
      text-align: right;
      color: #ff0000;
      font-weight: 700;
    }
    .input-group-text{
      font-weight: 700;
    }
    .need{
      color: #ff0000;
      font-size: 15px;
    }
    .pay-sel-box {
      margin-bottom: 30px;
      border-bottom: 1px solid #aaaaaa;

    }
    .pay-select {
      padding: 25px 0px;
      border-top: 1px solid #fff;
      border-bottom: 1px solid #aaaaaa;
      background: #f7f7f7;
      position: relative;

    }


    .pay-select > span{
      position: absolute;
      left: 34px;
      top: 20px;
      color: #333;
      font-weight: 700;
    }
    .pay-sel{
      font-size: 11px;
      line-height: 1.2;
      word-break: break-all;
      margin: 0;
      list-style: none;
      height: 22px;
      padding-left: 150px;

    }
  .pay-sel >li {
    display: flex;
    align-items: center;
    font-weight: 700;
  }
.pay-sel-li{
  display: flex;
  justify-content: space-between;
  padding: 0 70px 0 0;
}
    .pay-sel-li li input {
      position: relative;
      top: 1.5px;
      margin-right: 2px;
    }
    .pay-sel-li li label {
      position: relative;
      top: -1.5px;
      font-weight: 700;
    }
    .order-confirm{
      width: 245px;
      height: 360px;
      margin-top: 60px;
      text-align: right;
    }
    .order-confirm-title{

      background-color:#888888 ;
      color: white;
      font-size: 24px!important;
      padding: 7px 10px;
      margin-bottom: 0;
    }
    .box{
      width: 245px;
      height: auto;
      overflow: hidden;
      margin-bottom: 5px;
      padding: 5px;
      border: 5px solid #888888;
      background-color: white;
      font-weight: 700;
    }
    .order-sum{
      color: red;
    }
    .order-detail{
      display: flex;
      justify-content: space-between;
      padding: 0 15px;
      margin-bottom: 3px;
    }
    .order-detail-price{

    }
    .pay-total{
      margin-top: 15px;
      padding: 10px;
      border-top: 2px solid #888888;
      line-height: 16px;
    }
    .pay-total p{
      margin-bottom: 8px;
      color: #666;
      font-size: 12px;
      font-weight: 700;
    }
    .pay_price_str{
      font: 30px verdana;
      font-weight: 700;
      letter-spacing: -1px;
      color: #ff0000;
    }
    .order-submit-btn{

      display: flex;
      justify-content: space-between;
    }
    @media screen and (max-width: 991px) {
      .order{
        padding: 0 0;
      }
    }
  </style>
</head>
<body>

<div class="container mt-5">
  <div class="row order" style="margin-top: 100px;">
    <div class="order-step">
      <h2><img src="${root}/images/orders/step2.gif" alt="2.주문서작성/결제"></h2>
    </div>
    <div class=" col-9">
    <h3> 1. 주문하시는 상품 </h3>
    <div class="cart-list">
      <table class="table">
        <thead>
        <tr>
          <th>상품정보</th>
          <th>수량</th>
          <th>소계</th>
          <th>배송정보</th>
        </tr>
        </thead>
        <tbody class="order-contents" >


        <c:set var = "total_result" value = "0" />
        <c:forEach var="ordersdetailDTO" items="${ordersdetailList}" varStatus="status">
          <c:set var="contentsDTO" value="${contentsDTOList[status.index]}"/>
          <c:choose>
            <c:when test="${empty ordersdetailDTO}">
              <tr> <td colspan="4">주문한 상품이 없음</td></tr>
            </c:when>
            <c:otherwise>
              <tr>
                <td class="order-info">
                  <div class="order-info-img">
                    <img src="/contents/storage/${contentsDTO.filename}" alt="사진1" width="45" height="45">
                  </div>
                  <div class="order-info-content">
                    <a href="/contents/detail/${contentsDTO.contentsno}">${contentsDTO.pname}</a>
                    <div class="order-info-span">
                      <span class="order-info-no"> ◽ 상품번호 : ${ordersdetailDTO.contentsno}</span>
                      <span class="order-info-size"> ◽ 사이즈 : ${ordersdetailDTO.size}</span>
                    </div>

                  </div>
                </td>
                <td> ${ordersdetailDTO.quantity}</td>
                <c:set var="total" value="${contentsDTO.price * ordersdetailDTO.quantity}"/>

                <c:set var= "total_result" value="${total_result + total}"/>
                <td> <span  class="info-price"><fmt:formatNumber value="${total}" pattern="#,###"/>원</span></td>
                <td><span style="font-size: 14px">발송 후 3일이내 <br>배송 예정 <br>(영업일 기준)</span></td>
              </tr>
            </c:otherwise>
          </c:choose>
        </c:forEach>
        </tbody>
      </table>
    </div>
    <h3> 2. 주문고객/배송지 정보 </h3>
      <form name="mainForm">
<c:forEach var="ordersdetailDTO" items="${ordersdetailList}" varStatus="status">
  <input type="hidden" name="list[${status.index}].contentsno" value="${ordersdetailDTO.contentsno}" />
  <input type="hidden" name="list[${status.index}].quantity" value="${ordersdetailDTO.quantity}" />
  <input type="hidden" name="list[${status.index}].pname" value="${ordersdetailDTO.pname}" />
  <input type="hidden" name="list[${status.index}].size" value="${ordersdetailDTO.size}" />
</c:forEach>
        <input type="hidden" name="mname" value="${memberDTO.mname}" />
        <input type="hidden" name="total" value="${total_result}" />
        <input type="hidden" name="id" value="${sessionScope.id}" />
    <div class="member-list"></div>
      <div class="input-group mb-2 mt-2" >
        <div class="input-group-text">
           주문하시는 분
        </div>
        <input type="text" class="form-control" id="orderInfo" disabled
               value=" ◾ ${memberDTO.mname}      ◾ ${memberDTO.tel}      ◾ ${memberDTO.email} " readonly>
      </div>

      <div class="input-group mb-2">
        <div class="input-group-text">
         받으시는 분 <span class="need">*</span>
        </div>
        <input type="text" class="form-control" id="tname"
               value="${memberDTO.mname}" name="tname" >

      </div>
      <div class="input-group mb-2">
        <div class="input-group-text">
          연락처 <span class="need">*</span>
        </div>

        <input type="text" class="form-control" id="tel"
               value="${memberDTO.tel}" name="tel">
      </div>

      <div class="input-group mb-2">
        <div class="input-group-text"> 우편번호  <span class="need">*</span></div>
        <input type="text" class="form-control" size="10"
               name="zipcode" id="sample6_postcode" value="${memberDTO.zipcode}">
        <button type="button" class="btn btn-danger"
                onclick="sample6_execDaumPostcode()">주소검색</button>
      </div>
      <div class="input-group mb-2">
        <div class="input-group-text"> 주소  <span class="need">*</span></div>
        <input type="text" class="form-control" id="sample6_address" value="${memberDTO.address1}"
               name="address1">

      </div>
      <div class="input-group mb-2">
        <div class="input-group-text"> 상세 주소 <span class="need">*</span> </div>
        <input type="text" class="form-control" id="sample6_detailAddress" value="${memberDTO.address2}"
               name="address2">
      </div>
      <div class="input-group mb-2">
        <div class="input-group-text"> 배송메시지 </div>
        <input type="text" class="form-control" id="reqtext"
               placeholder="전달할 메시지를 20자이내로 입력해주세요."  name="reqtext">
      </div>
      <h3> 3. 결제정보 선택 </h3>
      <div class="payment-list">
        <div class="pay-sel-box oder_addLnN">

          <div class="pay-select">
            <span>간편결제</span>
            <ul class="pay-sel">
              <div class="pay-sel-li">
                <li><input type="radio" class="chk" name="payment" id="paysel_kakao" value="kakao"><label for="paysel_kakao"><img src="${root}/images/orders/order_simple_pay_1.png"  alt="카카오페이">간편결제</label></li>
                <li><input type="radio" class="chk" name="payment" id="paysel_naver"  value="naver"><label for="paysel_naver"><img src="${root}/images/orders/order_simple_pay_2.png"  alt="네이버페이">간편결제</label></li>
              </div>

            </ul>
          </div>
          <div class="pay-select">
            <span>일반결제</span>
            <ul class="pay-sel">
              <li><input type="radio" class="chk" name="payment" id="paysel_ba" checked="checked"  value="basic"><label for="paysel_ba">신용카드</label></li>
            </ul>
          </div>
        </div>
      </div>
      </form>
  </div>
    <div class="col-3">
     <div class="order-confirm">
       <h3 class="order-confirm-title">주문금핵 확인 및 결제</h3>
       <div class="box">
         <div class="order-sum order-detail">
           <span class="order-detail-price">주문금액</span>
           <span class="order-detail-price"><fmt:formatNumber value="${total_result}" pattern="#,###"/>원</span>
         </div>
         <div class="order-detail">
           <span class="order-detail-price">할인금액</span>
           <span class="order-detail-price">(-) 0원</span>
         </div>

         <div class="pay-total">
          <p>결제예정금액</p>
           <span class="pay_price_str"><fmt:formatNumber value="${total_result}" pattern="#,###"/>원</span>
         </div>
       </div>
       <div class="order-submit-btn">
         <div><button class="btn btn-secondary" style="width: 80px" onclick="history.back()">이전</button></div>
         <div><button class="btn btn-danger"  style="width: 160px" onclick="payment_submit()">결제하기</button></div>
       </div>

     </div>
    </div>
  </div>

</div>
</body>
<script>
  function payment_submit(){
    let form = document.mainForm;
    form.method = "post";
    form.action = "/orders/complete";
    if (form.tname.value ==''){
      alert("받으시는 분을 입력해주세요.");
      form.tname.focus()
      return false;
    }
    if (form.tel.value ==''){
      alert("연락처를 입력해주세요.");
      form.tel.focus()
      return false;
    }
    if (form.zipcode.value ==''){
      alert("우편번호를 입력해주세요.");
      form.tel.focus()
      return false;
    }
    if (form.address1.value ==''){
      alert("주소를 입력해주세요.");
      form.address1.focus()
      return false;
    }

    if (form.address2.value ==''){
      alert("상세주소를 입력해주세요.");
      form.address2.focus()
      return false;
    }
    if (form.reqtext.value ==''){
      alert("배송메시지를 입력해주세요.");
      form.reqtext.focus()
      return false;
    }
    form.submit();
  }
</script>
</html>
