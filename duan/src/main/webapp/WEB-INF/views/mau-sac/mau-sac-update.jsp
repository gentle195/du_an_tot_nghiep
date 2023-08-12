<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Rom</title>
    <%--    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet"--%>
    <%--          integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD" crossorigin="anonymous">--%>
    <!-- Bootstrap -->
    <link rel="icon" href="/images/favicon.ico" type="image/ico"/>

    <title>Gentelella Alela!</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://getbootstrap.com/docs/5.3/assets/css/docs.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.13/css/select2.min.css" rel="stylesheet"/>
    <link rel="icon" href="/images/favicon.ico" type="image/ico"/>
    <!-- Bootstrap -->
    <link href="/vendors/bootstrap/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Font Awesome -->
    <link href="/vendors/font-awesome/css/font-awesome.min.css" rel="stylesheet">
    <!-- NProgress -->
    <link href="/vendors/nprogress/nprogress.css" rel="stylesheet">
    <!-- iCheck -->
    <link href="/vendors/iCheck/skins/flat/green.css" rel="stylesheet">

    <!-- bootstrap-progressbar -->
    <link href="/vendors/bootstrap-progressbar/css/bootstrap-progressbar-3.3.4.min.css" rel="stylesheet">
    <!-- JQVMap -->
    <link href="/vendors/jqvmap/dist/jqvmap.min.css" rel="stylesheet"/>
    <!-- bootstrap-daterangepicker -->
    <link href="/vendors/bootstrap-daterangepicker/daterangepicker.css" rel="stylesheet">

    <!-- Custom Theme Style -->
    <link href="/build/css/custom.min.css" rel="stylesheet">
</head>
<body>
<form:form action="/update-mau-sac" method="post" modelAttribute="ms">
    <table class="tb">

        <thead>
        <div style="display: none">
            <form:input path="id"></form:input>
        </div>
        </thead>
        <tr style="">
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
        <thead>
        <tr style="display: none">
            <th>
                <form:label path="ngayTao">Ngày tạo </form:label>
            <th><form:input path="ngayTao" type="date"></form:input></th>
        </tr>
        </thead>

        <thead>
        <tr style="display: none">
            <th><form:label path="ngayCapNhat" >Ngày cập nhật</form:label></th>
            <th><form:input path="ngayCapNhat" type="date"></form:input></th>
        </tr>
        </thead>
        <thead>

        <tr>
            <th>
                <form:label path="moTa">Mô tả</form:label></th>
            <th><form:textarea path="moTa"></form:textarea>
                <form:errors path="moTa"></form:errors></th>
        </tr>
        </thead>

        <thead>
        <tr>
            <button type="submit" class="btn btn-primary" onclick="validateForm()">
                UPDATE
            </button>
        </tr>
        </thead>

    </table>

</form:form>

<script>

    function validateForm() {
        var tenValue = document.querySelector('input[name="ten"]').value;
        var moTaValue = document.querySelector('textarea[name="moTa"]').value;

        if (tenValue.trim() === '') {
            alert('Vui lòng không để trống trường ten');
            return false;
        }

        if (moTaValue.trim() === '') {
            alert('Vui lòng không để trống trường Mô tả');
            return false;
        }
    }
</script>
</body>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.13/js/select2.min.js"></script>
</html>