<%--
  Created by IntelliJ IDEA.
  User: chnbr
  Date: 2023-12-07
  Time: 오후 1:40
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>Insert title here</title>
  <script type="text/javascript" defer src="${pageContext.request.contextPath}/ckeditor/ckeditor.js">     </script>
  <script type="text/JavaScript">
    $(function() {
      CKEDITOR.replace('detail'); // <TEXTAREA>태그 id 값
    });

    function checkIn(f){
      if (f.pname.value == ""){
        alert("상품명을 입력하세요");
        f.pname.focus()
        return false;
      }
      if (f.price.value == ""){
        alert("가격을 입력하세요");
        f.price.focus();
        return false;
      }
      if (CKEDITOR.instances['detail'].getData() == '') {
        window.alert('내용을 입력해 주세요.');
        CKEDITOR.instances['detail'].focus();
        return false;
      }
      if (f.stock.value == ""){
        alert("재고를 입력하세요");
        f.stock.focus();
        return false;
      }
    }

  </script>
  <style>
    body{
      font-family: 'Noto Sans KR', sans-serif;
    }
  </style>
</head>
<body>
<div class="container mt-5">
  <div class="row">
    <h3 class="">상품 등록</h3>
    <form class="col-md-4 col-md-offset-4 "
          action="/contents/update"
          method="post"
          enctype="multipart/form-data"
          onsubmit="return checkIn(this)"
          style='width:100%;'>

      <input type="hidden" name="contentsno" value="${dto.contentsno}">

      <div class="mb-3 mt-3">
        <label for="cateno">상품분류</label>
        <div class="col-sm-6">
          <select class="form-select" name="cateno" id="cateno">
            <option value="1"
                    <c:if test= "${dto.cateno==1}"> selected </c:if>
            >WOMEN</option>
            <option value="2"
                    <c:if test= "${dto.cateno==2}"> selected </c:if>
            >MEN</option>
            <option value="3"
                    <c:if test= "${dto.cateno==3}"> selected </c:if>
            >BABY</option>
          </select>
        </div>
      </div>

      <div class="mb-3 mt-3">
        <label for="subcateno">상세분류</label>
        <div class="col-sm-6">
          <select class="form-select" name="subcateno" id="subcateno">
            <option value="1"
                    <c:if test= "${dto.subcateno==1}"> selected </c:if>
            >아우터</option>
            <option value="2"
                    <c:if test= "${dto.subcateno==2}"> selected </c:if>
            >티셔츠</option>
            <option value="3"
                    <c:if test= "${dto.subcateno==3}"> selected </c:if>
            >바지</option>
          </select>
        </div>
      </div>

      <div class="mb-3 mt-3">
        <label for="pname">상품명</label>
        <div class="col-sm-8">
          <input type="text" name="pname" id="pname" class="form-control" value="${dto.pname}">
        </div>
      </div>
      <div class="mb-3 mt-3">
        <label for="price">가격</label>
        <div class="col-sm-8">
          <input type="text" name="price" id="price" class="form-control"  value="${dto.price}">
        </div>
      </div>

      <div class="mb-3 mt-3">
        <label for="detail">상세정보</label>
        <div class="col-sm-8">
          <textarea rows="12" cols="7" id="detail" name="detail" class="form-control">${dto.detail}</textarea>
        </div>
      </div>

      <div class="mb-3 mt-3">
        <label for="stock">재고</label>
        <div class="col-sm-6">
          <input type="text" name="stock" id="stock" class="form-control" value="${dto.stock}" >
        </div>
      </div>
      <input type="hidden" name="oldfile" value="${dto.filename}">
      <div class="mb-3 mt-3">
        <label for="oldfile">원본파일</label>
        <div class="col-sm-6" id ="oldfile">
          <img src="/contents/storage/${dto.filename}"
               class="img-rounded" width="200px" height="200px">
        </div>
      </div>
      <div class="mb-3 mt-3">
        <label for="filenameMF">변경파일</label>
        <div class="col-sm-6">
          <input type="file" name="filenameMF" id="filenameMF" class="form-control">
        </div>
      </div>
      <button class="btn btn-danger">등록</button>
      <button type="button" class="btn btn-dark"
              onclick="history.back()">취소</button>
    </form>
  </div>

</div>
</body>
</html>