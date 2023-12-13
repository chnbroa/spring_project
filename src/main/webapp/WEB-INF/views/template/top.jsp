<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="root" value="${pageContext.request.contextPath }"/>
<%-- <c:choose>--%>
<%--    <c:when test="${not empty sessionScope.id && sessionScope.grade == 'A'}">--%>
<%--        <c:set var="str">관리자 페이지 입니다.</c:set>--%>
<%--    </c:when>--%>
<%--    <c:when test="${not empty sessionScope.id && sessionScope.grade != 'A'}">--%>
<%--        <c:set var='str'>안녕하세요 ${sessionScope.mname}(${sessionScope.id }) 님!</c:set>--%>
<%--    </c:when>--%>
<%--    <c:otherwise>--%>
<%--        <c:set var="str">기본 페이지 입니다.</c:set>--%>
<%--    </c:otherwise>--%>
<%--</c:choose> --%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <title>shop</title>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <link
      href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet"/>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    <script src="https://code.jquery.com/jquery-3.7.0.js"></script>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.0/font/bootstrap-icons.css">
    <script src="https://kit.fontawesome.com/71c72323b0.js" crossorigin="anonymous"></script>
    <script defer src="https://cdn.jsdelivr.net/npm/swiper@11/swiper-element-bundle.min.js"></script>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper@11/swiper-bundle.min.css" />
      <link rel="preconnect" href="https://fonts.googleapis.com">
      <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
      <link href="https://fonts.googleapis.com/css2?family=IBM+Plex+Sans+KR:wght@500&family=Noto+Sans+KR:wght@400;600&family=Roboto:wght@300;400;700&display=swap" rel="stylesheet">
    <style>
      .navbar{
        padding-top:0;
        padding-bottom: 0.5px;
      }

      .container-fluid{
        padding: 0 30vh;
      }
      .menu-name{
          display: block;
          padding: 8px 0;
          height: 40px;
          color: #000;
          font-size: 18px;
          font-weight: 700;
          font-family: 'Roboto';
          text-transform: uppercase;
          box-sizing: border-box;
      }


      .icon-description{
          margin-top: 5px;
          font-size: 13px;
          font-family: 'Noto Sans KR', sans-serif;
          font-weight: 600;
      }

      .left-nav-item{
          display: flex;
          text-align: center;
          align-items: center;
          flex-direction: column;
          font-size: 18px;
      }

      .count{
          text-align: center;
          overflow: hidden;
          position: absolute;
          top: 16px;
          width: 16px;
          height: 16px;
          background-color: #000;
          font-size: 11px;
          color: #fff;
          line-height: 1.5;
          border-radius: 50px;
          right: 305px;
          margin: 0 auto
      }
    </style>
  
<%--media --%>
    <style>
        @media screen and (max-height: 900px) {
            .count {
                right: 230px;
            }
        }

      @media screen and (max-width: 991px) {
        .container-fluid{
          padding: 0 0;
        }
          .count{
              right: 20px;
          }
      }
      @media screen and (max-width: 768px) {
          .count{
              display: none;
          }

          .left-nav-item{
              flex-direction: row;
              align-items: center;
              justify-content: center;
              text-align: center;
          }
          .icon-description{
              margin-left: 5px;
          }
          .menu-name{
              display: flex;
              align-items: center;
              justify-content: center;
          }
      }
    </style>


      <%-- 페이징 CSS 전체 적용--%>
      <style>
          .page-link {
              color: #000;
              background-color: #fff;
              border: 1px solid #ccc;
          }

          .page-item.active .page-link {
              z-index: 1;
              color: #555;
              font-weight:bold;
              background-color: #f1f1f1;
              border-color: #ccc;

          }

          .page-link:focus, .page-link:hover {
              color: #000;
              background-color: #fafafa;
              border-color: #ccc;
          }
      </style>


  </head>
  <body>

 <nav class="navbar navbar-expand-md bg-light navbar-light fixed-top border-2 border-top">
  <div class="container-fluid  border-1 border-bottom ">
    <a class="navbar-brand" href="/"> <img src="${root}/images/UNIQLO_logo.svg" alt="logo" width="40" height="40"></a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#collapsibleNavbar">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse py-1" id="collapsibleNavbar">
      <ul class="navbar-nav">
        <li class="nav-item">
          <a class="nav-link" href="/"></a>
        </li> 
        <li class="nav-item">
          <a class="nav-link menu-name" href="/contents/mainlist/1" role="button">WOMEN</a>
        </li>
        <li class="nav-item">
          <a class="nav-link menu-name" href="/contents/mainlist/2" role="button">MEN</a>
        </li>
          <li class="nav-item">
              <a class="nav-link menu-name" href="/contents/mainlist/3" role="button">BABY</a>
          </li>
      </ul>
        <ul class="navbar-nav ms-auto left-nav">
        <c:choose>
            <c:when test="${empty sessionScope.id }">
                <%--로그인을 X  회원가입 로그인 장바구니--%>

        <li class="nav-item ">
            <a href="${root}/member/create" class="nav-link m-2 left-nav-item"><i class="fa-solid fa-user-plus"></i> <span class="icon-description">회원가입</span></a>
        </li>
        <li class="nav-item ">
            <a href="${root}/member/login" class="nav-link m-2 left-nav-item"><i class="fa-solid fa-arrow-right-to-bracket"></i> <span class="icon-description">로그인</span></a>
        </li>
       <li class="nav-item ">
          <a href="${root}/member/login" class="nav-link m-2 left-nav-item"><i class="bi bi-cart-fill"></i> <span class="icon-description">장바구니</span></a>
          <span class="count">0</span>
       </li>

        </c:when>
        <c:when test="${not empty sessionScope.id && sessionScope.grade == 'A'}">
            <%--로그인을 O  관리자인경우 상품등록, 상품목록, 회원목록 로그아웃--%>

            <li class="nav-item ">
                <a href="${root}/admin/contents/create" class="nav-link m-2 left-nav-item"><i class="fa-brands fa-shopify"></i> <span class="icon-description">상품등록</span></a>
            </li>
            <li class="nav-item ">
                <a href="${root}/contents/list" class="nav-link m-2 left-nav-item"><i class="fa-brands fa-shopify"></i> <span class="icon-description">상품목록</span></a>
            </li>

            <li class="nav-item ">
                <a href="${root}/admin/member/list" class="nav-link m-2 left-nav-item"><i class="fa-solid fa-user-group"></i><span class="icon-description">회원목록</span></a>
            </li>

            <li class="nav-item ">
                <a href="${root}/member/logout" class="nav-link m-2 left-nav-item"><i class="fa-solid fa-arrow-right-from-bracket"></i> <span class="icon-description">로그아웃</span></a>
            </li>


        </c:when>
        <c:otherwise>
            <%--로그인을 O  일반 사용자인 경우, 마이페이지, 로그아웃, 장바구니--%>
            <li class="nav-item ">
                <a href="${root}/member/mypage" class="nav-link m-2 left-nav-item"><i class="bi bi-person-circle"></i> <span class="icon-description">회원정보</span></a>
            </li>
            <li class="nav-item ">
                <a href="${root}/member/logout" class="nav-link m-2 left-nav-item"><i class="fa-solid fa-arrow-right-from-bracket"></i> <span class="icon-description">로그아웃</span></a>
            </li>
            <li class="nav-item ">
                <a href="${root}/orders/cart?id=${sessionScope.id}" class="nav-link m-2 left-nav-item"><i class="bi bi-cart-fill"></i> <span class="icon-description">장바구니</span></a>
                <span class="count">0</span>
            </li>
         </c:otherwise>
       </c:choose> 
     </ul>
    </div>
  </div>
</nav>
 <script >
     function count(){
         let cnt = document.querySelector(".count");
         if(cnt != null){
             if(${not empty sessionScope.id})
             {
                 let url = "/orders/count/?id=${sessionScope.id}";

                 fetch(url,{
                     method: "POST",
                     headers: {
                         "Content-Type": "application/json",
                     }})
                     .then((response) => response.json())
                     .then((data) =>  cnt.innerText= data.str);
             }
         }
     }
     count();
 </script>
  </body>