<%@ page contentType="text/html; charset=UTF-8" %> 
<!DOCTYPE html>
<html>
<head>
  <title>이미지 수정</title>
  <meta charset="utf-8">
  <style>
    body{
      font-family: 'Noto Sans KR', sans-serif;
    }
  </style>
</head>
<body>
 
<div class="container mt-5" style="margin-top: 150px;">
 
<h3>이미지 수정</h3>
  <form 
        action="/member/updateFile"
        method="post"
        enctype="multipart/form-data"
        >   
    <input type="hidden" name="oldfile" value="${param.fname}">
    <input type="hidden" name="id" value="${sessionScope.id}">
        
    <div class="mb-3 mt-3">
      <label for="oldfile">원본파일</label>
      <div class="col-sm-6">
        <img src="/member/storage/${param.fname}"
        class="img-rounded" width="200px" height="200px" id="oldfile">
      </div>
    </div>
    <div class="mb-3 mt-3">
      <label for="fname">변경파일</label>
      <div class="col-sm-6">          
        <input type="file" class="form-control" id="fname"
        name="fname" accept=".jpg,.png,.gif" required="required">
      </div>
    </div>
        <button type="submit" class="btn btn-danger">수정</button>
        <button type="button" class="btn btn-dark" 
        onclick="history.back()">취소</button>
 
  </form>
</div>
</body>
</html>