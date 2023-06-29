<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/functions" %>
<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Rom</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD" crossorigin="anonymous">
</head>
<body>
<div class="container">
    <h1 style="text-align: center">Rom</h1>
    <table class="table table-bordered border-primary">
        <thead>
        <tr>
            <th>STT</th>
            <th>Mã </th>
            <th>Dung lượng </th>
            <th>Ngày tạo</th>
            <th>Ngày cập nhật</th>
            <th>Tình trạng</th>
            <th>Mô tả</th>
            <th colspan="2">Action</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach var="list" varStatus="i" items="${hsp}">
            <tr>
                <td>${i.index+1}</td>
                <td>${list.ma}</td>
                <td>${list.dungLuong}</td>
                <td>${list.ngayTao}</td>
                <td>${list.ngayCapNhat}</td>
                <td><c:if test="${list.tinhTrang==0}">Hoạt động</c:if>
                    <c:if test="${list.tinhTrang==1}">Ngừng hoạt động</c:if>
                </td>
                <td>${list.moTa}</td>
                <td>
                    <a class="btn btn-primary" href="/rom/delete/${list.id}">Delete</a>
                    <a class="btn btn-primary" href="/rom/view-update/${list.id}">Update</a>
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
    <br>
    <nav aria-label="Page navigation example">
        <ul class="pagination justify-content-center pagination-lg">
            <li class="page-item"><a class="page-link" href="/rom/hien-thi?num=0">First</a></li>

            <c:forEach begin="1" end="${total}" varStatus="status">
                <li class="page-item">
                    <a href="${pageContext.request.contextPath}/rom/hien-thi?num=${status.index -1}"
                       class="page-link">${status.index}</a>
                </li>
            </c:forEach>

            <li class="page-item"><a class="page-link" href="/rom/hien-thi?num=${total-1}">Last</a></li>
        </ul>
    </nav>
</div>
<br>
<div class="container">
    <form:form action="/rom/add" method="post" modelAttribute="dulieuxem">
        <h1 style="text-align: center">Add Rom</h1>

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
                <td> Dung lượng:</td>
                <th><form:input path="dungLuong" id="tent"></form:input></th>
            </tr>
            </tbody>

            <tbody>
            <tr>
                <td> Ngay tao:</td>
                <th><form:input path="ngayTao" type="date"></form:input></th>
            </tr>
            </tbody>

                <%--            <tbody>--%>
                <%--            <tr>--%>
                <%--                <td> Ngay cap nhat:</td>--%>
                <%--                <th><form:input path="ngayCapNhat" type="date"></form:input></th>--%>
                <%--            </tr>--%>
                <%--            </tbody>--%>

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

            <tr>
                <td>

                    <button type="submit" style="float: right" class="btn btn-success"
                            id="btt">Add
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