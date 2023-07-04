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

<form:form action="/ram/add-ram" method="post" modelAttribute="r">
    <table class="tb">
        <tr style="text-align: center">
            <thead>
            <tr>

                <th><form:label path="ma">Mã ram : </form:label></th>
                <th><form:input path="ma" readonly="true"></form:input></th>
            </tr>
            </thead>
            <thead>
            <tr>
                <th><form:label path="dungLuong">Dung lượng: </form:label></th>
                <th><form:input path="dungLuong"></form:input>
                    <form:errors path="dungLuong"></form:errors>
                </th>

            <thead>
            <tr style="display: none">
                <th><form:label path="ngayTao">Ngày tạo </form:label></th>
                <th><form:input path="ngayTao" type="date"></form:input></th>
            </tr>
            </thead>
                <%--            <thead>--%>
                <%--            <tr>--%>
                <%--                <th>  <form:label path="ngayCapNhat">Ngày cập nhật</form:label></th>--%>
                <%--                <th> <form:input path="ngayCapNhat" type="date"></form:input></th>--%>
                <%--            </tr>--%>
                <%--            </thead>--%>
                <%--            <thead>--%>
                <%--            <tr>--%>
                <%--                <th> <form:label path="tinhTrang">Tình trạng</form:label></th>--%>
                <%--                <th>        <form:radiobutton path="tinhTrang" label="Còn dùng" value="0"></form:radiobutton>--%>
                <%--                    <form:radiobutton path="tinhTrang" label="Không còn dùng" value="1"></form:radiobutton></th></th>--%>
                <%--            </tr>--%>
                <%--            </thead>--%>

            <thead>
            <tr>
                <th><form:label path="moTa">Mô tả</form:label></th>
                <th><form:textarea path="moTa"></form:textarea>
                    <form:errors path="moTa"></form:errors></th>


            </tr>
            </thead>
            <thead>
            <tr>
                <button type="submit" class="btn btn-primary" onclick="return tb()">ADD</button>
            </tr>
            </thead>
        </tr>
    </table>
</form:form>

<table class="table">
    <thead>
    <tr>
        <th scope="col">#</th>
        <th scope="col">Mã</th>
        <th scope="col">Dung lượng</th>
        <th scope="col">Ngày tạo</th>
        <th scope="col">Ngày cập nhật</th>
        <th scope="col">Tình trạng</th>
        <th scope="col">Mô tả</th>

        <th scope="col">Action</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach items="${duLieu}" var="ram" varStatus="i">
        <tr>
            <th scope="row">${i.index+1}</th>
            <td>${ram.ma}</td>
            <td>${ram.dungLuong}</td>
            <td>${ram.ngayTao}</td>
            <td>${ram.ngayCapNhat}</td>
            <td>${ram.trangThai()}</td>
            <td>${ram.moTa}</td>


            <td>
                <a href="/ram/view-update-ram/${ram.id}" onclick="return tb()">Update</a>
                <a href="/ram/remove-ram/${ram.id}" onclick="return tb()">Delete</a>
            </td>
        </tr>
    </c:forEach>
    </tbody>
</table>
</table>
<nav aria-label="...">
    <ul class="pagination">
        <li class="page-item">
            <a class="page-link" href="/ram/hien-thi?num=0">Previous</a>
        </li>

        <c:forEach begin="1" end="${tongSoTrang}" varStatus="STT">
            <li class="page-item"><a class="page-link" href="/ram/hien-thi?num=${STT.index-1}">${STT.index}</a>
            </li>
        </c:forEach>

        <li class="page-item">

            <a class="page-link" href="/ram/hien-thi?num=${tongSoTrang-1}">Next</a>
        </li>
    </ul>
</nav>


<P id="bc" style="color: crimson"></P>
<script>
    if ("${DLtable}" <= 0) {
        document.getElementById("bang").style.display = "none"
        document.getElementById("bc").innerText = "HẾT DỮ LIỆU"
    } else {
        document.getElementById("bang").style.display = ""
        document.getElementById("bc").innerText = ""
    }

    function tb() {
        var dtt = document.getElementById("dtt").value;
        if (confirm("Bạn muốn dùng chức năng") == true) {
            return true;
        }
        return false;
    }

</script>

</body>

</html>