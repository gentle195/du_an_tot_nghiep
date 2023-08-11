<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!doctype html>
<html lang="en">
<head>
    <%--    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">--%>
    <%--    <!-- Meta, title, CSS, favicons, etc. -->--%>
    <%--    <meta charset="utf-8">--%>
    <%--    <meta http-equiv="X-UA-Compatible" content="IE=edge">--%>
    <%--    <meta name="viewport" content="width=device-width, initial-scale=1">--%>
    <%--    <link rel="icon" href="../../images/favicon.ico" type="image/ico" />--%>
    <%--    <!-- Bootstrap -->--%>
    <%--    <link href="../vendors/bootstrap/dist/css/bootstrap.min.css" rel="stylesheet">--%>
    <%--    <!-- Font Awesome -->--%>
    <%--    <link href="../vendors/font-awesome/css/font-awesome.min.css" rel="stylesheet">--%>
    <%--    <!-- NProgress -->--%>
    <%--    <link href="../vendors/nprogress/nprogress.css" rel="stylesheet">--%>
    <%--    <!-- iCheck -->--%>
    <%--    <link href="../vendors/iCheck/skins/flat/green.css" rel="stylesheet">--%>

    <%--    <!-- bootstrap-progressbar -->--%>
    <%--    <link href="../vendors/bootstrap-progressbar/css/bootstrap-progressbar-3.3.4.min.css" rel="stylesheet">--%>
    <%--    <!-- JQVMap -->--%>
    <%--    <link href="../vendors/jqvmap/dist/jqvmap.min.css" rel="stylesheet"/>--%>
    <%--    <!-- bootstrap-daterangepicker -->--%>
    <%--    <link href="../vendors/bootstrap-daterangepicker/daterangepicker.css" rel="stylesheet">--%>

    <%--    <!-- Custom Theme Style -->--%>
    <%--    <link href="../../build/css/custom.min.css" rel="stylesheet">--%>
</head>
<body>
<form:form action="/mau-sac/update-mau-sac" method="post" modelAttribute="ms">
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

</html>