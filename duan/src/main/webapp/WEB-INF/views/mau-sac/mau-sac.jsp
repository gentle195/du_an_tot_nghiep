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
                <th><form:input path="ma" readonly="true"></form:input></th>
            </tr>
            </thead>
            <thead>
            <tr>
                <th><form:label path="ten">Tên màu : </form:label></th>
                <th><form:input path="ten"></form:input>
                    <form:errors path="ten"></form:errors>
                </th>
            </tr>
            </thead>
        <tr>
            <th>
                <form:label path="moTa">Mô tả</form:label></th>
            <th><form:textarea path="moTa"></form:textarea>
                <form:errors path="moTa"></form:errors></th>
        </tr>
        </thead>

        <thead>
        <tr>

            <button type="submit" class="btn btn-primary" onclick="validateForm()">Thêm màu sắc</button>
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
            <td>${mauSac.trangThai()}</td>
            <td>${mauSac.moTa}</td>


            <td>
                <a href="/mau-sac/view-update-mau-sac/${mauSac.id}" class="btn btn-success">Update</a>
                <a href="/mau-sac/remove-mau-sac/${mauSac.id}" class="btn btn-success">Delete</a>
            </td>
        </tr>
        </tbody>
    </c:forEach>
</table>

<nav aria-label="...">
    <ul class="pagination">
        <li class="page-item">
            <a class="page-link" href="/mau-sac/hien-thi?num=0">Previous</a>
        </li>

        <c:forEach begin="1" end="${tongSoTrang}" varStatus="STT">
            <li class="page-item"><a class="page-link" href="/mau-sac/hien-thi?num=${STT.index-1}">${STT.index}</a>
            </li>
        </c:forEach>

        <li class="page-item">

            <a class="page-link" href="/mau-sac/hien-thi?num=${tongSoTrang-1}">Next</a>
        </li>
    </ul>
</nav>

<script>
    function validateForm() {
        var tenValue = document.querySelector('input[name="ten"]').value;
        var moTaValue = document.querySelector('textarea[name="moTa"]').value;

        if (tenValue.trim() === '') {
            alert('Vui lòng không để trống trường Tên màu');
            return false;
        }

        if (moTaValue.trim() === '') {
            alert('Vui lòng không để trống trường Mô tả');
            return false;
        }
    }
</script>

</body>

</html>