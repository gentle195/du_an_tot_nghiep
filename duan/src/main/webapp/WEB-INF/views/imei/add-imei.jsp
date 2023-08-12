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
<h3 style="color: black; text-align: center"><b>Thêm Imei</b></h3>
<form:form action="/imei/add" class="container" method="post" modelAttribute="imei">
    <div class="row">
        <div class="col">
            <div class="form-floating mb-3 mt-3">
                <form:select path="chiTietSanPham" class="form-control">
                    <form:options items="${listCTSP}" itemLabel="sanPham.ten" itemValue="id"/>
                </form:select>
                <form:label class="form-label" path="chiTietSanPham">San Pham:</form:label>

            </div>
            <div class="form-floating mb-3 mt-3">
                <form:input class="form-control" placeholder="" path="ma" value="${ma}" readonly="true"/>
                <form:label class="form-label" path="ma">Ma:</form:label>
                <form:errors path="ma" cssStyle="color: red"></form:errors>
            </div>
            <div class="form-floating mb-3 mt-3">
                <form:input class="form-control" placeholder="" path="soImei"/>
                <form:label class="form-label" path="soImei">Imei:</form:label>
                <form:errors path="soImei" cssStyle="color: red"></form:errors>
            </div>
        </div>
        <div class="col">
            <div class="form-check mb-3 mt-3">
                <form:label class="form-label" path="tinhTrang">Tình Trạng:</form:label>
                <form:radiobutton path="tinhTrang" value="0" label="Chưa bán" checked="true"/>
                <form:radiobutton path="tinhTrang" value="1" label="Đã bán"/>
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
<script src="/vendors/jquery/dist/jquery.min.js"></script>
<!-- Bootstrap -->
<script src="/vendors/bootstrap/dist/js/bootstrap.bundle.min.js"></script>
<!-- FastClick -->
<script src="/vendors/fastclick/lib/fastclick.js"></script>
<!-- NProgress -->
<script src="/vendors/nprogress/nprogress.js"></script>
<!-- Chart.js -->
<script src="/vendors/Chart.js/dist/Chart.min.js"></script>
<!-- gauge.js -->
<script src="/vendors/gauge.js/dist/gauge.min.js"></script>
<!-- bootstrap-progressbar -->
<script src="/vendors/bootstrap-progressbar/bootstrap-progressbar.min.js"></script>
<!-- iCheck -->
<script src="/vendors/iCheck/icheck.min.js"></script>
<!-- Skycons -->
<script src="/vendors/skycons/skycons.js"></script>
<!-- Flot -->
<script src="/vendors/Flot/jquery.flot.js"></script>
<script src="/vendors/Flot/jquery.flot.pie.js"></script>
<script src="/vendors/Flot/jquery.flot.time.js"></script>
<script src="/vendors/Flot/jquery.flot.stack.js"></script>
<script src="/vendors/Flot/jquery.flot.resize.js"></script>
<!-- Flot plugins -->
<script src="/vendors/flot.orderbars/js/jquery.flot.orderBars.js"></script>
<script src="/vendors/flot-spline/js/jquery.flot.spline.min.js"></script>
<script src="/vendors/flot.curvedlines/curvedLines.js"></script>
<!-- DateJS -->
<script src="/vendors/DateJS/build/date.js"></script>
<!-- JQVMap -->
<script src="/vendors/jqvmap/dist/jquery.vmap.js"></script>
<script src="/vendors/jqvmap/dist/maps/jquery.vmap.world.js"></script>
<script src="/vendors/jqvmap/examples/js/jquery.vmap.sampledata.js"></script>
<!-- bootstrap-daterangepicker -->
<script src="/vendors/moment/min/moment.min.js"></script>
<script src="/vendors/bootstrap-daterangepicker/daterangepicker.js"></script>

<!-- Custom Theme Scripts -->
<script src="/build/js/custom.min.js"></script>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
<%--<script src="https://code.jquery.com/jquery-3.7.0.min.js"--%>
<%--        integrity="sha256-2Pmvv0kuTBOenSvLm6bvfBSSHrUJ+3A7x6P5Ebd07/g=" crossorigin="anonymous"></script>--%>
<script src="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.13/js/select2.min.js"></script>
</html>