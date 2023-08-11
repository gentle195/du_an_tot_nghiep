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
<form:form action="/chip/update-chip/${Chip.id}" method="post" modelAttribute="Chip">
    <div class="row">
        <div class="col" style="display: none">
            <form:label path="ma"><b>Mã:</b></form:label>
            <form:input path="ma" class="form-control"></form:input>

        </div>
        <div class="col">
            <form:label path="ten"><b>Tên:</b></form:label>
            <form:input path="ten" class="form-control"></form:input>
            <form:errors path="ten"></form:errors>
        </div>
        <div class="col">
            <form:label path="loaiChip"><b>Loại Chip:</b></form:label>
            <form:input path="loaiChip" class="form-control"></form:input>
            <form:errors path="loaiChip"></form:errors>
        </div>
        <div class="col">
            <form:label path="soNhan"><b>Số nhân:</b></form:label>
            <form:input path="soNhan" class="form-control" type="number"></form:input>
            <form:errors path="soNhan"></form:errors>
        </div>
        <div class="col">
            <form:label path="tinhTrang"><b>Tình Trạng:</b></form:label>
            <br>
            <form:radiobutton path="tinhTrang" label="Thế hệ mới" value="0"></form:radiobutton>
            <form:radiobutton path="tinhTrang" label="thế hệ cũ" value="1"></form:radiobutton>
        </div>
        <div class="col" style="display: none">
            <form:label path="ngayTao"><b>Ngày Tạo:</b></form:label>
            <form:input path="ngayTao" class="form-control" type="date"></form:input>
        </div>
        <div class="col">
            <form:label path="moTa"><b>Mô Tả:</b></form:label>
            <form:textarea path="moTa" class="form-control"></form:textarea>
            <form:errors path="moTa"></form:errors>
        </div>
        <div style="margin-top: 20px; margin-bottom: 20px">
            <button type="submit" class="btn btn-primary"
                    onclick="if(!(confirm('Bạn có muốn thực hiện thao tác này không ? ')))return false;">SAVE
            </button>
        </div>
    </div>
</form:form>
</body>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.13/js/select2.min.js"></script>
</html>