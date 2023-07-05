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
<h3 style="color: black; text-align: center"><b>Thêm Sản phẩm giảm giá</b></h3>
<form:form action="/san-pham-giam-gia/add" class="container" method="post" modelAttribute="sanphamgiamgia">
    <div class="row">
        <div class="col">
            <div class="form-floating mb-3 mt-3">
                <form:select path="chiTietSanPham" class="form-control">
                    <form:options items="${listCTSP}" itemLabel="sanPham.ten" itemValue="id"/>
                </form:select>
                <form:label class="form-label" path="chiTietSanPham">San Pham:</form:label>

            </div>
            <div class="form-floating mb-3 mt-3">
                <form:select path="khuyenMai" class="form-control">
                    <form:options items="${listKM}" itemLabel="ma" itemValue="id"/>
                </form:select>
                <form:label class="form-label" path="khuyenMai">Khuyen mai:</form:label>

            </div>



        </div>
        <div class="col">
            <div class="form-check mb-3 mt-3">
                <form:label class="form-label" path="tinhTrang">Tình Trạng:</form:label>
                <form:radiobutton path="tinhTrang" value="0"/>Không hoạt động
                <form:radiobutton path="tinhTrang" value="1" checked="true"/> Hoạt động
                <form:errors path="tinhTrang" cssStyle="color: red"></form:errors>
            </div>
            <div class="form-floating mb-3 mt-3">
                <form:textarea class="form-control" placeholder="" path="moTa"/>
                <form:label class="form-label" path="moTa">Mota:</form:label>
                <form:errors path="moTa" cssStyle="color: red"></form:errors>
            </div>


        </div>
    </div>

    <form:button type="submit" class="btn btn-primary"
                 onclick="if(!(confirm('Bạn có muốn them ? ')))return false;else return true">Add</form:button>


</form:form>

</body>
</html>