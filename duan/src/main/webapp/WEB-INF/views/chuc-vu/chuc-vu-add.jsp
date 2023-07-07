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
    <form:form method="post" class="container" action="/chuc-vu/add" modelAttribute="chucVu">
        <div class="row">
<%--            <div class="col">--%>
<%--                <div class="form-floating mb-3 mt-3">--%>
<%--                    <form:input class="form-control" placeholder="" path="ma"/>--%>
<%--                    <form:label class="form-label" path="ma">Mã:</form:label>--%>
<%--                    <form:errors path="ma" cssStyle="color: red"></form:errors>--%>
<%--                </div>--%>
<%--                <div class="form-floating mb-3 mt-3">--%>
<%--                    <form:input class="form-control" type="date" value="chucVu.ngayTao" placeholder="" path="ngayTao"/>--%>
<%--                    <form:label class="form-label" path="ngayTao">Ngày Tạo:</form:label>--%>
<%--                    <form:errors path="ngayTao" cssStyle="color: red"></form:errors>--%>
<%--                </div>--%>
<%--                <div class="form-floating mb-3 mt-3">--%>
<%--                    <form:input class="form-control" type="date" value="chucVu.ngayCapNhat" placeholder=""--%>
<%--                                path="ngayCapNhat"/>--%>
<%--                    <form:label class="form-label" path="ngayCapNhat">Ngày Cập Nhật:</form:label>--%>
<%--                    <form:errors path="ngayCapNhat" cssStyle="color: red"></form:errors>--%>
<%--                </div>--%>
<%--            </div>--%>
            <div class="col">
                <div class="form-floating mb-3 mt-3">
                    <form:input class="form-control" placeholder="" path="ten"/>
                    <form:label class="form-label" path="ten">Tên:</form:label>
                    <form:errors path="ten" cssStyle="color: red"></form:errors>
                </div>
                <div class="form-check mb-3 mt-3">
                    <form:label class="form-label" path="tinhTrang">Tình trạng:</form:label>
                    <form:radiobutton path="tinhTrang" value="0"/>Không hoạt động
                    <form:radiobutton path="tinhTrang" value="1" checked="true"/>Hoạt động
                    <form:errors path="tinhTrang" cssStyle="color: red"></form:errors>
                </div>
                <div class="form-floating mb-3 mt-3">
                    <form:input class="form-control" placeholder="" path="moTa"/>
                    <form:label class="form-label" path="moTa">Mô tả:</form:label>
                    <form:errors path="moTa" cssStyle="color: red"></form:errors>
                </div>
            </div>
        </div>
        <form:button type="submit" class="btn btn-primary"
                     onclick="if(!(confirm('Bạn có muốn thực hiện thao tác này không ? ')))return false;else alert('Thành công')">Add</form:button>
    </form:form>
</div>
</body>
</html>