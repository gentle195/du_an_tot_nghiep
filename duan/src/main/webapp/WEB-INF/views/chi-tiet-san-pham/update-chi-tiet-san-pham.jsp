<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://getbootstrap.com/docs/5.3/assets/css/docs.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

    <title>Document</title>
</head>
<body>
<h3 style="color: black; text-align: center"><b>Cập Nhật Chi Tiết Sản Phẩm</b></h3>
<form:form action="/chi-tiet-san-pham/update/${chitietsanphamupdate.id}" class="container" method="post" modelAttribute="chitietsanphamupdate">
    <div class="row">
        <div class="col">
            <div class="form-floating mb-3 mt-3">
                <form:select path="sanPham" class="form-control">
                    <form:options items="${listSanPham}" itemLabel="ten" itemValue="id"/>
                </form:select>
                <form:label class="form-label" path="sanPham">Sản Phẩm:</form:label>

            </div>
            <div class="form-floating mb-3 mt-3">
                <form:select path="mauSac" class="form-control">
                    <form:options items="${listMauSac}" itemLabel="ten" itemValue="id"/>
                </form:select>
                <form:label class="form-label" path="mauSac">Màu Sắc:</form:label>

            </div>
            <div class="form-floating mb-3 mt-3">
                <form:select path="chip" class="form-control">
                    <form:options items="${listChip}" itemLabel="ten" itemValue="id"/>
                </form:select>
                <form:label class="form-label" path="chip">Chip:</form:label>

            </div>
            <div class="form-floating mb-3 mt-3">
                <form:select path="ram" class="form-control">
                    <form:options items="${listRam}" itemLabel="dungLuong" itemValue="id"/>
                </form:select>
                <form:label class="form-label" path="ram">Ram:</form:label>

            </div>
            <div class="form-floating mb-3 mt-3">
                <form:select path="rom" class="form-control">
                    <form:options items="${listRom}" itemLabel="dungLuong" itemValue="id"/>
                </form:select>
                <form:label class="form-label" path="rom">Rom:</form:label>

            </div>
            <div class="form-floating mb-3 mt-3">
                <form:select path="pin" class="form-control">
                    <form:options items="${listPin}" itemLabel="dungLuongPin.thongSo" itemValue="id"/>
                </form:select>
                <form:label class="form-label" path="pin">Pin:</form:label>

            </div>

            <div class="form-floating mb-3 mt-3">
                <form:input class="form-control" placeholder="" path="urlAnh" type="file"/>
                <form:label class="form-label" path="urlAnh">Ảnh:</form:label>
                <form:errors path="urlAnh" cssStyle="color: red"></form:errors>
            </div>

        </div>
        <div class="col">
            <div class="form-floating mb-3 mt-3">
                <form:input class="form-control" placeholder="" path="giaNhap"/>
                <form:label class="form-label" path="giaNhap">Giá nhấp:</form:label>
                <form:errors path="giaNhap" cssStyle="color: red"></form:errors>
            </div>
            <div class="form-floating mb-3 mt-3">
                <form:input class="form-control" placeholder="" path="giaBan"/>
                <form:label class="form-label" path="giaBan">Giá bán:</form:label>
                <form:errors path="giaBan" cssStyle="color: red"></form:errors>
            </div>


            <div class="form-check mb-3 mt-3">
                <form:label class="form-label" path="tinhTrang">Tình Trạng:</form:label>
                <form:radiobutton path="tinhTrang" value="0"/>Ngừng kinh doanh
                <form:radiobutton path="tinhTrang" value="1" checked="true"/> Còn kinh doanh

            </div>
            <div class="form-floating mb-3 mt-3">
                <form:input class="form-control" placeholder="" path="namBaoHanh"/>
                <form:label class="form-label" path="namBaoHanh">Năm bảo hành:</form:label>
                <form:errors path="namBaoHanh" cssStyle="color: red"></form:errors>
            </div>
            <div class="form-floating mb-3 mt-3">
                <form:input class="form-control" placeholder="" path="soLuong"/>
                <form:label class="form-label" path="soLuong">Số lượng tồn:</form:label>
                <form:errors path="soLuong" cssStyle="color: red"></form:errors>
            </div>
            <div class="form-floating mb-3 mt-3">
                <form:textarea class="form-control" placeholder="" path="moTa"/>
                <form:label class="form-label" path="moTa">Mô tả:</form:label>
                <form:errors path="moTa" cssStyle="color: red"></form:errors>
            </div>
        </div>
    </div>


    <form:button type="submit" class="btn btn-primary"
                 onclick="if(!(confirm('Bạn có muốn cap nhat ? ')))return false;else return true">Update</form:button>
</form:form>
</body>
</html>