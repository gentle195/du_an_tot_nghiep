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
    <title>San Pham</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD" crossorigin="anonymous">
</head>
<body>
<div class="container">
    <h1 style="text-align: center"> Sản Phẩm</h1>
    <table class="table table-bordered border-primary">
        <thead>
        <tr>
            <th>STT</th>
            <th>Mã SP</th>
            <th>Tên SP</th>
            <th>Ngày tạo</th>
            <th>Ngày cập nhật</th>
            <th>Tình trạng</th>
            <th>Mô tả</th>
            <th>Hãng</th>
            <th colspan="2">Action</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach var="list" varStatus="i" items="${hsp}">
            <tr>
                <td>${i.index+1}</td>
                <td>${list.ma}</td>
                <td>${list.ten}</td>
                <td>${list.ngayTao}</td>
                <td>${list.ngayCapNhat}</td>
                <td><c:if test="${list.tinhTrang==0}">Hoạt động</c:if>
                    <c:if test="${list.tinhTrang==1}">Ngừng hoạt động</c:if>
                </td>
                <td>${list.moTa}</td>
                <td>${list.hangSanPham.ten}</td>
                <td>
                    <a type="" class="btn btn-primary" href="/san-pham/delete/${list.id}" onclick="return myFunction4()">Delete</a>
                    <a class="btn btn-primary" href="/san-pham/view-update/${list.id}">Update</a>
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
    <br>
    <nav aria-label="Page navigation example">
        <ul class="pagination justify-content-center pagination-lg">
            <li class="page-item"><a class="page-link" href="/san-pham/hien-thi?num=0">First</a></li>

            <c:forEach begin="1" end="${total}" varStatus="status">
                <li class="page-item">
                    <a href="${pageContext.request.contextPath}/san-pham/hien-thi?num=${status.index -1}"
                       class="page-link">${status.index}</a>
                </li>
            </c:forEach>

            <li class="page-item"><a class="page-link" href="/san-pham/hien-thi?num=${total-1}">Last</a></li>
        </ul>
    </nav>
</div>
<br>
<div class="container">
    <form:form action="/san-pham/add" method="post" modelAttribute="dulieuxem">
        <h1 style="text-align: center">Add  Sản Phẩm</h1>

        <table class="table " style="border: aliceblue 1px">
                <%--            <tbody>--%>
                <%--            <tr>--%>
                <%--                <td> Mã:</td>--%>
                <%--                <th>--%>
                <%--                    <form:input path="ma" id="mat"></form:input>--%>

                <%--                </th>--%>
                <%--            </tr>--%>
                <%--            </tbody>--%>

            <tbody>
            <tr>
                <td> Tên:</td>
                <th><form:input path="ten" id="tent"></form:input></th>
                <th><form:errors path="ten" cssClass="error text-danger"></form:errors></th>
            </tr>
            </tbody>

                <%--            <tbody>--%>
                <%--            <tr>--%>
                <%--                <td> Ngay tao:</td>--%>
                <%--                <th><form:input path="ngayTao" type="date"></form:input></th>--%>
                <%--            </tr>--%>
                <%--            </tbody>--%>

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
                <th><form:textarea path="moTa" ></form:textarea></th>
                <th><form:errors path="moTa" cssClass="error text-danger"></form:errors></th>
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
                            id="btt" onclick="return myFunction1()">Add
                    </button>
                </td>
                <th></th>
            </tr>
            </tbody>

        </table>
    </form:form>
</div>
</body>
<script>
    function myFunction1() {
        let text = "Bạn chắc chắn muốn thêm";
        let kt = confirm(text);
        if (kt == true) {
            return true;
        } else {
            return false;
        }
    }

    function myFunction2() {
        let text = "Bạn chắc chắn muốn sửa";
        let kt = confirm(text);
        if (kt == true) {
            return true
        } else {
            return false;
        }
    }

    function myFunction3() {
        let text = "Bạn chắc chắn muốn sửa";
        let kt = confirm(text);
        if (kt == true) {
            return true
        } else {
            return false;
        }
    }

    function myFunction4() {
        let text = "Bạn chắc chắn muốn xóa";
        let kt = confirm(text);
        if (kt == true) {
            return true
        } else {
            return false;
        }
    }

</script>
</html>