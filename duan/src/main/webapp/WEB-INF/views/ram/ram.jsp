<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!doctype html>
<html lang="en">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <!-- Meta, title, CSS, favicons, etc. -->
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="icon" href="../../images/favicon.ico" type="image/ico"/>
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

<form:form action="/ram/add-ram" method="post" modelAttribute="r">
    <table class="tb">
        <tr style="text-align: center">
            <thead>
            <tr>
                <th><form:label path="dungLuong">Dung lượng: </form:label></th>
                <th><form:input path="dungLuong"></form:input>
                    <form:errors path="dungLuong"></form:errors>
                </th>
            <thead>
            <tr>
                <th><form:label path="tinhTrang">Tình trạng</form:label></th>
                <th><form:radiobutton path="tinhTrang" label="Còn dùng" value="0"></form:radiobutton>
                    <form:radiobutton path="tinhTrang" label="Không còn dùng" value="1"></form:radiobutton></th>
                </th>
            </tr>
            </thead>

            <thead>
            <tr>
                <th><form:label path="moTa">Mô tả</form:label></th>
                <th><form:textarea path="moTa"></form:textarea>
                    <form:errors path="moTa"></form:errors></th>
            </tr>
            </thead>
            <thead>

            </thead>
        </tr>
        <tr>
            <button type="submit" class="btn btn-primary" onclick="validateForm()">ADD</button>
        </tr>
    </table>
</form:form>


<div class="clearfix">
    <div class="col-md-12 col-sm-12 ">
        <div class="x_panel">
            <div class="x_title">
                <h2>Thông tin Chip</h2>
                <div class="clearfix"></div>
            </div>
            <div class="x_content">
                <div class="row">
                    <div class="col-sm-12">
                        <div class="card-box table-responsive">
                            <table id="datatable-responsive"
                                   class="table table-striped table-bordered dt-responsive nowrap"
                                   cellspacing="0" width="100%">
                                <thead>
                                <tr>
                                    <th scope="col">#</th>
                                    <th scope="col">Mã</th>
                                    <th scope="col">Dung lượng</th>
                                    <th scope="col">Ngày tạo</th>
                                    <th scope="col">Ngày cập nhật</th>
                                    <th scope="col">Tình trạng</th>
                                    <th scope="col">Mô tả</th>

                                    <th scope="col">Action</th>
                                </tr>
                                </thead>
                                <tbody>
                                <c:forEach items="${duLieu}" var="ram" varStatus="i">
                                    <tr>
                                        <th scope="row">${i.index+1}</th>
                                        <td>${ram.ma}</td>
                                        <td>${ram.dungLuong}</td>
                                        <td>${ram.ngayTao}</td>
                                        <td>${ram.ngayCapNhat}</td>
                                        <td>${ram.trangThai()}</td>
                                        <td>${ram.moTa}</td>


                                        <td>
                                            <a href="/ram/view-update-ram/${ram.id}" class="btn btn-success">Update</a>
                                            <a href="/ram/remove-ram/${ram.id}" class="btn btn-success">Delete</a>
                                        </td>
                                    </tr>
                                </c:forEach>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>



<br>
<br>
<div>
    <nav aria-label="Page navigation example">
        <ul class="pagination justify-content-center pagination-lg">
            <li class="page-item">
                <a class="page-link" href="/ram/hien-thi?num=0">Previous</a>
            </li>
            <c:forEach begin="1" end="${tongSoTrang}" varStatus="STT">
                <li class="page-item"><a class="page-link" href="/ram/hien-thi?num=${STT.index-1}">${STT.index}</a>
                </li>
            </c:forEach>
            <li class="page-item">
                <a class="page-link" href="/ram/hien-thi?num=${tongSoTrang-1}">Next</a>
            </li>
        </ul>
    </nav>
</div>
<script>
    function validateForm() {
        var tenValue = document.querySelector('input[name="dungLuong"]').value;
        var moTaValue = document.querySelector('textarea[name="moTa"]').value;

        if (tenValue.trim() === '') {
            alert('Vui lòng không để trống trường dung lượng');
            return false;
        }

        if (moTaValue.trim() === '') {
            alert('Vui lòng không để trống trường Mô tả');
            return false;
        }
    }
</script>
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