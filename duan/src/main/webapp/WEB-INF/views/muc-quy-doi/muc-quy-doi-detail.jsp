<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<html>
<head>
    <title>Chức vụ</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://getbootstrap.com/docs/5.3/assets/css/docs.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</head>
<body>
<div class="container">
    <form:form method="post" class="container" action="/muc-quy-doi/update/${mucQuyDoi.id}" modelAttribute="mucQuyDoi">
        <div class="row">
            <div class="col">
                <div class="form-floating mb-3 mt-3">
                    <form:input class="form-control" placeholder="" path="soDiem"/>
                    <form:label class="form-label" path="soDiem">Số Điểm:</form:label>
                </div>
                <div class="form-floating mb-3 mt-3">
                    <form:input class="form-control" type="date" value="${mucQuyDoi.ngayTao}" placeholder="" path="ngayTao"/>
                    <form:label class="form-label" path="ngayTao">Ngày Tạo:</form:label>
                </div>
                <div class="form-check mb-3 mt-3">
                    <form:label class="form-label" path="tinhTrang">Tình Trạng:</form:label>
                    <form:radiobutton path="tinhTrang" value="0"/>Không hoạt động
                    <form:radiobutton path="tinhTrang" value="1"/>Hoạt động
                </div>
            </div>
            <div class="col">
                <div class="form-floating mb-3 mt-3">
                    <form:input class="form-control" placeholder="" path="soTien"/>
                    <form:label class="form-label" path="soTien">Số Tiền:</form:label>
                </div>
                <div class="form-floating mb-3 mt-3">
                    <form:input class="form-control" placeholder="" path="ghiChu"/>
                    <form:label class="form-label" path="ghiChu">Ghi Chú:</form:label>
                </div>
            </div>
        </div>
        <form:button type="submit" class="btn btn-primary"
                     onclick="if(!(confirm('Bạn có muốn thực hiện thao tác này không ? ')))return false;else alert('Thành công')">Update</form:button>
    </form:form>
</div>
</body>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.13/js/select2.min.js"></script>
</html>