<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!doctype html>
<html lang="en">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <!-- Meta, title, CSS, favicons, etc. -->
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="icon" href="../../images/favicon.ico" type="image/ico" />
    <!-- Bootstrap -->
    <link href="../vendors/bootstrap/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Font Awesome -->
    <link href="../vendors/font-awesome/css/font-awesome.min.css" rel="stylesheet">
    <!-- NProgress -->
    <link href="../vendors/nprogress/nprogress.css" rel="stylesheet">
    <!-- iCheck -->
    <link href="../vendors/iCheck/skins/flat/green.css" rel="stylesheet">

    <!-- bootstrap-progressbar -->
    <link href="../vendors/bootstrap-progressbar/css/bootstrap-progressbar-3.3.4.min.css" rel="stylesheet">
    <!-- JQVMap -->
    <link href="../vendors/jqvmap/dist/jqvmap.min.css" rel="stylesheet"/>
    <!-- bootstrap-daterangepicker -->
    <link href="../vendors/bootstrap-daterangepicker/daterangepicker.css" rel="stylesheet">

    <!-- Custom Theme Style -->
    <link href="../../build/css/custom.min.css" rel="stylesheet">
</head>
<body>


<br>

<form:form action="/hang-khach-hang/update" method="post" modelAttribute="hkh">
    <P style="display: none">
        <form:input path="id"></form:input>
    </P>
    <table class="table">
        <thead>
        <tr>

            <th scope="col">MA</th>
            <th scope="col">
                <P><form:input path="ma" readonly="true"></form:input></P>
            </th>

        </tr>
        </thead>
        <thead>
        <tr>

            <th scope="col">TEN</th>
            <th scope="col">
                <form:input path="ten"></form:input><br>
                <form:errors path="ten" cssClass="error text-danger"/>
            </th>

        </tr>
        </thead>
        <thead>
        <tr>

            <th scope="col">DIEM TOI THIEU</th>
            <th scope="col">
                <form:input path="diem_toi_thieu" type="number" id="dtt"></form:input><br>
                <form:errors path="diem_toi_thieu" cssClass="error text-danger"/>
            </th>

        </tr>
        </thead>

        <thead>
        <tr style="display: none">

            <th scope="col">NGAY TAO</th>
            <th scope="col">
                <form:input path="ngayTao" type="date"></form:input><br>


            </th>

        </tr>
        </thead>

        <thead>
        <tr style="display: none">

            <th scope="col">NGAY CAP NHAT</th>
            <th scope="col">
                <form:input path="ngayCapNhat" type="date"></form:input>
            </th>

        </tr>
        </thead>

        <thead>
        <tr style="display: none">

            <th scope="col">TINH TRANG</th>
            <th scope="col">
                <form:radiobutton path="tinhTrang" label="YES" value="0"></form:radiobutton><br>
                <form:radiobutton path="tinhTrang" label="NO" value="1"></form:radiobutton>
            </th>
        </tr>
        </thead>

        <thead>
        <tr>
            <th scope="col">Mo TA</th>
            <th scope="col">
                <form:textarea path="moTa" type="text"></form:textarea><br>
                <form:errors path="moTa" cssClass="error text-danger"/>
            </th>
        </tr>
        </thead>
        <thead>
        <tr>

            <th scope="col"></th>
            <th scope="col">
                <BUTTON type="submit" class="btn btn-primary" onclick="return tb()">UPDATE</BUTTON>
            </th>

        </tr>
        </thead>
    </table>
</form:form>


<script>
    function tb() {
        var dtt = document.getElementById("dtt").value;
        if (confirm("Bạn muốn dùng chức năng") == true) {

            return true;

        }
        return false;
    }

</script>


<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-w76AqPfDkMBDXo30jS1Sgez6pr3x5MlQ1ZAGC+nuZB+EYdgRZgiwxhTBTkF7CXvN"
        crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"
        integrity="sha384-oBqDVmMz9ATKxIep9tiCxS/Z9fNfEXiDAYTujMAeBAsjFuCZSmKbSSUnQlmh/jp3"
        crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.min.js"
        integrity="sha384-mQ93GR66B00ZXjt0YO5KlohRA5SY2XofN4zfuZxLkoj1gXtW8ANNCe9d5Y3eG5eD"
        crossorigin="anonymous"></script>
</body>

<!-- jQuery -->
<script src="../vendors/jquery/dist/jquery.min.js"></script>
<!-- Bootstrap -->
<script src="../vendors/bootstrap/dist/js/bootstrap.bundle.min.js"></script>
<!-- FastClick -->
<script src="../vendors/fastclick/lib/fastclick.js"></script>
<!-- NProgress -->
<script src="../vendors/nprogress/nprogress.js"></script>
<!-- Chart.js -->
<script src="../vendors/Chart.js/dist/Chart.min.js"></script>
<!-- gauge.js -->
<script src="../vendors/gauge.js/dist/gauge.min.js"></script>
<!-- bootstrap-progressbar -->
<script src="../vendors/bootstrap-progressbar/bootstrap-progressbar.min.js"></script>
<!-- iCheck -->
<script src="../vendors/iCheck/icheck.min.js"></script>
<!-- Skycons -->
<script src="../vendors/skycons/skycons.js"></script>
<!-- Flot -->
<script src="../vendors/Flot/jquery.flot.js"></script>
<script src="../vendors/Flot/jquery.flot.pie.js"></script>
<script src="../vendors/Flot/jquery.flot.time.js"></script>
<script src="../vendors/Flot/jquery.flot.stack.js"></script>
<script src="../vendors/Flot/jquery.flot.resize.js"></script>
<!-- Flot plugins -->
<script src="../vendors/flot.orderbars/js/jquery.flot.orderBars.js"></script>
<script src="../vendors/flot-spline/js/jquery.flot.spline.min.js"></script>
<script src="../vendors/flot.curvedlines/curvedLines.js"></script>
<!-- DateJS -->
<script src="../vendors/DateJS/build/date.js"></script>
<!-- JQVMap -->
<script src="../vendors/jqvmap/dist/jquery.vmap.js"></script>
<script src="../vendors/jqvmap/dist/maps/jquery.vmap.world.js"></script>
<script src="../vendors/jqvmap/examples/js/jquery.vmap.sampledata.js"></script>
<!-- bootstrap-daterangepicker -->
<script src="../vendors/moment/min/moment.min.js"></script>
<script src="../vendors/bootstrap-daterangepicker/daterangepicker.js"></script>

<!-- Custom Theme Scripts -->
<script src="../../build/js/custom.min.js"></script>
</html>