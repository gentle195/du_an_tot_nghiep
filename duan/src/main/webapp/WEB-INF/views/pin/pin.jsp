<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!doctype html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Bootstrap demo</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD" crossorigin="anonymous">
</head>
<body>
<h3 style="color: red; text-align: center"><b>Pin</b></h3>
<hr>
<form:form action="/pin/add-pin" method="post" modelAttribute="Pin">
    <div class="row">
        <div class="col">
            <form:label path="loaiPin"><b>Loại Pin:</b></form:label>
            <form:input path="loaiPin" class="form-control"></form:input>
            <form:errors path="loaiPin"></form:errors>
        </div>
        <div class="col">
            <form:label path="congNghePin"><b>Công nghệ Pin:</b></form:label>
            <form:input path="congNghePin" class="form-control"></form:input>
            <form:errors path="congNghePin"></form:errors>
        </div>
        <div class="col">
            <form:label path="moTa"><b>Mô Tả:</b></form:label>
            <form:textarea path="moTa" class="form-control"></form:textarea>
            <form:errors path="moTa"></form:errors>
        </div>
        <div class="col">
            <form:label path="dungLuongPin"><b>Dung Lượng:</b></form:label>
            <form:select path="dungLuongPin" items="${dungLuongPin}" class="form-control" itemLabel="thongSo"
                         itemValue="id"></form:select>
        </div>
        <div style="margin-top: 20px; margin-bottom: 20px">
            <button type="submit" class="btn btn-primary"
                    onclick="if(!(confirm('Bạn có muốn thực hiện thao tác này không ? ')))return false;">ADD
            </button>
        </div>
    </div>

</form:form>
<c:if test="${list.isEmpty()}">
    <div class="container">
        <h4>Không có sản phẩm !</h4>
    </div>
</c:if>
<c:if test="${not list.isEmpty()}">
    <form action="">
        <table class="table table-bordered border-dark">
            <tr style="text-align: center">
                <th scope="col">Mã</th>
                <th scope="col">Loại Pin</th>
                <th scope="col">Công nghệ Pin</th>
                <th scope="col">Ngày Tạo</th>
                <th scope="col">Ngày Cập Nhật</th>
                <th scope="col">Tình Trạng</th>
                <th scope="col">Mô Tả</th>
                <th scope="col">Dung Lượng</th>
                <th scope="col">Action</th>
            </tr>
            <c:forEach items="${list}" var="p">
                <tr>
                    <td>${p.ma}</td>
                    <td>${p.loaiPin}</td>
                    <td>${p.congNghePin}</td>
                    <td>${p.ngayTao}</td>
                    <td>${p.ngayCapNhat}</td>
                    <td>
                        <c:if test="${p.tinhTrang == 0}">Yes</c:if>
                        <c:if test="${p.tinhTrang == 1}">No</c:if>
                    </td>
                    <td>${p.moTa}</td>
                    <td>${p.dungLuongPin.thongSo}</td>
                    <td>
                        <a href="/pin/detail-pin/${p.id}" class="btn btn-outline-primary" tabindex="-1"
                           role="button"
                           onclick="if(!(confirm('Bạn có muốn thực hiện thao tác này không ? ')))return false;">Detail</a>
                        <a href="/pin/remove-pin/${p.id}" class="btn btn-outline-primary" tabindex="-1"
                           role="button"
                           onclick="if(!(confirm('Bạn có muốn thực hiện thao tác này không ? ')))return false;">Delete</a>
                        <a href="/pin/view-update-pin/${p.id}" class="btn btn-outline-primary" tabindex="-1"
                           role="button">Update</a>
                    </td>
                </tr>
            </c:forEach>
        </table>
    </form>
    <nav aria-label="Page navigation example">
        <ul class="pagination justify-content-center pagination-lg">
            <li class="page-item"><a class="page-link" href="/pin/hien-thi?pageNum=0">First</a></li>
            <c:forEach begin="1" end="${total}" varStatus="status">
                <li class="page-item">
                    <a href="${pageContext.request.contextPath}/pin/hien-thi?pageNum=${status.index -1}"
                       class="page-link">${status.index}</a>
                </li>
            </c:forEach>
            <li class="page-item"><a class="page-link" href="/pin/hien-thi?pageNum=${total-1}">Last</a></li>
        </ul>
    </nav>
</c:if>
</body>
</html>