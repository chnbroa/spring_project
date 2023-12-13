<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

 
 
<!DOCTYPE html> 
<html> 
<head>
  <title>Bootstrap Example</title>
  <meta charset="utf-8">
   <script type="text/javascript">
     function read(contentsno){
       var url = "/contents/detail/";
       url += contentsno;
       location.href=url;
 
     }
         
     function del(contentsno, filename){
    	 
 		let url = "delete/"+contentsno+"/"+filename;
		if (confirm("상품을 삭제하시겠습니까?")) {
			location.href = url;
		}
     }
  
  </script>
    <style>
        body{
            font-family: 'Noto Sans KR', sans-serif;
        }
        .content-list-title{
            font-weight: 700;
        }
        .content-list-btn > a , .content-list-name{
            color: black;
            text-decoration:none;
            font-size: 20px;
        }
    </style>
</head>
<body>
<div class="container" style="margin-top: 150px;">
 
  <h2 class="content-list-title">상품 목록</h2>
  <form action="./list">
    <div class="row mb-3 mt-3"> 
      <div class="col"> 
      <select class="form-control" name="col">
        <option value="cateno"
        <c:if test= "${col=='cateno'}"> selected </c:if>
        >상품분류(Women:1, Men:2, Boby:3)</option>
        <option value="pname"
        <c:if test= "${col=='pname'}"> selected </c:if>
        >상품명</option>
        <option value="price"
        <c:if test= "${col=='price'}"> selected </c:if>
        >가격</option>
        <option value="total"
        <c:if test= "${col=='total'}"> selected </c:if>
        >전체출력</option>       
     </select>
    </div>
   
    <div class="col">
      <input type="text" class="form-control" placeholder="Enter 검색어" 
      name="word" value="${word}">
    </div>
    <div class="col">
    <button type="submit" class="btn btn-primary" >검색</button>
    <button type="button" class="btn btn-dark" onclick="location.href='/admin/contents/create'">등록</button>
    
    </div>
    </div>
  </form>
  
  <table class="table table-striped">
   <thead>
    <tr>
    <th>번호</th>
    <th>상품이미지</th>
    <th>상품명</th>
    <th>가격</th>
    <th>등록날짜</th>
    <th>재고</th>
    <th>수정/삭제</th>
    </tr>
   </thead>
   <tbody>
 
<c:choose>   
<c:when test="${empty list}">
   <tr><td colspan="6">등록된 상품이 없습니다.</td>
</c:when>
<c:otherwise>
  
   <c:forEach var="dto" items="${list}"> 
   
   <tr>
    <td>${dto.contentsno}</td>
    <td>
    <img src="/contents/storage/${dto.filename}"  class="img-rounded" width="100px" height="100px">
    </td>
    <td >
    <a class="content-list-name" href="javascript:read('${dto.contentsno}')">${dto.pname}</a>

    </td>
    <td>${dto.price}</td>
    <td>${dto.rdate}</td>
    <td>${dto.stock}</td>
    <td class="content-list-btn"> <a href="./update/${dto.contentsno }">
          <i class="bi bi-pencil-square"></i>
        </a>
        /
        <a href="javascript:del('${dto.contentsno }','${dto.filename}')">
          <i class="bi bi-trash"></i>
        </a>
    </td>
   </tr>
   </c:forEach>
   </c:otherwise>
   </c:choose>
 
   </tbody>
  
  </table>
  <div>
      ${paging}
  </div>
</div>
</body> 
</html> 
 