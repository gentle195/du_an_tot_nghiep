<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!doctype html>
<html lang="en">
<head>
    <title>Title</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD" crossorigin="anonymous">


</head>
<body>



<form:form action="/dia-chi/update" method="post" modelAttribute="dc">
    <table class="table">
        <P style="display: none"><form:input path="id"></form:input></P>
        <thead>
        <tr>

            <th scope="col">MA</th>
            <th scope="col">DIA CHI</th>
            <th scope="col">QUAN</th>
            <th scope="col">HUYEN</th>


        </tr>
        </thead>
        <thead>
        <tr>
            <th scope="col">
                <form:input path="ma"></form:input>
            </th>

            <th scope="col">
                <form:input path="diaChi"></form:input>
            </th>

            <th scope="col">
                <form:input path="quan"></form:input>
            </th>

            <th scope="col">
                <form:input path="huyen"></form:input>
            </th>
        </tr>
        </thead>


        <thead>
        <tr>

            <th scope="col">THANH PHO</th>
            <th scope="col">NGAY TAO</th>
            <th scope="col">NGAY CAP NHAT</th>
            <th scope="col">TINH TRANG</th>


        </tr>
        </thead>
        <thead>
        <tr>


            <th scope="col">
                <form:input path="thanhPho" ></form:input>
            </th>
            <th scope="col">
                <form:input path="ngayTao" type="date" ></form:input>
            </th>
            <th scope="col">
                <form:input path="ngayCapNhat" type="date" ></form:input>
            </th>

            <th scope="col">
                <form:radiobutton path="tinhTrang" label="YES" value="0"></form:radiobutton><br>
                <form:radiobutton path="tinhTrang" label="NO" value="1"></form:radiobutton>

            </th>
        </tr>
        </thead>


        <thead>
        <tr>

            <th scope="col">MO TA</th>
            <th scope="col">KHACH HANG</th>



        </tr>
        </thead>
        <thead>
        <tr>


            <th scope="col">
                <form:input path="moTa" ></form:input>
            </th>

            <th>

                <form:select path="khachHang"  items="${kh}" itemValue="id" itemLabel="hoTen">

                </form:select>
            </th>
        </tr>
        </thead>









    </table>
    <BUTTON type="submit"  style="margin-left: 5cm">UPDATE</BUTTON>
</form:form>






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