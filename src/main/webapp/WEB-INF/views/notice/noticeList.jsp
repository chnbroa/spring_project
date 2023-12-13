<%--
  Created by IntelliJ IDEA.
  User: chnbr
  Date: 2023-08-14
  Time: 오후 5:16
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<html>
<head>
    <style>
        body{
            font-family: 'Noto Sans KR', sans-serif;
        }
        .notice-title-a{
            text-decoration: none;
            color: black;
        }
    </style>
    <script>
        function read(noticeno){
            let url = "/notice/read";
            url +="?nowPage=${nowPage}";
            url +="&col=${col}";
            url +="&word=${word}";
            url +="&noticeno="+noticeno;
            location.href=url;
        }

    </script>
</head>
</head>
<body>
<div class="container mt-5">
    <div class="d-flex justify-content-between align-items-center" style="margin-top: 150px">
        <div>
            <h2>공지사항</h2>
        </div>
        <form action="/notice/list" class="d-flex">
            <div class="row">
                <div class='col'>
                    <select class="form-select" name="col">
                        <option
                                <c:if test="${col == 'id'}">
                                    selected
                                </c:if>
                                value="id">id</option>
                        <option
                                <c:if test="${col == 'title'}">
                                    selected
                                </c:if>
                                value="title">제목</option>
                        <option
                                <c:if test="${col == 'content'}">
                                    selected
                                </c:if>
                                value="content">내용</option>
                        <option
                                <c:if test="${col == 'title_content'}">
                                    selected
                                </c:if>
                                value="title_content" >제목+내용</option>
                        <option
                                <c:if test="${col == 'total'}">
                                    selected
                                 </c:if>
                                value="total" >전체출력</option>
                    </select>
                </div>
                <div class="col">
                    <input type="search" class="form-control" name="word" required="required" value="${word}">

                </div>
                <div class='col'>
                    <button type="submit" class="btn btn-dark">검색</button>
                    <c:if test="${sessionScope.grade == 'A'}">
                        <button type="button" class="btn btn-dark" data-bs-toggle="modal" data-bs-target="#myModal">등록</button>
                    </c:if>

                </div>
            </div>

        </form>
    </div>

    <div class="container mt-5 ">
        <!-- <h2>게시판</h2> -->

        <table class="table table-hover">
            <!--<table class="table table-striped table-hover">-->

            <thead>
            <tr>
                <th>번호</th>
                <th>제목</th>
                <th>작성자</th>
                <th>날짜</th>
                <th>조회수</th>
            </tr>
            </thead>

            <tbody class="contents "  >

            <c:forEach var="dto" items="${list}" varStatus="status">

                <c:choose>
                    <c:when test="${empty dto}">
                        <tr> <td colspan="5"> 등록된 공지가 없습니다. </td></tr>
                    </c:when>
                    <c:otherwise>
                        <tr>
                        <td> ${fn:length(list) - status.index}</td>

                        <td>    <a class="notice-title-a" href="javascript:read(${dto.noticeno})">${dto.title}</a>
                        </td>
                        <td> ${dto.id}</td>
                        <td> ${dto.rdate}</td>
                        <td> ${dto.cnt}</td>
                        </tr>
                    </c:otherwise>
                </c:choose>
            </c:forEach>
            </tbody>
        </table>
        ${paging}
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

<!-- 공지사항 생성 부분  -->
<div class="modal" id="myModal">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">
            <!-- Modal Header -->
            <div class="modal-header">
                <h4 class="modal-title">공지사항 생성</h4>
                <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
            </div>

            <!-- Modal body -->
            <div class="modal-body">
                <form action="/notice/create" method="post" id="create" onsubmit="return checkModal(this)">
                    <div class="modal-body-fir mb-3 d-flex justify-content-between">
                        <div class="input-group me-5">
                            <span class="input-group-text">제목</span>
                            <input type="text" class="form-control " placeholder="title" name="title">
                        </div>
                        <div class="input-group">
                            <span class="input-group-text">이름</span>
                            <input type="text" class="form-control" placeholder="id" name="id" value="${sessionScope.id}"  readonly>
                        </div>
                    </div>

                    <div class="mb-3 mt-3 " style="">
                        <label for="content">내용</label>
                        <div class="" style="height: auto">
                            <textarea class="form-control " rows="5" cols="3" id="content" name="content" style="height:500px"></textarea>
                        </div>
                    </div>
                </form>
            </div>
            <!-- Modal footer -->
            <div class="modal-footer">

                <div class="input-group d-flex flex-row-reverse">

                    <div>
                        <button type="submit" form="create" class="btn text-danger"><svg xmlns="http://www.w3.org/2000/svg"
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
