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
    <title>Màn hình</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD" crossorigin="anonymous">
</head>
<body>
<div class="container">
    <h1 style="text-align: center">Màn Hình</h1>
    <c:if test="${f:length(listManHinh)==0}">
        <span style="text-align: center">Không có dữ liệu màn hình</span>
    </c:if>
    <c:if test="${f:length(listManHinh)!=0}">
        <table class="table table-bordered border-primary">
            <thead>
            <tr>
                <th>STT</th>
                <th>Mã</th>
                <th>Thông số</th>
                <th>Loại cảm ứng</th>
                <th>Tỉ lệ khung hình</th>
                <th>Công nghệ màn hình</th>
                <th>Độ phân giải màn hình</th>
                <th>Tần số quét</th>
                <th>Ngày tạo</th>
                <th>Ngày cập nhật</th>
                <th>Tình trạng</th>
                <th>Mô tả</th>
                <th colspan="2">Action</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach var="list" varStatus="i" items="${listManHinh}">
                <tr>
                    <td>${i.index+1}</td>
                    <td>${list.ma}</td>
                    <td>${list.thongSo}</td>
                    <td>${list.loaiCamUng}</td>
                    <td>${list.tiLeKhungHinh}</td>
                    <td>${list.congNghe}</td>
                    <td>${list.doPhanGiai}</td>
                    <td>${list.tanSoQuet}</td>
                    <td>${list.ngayTao}</td>
                    <td>${list.ngayCapNhat}</td>
                    <td>
                        <c:if test="${list.tinhTrang==0}">Hoạt động</c:if>
                        <c:if test="${list.tinhTrang==1}">Ngừng hoạt động</c:if>
                    </td>
                    <td>${list.moTa}</td>
                    <td>
                        <a class="btn btn-primary" href="/man-hinh/delete/${list.id}"
                           onclick="return myFunction3()">Delete</a>
                        <a class="btn btn-primary" href="/man-hinh/view-update/${list.id}">Update</a>
                    </td>
                </tr>
            </c:forEach>
            </tbody>
        </table>

        <br>
        <nav aria-label="Page navigation example">
            <ul class="pagination justify-content-center pagination-lg">
                <li class="page-item"><a class="page-link" href="/man-hinh/hien-thi?num=0">First</a></li>

                <c:forEach begin="1" end="${total}" varStatus="status">
                    <li class="page-item">
                        <a href="${pageContext.request.contextPath}/man-hinh/hien-thi?num=${status.index -1}"
                           class="page-link">${status.index}</a>
                    </li>
                </c:forEach>

                <li class="page-item"><a class="page-link" href="/man-hinh/hien-thi?num=${total-1}">Last</a></li>
            </ul>
        </nav>
    </c:if>
</div>
<br>
<div class="container">
    <form:form action="/man-hinh/add" method="post" modelAttribute="manHinh">
        <h1 style="text-align: center">ADD Thông Tin Màn Hình</h1>
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
                <td><form:label path="loaiCamUng">Loại cảm ứng màn hình</form:label></td>
                <th><form:input path="loaiCamUng" id="tent"></form:input></th>
                <th><form:errors path="loaiCamUng" cssClass="error text-danger"></form:errors></th>
            </tr>
            </tbody>
            <tbody>
            <tr>
                <td><form:label path="tiLeKhungHinh">Tỉ lệ khung hình</form:label></td>
                <th><form:input path="tiLeKhungHinh" id="tent"></form:input></th>
                <th><form:errors path="tiLeKhungHinh" cssClass="error text-danger"></form:errors></th>
            </tr>
            </tbody>
            <tbody>
            <tr>
                <td><form:label path="congNghe">Công nghệ màn hình</form:label></td>
                <th><form:input path="congNghe" id="tent"></form:input></th>
                <th><form:errors path="congNghe" cssClass="error text-danger"></form:errors></th>
            </tr>
            </tbody>
            <tbody>
            <tr>
                <td><form:label path="doPhanGiai">Độ phân giải</form:label></td>
                <th><form:input path="doPhanGiai" id="tent"></form:input></th>
                <th><form:errors path="doPhanGiai" cssClass="error text-danger"></form:errors></th>
            </tr>
            </tbody>
            <tbody>
            <tr>
                <td><form:label path="tanSoQuet">Tần số quét</form:label></td>
                <th><form:input path="tanSoQuet" id="tent"></form:input></th>
                <th><form:errors path="tanSoQuet" cssClass="error text-danger"></form:errors></th>
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
                            id="btt" onclick="return myFunction1()">Add
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
            return true
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