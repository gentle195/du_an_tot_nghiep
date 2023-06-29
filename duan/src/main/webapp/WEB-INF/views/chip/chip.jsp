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
<form:form action="/chip/add-chip" method="post" modelAttribute="Chip">
    <div class="row">
        <div class="col">
            <form:label path="ma"><b>Mã:</b></form:label>
            <form:input path="ma" class="form-control"></form:input>
        </div>
        <div class="col">
            <form:label path="ten"><b>Tên:</b></form:label>
            <form:input path="ten" class="form-control"></form:input>
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
            <form:radiobutton path="tinhTrang" label="Yes" value="0"></form:radiobutton>
            <form:radiobutton path="tinhTrang" label="No" value="1"></form:radiobutton>
        </div>
        <div class="col">
            <form:label path="moTa"><b>Mô Tả:</b></form:label>
            <form:input path="moTa" class="form-control"></form:input>
        </div>
        <div>
            <button type="submit" class="btn btn-primary">ADD</button>
        </div>
    </div>

</form:form>
<form action="">
    <table class="table table-bordered border-dark">
        <tr style="text-align: center">
            <th scope="col">Mã</th>
            <th scope="col">Loại Pin</th>
            <th scope="col">Ngày Tạo</th>
            <th scope="col">Ngày Cập Nhật</th>
            <th scope="col">Tình Trạng</th>
            <th scope="col">Mô Tả</th>
        </tr>
        <c:forEach items="${list}" var="chip">
            <tr>
                <td>${chip.ma}</td>
                <td>${chip.ten}</td>
                <td>${chip.ngayTao}</td>
                <td>${chip.ngayCapNhat}</td>
                <td>
                    <c:if test="${chip.tinhTrang == 0}">Yes</c:if>
                    <c:if test="${chip.tinhTrang == 1}">No</c:if>
                </td>
                <td>${chip.moTa}</td>
                <td>
                    <a href="/chip/detail-chip/${chip.id}" class="btn btn-outline-primary" tabindex="-1"
                       role="button">Detail</a>
                    <a href="/chip/remove-chip/${chip.id}" class="btn btn-outline-primary" tabindex="-1"
                       role="button">Delete</a>
                    <a href="/chip/view-update-chip/${chip.id}" class="btn btn-outline-primary" tabindex="-1"
                       role="button">Update</a>
                </td>
            </tr>
        </c:forEach>
    </table>
</form>
</body>
</html>