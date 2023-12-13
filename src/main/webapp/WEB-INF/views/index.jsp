<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 
<!DOCTYPE html> 
<html> 
<head>
  <title>기본페이지</title>
  <meta charset="utf-8">
    <script type="module">
        import Swiper from 'https://cdn.jsdelivr.net/npm/swiper@11/swiper-bundle.min.mjs'


        var rightswiper = new Swiper('.right-swiper-container', {
            speed: 500,
            direction: 'vertical',
            mousewheel: true,
            pagination: {
                el: '.right-swiper-pagination',
                clickable: true,
            },
            watchOverflow : true,
            on: {
                slideChange: function() {
                    setTimeout(function () {
                        rightswiper.params.touchReleaseOnEdges = false;
                        rightswiper.params.mousewheel.releaseOnEdges = false;
                    });
                },
                reachEnd: function() {
                    setTimeout(function () {
                        rightswiper.params.touchReleaseOnEdges = true;
                        rightswiper.params.mousewheel.releaseOnEdges = true;
                    }, 500);
                },
                reachBeginning: function() {
                    setTimeout(function () {
                        rightswiper.params.touchReleaseOnEdges = true;
                        rightswiper.params.mousewheel.releaseOnEdges = true;
                    }, 500);
                }
            }
        });



        var lowerswiper = new Swiper(".lowerSwiper", {
            slidesPerView: 1,
            spaceBetween: 30,
            loop: true,
            pagination: {
                el: ".lower-swiper-pagination",
                clickable: true,
            },
            navigation: {
                nextEl: ".lower-swiper-button-next",
                prevEl: ".lower-swiper-button-prev",
            },
        });
    </script>


    <style>
        html,
        body {
            position: relative;
            height: 100%;
        }

        body {
            background-color: white;
            font-family: Helvetica Neue, Helvetica, Arial, sans-serif;
            font-size: 14px;
            color: #000;
            margin: 0;
            padding: 0;
        }

        .swiper {
            width: 100%;
            height: 100%;
        }

        .swiper-slide {
            text-align: center;
            font-size: 18px;
            background: #fff;
            display: flex;
            justify-content: center;
            align-items: center;
        }

        .swiper-slide img {
            display: block;
            width: 100%;
            height: 100%;
            object-fit: cover;
        }

    /*    스크롤바 제거*/
        body{
            -ms-overflow-style: none;
        }
        body::-webkit-scrollbar{
            display:none;
        }

        .swiper-pagination{
            display: flex;
            text-align: center;
            align-items: center;
        }
        .right-swiper-pagination{
            top: 85% !important;
            right: auto !important;
            margin-left:15px;
            flex-direction: column;
            text-align: center;
            align-items: center;
        }

        .lower-swiper-pagination{
            justify-content: center;
            margin-bottom: 15px;
        }
        .swiper-pagination-bullet{
            display: block;
            margin: 8px auto;
            width: 4px;
            height: 4px;
            background-color: #f4f4f4;
            box-shadow: 1px 1px 2px rgba(0, 0, 0, 0.3);
            opacity: 0.8;
            box-sizing: border-box;
            text-align: center;
        }

        .swiper-pagination-bullet-active{
            width: 8px;
            height: 8px;
            background-color: #fff;
        }

        .swiper-button-prev:after{
            background-image: url("${root}/images/index_img/arrow_prev.svg");
            font-size: 55px;
            line-height: normal;
            background-repeat: no-repeat;

        }
        .swiper-button-next:after{
            background-image: url("${root}/images/index_img/arrow_next.svg");
            font-size: 55px;
            line-height: normal;
            background-repeat: no-repeat;
        }

        .swiper-button-prev,.swiper-button-next{

            color: transparent;
            transform: translateY(-50%);
        }
        .notice{
            font-family: 'Noto Sans KR', sans-serif;

        }
        .notice-title{
            font-size: 30px;
            font-weight: 700;

        }
        .notice-cont a{
            color: #000;
            text-decoration: none;
        }
        .notice-cont {
            text-align: center;
        }

        .notice-subtitle{
            margin-top: 20px;
            font-size:24px;
        }
        .notice-view-more {
            width: 70%;
            border: 1px solid #1b1b1b;
            margin: 40px auto;
            text-align: center;
        }
        .notice-view-more > a {
            display: block;
            padding: 13px 0;
        }
        .notice-view-more > a:hover{
            color: #6a6a6a;
        }
        .notice-view-more:hover{
            border: 1px solid #6a6a6a;
        }
        .notice-view{
            /*padding: 0px 50px;*/
            width: 65%;
            text-align: center;
            margin:25px auto;
            border-bottom: 1px solid #dadada;
        }

        .notice-item-div{
            padding: 13px 0;
            border-top: 1px solid #dadada;
            width: 100%;

        }
        .notice-item-a{
            display: flex;
            justify-content: space-between;
            align-items: center;
        }
</style>
</head>
<body>
<div class="swiper right-swiper-container">
    <div class="swiper-wrapper">
        <div class="swiper-slide"  >
            <div class="swiper lowerSwiper">
                <div class="swiper-wrapper">
                    <div class="swiper-slide" ><img src="${root}/images/index_img/woman1.jpg" alt="woman1"></div>
                    <div class="swiper-slide" ><img src="${root}/images/index_img/woman2.jpg" alt="woman2"></div>
                    <div class="swiper-slide" ><img src="${root}/images/index_img/woman3.jpg" alt="woman3"></div>
                </div>
                <div class="lower-swiper-button-next swiper-button-next"></div>
                <div class="lower-swiper-button-prev swiper-button-prev"></div>
                <div class="lower-swiper-pagination swiper-pagination"></div>

            </div>

        </div>
        <div class="swiper-slide">
            <div class="swiper lowerSwiper">
                <div class="swiper-wrapper">
                    <div class="swiper-slide"><img src="${root}/images/index_img/man1.jpg" alt="man1"></div>
                    <div class="swiper-slide"><img src="${root}/images/index_img/man2.jpg" alt="man2"></div>
                    <div class="swiper-slide"><img src="${root}/images/index_img/man3.jpg" alt="man3"></div>
                </div>
                <div class="lower-swiper-button-next swiper-button-next"></div>
                <div class="lower-swiper-button-prev swiper-button-prev"></div>
                <div class="lower-swiper-pagination swiper-pagination"></div>

            </div>
        </div>
        <div class="swiper-slide slide03">
            <div class="swiper lowerSwiper">
                <div class="swiper-wrapper">
                    <div class="swiper-slide"><img src="${root}/images/index_img/baby1.jpg" alt="baby1"></div>
                    <div class="swiper-slide"><img src="${root}/images/index_img/baby2.jpg" alt="baby2"><</div>
                    <div class="swiper-slide"><img src="${root}/images/index_img/baby3.jpg" alt="baby3"><</div>
                </div>
                <div class="lower-swiper-button-next swiper-button-next"></div>
                <div class="lower-swiper-button-prev swiper-button-prev"></div>
                <div class="lower-swiper-pagination swiper-pagination"></div>

            </div>
        </div>
    </div>
    <!-- Add Pagination -->
    <div class="right-swiper-pagination swiper-pagination"></div>
</div>

<script>
    function read(noticeno){
        let url = "/notice/read";
        url +="?nowPage=1";
        url +="&col=";
        url +="&word=";
        url +="&noticeno="+noticeno;
        location.href=url;
    }
</script>
<div class="container mt-5 notice">
    <h2 class="notice-title">공지사항</h2>
    <div class="notice-cont">
        <h3 class="notice-subtitle">최신 공지사항</h3>
        <div class="notice-view" >
            <c:forEach var="noticeDto" items="${noticeList}">
                <div class="notice-item-div">
                        <%--해당 공지사항 링크 걸어주기 noticeDto.noticeno --%>
                    <a class="notice-item-a" href="javascript:read(${noticeDto.noticeno})">${noticeDto.title}    <i class="bi bi-chevron-right"></i></a>
                </div>

            </c:forEach>
        </div>
        <div class="notice-view-more">
            <%--해당 공지사항 으로 가능 링크 걸기 --%>
            <a href="/notice/list">VIEW MORE</a>
        </div>
    </div>
</div>

</body> 
</html>