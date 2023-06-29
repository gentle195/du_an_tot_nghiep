<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!doctype html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Bootstrap demo</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD" crossorigin="anonymous">
</head>
<body>
<h3 style="color: red; text-align: center"><b>Pin</b></h3>
<hr>
<form:form action="/dung-luong-pin/update-dung-luong-pin/${DungLuongPin.id}" method="post" modelAttribute="DungLuongPin">
    <div class="row">
        <div class="col">
            <form:label path="ma"><b>Mã:</b></form:label>
            <form:input path="ma" class="form-control"></form:input>
        </div>
        <div class="col">
            <form:label path="thongSo"><b>Thông số:</b></form:label>
            <form:input path="thongSo" class="form-control"></form:input>
        </div>

        <div class="col">
            <form:label path="ngayTao"><b>Ngày Tạo:</b></form:label>
            <form:input path="ngayTao" class="form-control" type="date"></form:input>
        </div>

        <div class="col">
            <form:label path="ngayCapNhat"><b>Ngày Cập nhật:</b></form:label>
            <form:input path="ngayCapNhat" class="form-control" type="date"></form:input>
        </div>

        <div class="col">
            <form:label path="tinhTrang"><b>Tình Trạng:</b></form:label>
            <form:input path="tinhTrang" class="form-control"></form:input>
        </div>
        <div class="col">
            <form:label path="moTa"><b>Mô Tả:</b></form:label>
            <form:input path="moTa" class="form-control"></form:input>
        </div>

        <div>
            <button type="submit" class="btn btn-primary">SAVE</button>
        </div>
    </div>
</form:form>
<%--<nav aria-label="Page navigation example">--%>
<%--    <ul class="pagination justify-content-center pagination-lg">--%>
<%--        <li class="page-item"><a class="page-link" href="/dung-luon-ping/hien-thi?pageNum=0">First</a></li>--%>
<%--        <c:forEach begin="1" end="${total}" varStatus="status">--%>
<%--            <li class="page-item">--%>
<%--                <a href="${pageContext.request.contextPath}/dung-luon-ping/hien-thi?pageNum=${status.index -1}"--%>
<%--                   class="page-link">${status.index}</a>--%>
<%--            </li>--%>
<%--        </c:forEach>--%>
<%--        <li class="page-item"><a class="page-link" href="/dung-luon-ping/hien-thi?pageNum=${total-1}">Last</a></li>--%>
<%--    </ul>--%>
<%--</nav>--%>
</body>
</html>