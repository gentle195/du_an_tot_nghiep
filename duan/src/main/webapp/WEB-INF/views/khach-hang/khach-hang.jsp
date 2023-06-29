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


<br>

<form:form action="/khach-hang/add" method="post" modelAttribute="kh">
    <table class="table">
        <thead>
        <tr>

            <th scope="col">MA</th>
            <th scope="col">HO TEN</th>
            <th scope="col">GIOI TINH</th>
            <th scope="col">EMAIL</th>


        </tr>
        </thead>
        <thead>
        <tr>
            <th scope="col">
                <form:input path="ma"></form:input>
            </th>

            <th scope="col">
                <form:input path="hoTen"></form:input>
            </th>


            <th scope="col">
                <form:radiobutton path="gioiTinh" label="nam" value="true"></form:radiobutton><br>
                <form:radiobutton path="gioiTinh" label="nu" value="false"></form:radiobutton>
            </th>
            <th scope="col">
                <form:input path="email"></form:input>
            </th>
        </tr>
        </thead>


        <thead>
        <tr>

            <th scope="col">SDT</th>
            <th scope="col">NGAY SINH</th>
            <th scope="col">TAI KHOAN</th>
            <th scope="col">MAT KHAU</th>


        </tr>
        </thead>
        <thead>
        <tr>


            <th scope="col">
                <form:input path="sdt" type="number"></form:input>
            </th>
            <th scope="col">
                <form:input path="ngaySinh" type="date" ></form:input>
            </th>
            <th scope="col">
                <form:input path="taiKhoan"  ></form:input>
            </th>
            <th scope="col">
                <form:input path="matKhau"  ></form:input>
            </th>
        </tr>
        </thead>


        <thead>
        <tr>

            <th scope="col">NGAY TAO</th>
            <th scope="col">NGAY CAP NHAT</th>
            <th scope="col">TINH TRANG</th>
            <th scope="col">DIEM</th>


        </tr>
        </thead>
        <thead>
        <tr>


            <th scope="col">
                <form:input path="ngayTao" type="date"></form:input>
            </th>
            <th scope="col">
                <form:input path="ngayCapNhat" type="date"></form:input>
            </th>
            <th scope="col">
                <form:radiobutton path="tinhTrang" label="YES" value="0"></form:radiobutton><br>
                <form:radiobutton path="tinhTrang" label="NO" value="1"></form:radiobutton>
            </th>
            <th scope="col">
                <form:input path="diem" ></form:input>
            </th>

        </tr>
        </thead>

        <thead>
        <tr>

            <th scope="col">HANG KHACH HANG</th>

    <th></th>
            <th></th>
            <th></th>
        </tr>

        </thead>

        <thead>
        <tr>
<th>

          <form:select path="hangKhachHang"  items="${hkh}" itemValue="id" itemLabel="ten">

          </form:select>
</th>
            <th></th>
            <th></th>
            <th></th>
        </tr>

        </thead>





    </table>
    <BUTTON type="submit"  style="margin-left: 5cm">ADD</BUTTON>
</form:form>



<%--<br><br><br>--%>

<table class="table">
    <tr>
        <th >STT</th>
        <th >MA</th>
        <th >TEN</th>
        <th >GIOI TINH</th>
        <th >Email</th>
        <th >SDT</th>
        <th >NGAY SINH</th>
        <th >TAI KHOAN</th>
        <th >MAT KHAU</th>
        <th >NGAY TAO</th>
        <th >NGAY CAP NHAT</th>
        <th >TINH TRANG</th>
        <th >DIEM</th>
        <th >HANG KHACH HANG</th>
        <th >REMOVE</th>
        <th >UPDATE</th>
    </tr>


    <c:forEach items="${dulieu}" var="ht" varStatus="stt">
        <tr>
            <td>${stt.index}</td>
            <td>${ht.ma}</td>
            <td>${ht.hoTen} </td>
            <td>${ht.goitinh()}</td>
            <td>${ht.email}</td>
            <td>${ht.sdt}</td>
            <td>${ht.ngaySinh}</td>
            <td>${ht.taiKhoan}</td>
            <td>${ht.matKhau}</td>
            <td>${ht.ngayTao}</td>
            <td>${ht.ngayCapNhat}</td>
            <td>${ht.tt()}</td>
<%--            <td>--%>
<%--                <c:if test="${ht.tinhTrang == 0}">Yes</c:if>--%>
<%--                <c:if test="${ht.tinhTrang == 1}">No</c:if>--%>
<%--            </td>--%>
            <td>${ht.diem}</td>
            <td>${ht.hangKhachHang.ten}</td>

            <td>
                <a href="/khach-hang/remove/${ht.id}" class="btn btn-success">REMOVE</a>
            </td>
            <td>
                <a href="/khach-hang/view-update/${ht.id}" class="btn btn-success">VIEW UPDATE</a>
            </td>
        </tr>
    </c:forEach>
</table>


<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-w76AqPfDkMBDXo30jS1Sgez6pr3x5MlQ1ZAGC+nuZB+EYdgRZgiwxhTBTkF7CXvN"
        crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"
        integrity="sha384-oBqDVmMz9ATKxIep9tiCxS/Z9fNfEXiDAYTujMAeBAsjFuCZSmKbSSUnQlmh/jp3"
        crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.min.js"
        integrity="sha384-mQ93GR66B00ZXjt0YO5KlohRA5SY2XofN4zfuZxLkoj1gXtW8ANNCe9d5Y3eG5eD"
<%--        crossorigin="anonymous"></script>--%>
</body>
</html>