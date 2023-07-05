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
            <%--        <thead>--%>
            <%--        <tr>--%>
            <%--            <th><form:label path="tinhTrang">Tình trạng</form:label></th>--%>
            <%--            <th><form:radiobutton path="tinhTrang" label="Không hoạt động" value="0"></form:radiobutton>--%>
            <%--                <form:radiobutton path="tinhTrang" label="Còn hoạt động" value="1"></form:radiobutton>--%>
            <%--            </th>--%>

            <%--        </tr>--%>
            <%--        </thead>--%>
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
            <button type="submit" class="btn btn-primary" onclick="confirmUpdate(event)">
                UPDATE
            </button>
        </tr>
        </thead>

    </table>
    r>
</form:form>

<%--<script>--%>
<%--    function confirmUpdate(event) {--%>
<%--       event.preventDefault(); // Prevents the default action of the link--%>

<%--        if (confirm("Bạn chắc chắn muốn Update không?")) {--%>
<%--            window.location.href = event.target.href; // Redirect to the delete URL--%>
<%--        } else {--%>
<%--            // Do nothing or perform any desired action--%>
<%--        }--%>
<%--    }--%>
</script>
</body>

</html>