<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!doctype html>
<html lang="en">
<head>
    <title>Title</title>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD" crossorigin="anonymous">

</head>
<body>
<form:form action="/khuyen-mai/update-khuyen-mai" method="post" modelAttribute="km">
    <table class="tb">
        <tr style="text-align: center">
            <thead>
            <tr>
                <th style="display: none">
                    <form:input path="id"></form:input>
                </th>

            </thead>
            <thead>
            <tr>

                <th>
                    <form:label path="ma">Mã khuyến mãi : </form:label></th>
                <th><form:input path="ma" readonly="true"></form:input></th>
            </tr>
            </thead>
            <thead>
            <tr>
                <th>
                    <form:label path="ten">Tên khuyến mãi: </form:label></th>
                <th><form:input path="ten"></form:input>
                    <form:errors path="ten"></form:errors>
                </th>
            </tr>
            </thead>
                <%--            <thead>--%>
                <%--            <tr>--%>
                <%--                <th><form:label path="ngayTao">Ngày tạo </form:label></th>--%>
                <%--                <th><form:input path="ngayTao" type="date"></form:input></th>--%>
                <%--            </tr>--%>
                <%--            </thead>--%>
            <thead>
            <tr style="display: none">
                <th><form:label path="ngayCapNhat">Ngày cập nhật</form:label></th>
                <th><form:input path="ngayCapNhat" type="date"></form:input></th>
            </tr>
            </thead>
            <thead>
            <tr>
                <th><form:label path="ngayBatDau">Ngày bắt đầu</form:label></th>
                <th><form:input path="ngayBatDau" type="date"></form:input></th>
            </tr>
            </thead>
            <thead>
            <tr>
                <th><form:label path="ngayKetThuc">Ngày kết thúc</form:label></th>
                <th><form:input path="ngayKetThuc" type="date"></form:input></th>
            </tr>
            </thead>
            <thead>
            <tr>
                <th><form:label path="loaiGiamGia">Loại giảm giá : </form:label></th>
                <th><form:input path="loaiGiamGia"></form:input>
                    <form:errors path="loaiGiamGia"></form:errors></th>

            </tr>
            </thead>
            <thead>
            <tr>

                <th><form:label path="hinhThucGiamGia">Hình thức giảm giá : </form:label></th>
                <th><form:input path="hinhThucGiamGia"></form:input>
                    <form:errors path="hinhThucGiamGia"></form:errors></th>

            </tr>
            </thead>
            <thead>
            <tr>
                <th><form:label path="soTienGiam">So tien giam : </form:label></th>
                <th><form:input path="soTienGiam"></form:input>
                    <form:errors path="soTienGiam"></form:errors></th>
            </tr>
            </thead>
                <%--            <thead>--%>
                <%--            <tr>--%>
                <%--                <th><form:label path="tinhTrang">Tình trạng</form:label></th>--%>
                <%--                <th>--%>
                <%--                    <form:radiobutton path="tinhTrang" label="Không hoạt động" value="0"></form:radiobutton>--%>
                <%--                    <form:radiobutton path="tinhTrang" label="Còn hoạt động" value="1"></form:radiobutton></th>--%>

                <%--            </tr>--%>
                <%--            </thead>--%>
            <thead>
            <tr>
                <th>
                    <form:label path="moTa">Mô tả</form:label></th>
                <th><form:textarea path="moTa"></form:textarea>
                    <form:errors path="moTa"></form:errors></th>
            </tr>
            </thead>
        <tr>
            <button type="submit" class="btn btn-primary">UPDATE</button>
        </tr>

        </tr>
    </table>
</form:form>
</body>

</html>