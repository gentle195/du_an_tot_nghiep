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
<form:form action="/khuyen-mai/add-khuyen-mai" method="post" modelAttribute="km">
    <table class="tb">
        <tr style="text-align: center">
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

                <%--            <thead>--%>
                <%--            <tr>--%>
                <%--                <th><form:label path="ngayCapNhat">Ngày cập nhật</form:label></th>--%>
                <%--                <th><form:input path="ngayCapNhat" type="date"></form:input></th>--%>
                <%--            </tr>--%>
                <%--            </thead>--%>
            <thead>
            <tr>
                <th><form:label path="ngayBatDau">Ngày bắt đầu</form:label></th>
                <th><form:input path="ngayBatDau" type="date"></form:input></th>
            </tr>
            </thead>

            <thead>
            <tr>
                <th><form:label path="ngayKetThuc">Ngày kết thúc:</form:label></th>
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
                <%--                    <form:radiobutton path="tinhTrang" label="Còn dùng" value="0"></form:radiobutton>--%>
                <%--                    <form:radiobutton path="tinhTrang" label="Không còn dùng" value="1"></form:radiobutton></th>--%>
                <%--            </tr>--%>
                <%--            </thead>--%>
            <thead>
            <tr>
                <th>
                    <form:label path="moTa">Mô tả</form:label></th>
                <th><form:textarea path="moTa"></form:textarea>
                    <form:errors path="moTa"></form:errors></th>

                <button type="submit" class="btn btn-primary">ADD</button>
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

        <th scope="col">Tên khuyến mãi</th>
        <th scope="col">Ngày tạo</th>

        <th scope="col">Ngày cập nhật</th>
        <th scope="col">Ngày bắt đầu</th>

        <th scope="col">Ngày kết thúc</th>
        <th scope="col">Loại giảm giá</th>

        <th scope="col">Hình thức giảm</th>
        <th scope="col">Số tiền giảm</th>

        <th scope="col">Tình trạng</th>
        <th scope="col">Mô tả</th>

        <th scope="col">Action</th>
    </tr>
    </thead>

    <c:forEach items="${duLieu}" var="khuyenMai" varStatus="i">
        <tbody>
        <tr>
            <td scope="row">${i.index+1}</td>
            <td>${khuyenMai.ma}</td>

            <td>${khuyenMai.ten}</td>
            <td>${khuyenMai.ngayTao}</td>

            <td>${khuyenMai.ngayCapNhat}</td>
            <td>${khuyenMai.ngayBatDau}</td>

            <td>${khuyenMai.ngayKetThuc}</td>
            <td>${khuyenMai.loaiGiamGia}</td>

            <td>${khuyenMai.hinhThucGiamGia}</td>
            <td>${khuyenMai.soTienGiam}</td>

            <td>${khuyenMai.trangThai()}</td>
            <td>${khuyenMai.moTa}</td>


            <td>
                <a href="/khuyen-mai/view-update-khuyen-mai/${khuyenMai.id}"  onclick="return tb()">Update</a>
                <a href="/khuyen-mai/remove-khuyen-mai/${khuyenMai.id}"  onclick="return tb()">Delete</a>
            </td>
        </tr>
        </tbody>

    </c:forEach>

</table>
</table>
<nav aria-label="...">
    <ul class="pagination">
        <li class="page-item">
            <a class="page-link" href="/khuyen-mai/hien-thi?num=0">Previous</a>
        </li>

        <c:forEach begin="1" end="${tongSoTrang}" varStatus="STT">
            <li class="page-item"><a class="page-link" href="/khuyen-mai/hien-thi?num=${STT.index-1}">${STT.index}</a>
            </li>
        </c:forEach>

        <li class="page-item">

            <a class="page-link" href="/khuyen-mai/hien-thi?num=${tongSoTrang-1}">Next</a>
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
    function tbxd() {
        if (confirm("Bạn muốn dùng chức năng") == true) {
            return true;
        }
        return false;
    }
</script>

</body>

</html>