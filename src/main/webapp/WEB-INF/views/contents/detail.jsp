<%--
  Created by IntelliJ IDEA.
  User: chnbr
  Date: 2023-12-01
  Time: 오전 11:33
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>상품 상세</title>
    <meta charset="utf-8">
    <script type="text/javascript">

    function cart() {
            if ('${sessionScope.id}' == '') {
                alert('먼저 로그인을 하세요');
                let url = '/member/login';
                url += '?contentsno=${dto.contentsno}';
                location.href = url;
                return;
            }
            let form = document.contentForm;
             form.method = "post";
             form.action = "/orders/cart";


             if (form.size.value == ''){
            alert("사이즈를 입력하세요");
            form.size.focus();
            return false;
            }
          if (form.quantity.value > ${dto.stock}){
            alert("재고를 확인해주세요");
            form.quantity.focus()
            return false;
          }

        form.submit();

        }
        function buynow() {
            if ('${sessionScope.id}' == '') {
                alert('먼저 로그인을 하세요');
                let url = '/member/login';
                url += '?contentsno=${dto.contentsno}';
                location.href = url;
                return;
            }
            let form = document.contentForm;
            form.method = "post";
            form.action = "/orders/buynow";


            if (form.size.value == ''){
                alert("사이즈를 입력하세요");
                return false;
            }
            if (form.quantity.value > ${dto.stock}){
                alert("재고를 확인해주세요");
                form.quantity.focus()
                return false;
            }

            form.submit();
        }

        function setStarWidth(value) {
            console.log("평균"+value);
            const width = value * 20 + "%";
            document.querySelector(".avg-startpoint").style.width = width;
        }

        function getReviewTotalCnt(contentsno){
            let url = "/review/totalcnt/?contentsno="+contentsno;
            fetch(url,{
                method: "POST",
                headers: {
                    "Content-Type": "application/json",
                }})
                .then((response) => response.json())
                .then((data) =>   document.querySelector(".review-cnt").innerText = data.cnt);

        }

        function delete_reivew(rnum){
            let url = "/review/delete";
            url += "?rnum=" + rnum;
            url += "&contentsno=${dto.contentsno}";
            if(confirm("정말 삭제하시겠습니까?")){
                location.href = url;
            }
        }
    function noticeRead(noticeno){
        let url = "/notice/read";
        url +="?nowPage=1";
        url +="&col=";
        url +="&word=";
        url +="&noticeno="+noticeno;
        location.href=url;
    }
    function stockCheck()
    {
        alert("남은 재고 : ${dto.stock}개");
    }



        window.onload = function(){
            setStarWidth(${dto.gradepoint});
            getReviewTotalCnt(${dto.contentsno});
        }

    </script>

    <style>
        body{
            background-color: #e6e6e6;
            font-family: 'Noto Sans KR', sans-serif;
        }

        .left-div{
            width: 200px;
            height: 500px;
            background-color: white;
        }
        .right-div-des{
            padding: 15px 15px 0 15px;
            margin: 0 0 20px 0;
        }

        .right-div-des > p{
            font-size: 12px;
            margin-bottom : 0px;
        }
        .right-div-des > h2{
            font-weight: 700;
            margin: 13px 0 13px 0;
            font-size: 20px;
        }


        .dotarea {
            background: url(${root}/images/detail/dot_side_top.gif) no-repeat left top;
            padding: 20px 15px 0 15px;
            margin: 5px 0;
        }
        .details-menu-name{
            font-size: 12px;
            font-weight: 700;
            margin: 0 0 18px 0;
        }
        .listimage{
            font-size: 0%;
            line-height: 100%;
            margin: 0 -10px -10px 0;
            display: block;
            padding: 0;
            border: none;
            font-style: normal;
            text-align: left;
        }

        .listimage > li{
            float: left;

        }
        .listimage > li > img{
            margin: 0 10px 10px 0;
        }
        .listimage > li > img:hover{
           border: black solid 2px;
        }
        .main-img{
            width: 570px;
            height: 570px;
            background-color: white;
        }
        .right-div{
            width: 200px;
            height: 280px;
            background-color: white;
            padding: 18px 0 0 0;
        }
        .reviewarea{
            width: 570px;
            height: auto;
            background-color: white;
            padding: 15px 35px;
            margin-top: 20px;
        }
        .review-head{
            padding: 20px 0px;
            display: flex;
            justify-content: space-between;
            border-bottom: 1px solid #555;
        }
        .head-title{
            font-weight: 700;
            font-size: 20px;
            margin: 0;
            text-align: center;
        }
        .review-total{
            display: flex;
            padding: 17px 0 19px;
            justify-content: space-between;
            border-bottom: 1px solid #cdcdcd;
        }
        .review-cnt{
            font-size: 18px;
            color: #ed1c25;
        }
        .review-list{
            margin: 0;
            padding: 0;
            border: none;
            font-style: normal;
            text-align: left;

        }

        .review-list > li{
            padding: 20px 0;
            border-bottom: 1px solid #e6e6e6;
            list-style-type: none;
        }

        .user-review-head{
            display: flex;
            justify-content: space-between;
            text-align: center;
        }
        .user-review-info{
            display: flex;
            font-size: 13px;
            color: #999;
        }
        .user-id{
            margin-right: 15px;
        }
        .user-size{
            margin-top: 8px;
            font-size: 13px;
        }
        .user-review-cont{
            margin-top: 12px;
            font-size: 13px;
        }
        .starpoint_wrap{display:inline-block;}
        .starpoint_box{position:relative;background:url(${root}/images/detail/star.png) 0 0 no-repeat;font-size:0;}
        .starpoint_box .starpoint_bg{display:block;position:absolute;top:0;left:0;height:18px;background:url(${root}/images/detail/star.png) 0 -20px no-repeat;pointer-events:none;}
        .starpoint_box .label_star{display:inline-block;width:10px;height:18px;box-sizing:border-box;}

        .blind{position:absolute;clip:rect(0 0 0 0);margin:-1px;width:1px;height: 1px;overflow:hidden;}

        .user-review-middle{
            display: flex;
            justify-content: space-between;
        }

        .contProd{

            width: 570px;
            height: auto;
        }
        .title2{
            padding: 10px 35px;
            background: #666666;
            height: 50px;
            margin: 15px 0 0 0;
            color: white;
            text-align: center;
            align-content: center;
            font-size: 30px;

        }
        .title2>a{
            color: white;
        }

        .sizearea{
            padding: 0 15px 20px 15px;
        }
        .size-cont{
            font-size: 11px;
        }
        .content{
            background: #ffffff;
            padding: 18px;
            margin: 15px 0 0 0;
        }
        .detail{
            margin: 0 0 18px 0;
        }
    </style>


</head>
<body>

<div class="container" >
    <div class="row justify-content-md-center" style="margin-top: 130px;">
        <div class="left-div col-lg-2">
            <div class="right-div-des">
                <c:choose>
                    <c:when test="${dto.cateno==1}">
                        <p>MEN</p>
                    </c:when>
                    <c:when test="${dto.cateno==1 }">
                        <p>WOMEN</p>
                    </c:when>
                    <c:otherwise>
                        <p>BABY</p>
                    </c:otherwise>
                </c:choose>
                <h2>${dto.pname}</h2>

                <p>상품번호 : ${dto.contentsno}</p>
                <h2 class="price">
                    <fmt:formatNumber value="${dto.price}" pattern="#,###"/>원
                </h2>
            </div>


            <div class="dotarea">
            <p class="details-menu-name">◾  상품 이미지</p>
            <ul class="listimage">
                <li>
                    <img src="/contents/storage/${dto.filename}" alt="사진1" width="68" height="68">
                </li>
                <li>
                    <img src="/contents/storage/default.jpg" alt="사진2" width="68" height="68">
                </li>
            </ul>
            </div>
        </div>

        <div class="center col-md-auto">
            <div class="main-img">
                <img src="/contents/storage/${dto.filename}" alt="사진1" width="570" height="570">
            </div>
            <div class="reviewarea">
                <div class="review-head">
                    <p class="head-title">고객 상품평</p>

                    <c:choose>
                        <c:when test="${empty sessionScope.id}">
                            <button type="button" class="btn btn-outline-danger" onclick="location.href='/member/login'" >상품평 쓰기</button>

                        </c:when>
                        <c:otherwise>
                            <button type="button" class="btn btn-outline-danger"  data-bs-toggle="modal" data-bs-target="#createModal">상품평 쓰기</button>
                        </c:otherwise>
                    </c:choose>


                </div>

                <div class="review-contents">
                    <div class="review-total">
                        <div class="starpoint_wrap">
                            <div class="starpoint_box">
                                <label  class="label_star" title="0.5"><span class="blind">0.5점</span></label>
                                <label  class="label_star" title="1"><span class="blind">1점</span></label>
                                <label  class="label_star" title="1.5"><span class="blind">1.5점</span></label>
                                <label  class="label_star" title="2"><span class="blind">2점</span></label>
                                <label  class="label_star" title="2.5"><span class="blind">2.5점</span></label>
                                <label  class="label_star" title="3"><span class="blind">3점</span></label>
                                <label  class="label_star" title="3.5"><span class="blind">3.5점</span></label>
                                <label  class="label_star" title="4"><span class="blind">4점</span></label>
                                <label  class="label_star" title="4.5"><span class="blind">4.5점</span></label>
                                <label  class="label_star" title="5"><span class="blind">5점</span></label>
                                <span class="starpoint_bg avg-startpoint"></span>
                            </div>
                        </div>
                        <span>
                            총 <strong class="review-cnt">0</strong>건
                        </span>

                    </div>

                <ul class="review-list">
                    <c:choose>
                        <c:when test="${empty reviewList}">
                            <li>
                                <div class="user-review">
                                    등록된 리뷰가 없습니다.
                                </div>
                            </li>
                        </c:when>
                        <c:otherwise>
                            <c:forEach var="reviewDto" items="${reviewList}" varStatus="status">
                                <li>
                                    <div class="user-review">
                                        <div class="user-review-head">
                                            <div class="user-review-name">
                                                <strong>${reviewDto.title}</strong>
                                            </div>

                                            <div class="user-review-info">
                                                <div class="user-id">
                                                    <%-- ID 보여질 자리 --%>
                                                    <c:set var="visibleCharacters" value="3" />
                                                    <p><c:out value="${fn:substring(reviewDto.id, 0,visibleCharacters)}${fn:substring('*************************', 0, fn:length(reviewDto.id) - visibleCharacters)}" /></p>
                                                </div>
                                                <div class="user-date">
                                                    <p>${reviewDto.regdate}</p>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="user-review-middle">
                                            <div class="starpoint_wrap">
                                                <div class="starpoint_box">
                                                    <label  class="label_star" title="0.5"><span class="blind">0.5점</span></label>
                                                    <label  class="label_star" title="1"><span class="blind">1점</span></label>
                                                    <label  class="label_star" title="1.5"><span class="blind">1.5점</span></label>
                                                    <label  class="label_star" title="2"><span class="blind">2점</span></label>
                                                    <label  class="label_star" title="2.5"><span class="blind">2.5점</span></label>
                                                    <label  class="label_star" title="3"><span class="blind">3점</span></label>
                                                    <label  class="label_star" title="3.5"><span class="blind">3.5점</span></label>
                                                    <label  class="label_star" title="4"><span class="blind">4점</span></label>
                                                    <label  class="label_star" title="4.5"><span class="blind">4.5점</span></label>
                                                    <label  class="label_star" title="5"><span class="blind">5점</span></label>
                                                    <span class="starpoint_bg user-starpoint${reviewDto.rnum}"></span>
                                                    <script>
                                                        function setUserStarWidth(value) {
                                                            const width = value * 20 + "%";
                                                            document.querySelector(".user-starpoint${reviewDto.rnum}").style.width = width
                                                        }
                                                        setUserStarWidth(${reviewDto.gradepoint});
                                                    </script>
                                                </div>
                                            </div>
                                            <div>
                                                <c:if test="${reviewDto.id eq sessionScope.id || sessionScope.grade eq 'A'}">
                                                    <c:set var="Review" value="${reviewList[status.index]}" />
                                                    <a href="" class="btn btn-outline-secondary" data-bs-toggle="modal" data-bs-target="#updateModal" ><i class="bi bi-pencil-square"></i></a>
                                                    <a href="javascript:delete_reivew(${reviewDto.rnum})" class="btn btn-outline-secondary"><i class="bi bi-trash"></i></a>
                                                </c:if>
                                            </div>
                                        </div>


                                        <div class="user-size">
                                            사이즈 : <strong>${reviewDto.ordersize}</strong>
                                        </div>
                                        <div class="user-review-cont">
                                            <p> ${reviewDto.content} </p>
                                        </div>
                                    </div>
                                </li>
                            </c:forEach>
                        </c:otherwise>
                    </c:choose>
                </ul>
                </div>
            </div>
            <div class="contProd">
                <div class="title2 d-flex  justify-content-between">
                    <p class="head-title">상품상세설명</p>
                    <a href=""><i class="bi bi-arrow-up-circle title2-atag"></i></a>
                </div>
                <div class="content">
                    <p class="detail">
                        ${dto.detail}
                    </p>
                </div>
            </div>
        </div>

        <style>
            .form_radio_btn {
                border: 1px solid #EAE7E7;
                font-size: 11px;
                padding: 5px;
            }
            .form_radio_btn input[type=radio] {
                display: none;
            }
            .form_radio_btn label {
                display: block;
                margin: 2px;
                text-align: center;
                align-content: center;
                height: 22px;
                width: 35px;
                border: 2px solid #cbcbcb;
                background-color: #000000;
                color: white;
            }
            .form_toggle{
                padding: 0 15px 20px 15px;
            }
            /* Checked */

            .form_radio_btn.selected{
                box-shadow: 0 0 0 3px #000000 inset;
            }

            .selected> input{
                font-size: 1000px;
            }
            /* Hover */
            .form_radio_btn:hover{
                box-shadow: 0 0 0 3px #000000 inset;
            }

            /* Disabled */
            /*.form_radio_btn input[type=radio] + label {*/

            /*    background: #F9FAFC;*/
            /*    color: #666;*/
            /*}*/
            .size-cont{
                margin: 0px;
            }
            .quantityarea{
                padding: 0 15px;
            }
            .quantity-div{
                font-size: 10px;
            }
            .buynow{
                width: 200px;
                height: 95px;
                background-color: #fe0000;
                color: white;
                text-decoration:none;
                text-align: center;
                padding: 20px;
            }
            .buynow-title{
                font-size: 18px;
                font-weight: 700;
            }
            .buynow > i {
                font-size: 30px;
            }

            .cart{
                width: 200px;
                height: 75px;
                background-color: black;
                color: white;
                text-decoration:none;
                text-align: center;
                align-items: center;
                padding: 25px 30px;
                margin-top: 7px;
            }
            .cart > i{
                font-size: 25px;
                margin-left: 10px;
            }
            .cart-title{
                font-size: 17px;
                font-weight: 700;
                margin: 0;
            }
            .notice{
                margin-top: 7px;
                width: 200px;
                height: auto;
                background-color: white;
                padding: 8px 10px;
                font-size: 12px;
                text-align: center;



            }
            .notice-title {
                margin: 0;
                font-weight: 700;
            }
            .notice-cont{
                align-items: center;
                color: black;
                text-decoration:none;
                justify-content: flex-end;
                margin-bottom: 3px;
            }
            .notice-cont > i{
               margin-left: 5px;
            }
        </style>

        <div class="right-div col-lg-2">
            <div class="sizearea">
                <p class="details-menu-name">◾  사이즈 선택</p>
                <p class="size-cont">Size: </p>
            </div>



            <form name="contentForm" >
                <input type="hidden" name="contentsno" value="${dto.contentsno}">
                <input type="hidden" name="pname" value="${dto.pname}">
                <input type="hidden" name="filename" value="${dto.filename}">
                <input type="hidden" name="id" value="${sessionScope.id}">
                <input type="hidden" name="price" value="${dto.price}">

            <div class="form_toggle  d-flex  flex-column  " >
                <div class=" d-flex justify-content-between">
                        <div class="form_radio_btn">
                            <input id="radio-1" type="radio" name="size" value="XS">
                            <label for="radio-1">XS</label>
                        </div>


                        <div class="form_radio_btn">
                            <input id="radio-2" type="radio" name="size" value="S">
                            <label for="radio-2">S</label>
                        </div>


                        <div class="form_radio_btn">
                            <input id="radio-3" type="radio" name="size" value="M">
                            <label for="radio-3">M</label>
                        </div>

                    </div>

                <div class="d-flex justify-content-between mt-1">

                        <div class="form_radio_btn">
                            <input id="radio-4" type="radio" name="size" value="L">
                            <label for="radio-4">L</label>
                        </div>


                        <div class="form_radio_btn">
                            <input id="radio-5" type="radio" name="size" value="XL">
                            <label for="radio-5">XL</label>
                        </div>
                        <div class="form_radio_btn">
                            <input id="radio-6" type="radio" name="size" value="XXL">
                            <label for="radio-6">XXL</label>
                        </div>
                    </div>
            </div>

            <div class="quantityarea">
                <p class="details-menu-name">◾  수량 선택</p>
                <div class="input-group mb-3 quantity-div input-group-sm ">
                    <label class="input-group-text " for="quantity">수량</label>
                    <select class="form-select" id="quantity"  name="quantity">
                        <option selected value="1">1</option>
                        <option value="2">2</option>
                        <option value="3">3</option>
                        <option value="4">4</option>
                        <option value="5">5</option>
                        <option value="6">6</option>
                        <option value="7">7</option>
                        <option value="8">8</option>
                        <option value="9">9</option>
                        <option value="10">10</option>
                    </select>
                </div>
            </div>
            </form>
            <a href="javascript:buynow()" class="buynow d-flex flex-column">
                <h2 class="buynow-title">바로 구매하기</h2>
                <i class="bi bi-chevron-down"></i>
            </a>

            <a href="javascript:cart()" class="cart d-flex">
                <h2 class="cart-title">장바구니 담기</h2>
                <i class="bi bi-chevron-down"></i>
            </a>

            <a href="javascript:stockCheck()" class="cart d-flex">
                <h2 class="cart-title">매장 재고 확인</h2>
                <i class="bi bi-chevron-down"></i>
            </a>

            <div class="notice">
                <a href="javascript:noticeRead(1)" class="notice-cont d-flex">
                    <p class="notice-title">결재방법</p>
                    <i class="bi bi-caret-right-square-fill"></i>
                </a>
                <a href="javascript:noticeRead(2)" class="notice-cont d-flex">
                    <p class="notice-title">반품/환불/교환방법</p>
                    <i class="bi bi-caret-right-square-fill"></i>
                </a>
            </div>
        </div>

    </div>


        <script>
            const radioButtons = document.querySelectorAll('.form_radio_btn input[type=radio]');
            const radioDivs = document.querySelectorAll('.form_radio_btn');
            const sizeCont = document.querySelector('.size-cont');
            radioButtons.forEach((radio, index) => {
                radio.addEventListener('change', () => {

                    radioDivs.forEach((div) => {
                        div.classList.remove('selected');
                    });
                    radioDivs[index].classList.add('selected');
                    sizeCont.innerText="Size: " + radioDivs[index].childNodes[1].value;
                });
            });


        </script>
    </div>

</div>

<%--리뷰 생성 Modal 부분--%>
<script>
    function checkModal(f){
        if (f.title.value == ""){
            alert("제목을 입력하세요");
            f.title.focus()
            return false;
        }
        if (f.ordersize.value == "사이즈 선택"){
            alert("구입한 사이즈를 입력하세요");
            f.ordersize.focus();
            return false;
        }
        if (f.content.value == ""){
            alert("내용을 입력하세요");
            f.content.focus()
            return false;
        }
    }

</script>
<style>
    .modal-title{
        font-weight: 700;
    }
    .starpoint_box .star_radio{opacity:0;width:0;height:0;position:absolute;}
    .starpoint_box .star_radio:nth-of-type(1):hover ~ .review-create-modal,
    .starpoint_box .star_radio:nth-of-type(1):checked ~ .review-create-modal{width:10%;}
    .starpoint_box .star_radio:nth-of-type(2):hover ~ .review-create-modal,
    .starpoint_box .star_radio:nth-of-type(2):checked ~ .review-create-modal{width:20%;}
    .starpoint_box .star_radio:nth-of-type(3):hover ~ .review-create-modal,
    .starpoint_box .star_radio:nth-of-type(3):checked ~ .review-create-modal{width:30%;}
    .starpoint_box .star_radio:nth-of-type(4):hover ~ .review-create-modal,
    .starpoint_box .star_radio:nth-of-type(4):checked ~ .review-create-modal{width:40%;}
    .starpoint_box .star_radio:nth-of-type(5):hover ~ .review-create-modal,
    .starpoint_box .star_radio:nth-of-type(5):checked ~ .review-create-modal{width:50%;}
    .starpoint_box .star_radio:nth-of-type(6):hover ~ .review-create-modal,
    .starpoint_box .star_radio:nth-of-type(6):checked ~ .review-create-modal{width:60%;}
    .starpoint_box .star_radio:nth-of-type(7):hover ~ .review-create-modal,
    .starpoint_box .star_radio:nth-of-type(7):checked ~ .review-create-modal{width:70%;}
    .starpoint_box .star_radio:nth-of-type(8):hover ~ .review-create-modal,
    .starpoint_box .star_radio:nth-of-type(8):checked ~ .review-create-modal{width:80%;}
    .starpoint_box .star_radio:nth-of-type(9):hover ~ .review-create-modal,
    .starpoint_box .star_radio:nth-of-type(9):checked ~ .review-create-modal{width:90%;}
    .starpoint_box .star_radio:nth-of-type(10):hover ~ .review-create-modal,
    .starpoint_box .star_radio:nth-of-type(10):checked ~ .review-create-modal{width:100%;}
    .modal-star{
        margin-top:30px
    }
</style>
<div class="modal" id="createModal">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">
            <!-- Modal Header -->
            <div class="modal-header">
                <h4 class="modal-title">고객 상품평</h4>
                <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
            </div>

            <!-- Modal body -->
            <div class="modal-body">
                <form action="/review/create" method="post" id="create"   onsubmit="return checkModal(this)">
                    <input type="hidden" name="contentsno" value="${dto.contentsno}">
                    <div class="modal-body-fir mb-3 d-flex justify-content-between">
                        <div class="input-group me-5">
                            <span class="input-group-text">제목</span>
                            <input type="text" class="form-control " placeholder="title" name="title">
                        </div>
                        <div class="input-group">
                            <span class="input-group-text">id</span>
                            <input type="text" class="form-control" placeholder="id" name="id" value="${sessionScope.id}"  readonly>
                        </div>


                    </div>
                    <div class="input-group">
                        <span class="input-group-text">사이즈</span>
                        <select class="form-select"  name="ordersize">
                            <option selected>사이즈 선택</option>
                            <option value="S">S</option>
                            <option value="M">M</option>
                            <option value="L">L</option>
                            <option value="XL">XL</option>
                        </select>
                    </div>
                    <div class="input-group">
                    <span class="input-group-text" style="margin:20px 20px 0 0">평점</span>
                        <div class="starpoint_wrap modal-star ">
                            <div class="starpoint_box">
                                <label for="starpoint_1" class="label_star" title="0.5"><span class="blind">0.5점</span></label>
                                <label for="starpoint_2" class="label_star" title="1"><span class="blind">1점</span></label>
                                <label for="starpoint_3" class="label_star" title="1.5"><span class="blind">1.5점</span></label>
                                <label for="starpoint_4" class="label_star" title="2"><span class="blind">2점</span></label>
                                <label for="starpoint_5" class="label_star" title="2.5"><span class="blind">2.5점</span></label>
                                <label for="starpoint_6" class="label_star" title="3"><span class="blind">3점</span></label>
                                <label for="starpoint_7" class="label_star" title="3.5"><span class="blind">3.5점</span></label>
                                <label for="starpoint_8" class="label_star" title="4"><span class="blind">4점</span></label>
                                <label for="starpoint_9" class="label_star" title="4.5"><span class="blind">4.5점</span></label>
                                <label for="starpoint_10" class="label_star" title="5"><span class="blind">5점</span></label>
                                <input type="radio" name="gradepoint" value="0.5"  id="starpoint_1" class="star_radio">
                                <input type="radio" name="gradepoint" value="1" id="starpoint_2" class="star_radio">
                                <input type="radio" name="gradepoint" value="1.5" id="starpoint_3" class="star_radio">
                                <input type="radio" name="gradepoint" value="2" id="starpoint_4" class="star_radio">
                                <input type="radio" name="gradepoint" value="2.5" id="starpoint_5" class="star_radio">
                                <input type="radio" name="gradepoint" value="3" id="starpoint_6" class="star_radio">
                                <input type="radio" name="gradepoint" value="3.5" id="starpoint_7" class="star_radio">
                                <input type="radio" name="gradepoint" value="4" id="starpoint_8" class="star_radio">
                                <input type="radio" name="gradepoint" value="4.5" id="starpoint_9" class="star_radio">
                                <input type="radio" name="gradepoint" value="5" id="starpoint_10" class="star_radio">
                                <span class="starpoint_bg review-create-modal"></span>
                            </div>
                        </div>
                    </div>
                    <div class="mb-3 mt-3 ">
                        <label for="content">내용</label>
                        <div class="" style="height: 400px">
                            <textarea class="form-control h-100" rows="15" id="content" name="content"></textarea>
                        </div>
                    </div>
                </form>
            </div>
            <!-- Modal footer -->
            <div class="modal-footer">

                <div class="input-group mb-3 d-flex flex-row-reverse">

                    <div>
                        <button type="submit" form="create" class="btn text-danger">
                            <svg xmlns="http://www.w3.org/2000/svg"
                                                                                          width="35" height="35" fill="currentColor" class="bi bi-plus-circle" viewBox="0 0 16 16">
                            <path d="M8 15A7 7 0 1 1 8 1a7 7 0 0 1 0 14zm0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16z" />
                            <path
                                    d="M8 4a.5.5 0 0 1 .5.5v3h3a.5.5 0 0 1 0 1h-3v3a.5.5 0 0 1-1 0v-3h-3a.5.5 0 0 1 0-1h3v-3A.5.5 0 0 1 8 4z" />
                        </svg>
                        </button>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>





<style>
    .starpoint_box .star_radio:nth-of-type(1):hover ~ .review-update-modal,
    .starpoint_box .star_radio:nth-of-type(1):checked ~ .review-update-modal{width:10%;}
    .starpoint_box .star_radio:nth-of-type(2):hover ~ .review-update-modal,
    .starpoint_box .star_radio:nth-of-type(2):checked ~ .review-update-modal{width:20%;}
    .starpoint_box .star_radio:nth-of-type(3):hover ~ .review-update-modal,
    .starpoint_box .star_radio:nth-of-type(3):checked ~ .review-update-modal{width:30%;}
    .starpoint_box .star_radio:nth-of-type(4):hover ~ .review-update-modal,
    .starpoint_box .star_radio:nth-of-type(4):checked ~ .review-update-modal{width:40%;}
    .starpoint_box .star_radio:nth-of-type(5):hover ~ .review-update-modal,
    .starpoint_box .star_radio:nth-of-type(5):checked ~ .review-update-modal{width:50%;}
    .starpoint_box .star_radio:nth-of-type(6):hover ~ .review-update-modal,
    .starpoint_box .star_radio:nth-of-type(6):checked ~ .review-update-modal{width:60%;}
    .starpoint_box .star_radio:nth-of-type(7):hover ~ .review-update-modal,
    .starpoint_box .star_radio:nth-of-type(7):checked ~ .review-update-modal{width:70%;}
    .starpoint_box .star_radio:nth-of-type(8):hover ~ .review-update-modal,
    .starpoint_box .star_radio:nth-of-type(8):checked ~ .review-update-modal{width:80%;}
    .starpoint_box .star_radio:nth-of-type(9):hover ~ .review-update-modal,
    .starpoint_box .star_radio:nth-of-type(9):checked ~ .review-update-modal{width:90%;}
    .starpoint_box .star_radio:nth-of-type(10):hover ~ .review-update-modal,
    .starpoint_box .star_radio:nth-of-type(10):checked ~ .review-update-modal{width:100%;}
</style>
<div class="modal" id="updateModal">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">
            <!-- Modal Header -->
            <div class="modal-header">
                <h4 class="modal-title">상품평 수정</h4>
                <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
            </div>

            <!-- Modal body -->
            <div class="modal-body">
                <form action="/review/update" method="post" id="update"   onsubmit="return checkModal(this)">
                    <input type="hidden" name="contentsno" value="${dto.contentsno}">
                    <input type="hidden" name="rnum" value="${Review.rnum}">

                    <div class="modal-body-fir mb-3 d-flex justify-content-between">
                        <div class="input-group me-5">
                            <span class="input-group-text">제목</span>
                            <input type="text" class="form-control" value="${Review.title}" name="title" >
                        </div>
                        <div class="input-group">
                            <span class="input-group-text">id</span>
                            <input type="text" class="form-control" placeholder="id" name="id" value="${sessionScope.id}"  readonly>
                        </div>


                    </div>
                    <div class="input-group">
                        <span class="input-group-text">사이즈</span>
                        <select class="form-select"  name="ordersize">
                            <option selected>사이즈 선택</option>
                            <option value="S" <c:if test="${Review.ordersize eq 'S'}">selected</c:if> >S</option>
                            <option value="M" <c:if test="${Review.ordersize eq 'M'}">selected</c:if>  >M</option>
                            <option value="L" <c:if test="${Review.ordersize eq 'L'}">selected</c:if>  >L</option>
                            <option value="XL"<c:if test="${Review.ordersize eq 'XL'}">selected</c:if>  >XL</option>
                        </select>
                    </div>
                    <div class="input-group">
                        <span class="input-group-text" style="margin:20px 20px 0 0">평점</span>
                        <div class="starpoint_wrap modal-star ">
                            <div class="starpoint_box">
                                <label for="update_starpoint_1" class="label_star" title="0.5"><span class="blind">0.5점</span></label>
                                <label for="update_starpoint_2" class="label_star" title="1"><span class="blind">1점</span></label>
                                <label for="update_starpoint_3" class="label_star" title="1.5"><span class="blind">1.5점</span></label>
                                <label for="update_starpoint_4" class="label_star" title="2"><span class="blind">2점</span></label>
                                <label for="update_starpoint_5" class="label_star" title="2.5"><span class="blind">2.5점</span></label>
                                <label for="update_starpoint_6" class="label_star" title="3"><span class="blind">3점</span></label>
                                <label for="update_starpoint_7" class="label_star" title="3.5"><span class="blind">3.5점</span></label>
                                <label for="update_starpoint_8" class="label_star" title="4"><span class="blind">4점</span></label>
                                <label for="update_starpoint_9" class="label_star" title="4.5"><span class="blind">4.5점</span></label>
                                <label for="update_starpoint_10" class="label_star" title="5"><span class="blind">5점</span></label>
                                <input type="radio" name="gradepoint" value="0.5"  id="update_starpoint_1" class="star_radio" <c:if test="${Review.gradepoint eq '0.5'}">checked</c:if>  >
                                <input type="radio" name="gradepoint" value="1" id="update_starpoint_2" class="star_radio" <c:if test="${Review.gradepoint eq '1'}">checked</c:if> >
                                <input type="radio" name="gradepoint" value="1.5" id="update_starpoint_3" class="star_radio" <c:if test="${Review.gradepoint eq '1.5'}">checked</c:if> >
                                <input type="radio" name="gradepoint" value="2" id="update_starpoint_4" class="star_radio" <c:if test="${Review.gradepoint eq '2'}">checked</c:if> >
                                <input type="radio" name="gradepoint" value="2.5" id="update_starpoint_5" class="star_radio" <c:if test="${Review.gradepoint eq '2.5'}">checked</c:if> >
                                <input type="radio" name="gradepoint" value="3" id="update_starpoint_6" class="star_radio" <c:if test="${Review.gradepoint eq '3'}">checked</c:if> >
                                <input type="radio" name="gradepoint" value="3.5" id="update_starpoint_7" class="star_radio" <c:if test="${Review.gradepoint eq '3.5'}">checked</c:if> >
                                <input type="radio" name="gradepoint" value="4" id="update_starpoint_8" class="star_radio" <c:if test="${Review.gradepoint eq '4'}">checked</c:if> >
                                <input type="radio" name="gradepoint" value="4.5" id="update_starpoint_9" class="star_radio" <c:if test="${Review.gradepoint eq '4.5'}">checked</c:if> >
                                <input type="radio" name="gradepoint" value="5" id="update_starpoint_10" class="star_radio" <c:if test="${Review.gradepoint eq '5'}">checked</c:if> >
                                <span class="starpoint_bg review-update-modal"></span>
                            </div>
                        </div>
                    </div>
                    <div class="mb-3 mt-3 ">
                        <label for="content">내용</label>
                        <div class="" style="height: 400px">
                            <textarea class="form-control h-100" rows="15" id="update_content" name="content">${Review.content}</textarea>
                        </div>
                    </div>
                </form>
            </div>
            <!-- Modal footer -->
            <div class="modal-footer">

                <div class="input-group mb-3 d-flex flex-row-reverse">

                    <div>
                        <button type="submit" form="update" class="btn text-danger">
                            <svg xmlns="http://www.w3.org/2000/svg"
                                 width="35" height="35" fill="currentColor" class="bi bi-plus-circle" viewBox="0 0 16 16">
                                <path d="M8 15A7 7 0 1 1 8 1a7 7 0 0 1 0 14zm0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16z" />
                                <path
                                        d="M8 4a.5.5 0 0 1 .5.5v3h3a.5.5 0 0 1 0 1h-3v3a.5.5 0 0 1-1 0v-3h-3a.5.5 0 0 1 0-1h3v-3A.5.5 0 0 1 8 4z" />
                            </svg>
                        </button>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
</body>


</html>