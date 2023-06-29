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
<form:form action="/mau-sac/add-mau-sac" method="post" modelAttribute="ms">
    <table class="tb">
        <tr style="text-align: center">
            <thead>
            <tr>
                <th><form:label path="ma">Mã màu : </form:label></th>
                <th><form:input path="ma"></form:input></th>
            </tr>
            </thead>
            <thead>
            <tr>
                <th><form:label path="ten">Tên màu : </form:label></th>
                <th><form:input path="ten"></form:input></th>
            </tr>
            </thead>
            <thead>
            <tr>
                <th>
                    <form:label path="ngayTao">Ngày tạo </form:label>
                <th><form:input path="ngayTao" type="date"></form:input></th>
            </tr>
            </thead>

            <thead>
            <tr>
                <th><form:label path="ngayCapNhat">Ngày cập nhật</form:label></th>
                <th><form:input path="ngayCapNhat" type="date"></form:input></th>
            </tr>
            </thead>

            <thead>
            <tr>
                <th><form:label path="tinhTrang">Tình trạng</form:label></th>
                <th><form:radiobutton path="tinhTrang" label="Không hoạt động" value="0"></form:radiobutton>
                    <form:radiobutton path="tinhTrang" label="Còn hoạt động" value="1"></form:radiobutton>
                </th>

            </tr>
            </thead>
            <thead>

            <tr>
                <th>
                    <form:label path="moTa">Mô tả</form:label></th>
                <th><form:textarea path="moTa"></form:textarea></th>
            </tr>
            </thead>

            <thead>
            <tr>
                <button type="submit" class="btn btn-primary">
                    Thêm màu sắc
                </button>
            </tr>
            </thead>
        </tr>
    </table>
</form:form>


<br>
<br>

<table class="table">
    <thead>
    <tr>
        <th scope="col">#</th>
        <th scope="col">Mã</th>
        <th scope="col">Tên màu</th>
        <th scope="col">Ngày tạo</th>
        <th scope="col">Ngày cập nhật</th>
        <th scope="col">Tình trạng</th>
        <th scope="col">Mô tả</th>

        <th scope="col">Action</th>
    </tr>
    </thead>


    <c:forEach items="${duLieu}" var="mauSac" varStatus="i">
        <tbody>
        <tr>
            <th scope="row">${i.index+1}</th>
            <td>${mauSac.ma}</td>
            <td>${mauSac.ten}</td>
            <td>${mauSac.ngayTao}</td>
            <td>${mauSac.ngayCapNhat}</td>
            <td>${mauSac.tinhTrang()}</td>
            <td>${mauSac.moTa}</td>


            <td>
                <a href="/mau-sac/view-update-mau-sac/${mauSac.id}" class="btn btn-success">Update</a>
                <a href="/mau-sac/remove-mau-sac/${mauSac.id}" class="btn btn-success">Delete</a>
            </td>
        </tr>
        </tbody>
    </c:forEach>

</table>

</body>

</html>