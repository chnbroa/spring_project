<%--
  Created by IntelliJ IDEA.
  User: chnbr
  Date: 2023-11-30
  Time: 오후 3:43
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>

  <style>

    body{
      font-family: 'Noto Sans KR', sans-serif;
    }
    h3{
      font-weight: 700;
    }
    a{
      text-decoration: none;
      color: #000000;
    }
   .tag{
     display: inline-block;
     margin: 6px 0 0 0px;
     width: auto;
     height: auto;

    }
    .tag>span{
      display: block;
      height: 33px;
      text-align: right;
      padding: 0px 0px 5px 0;
      letter-spacing: -1px;
    }
    .description{
      display: flex;
      flex-direction: column;
      font-weight: 700;
    }

    .price{
      font-size: 22px;
    }
    .small{
      font-size:13px;
    }

    .name:hover{
      cursor: pointer;
      opacity: 0.7;
      text-decoration: underline;
    }
    .img:hover{
      cursor: pointer;
      opacity: 0.7;
    }

  </style>
</head>
<body>
<div class="container mt-5" style="margin-top: 100px!important;">
  <c:choose>
    <c:when test="${subcateno==1 }">
      <h3>OUTER</h3>
    </c:when>
    <c:when test="${subcateno==2 }">
      <h3>SHIRT</h3>
    </c:when>
    <c:otherwise>
      <h3>PANTS</h3>
    </c:otherwise>
  </c:choose>

  <c:choose>
    <c:when test="${empty list}">
      <div class="row" >
        <h3>상품 준비중 입니다.</h3>
        <p><img src="/contents/storage/default.jpg" class="img-thumbnail"  width="236" height="306"></p>
      </div>
    </c:when>
    <c:otherwise>
      <c:set var="list" value="${list}"/>
      <div class="row justify-content-center">
        <c:forEach var="dto" begin="0" end="3" items="${list}">
          <div class="col-sm-3 my-3 tag">
            <c:choose>
              <c:when test="${cateno==1 }">
                <span>
                  <img src= "${root}/images/category/tag/tag_women.gif" alt="WOMEN">
                </span>
              </c:when>
              <c:when test="${cateno==2 }">
                <span>
                  <img src="${root}/images/category/tag/tag_men.gif" alt="MEN">
                </span>
              </c:when>
              <c:otherwise>
                <span>
                  <img src="${root}/images/category/tag/tag_baby.gif" alt="BABY">
                </span>
              </c:otherwise>
            </c:choose>
            <div>
              <a class="img" href="/contents/detail/${dto.contentsno}">
                <img src="/contents/storage/${dto.filename}"  width="276" height="276">
              </a>
              <div class="description">
                <a href="/contents/detail/${dto.contentsno}">
                  <span class="name"> ${dto.pname}</span>
                </a>

                <div>
                  <strong class="price">
                    <fmt:formatNumber value="${dto.price}" pattern="#,###"/>
                  </strong>
                  <span class="small">원</span>
                </div>
              </div>
            </div>
          </div>
        </c:forEach>
      </div>

      ${paging}
    </c:otherwise>
  </c:choose>
</div>
</body>
</html>
