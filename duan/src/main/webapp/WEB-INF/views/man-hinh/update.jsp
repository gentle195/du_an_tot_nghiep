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
    <form:form action="/man-hinh/update/${manHinh.id}" method="post" modelAttribute="manHinh">
        <h1 style="text-align: center">UPDATE Thông Tin Màn Hình</h1>
        <table class="table " style="border: aliceblue 1px">
            <tbody>
            <tr>
                <td><form:label path="thongSo">Thông số màn hình</form:label></td>
                <th><form:input path="thongSo" id="tent"></form:input></th>
                <th><form:errors path="thongSo" cssClass="error text-danger"></form:errors></th>
            </tr>
            </tbody>
            <tbody>
            <tr>
                <td><form:label path="tinhTrang">Trạng thái</form:label></td>
                <th><form:radiobutton path="tinhTrang" value="0" label="Hoạt động"/>
                    <form:radiobutton path="tinhTrang" value="1" label="Ngừng hoạt động"/>
                </th>
            </tr>
            </tbody>
            <tbody>
            <tr>
                <td><form:label path="moTa">Mô tả</form:label></td>
                <th><form:textarea path="moTa"></form:textarea></th>
                <th><form:errors path="moTa" cssClass="error text-danger"></form:errors></th>
            </tr>
            </tbody>
            <tr>
                <td>
                    <button type="submit" style="float: right" class="btn btn-success"
                            id="btt" onclick="return myFunction2()">Update
                    </button>
                </td>
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
            confirm("Thêm thành công");
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
        let text = "Bạn chắc chắn muốn xóa";
        let kt = confirm(text);
        if (kt == true) {
            confirm("Xóa thành công");
            return true
        } else {
            return false;
        }
    }
</script>
</html>