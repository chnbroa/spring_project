<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>

  <title>로그인 처리</title>
  <meta charset="utf-8">
  <script type="text/javascript">

      function find_id()
      {
          let name = document.querySelector("#id_first").value;
          let email = document.querySelector("#id_second").value;
          let result = document.querySelector(".id_result");
          if(name == "" || email == "")
          {
              result.innerText = "이름과 이메일을 입력해주세요.";
              return;
          }
          let url = "/member/findid/?name="+name+"&email="+email;

          fetch(url,{
              method: "POST",
              headers: {
                  "Content-Type": "application/json",
              }})
              .then((response) => response.json())
              .then((data) =>  result.innerText = data.str);


      }
      function find_pw()
      {
          let pwname = document.querySelector("#pw_first").value;
          let id = document.querySelector("#pw_second").value;

          let result = document.querySelector(".pw_result");
          if(pwname == "" || id == "")
          {
              result.innerText = "이름과 이메일을 입력해주세요.";
              return;
          }
          let url = "/member/findpw/?name="+pwname+"&id="+id;

          fetch(url,{
              method: "POST",
              headers: {
                  "Content-Type": "application/json",
              }})
              .then((response) => response.json())
              .then((data) =>  result.innerText = data.str);
      }

  </script>

    <style>
        .card-box{
            margin-top: 100px;
        }
        body{
            font-family: 'Noto Sans KR', sans-serif;
        }
    </style>
</head>

<body>

<div class=" container py-4 h-100">
    <div class="card-box row d-flex justify-content-center align-items-center h-100">
        <div class="col-12 col-md-8 col-lg-5 col-xl-7">
            <div class="card shadow-2-strong" style="border-radius: 1rem;">
                <div class="card-body p-5 text-center">

                    <h2 class="mb-5" style="font-weight: 600;">로그인</h2>

                    <form
                            action="/member/login"
                            method="post"
                            id ="loginform">
                        <input type="hidden" name="contentsno" value="${param.contentsno}">
                        <input type="hidden" name="cateno" value="${param.cateno}">
                        <input type="hidden" name="nowPage" value="${param.nowPage}">
                        <input type="hidden" name="col" value="${param.col}">
                        <input type="hidden" name="word" value="${param.word}">

                    <div class="form-outline mb-4">
                        <input type="text" class="form-control  form-control-lg" id="id"
                               placeholder="이메일" name="id" required="required"
                               value='${c_id_val}'>

                    </div>

                    <div class="form-outline mb-4">
                        <input type="password" class="form-control  form-control-lg" id="pwd"
                               placeholder="비밀번호" name="passwd" required="required" >

                    </div>

                    <!-- Checkbox -->
                    <div class="form-check d-flex justify-content-start mb-4">
                        <label class="form-check-label">
                            <c:choose>
                                <c:when test="${c_id =='Y'}">
                                    <input class="form-check-input" type="checkbox" name="c_id" value="Y" checked="checked"> 아이디저장
                                </c:when>
                                <c:otherwise>
                                    <input class="form-check-input" type="checkbox" name="c_id" value="Y" > 아이디저장
                                </c:otherwise>
                            </c:choose>
                        </label>
                    </div>

                    <button class="btn btn-lg btn-danger" type="submit" >로그인</button>
                    </form>

                    <hr class="my-4">

                    <button type="button" data-bs-toggle="collapse" data-bs-target="#find_ID"  class="btn btn-light">아이디 찾기</button>
                    <button type="button" data-bs-toggle="collapse" data-bs-target="#find_PW" class="btn btn-light">비밀번호 찾기</button>
                    <button type="button" class="btn btn-light" onclick="location.href='/member/create'">회원가입</button>
                    <%--ID 찾기 --%>
                    <div id="find_ID" class="collapse mt-3">
                        <div class="row">
                            <div class="col-sm-5">
                                <input type="text" class="form-control" placeholder="Enter name" id="id_first">
                            </div>
                            <div class="col-sm-5">
                                <input type="email" class="form-control" placeholder="Enter email" id="id_second">
                            </div>
                            <div class="col-sm-2">
                                <button type="button" class="btn btn-outline-dark"  style="--bs-btn-padding-y: .25rem; --bs-btn-padding-x: .5rem;" onclick="find_id()">찾기</button>
                            </div>
                            <div class="id_result"></div>
                        </div>
                    </div>
                    <%--PW 찾기 --%>
                    <div id="find_PW" class="collapse mt-3">
                        <div class="row">
                            <div class="col-sm-5">
                                <input type="text" class="form-control" placeholder="Enter name" id="pw_first">
                            </div>
                            <div class="col-sm-5">
                                <input type="email" class="form-control" placeholder="Enter id" id="pw_second">
                            </div>
                            <div class="col-sm-2">
                                <button type="button" class="btn btn-outline-dark"  style="--bs-btn-padding-y: .25rem; --bs-btn-padding-x: .5rem;" onclick="find_pw()">찾기</button>
                            </div>
                            <div class="pw_result"></div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

</div>
</body>
</html>
