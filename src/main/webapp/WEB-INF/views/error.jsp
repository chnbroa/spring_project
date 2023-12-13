<%@ page contentType="text/html; charset=utf-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <title>Error</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"></script>
</head>

<body>
<div class="d-flex align-items-center justify-content-center vh-100">
  <div class="text-center">
    <h1 class="display-1 fw-bold">404</h1>
    <p class="fs-3"> <span class="text-danger">Opps!</span> Page not found.</p>
    <p class="lead">
      고객님이 찾고 계시는 페이지가
      삭제 되었거나, 이름이 변경되었거나,
      일시적인 오류로 표시할 수 없습니다.
    </p>
    <a href="/" class="btn btn-primary">메인 페이지로 가기</a>
    <a href="javascript:history.back();" class="btn btn-primary">이전 페이지로 돌아가기</a>
  </div>
</div>
</body>
</html>