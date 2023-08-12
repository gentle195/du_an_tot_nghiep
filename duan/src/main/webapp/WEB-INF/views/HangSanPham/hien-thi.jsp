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
    <title>Hang San Pham</title>
    <link rel="icon" href="/images/favicon.ico" type="image/ico"/>

    <title>Gentelella Alela!</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://getbootstrap.com/docs/5.3/assets/css/docs.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.13/css/select2.min.css" rel="stylesheet"/>
    <link rel="icon" href="/images/favicon.ico" type="image/ico"/>
    <!-- Bootstrap -->
    <link href="/vendors/bootstrap/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Font Awesome -->
    <link href="/vendors/font-awesome/css/font-awesome.min.css" rel="stylesheet">
    <!-- NProgress -->
    <link href="/vendors/nprogress/nprogress.css" rel="stylesheet">
    <!-- iCheck -->
    <link href="/vendors/iCheck/skins/flat/green.css" rel="stylesheet">

    <!-- bootstrap-progressbar -->
    <link href="/vendors/bootstrap-progressbar/css/bootstrap-progressbar-3.3.4.min.css" rel="stylesheet">
    <!-- JQVMap -->
    <link href="/vendors/jqvmap/dist/jqvmap.min.css" rel="stylesheet"/>
    <!-- bootstrap-daterangepicker -->
    <link href="/vendors/bootstrap-daterangepicker/daterangepicker.css" rel="stylesheet">

    <!-- Custom Theme Style -->
    <link href="/build/css/custom.min.css" rel="stylesheet">
</head>
<body>
<form:form action="/add-hsp" method="post" modelAttribute="dulieuxem">
    <div class="row">
        <div class="col">
            <form:label path="ten"><b>Tên:</b></form:label>
            <form:input path="ten" class="form-control"></form:input>
            <form:errors path="ten"></form:errors>
        </div>
        <div class="col">
            <form:label path="xuatSu"><b>Xuất sứ:</b></form:label>
            <form:input path="xuatSu" class="form-control"></form:input>
            <form:errors path="xuatSu"></form:errors>
        </div>
        <div class="col">
            <form:label path="tinhTrang"><b>Tình Trạng:</b></form:label>
            <br>
            <form:radiobutton path="tinhTrang" label="Thế hệ mới" value="0"></form:radiobutton>
            <form:radiobutton path="tinhTrang" label="Thế hệ cũ" value="1"></form:radiobutton>
        </div>
        <div class="col">
            <form:label path="moTa"><b>Mô Tả:</b></form:label>
            <form:textarea path="moTa" class="form-control"></form:textarea>
            <form:errors path="moTa"></form:errors>
        </div>
        <div style="margin-top: 20px;margin-bottom: 20px">
            <button type="submit" class="btn btn-primary"
                    onclick="if(!(confirm('Bạn có muốn thực hiện thao tác này không ? ')))return false;">ADD
            </button>
        </div>
    </div>
</form:form>
<div class="">
    <div class="clearfix"></div>
    <div class="col-md-12 col-sm-12 ">
        <div class="x_panel">
            <div class="x_title">
                <h2>Responsive example<small>Users</small></h2>
                <ul class="nav navbar-right panel_toolbox">
                    <li><a class="collapse-link"><i class="fa fa-chevron-up"></i></a>
                    </li>
                    <li class="dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button"
                           aria-expanded="false"><i
                                class="fa fa-wrench"></i></a>
                        <div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
                            <a class="dropdown-item" href="#">Settings 1</a>
                            <a class="dropdown-item" href="#">Settings 2</a>
                        </div>
                    </li>
                    <li><a class="close-link"><i class="fa fa-close"></i></a>
                    </li>
                </ul>
                <div class="clearfix"></div>
            </div>
            <div class="x_content">
                <div class="row">
                    <div class="col-sm-12">
                        <div class="card-box table-responsive">
                            <p class="text-muted font-13 m-b-30">
                                Responsive is an extension for DataTables that resolves that problem by optimising the
                                table's layout for different screen sizes through the dynamic insertion and removal of
                                columns from the table.
                            </p>
                            <table id="datatable-responsive"
                                   class="table table-striped table-bordered dt-responsive nowrap"
                                   cellspacing="0" width="100%">
                                <thead>
                                <tr>
                                    <th>STT</th>
                                    <th>Mã</th>
                                    <th>Tên hãng</th>
                                    <th>Xuất sứ</th>
                                    <th>Ngày tạo</th>
                                    <th>Ngày cập nhật</th>
                                    <th>Tình trạng</th>
                                    <th>Mô tả </th>
                                    <th colspan="2">Action</th>
                                </tr>
                                </thead>
                                <tbody>
                                <c:forEach items="${hsp}" var="chip" varStatus="i">
                                    <tr>
                                        <td>${i.index+1}</td>
                                        <td>${chip.ma}</td>
                                        <td>${chip.ten}</td>
                                        <td>${chip.xuatSu}</td>
                                        <td>${chip.ngayTao}</td>
                                        <td>${chip.ngayCapNhat}</td>
                                        <td><c:if test="${chip.tinhTrang==0}">Thế hệ mới</c:if>
                                            <c:if test="${chip.tinhTrang==1}">Thế hệ cũ</c:if>
                                        </td>
                                        <td>${chip.moTa}</td>
                                        <td>
                                                <%--                                            <a href="/detail-chip/${chip.id}" class="btn btn-outline-primary"--%>
                                                <%--                                               tabindex="-1"--%>
                                                <%--                                               role="button"--%>
                                                <%--                                               onclick="if(!(confirm('Bạn có muốn thực hiện thao tác này không ? ')))return false;">Detail</a>--%>
                                            <a href="/delete-hsp/${chip.id}" class="btn btn-outline-primary"
                                               tabindex="-1"
                                               role="button"
                                               onclick="if(!(confirm('Bạn có muốn thực hiện thao tác này không ? ')))return false;">Delete</a>
                                            <a href="/view-update-hsp/${chip.id}" class="btn btn-outline-primary"
                                               tabindex="-1"
                                               role="button">Update</a>
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
        <%--hết--%>

        <nav aria-label="Page navigation example">
            <ul class="pagination justify-content-center pagination-lg">
                <li class="page-item"><a class="page-link" href="/rom/hien-thi?num=0">First</a></li>

                <c:forEach begin="1" end="${total}" varStatus="status">
                    <li class="page-item">
                        <a href="${pageContext.request.contextPath}/rom/hien-thi?num=${status.index -1}"
                           class="page-link">${status.index}</a>
                    </li>
                </c:forEach>

                <li class="page-item"><a class="page-link" href="/rom/hien-thi?num=${total-1}">Last</a></li>
            </ul>
        </nav>
        <br>
        <%--<div class="container">--%>
        <%--    <form:form action="/hang-san-pham/add" method="post" modelAttribute="dulieuxem">--%>
        <%--        <h1 style="text-align: center">Add Hãng Sản Phẩm</h1>--%>

        <%--        <table class="table " style="border: aliceblue 1px">--%>
        <%--            <tbody>--%>
        <%--            <tr>--%>
        <%--                <td> Tên:</td>--%>
        <%--                <th><form:input path="ten" id="tent"></form:input></th>--%>
        <%--                <td><form:errors path="ten" cssClass="error text-danger"/></td>--%>
        <%--            </tr>--%>
        <%--            </tbody>--%>
        <%--            <tbody>--%>
        <%--            <tr>--%>
        <%--                <td> Xuất Sứ:</td>--%>
        <%--                <th><form:input path="xuatSu" id="tent"></form:input></th>--%>
        <%--                <td><form:errors path="xuatSu" cssClass="error text-danger"/></td>--%>
        <%--            </tr>--%>
        <%--            </tbody>--%>
        <%--            <tbody>--%>
        <%--            <tr>--%>
        <%--                <td> Trang thai:</td>--%>
        <%--                <th><form:radiobutton path="tinhTrang" value="0" label="Hoạt động"></form:radiobutton>--%>
        <%--                    <form:radiobutton path="tinhTrang" value="1" label="Ngừng hoạt động"></form:radiobutton>--%>
        <%--                </th>--%>
        <%--            </tr>--%>
        <%--            </tbody>--%>
        <%--            <tbody>--%>
        <%--            <tr>--%>
        <%--                <td>Mo ta:</td>--%>
        <%--                <th><form:textarea path="moTa"></form:textarea></th>--%>
        <%--                <td><form:errors path="moTa" cssClass="error text-danger"/></td>--%>
        <%--            </tr>--%>
        <%--            </tbody>--%>
        <%--            <tr>--%>
        <%--                <td>--%>

        <%--                    <button type="submit" style="float: right" class="btn btn-success"--%>
        <%--                            id="btt" onclick="return myFunction1()">Add--%>
        <%--                    </button>--%>
        <%--                </td>--%>
        <%--                <th></th>--%>
        <%--            </tr>--%>
        <%--            </tbody>--%>

        <%--        </table>--%>
        <%--    </form:form>--%>
        <%--</div>--%>
</body>
<script>
    function myFunction1() {
        let text = "Bạn chắc chắn muốn thêm";
        let kt = confirm(text);
        if (kt == true) {
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

<script>
    document.addEventListener("DOMContentLoaded", function () {
        $('div[id^="nhapImei_"]').on('show.bs.modal', async function (e) {
            const ctspId = e.currentTarget.id.split("_")[1];
            const url = "http://localhost:8080/ban-hang/them-san-pham/" + ctspId;
            console.log(ctspId, url);
            try {
                const resp = await fetch(url);
                const data = await resp.json();
                console.log(data)
                let html = '';
                for (let i = 0; i < data.length; i++) {
                    const imei = data[i];
                    const tr = `
            <tr>
                <td>` + (i + 1) + `</td>
                <td>` + imei.soImei + `</td>
                <td>` + (imei.tinhTrang == 0 ? "Chưa bán" : "Đã bán") + `</td>
                <td><a href="/ban-hang/them-imei/` + imei.id + `">Thêm IMEI</a></td>
            </tr>
            `;
                    html += tr;
                }

                $("#listImei_" + ctspId).html(html);
            } catch (err) {
                console.error(err)
            }
        });
    });
</script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
<%--<script src="https://code.jquery.com/jquery-3.7.0.min.js"--%>
<%--        integrity="sha256-2Pmvv0kuTBOenSvLm6bvfBSSHrUJ+3A7x6P5Ebd07/g=" crossorigin="anonymous"></script>--%>
<script src="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.13/js/select2.min.js"></script>

<script>
    $(document).ready(function () {
        $('#selectSanPham').select2();
    });
    $(document).ready(function () {
        $('#selectRam').select2();
    });
    $(document).ready(function () {
        $('#selectRom').select2();
    });
    $(document).ready(function () {
        $('#selectPin').select2();
    });
    $(document).ready(function () {
        $('#selectMauSac').select2();
    });
    $(document).ready(function () {
        $('#selectChip').select2();
    });
</script>
</html>