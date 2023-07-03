<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!doctype html>
<html lang="en">
<head>
    <title>Title</title>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/js/bootstrap.min.js"
            integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM"
            crossorigin="anonymous"></script>
</head>
<body>


<br>

<form:form action="/hang-khach-hang/add" method="post" modelAttribute="hkh">
    <table class="table">

        <thead>
        <tr>

            <th scope="col">TEN</th>
            <th scope="col">
                <form:input path="ten"></form:input><br>
                <form:errors path="ten" cssClass="error text-danger"/>
            </th>

        </tr>
        </thead>
        <thead>
        <tr>

            <th scope="col">DIEM TOI THIEU</th>
            <th scope="col">
                <form:input path="diem_toi_thieu" type="number" id="dtt"></form:input><br>
                <form:errors path="diem_toi_thieu" cssClass="error text-danger"/>

            </th>

        </tr>
        </thead>


        <thead>
        <tr>
            <th scope="col">Mo TA</th>
            <th scope="col">
                <form:textarea path="moTa" type="text"></form:textarea><br>
                <form:errors path="moTa" cssClass="error text-danger"/>
            </th>
        </tr>
        </thead>
        <thead>
        <tr>

            <th scope="col"></th>
            <th scope="col">
                <BUTTON type="submit" class="btn btn-primary" onclick="return tb()">ADD</BUTTON>
            </th>

        </tr>
        </thead>
    </table>
</form:form>


<br><br><br>

<table class="table" id="bang">
    <thead>
    <tr>
        <th>STT</th>
        <th>MA</th>
        <th>TEN</th>
        <th>DIEM TOI THIEU</th>
        <th>NGAY TAO</th>
        <th>NGAY CAP NHAT</th>
        <th>TINH TRANG</th>
        <th>MO TA</th>
        <th>REMOVE</th>
        <th>UPDATE</th>
    </tr>
    </thead>

    <c:forEach items="${dulieu}" var="ht" varStatus="stt">
        <tr>
            <td>${stt.index}</td>
            <td>${ht.ma}</td>
            <td>${ht.ten} </td>
            <td>${ht.diem_toi_thieu}</td>
            <td>${ht.ngayTao}</td>
            <td>${ht.ngayCapNhat}</td>
            <td>${ht.tt()}</td>
            <td>${ht.moTa}</td>
            <td>
                <a href="/hang-khach-hang/remove/${ht.id}" class="btn btn-success" onclick="return tb()">REMOVE</a>
            </td>
            <td>
                <a href="/hang-khach-hang/view-update/${ht.id}" class="btn btn-success" onclick="return tb()">VIEW
                    UPDATE</a>
            </td>
        </tr>
    </c:forEach>
</table>
<P id="bc" style="color: crimson"></P>
<script>
    if ("${tong}" <= 0) {
        document.getElementById("bang").style.display = "none"
        document.getElementById("bc").innerText = "Hết để xóa rồi cu"
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
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-w76AqPfDkMBDXo30jS1Sgez6pr3x5MlQ1ZAGC+nuZB+EYdgRZgiwxhTBTkF7CXvN"
        crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"
        integrity="sha384-oBqDVmMz9ATKxIep9tiCxS/Z9fNfEXiDAYTujMAeBAsjFuCZSmKbSSUnQlmh/jp3"
        crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.min.js"
        integrity="sha384-mQ93GR66B00ZXjt0YO5KlohRA5SY2XofN4zfuZxLkoj1gXtW8ANNCe9d5Y3eG5eD"
        crossorigin="anonymous"></script>
</body>
</html>