<%--
  Created by IntelliJ IDEA.
  User: chnbr
  Date: 2023-12-06
  Time: 오후 5:11
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<html>
<head>
    <script>
        function list(){
            let url  ="/notice/list";
            url +="?nowPage=${nowPage}";
            url +="&col=${col}";
            url +="&word=${word}";

            location.href=url;
        }


        function delete_url(noticeno){
            let url  ="/notice/delete";
            url +="?noticeno="+noticeno;

            if (confirm("정말 삭제하시겠습니까?")){
                location.href=url;
            }

        }
    </script>
    <style>
        body{
            font-family: 'Noto Sans KR', sans-serif;
        }
        .card-header{
            padding: 15px;
            font-size: 20px;
            font-weight: 700;
        }
        .textarea{
            margin: 30px;
        }
        .footer-buttons{
            margin-left: 5px;
        }
    </style>
</head>
<body>
<div class="container mt-5"  style="">
    <div class="card" style="width: 100%; margin-top: 150px;">
        <div class="card-header">
            ${dto.title}
        </div>
        <div class="textarea">${dto.content}</div>

        <div class="card-footer d-flex justify-content-between">
            <div >작성자 : ${dto.id} | 등록일 : ${dto.rdate} | 조회수 : ${dto.cnt}</div>

            <div>
            </div>
        </div>
        <div class="card-footer d-flex flex-row-reverse ">
                <c:if test="${sessionScope.grade == 'A'}">
                    <button class="btn btn-outline-dark footer-buttons" onclick="delete_url(${dto.noticeno})">삭제</button>
                    <button class="btn btn-outline-dark footer-buttons" data-bs-toggle="modal" data-bs-target="#updateModal" >수정</button>
                </c:if>
            <button class="btn btn-outline-dark footer-buttons" onclick="list()">목록</button>
        </div>
    </div>
</div>

<script type="text/javascript" defer src="${pageContext.request.contextPath}/ckeditor/ckeditor.js">     </script>
<script>
    $(function() {
        CKEDITOR.replace('content'); // <TEXTAREA>태그 id 값
    });
    function checkModal(f){
        if (f.title.value == ""){
            alert("제목을 입력하세요");
            f.title.focus()
            return false;
        }
        if (f.content.value == ""){
            alert("내용을 입력하세요");
            f.content.focus()
            return false;
        }
    }
</script>

<div class="modal" id="updateModal">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">
            <!-- Modal Header -->
            <div class="modal-header">
                <h4 class="modal-title">공지사항 수정</h4>
                <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
            </div>

            <!-- Modal body -->
            <div class="modal-body">
                <form action="/notice/update" method="post" id="update" onsubmit="return checkModal(this)">
                    <input type="hidden" name="noticeno" value="${dto.noticeno}">
                    <div class="modal-body-fir mb-3 d-flex justify-content-between">
                        <div class="input-group me-5">
                            <span class="input-group-text">제목</span>
                            <input type="text" class="form-control " value="${dto.title}" name="title">
                        </div>
                        <div class="input-group">
                            <span class="input-group-text">이름</span>
                            <input type="text" class="form-control" placeholder="id" name="id" value="${sessionScope.id}"  readonly>
                        </div>
                    </div>
                    <div class="mb-3 mt-3 " style="">
                        <label for="content">내용</label>
                        <div class="" style="height: auto">
                            <textarea class="form-control " rows="5" cols="3" id="content" name="content" style="height:500px">${dto.content}</textarea>
                        </div>
                    </div>
                </form>
            </div>
            <!-- Modal footer -->
            <div class="modal-footer">

                <div class="input-group d-flex flex-row-reverse">

                    <div>
                        <button type="submit" form="update" class="btn text-danger"><svg xmlns="http://www.w3.org/2000/svg"
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
