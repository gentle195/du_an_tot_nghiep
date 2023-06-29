<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page import="java.time.LocalDate" %>

<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Update</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD" crossorigin="anonymous">
</head>
<body>
<div class="container">
    <form:form action="/san-pham/update/${dulieuxem.id}" method="post" modelAttribute="dulieuxem">
        <h1 style="text-align: center">Update  Sản Phẩm</h1>

        <table class="table " style="border: aliceblue 1px">
            <tbody>
            <tr>
                <td> Mã:</td>
                <th>
                    <form:input path="ma" id="mat"></form:input>

                </th>
            </tr>
            </tbody>

            <tbody>
            <tr>
                <td> Tên:</td>
                <th><form:input path="ten" id="tent"></form:input></th>
            </tr>
            </tbody>

            <tbody>
            <tr>
                <td> Ngay tao:</td>
                <th><form:input path="ngayTao" type="date"></form:input></th>
            </tr>
            </tbody>

            <tbody>
            <tr>
                <td> Ngay cap nhat:</td>
                <th><form:input path="ngayCapNhat" type="date" value="<%= java.time.LocalDate.now() %>" ></form:input></th>
            </tr>
            </tbody>

            <tbody>
            <tr>
                <td> Trang thai:</td>
                <th><form:radiobutton path="tinhTrang" value="0" label="Hoạt động"></form:radiobutton>
                    <form:radiobutton path="tinhTrang" value="1" label="Ngừng hoạt động"></form:radiobutton>
                </th>
            </tr>
            </tbody>


            <tbody>
            <tr>
                <td>Mo ta:</td>
                <th><form:input path="moTa" ></form:input></th>
            </tr>
            </tbody>

            <tbody>
            <tr>
                <td>Hãng:</td>
                <th><form:select path="hangSanPham" items="${hangsp}" itemValue="id" itemLabel="ten" ></form:select></th>
            </tr>
            </tbody>

            <tr>
                <td>

                    <button type="submit" style="float: right" class="btn btn-success"
                            id="btt">UPDATE
                    </button>
                </td>
                <th></th>
            </tr>
            </tbody>

        </table>
    </form:form>
</div>
</body>
</html>