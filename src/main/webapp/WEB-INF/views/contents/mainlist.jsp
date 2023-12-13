<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html> 
<html> 
<head>
  <title>상품메인페이지</title>
  <meta charset="utf-8">


    <style>
        body{
            font-family: 'Noto Sans KR', sans-serif;
        }
        h3{
            font-weight: 700;
        }
        .caterow{
            text-align: center;
        }
        .cateimg{
            margin-top: 50px;
            display: flex;
            justify-content: space-around;
            text-align: center;
        }
        .photo{
            text-align: center;
        }
        .photo img{
            width: 285px;
            height: 285px;
        }

        @media screen and (max-width: 768px) {
            .cateimg {
                flex-direction: column;
            }
        }

    </style>
</head>
<body> 
 
<div class="container mt-5" style="margin-top: 100px!important;">
    <c:choose>
        <c:when test="${cateno==1 }">
            <h3>WOMEN</h3>
        </c:when>
        <c:when test="${cateno==2 }">
            <h3>MEN</h3>
        </c:when>
        <c:otherwise>
            <h3>BABY</h3>
        </c:otherwise>
    </c:choose>
<div class="row caterow">
    <h3>상품 카테고리</h3>

    <c:choose>
        <c:when test="${cateno==1 }">
            <div class="cateimg">
                <div class="photo">
                    <a href="/contents/category?cateno=${cateno}&subcateno=1">
                        <img src="${root}/images/category/class/women_outer.jpg" alt="아우터">
                    </a>
                    <p>아우터</p>
                </div>
                <div class="photo">
                    <a href="/contents/category?cateno=${cateno}&subcateno=2">
                        <img src="${root}/images/category/class/women_shirt.jpg" alt="티셔츠">
                    </a>
                    <p>티셔츠</p>
                </div>
                <div class="photo">
                    <a href="">
                        <a href="/contents/category?cateno=${cateno}&subcateno=3">
                        <img src="${root}/images/category/class/women_pants.jpg" alt="바지">
                    </a>
                    <p>바지</p>
                </div>

            </div>
        </c:when>
        <c:when test="${cateno==2 }">
            <div class="cateimg">
                <div class="photo">
                    <a href="/contents/category?cateno=${cateno}&subcateno=1">
                        <img src="${root}/images/category/class/men_outer.jpg" alt="아우터">
                    </a>
                    <p>아우터</p>
                </div>
                <div class="photo">
                    <a href="/contents/category?cateno=${cateno}&subcateno=2">
                        <img src="${root}/images/category/class/men_shirt.jpg" alt="티셔츠">
                    </a>
                    <p>티셔츠</p>
                </div>
                <div class="photo">
                    <a href="/contents/category?cateno=${cateno}&subcateno=3">
                        <img src="${root}/images/category/class/men_pants.jpg" alt="바지">
                    </a>
                    <p>바지</p>
                </div>

            </div>
        </c:when>
        <c:otherwise>
            <div class="cateimg">
                <div class="photo">
                    <a href="/contents/category?cateno=${cateno}&subcateno=1">
                        <img src="${root}/images/category/class/baby_outer.jpg" alt="아우터">
                    </a>
                    <p>아우터</p>
                </div>
                <div class="photo">
                    <a href="/contents/category?cateno=${cateno}&subcateno=2">
                        <img src="${root}/images/category/class/baby_shirt.jpg" alt="티셔츠">
                    </a>
                    <p>티셔츠</p>
                </div>
                <div class="photo">
                    <a href="/contents/category?cateno=${cateno}&subcateno=3">
                        <img src="${root}/images/category/class/baby_pants.jpg" alt="바지">
                    </a>
                    <p>바지</p>
                </div>

            </div>
        </c:otherwise>
    </c:choose>
</div>


</div>
</body> 
</html> 