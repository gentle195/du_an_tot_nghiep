<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<html>
<head>
    <title>Nhân viên</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://getbootstrap.com/docs/5.3/assets/css/docs.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</head>
<body>
<div class="container">
    <form:form method="post" class="container" action="/nhan-vien/update/${nhanVien.id}" modelAttribute="nhanVien">
        <div class="row">
            <div class="col">
                <div class="form-floating mb-3 mt-3">
                    <form:input class="form-control" placeholder="" path="ma"/>
                    <form:label class="form-label" path="ma">Mã:</form:label>
                </div>
                <div class="form-floating mb-3 mt-3">
                    <form:input class="form-control" placeholder="" path="hoTen"/>
                    <form:label class="form-label" path="hoTen">Họ tên:</form:label>
                </div>
                <div class="form-floating mb-3 mt-3">
                    <form:input class="form-control" placeholder="" path="email"/>
                    <form:label class="form-label" path="email">Email:</form:label>
                </div>
                <div class="form-floating mb-3 mt-3">
                    <form:input class="form-control" placeholder="" path="sdt"/>
                    <form:label class="form-label" path="sdt">Số điện thoại:</form:label>
                </div>
                <div class="form-floating mb-3 mt-3">
                    <form:input class="form-control" type="date" value="${nhanVien.ngaySinh}" placeholder=""
                                path="ngaySinh"/>
                    <form:label class="form-label" path="ngaySinh">Ngày sinh:</form:label>
                </div>
                <div class="form-floating mb-3 mt-3">
                    <form:input class="form-control" placeholder="" path="canCuoc"/>
                    <form:label class="form-label" path="canCuoc">CCCD:</form:label>
                </div>
                <div class="form-floating mb-3 mt-3">
                    <form:input class="form-control" placeholder="" path="taiKhoan"/>
                    <form:label class="form-label" path="taiKhoan">Tài khoản:</form:label>
                </div>
            </div>
            <div class="col">
                <div class="form-floating mb-3 mt-3">
                    <form:input class="form-control" placeholder="" path="matKhau"/>
                    <form:label class="form-label" path="matKhau">Mật khẩu:</form:label>
                </div>
                <div class="form-floating mb-3 mt-3">
                    <form:input class="form-control" placeholder="" path="queQuan"/>
                    <form:label class="form-label" path="queQuan">Quê quán:</form:label>
                </div>
                <div class="form-floating mb-3 mt-3">
                    <form:input class="form-control" type="date" value="${nhanVien.ngayTao}" placeholder=""
                                path="ngayTao"/>
                    <form:label class="form-label" path="ngayTao">Ngày tạo:</form:label>
                </div>
                <div class="form-check mb-3 mt-3">
                    <form:label class="form-label" path="tinhTrang">Giới Tính:</form:label>
                    <form:radiobutton path="gioiTinh" value="true" />Nam
                    <form:radiobutton path="gioiTinh" value="false"/> Nữ
                </div>
                <div class="form-check mb-3 mt-3">
                    <form:label class="form-label" path="tinhTrang">Tình Trạng:</form:label>
                    <form:radiobutton path="tinhTrang" value="0"/>Không hoạt động
                    <form:radiobutton path="tinhTrang" value="1" /> Hoạt động
                </div>
                <div class="form-floating mb-3 mt-3">
                    <form:select path="chucVu" class="form-select">
                        <form:options items="${listChucVu}" itemValue="id" itemLabel="ten"/>
                    </form:select>
                    <form:label class="form-label" path="chucVu">Chức vụ:</form:label>
                </div>
            </div>
        </div>
        <form:button type="submit" class="btn btn-primary"
                     onclick="if(!(confirm('Bạn có muốn thực hiện thao tác này không ? ')))return false;else alert('Thành công')">Update</form:button>
    </form:form>
</div>
</body>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.13/js/select2.min.js"></script>
</html>