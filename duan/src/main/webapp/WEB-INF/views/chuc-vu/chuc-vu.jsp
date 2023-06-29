<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<html>
<head>
    <title>Chức vụ</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://getbootstrap.com/docs/5.3/assets/css/docs.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</head>
<body>
<div class="container">
    <h1>Quản Lý Chức Vụ</h1>
    <form>
        <div class="row">
            <div class="mb-3 mt-3 col-3">
                <div class="row g-3 align-items-center">
                    <div class="col-auto">
                        <label class="col-form-label">Name:</label>
                    </div>
                    <div class="col-auto">
                        <input class="form-control" name="name" value="${param.name}">
                    </div>
                </div>
            </div>
<%--            <div class="mb-3 mt-3 col-3">--%>
<%--                <div class="row g-3 align-items-center">--%>
<%--                    <div class="col-auto">--%>
<%--                        <label class="col-form-label">Giá min:</label>--%>
<%--                    </div>--%>
<%--                    <div class="col-auto">--%>
<%--                        <input class="form-control" name="min" value="${param.min}">--%>
<%--                    </div>--%>
<%--                </div>--%>
<%--            </div>--%>
<%--            <div class="mb-3 mt-3 col-3">--%>
<%--                <div class="row g-3 align-items-center">--%>
<%--                    <div class="col-auto">--%>
<%--                        <label class="col-form-label">Giá max:</label>--%>
<%--                    </div>--%>
<%--                    <div class="col-auto">--%>
<%--                        <input class="form-control" name="max" value="${param.max}">--%>
<%--                    </div>--%>
<%--                </div>--%>
<%--            </div>--%>
            <div class="mb-3 mt-3 col-3">
                <button type="submit" class="btn btn-primary">Search</button>
            </div>
        </div>
    </form>
</div>
<div class="container">
    <div class="mb-3 mt-3 col-3">
        <button class="btn btn-info">
            <a style="color: white;text-decoration: none" href="/chuc-vu/view-add">Thêm mới</a>
        </button>
    </div>
</div>
<c:if test="${listChucVu.isEmpty()}">
    <div class="container">
        <h4>Không có sản phẩm !</h4>
    </div>
</c:if>
<c:if test="${not listChucVu.isEmpty()}">
    <table class="table table-bordered container text-center align-middle">
        <thead>
        <tr>
            <th scope="col" rowspan="2" class="align-middle">No</th>
            <th scope="col" rowspan="2" class="align-middle">Mã</th>
            <th scope="col" rowspan="2" class="align-middle">Tên</th>
            <th scope="col" rowspan="2" class="align-middle">Ngày Tạo</th>
            <th scope="col" rowspan="2" class="align-middle">Ngày Cập Nhật</th>
            <th scope="col" rowspan="2" class="align-middle">Tình Trạng</th>
            <th scope="col" rowspan="2" class="align-middle">Mô Tả</th>
            <th scope="col" rowspan="2" class="align-middle">Action</th>
        </tr>
<%--        <tr>--%>
<%--            <th scope="col">NO</th>--%>
<%--            <th scope="col">Size</th>--%>
<%--            <th scope="col">Material</th>--%>
<%--            <th scope="col">Name</th>--%>
<%--            <th scope="col">Size</th>--%>
<%--            <th scope="col">Material</th>--%>
<%--        </tr>--%>
        </thead>
        <tbody>
        <c:forEach items="${listChucVu.getContent()}" var="chucVu" varStatus="viTri">
            <tr>
                <td>${viTri.index + 1}</td>
                <td>${chucVu.ma}</td>
                <td>${chucVu.ten}</td>
                <td>${chucVu.ngayTao}</td>
                <td>${chucVu.ngayCapNhat}</td>
                <td>${chucVu.tinhTrang}</td>
                <td>${chucVu.moTa}</td>
                <td class="btn-group">
                    <button class="btn btn-info"><a style="color: white;text-decoration: none"
                                                    onclick="if(!(confirm('Bạn có muốn thực hiện thao tác này không ? ')))return false;else alert('Thành công')"
                                                    href="/chuc-vu/delete/${chucVu.id}">Delete</a></button>
                    <button class="btn btn-info"><a style="color: white;text-decoration: none"
                                                    href="/chuc-vu/detail/${chucVu.id}">Detail</a></button>
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
    <ul class="pagination container d-flex justify-content-center">
        <c:if test="${listChucVu.getNumber() gt 0}">
            <li class="page-item">
                <a class="page-link" href="?name=${param.name}&min=${param.min}&max=${param.max}&page=1">First</a>
            </li>
        </c:if>

        <c:if test="${listChucVu.getNumber() gt 0}">
            <li class="page-item">
                <a class="page-link"
                   href="?name=${param.name}&min=${param.min}&max=${param.max}&page=${listChucVu.getNumber()}">Previous</a>
            </li>
        </c:if>

        <li class="page-item">
            <a class="page-link"> ${listChucVu.getNumber() + 1} / ${listChucVu.getTotalPages()} </a>
        </li>

        <c:if test="${listChucVu.getNumber() lt listChucVu.getTotalPages() - 1}">
            <li class="page-item">
                <a class="page-link"
                   href="?name=${param.name}&min=${param.min}&max=${param.max}&page=${listChucVu.getNumber() + 2}">Next</a>
            </li>
        </c:if>

        <c:if test="${listChucVu.getNumber() lt listChucVu.getTotalPages() - 1}">
            <li class="page-item">
                <a class="page-link"
                   href="?name=${param.name}&min=${param.min}&max=${param.max}&page=${listChucVu.getTotalPages()}">Last</a>
            </li>
        </c:if>
    </ul>
</c:if>
</body>
</html>