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
    <title>San Pham</title>
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
    <style>
        <style>
        .form-container {
            width: 80%;
            margin: 0 auto;
        }

        .form-row {
            display: flex;
            align-items: center;
            gap: 10px; /* Khoảng cách giữa các ô */
            margin-bottom: 10px; /* Khoảng cách giữa các dòng */
        }

        /* Tuỳ chỉnh CSS của bạn ở đây */

        label {
            min-width: 150px; /* Độ rộng tối thiểu cho nhãn */
            text-align: right;
        }
    </style>
    </style>
</head>
<body>
<div class="form-container">
    <form:form action="/add-sp" method="post" modelAttribute="dulieuxem">
        <h1 style="text-align: center">Add Sản Phẩm</h1>

        <div class="form-row">
            <label for="ten">Tên:</label>
            <form:input path="ten" id="ten"/>
            <form:errors path="ten" cssClass="error text-danger"/>

            <label for="heDieuHanh">Hệ điều hành:</label>
            <form:input path="heDieuHanh" id="heDieuHanht"/>
            <form:errors path="heDieuHanh" cssClass="error text-danger"/>

            <label for="soSim">Số khe sim:</label>
            <form:input path="soSim" type="number"/>
            <form:errors path="soSim" cssClass="error text-danger"/>
        </div>

        <div class="form-row">
            <label for="bluetooth">Kết nối bluetooth:</label>
            <form:input path="bluetooth"/>
            <form:errors path="bluetooth" cssClass="error text-danger"/>

            <label for="hoTroMang">Hỗ trợ mạng:</label>
            <form:input path="hoTroMang"/>
            <form:errors path="hoTroMang" cssClass="error text-danger"/>

            <label for="congGiaoTiep">Cổng giao tiếp:</label>
            <form:input path="congGiaoTiep"/>
            <form:errors path="congGiaoTiep" cssClass="error text-danger"/>
        </div>

        <div class="form-row">
            <label for="thongSoWifi">Thông số Wifi:</label>
            <form:input path="thongSoWifi"/>
            <form:errors path="thongSoWifi" cssClass="error text-danger"/>

            <label for="kichThuoc">Kích thước sản phẩm:</label>
            <form:input path="kichThuoc"/>
            <form:errors path="kichThuoc" cssClass="error text-danger"/>

            <label for="trongLuong">Trọng lượng:</label>
            <form:input path="trongLuong"/>
            <form:errors path="trongLuong" cssClass="error text-danger"/>
        </div>

        <div class="form-row">
            <label for="chatLieu">Chất liệu:</label>
            <form:input path="chatLieu"/>
            <form:errors path="chatLieu" cssClass="error text-danger"/>

            <label for="tinhTrang">Trạng thái:</label>
            <div>
                <form:radiobutton path="tinhTrang" value="0" label="Hoạt động"/>
                <form:radiobutton path="tinhTrang" value="1" label="Ngừng hoạt động"/>
            </div>

            <label for="moTa">Mô tả:</label>
            <form:textarea path="moTa"/>
            <form:errors path="moTa" cssClass="error text-danger"/>
        </div>

        <div class="form-row">
            <label for="hangSanPham">Hãng Sản Phẩm:</label>
            <form:select path="hangSanPham" items="${listHangSP}" itemValue="id" itemLabel="ten"/>
            <div class="btn-group">
                <a class="btn btn-secondary" data-bs-toggle="modal" data-bs-target="#exampleModalHangSanPham">
                    <img src="https://emojigraph.org/media/twitter/plus_2795.png" style="width: 25px; height: 60%">
                </a>
            </div>

            <label for="manHinh">Màn Hình:</label>
            <form:select path="manHinh" items="${listManHinh}" itemValue="id" itemLabel="thongSo"/>
            <div class="btn-group">
                <a class="btn btn-secondary" data-bs-toggle="modal" data-bs-target="#exampleModalManHinh">
                    <img src="https://emojigraph.org/media/twitter/plus_2795.png" style="width: 25px; height: 60%">
                </a>
            </div>

            <label for="camera">Camera:</label>
            <form:select path="camera" items="${listCamera}" itemValue="id" itemLabel="thongSo"/>
            <div class="btn-group">
                <a class="btn btn-secondary" data-bs-toggle="modal" data-bs-target="#exampleModalCamera">
                    <img src="https://emojigraph.org/media/twitter/plus_2795.png" style="width: 25px; height: 60%">
                </a>
            </div>
        </div>

        <!-- Thêm các trường khác vào đây -->

        <div class="form-row">
            <button type="submit" class="btn btn-success" id="btt" onclick="return myFunction1()">Add</button>
        </div>

    </form:form>
</div>

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
                                    <th>Mã SP</th>
                                    <th>Tên SP</th>
                                    <th>Thông số bluetooth</th>
                                    <th>Hỗ trợ mạng</th>
                                    <th>Cổng giao tiếp</th>
                                    <th>Thông số wifi</th>
                                    <th>Kich thước</th>
                                    <th>Trọng lượng</th>
                                    <th>Chất liệu máy</th>
                                    <th>Hệ điều hành</th>
                                    <th>Số khe sim</th>
                                    <th>Ngày tạo</th>
                                    <th>Ngày cập nhật</th>
                                    <th>Tình trạng</th>
                                    <th>Mô tả</th>
                                    <th>Hãng</th>
                                    <th colspan="2">Action</th>
                                </tr>
                                </thead>
                                <tbody>
                                <c:forEach items="${hsp}" var="list" varStatus="i">
                                    <tr>
                                        <td>${i.index+1}</td>
                                        <td>${list.ma}</td>
                                        <td>${list.ten}</td>
                                        <td>${list.bluetooth}</td>
                                        <td>${list.hoTroMang}</td>
                                        <td>${list.congGiaoTiep}</td>
                                        <td>${list.thongSoWifi}</td>
                                        <td>${list.kichThuoc}</td>
                                        <td>${list.trongLuong}</td>
                                        <td>${list.chatLieu}</td>
                                        <td>${list.heDieuHanh}</td>
                                        <td>${list.soSim}</td>
                                        <td>${list.ngayTao}</td>
                                        <td>${list.ngayCapNhat}</td>
                                        <td><c:if test="${list.tinhTrang==0}">Hoạt động</c:if>
                                            <c:if test="${list.tinhTrang==1}">Ngừng hoạt động</c:if>
                                        </td>
                                        <td>${list.moTa}</td>
                                        <td>${list.hangSanPham.ten}</td>
                                        <td>
                                                <%--                                            <a href="/detail-chip/${chip.id}" class="btn btn-outline-primary"--%>
                                                <%--                                               tabindex="-1"--%>
                                                <%--                                               role="button"--%>
                                                <%--                                               onclick="if(!(confirm('Bạn có muốn thực hiện thao tác này không ? ')))return false;">Detail</a>--%>
                                            <a href="/delete-sp/${list.id}" class="btn btn-outline-primary"
                                               tabindex="-1"
                                               role="button"
                                               onclick="if(!(confirm('Bạn có muốn thực hiện thao tác này không ? ')))return false;">Delete</a>
                                            <a href="/view-update-sp/${list.id}" class="btn btn-outline-primary"
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

</body>
<div class="modal fade" id="exampleModalManHinh" tabindex="-1" aria-labelledby="exampleModalLabelManHinh"
     aria-hidden="true" data-backdrop="static">
    <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content">
            <div class="modal-header">
                <h1 class="modal-title fs-5" id="exampleModalLabelManHinh">Màn Hình</h1>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <div id="imeiList">
                    <table class="table">
                        <form:form action="/san-pham/modal-add-man-hinh" method="post" modelAttribute="manHinh">
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
                    </table>
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
            </div>
        </div>
    </div>
</div>
<div class="modal fade" id="exampleModalHangSanPham" tabindex="-1" aria-labelledby="exampleModalLabelHangSanPham"
     aria-hidden="true" data-backdrop="static">
    <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content">
            <div class="modal-header">
                <h1 class="modal-title fs-5" id="exampleModalLabelHangSanPham">Hãng SP</h1>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <div id="imeiList">
                    <table class="table">
                        <form:form action="/san-pham/modal-add-hang-sp" method="post" modelAttribute="hangSP">
                            <h1 style="text-align: center">Add Hãng Sản Phẩm</h1>

                            <table class="table " style="border: aliceblue 1px">
                                <tbody>
                                <tr>
                                    <td> Tên:</td>
                                    <th><form:input path="ten" id="tent"></form:input></th>
                                    <td><form:errors path="ten" cssClass="error text-danger"/></td>
                                </tr>
                                </tbody>
                                <tbody>
                                <tr>
                                    <td> Xuất Sứ:</td>
                                    <th><form:input path="xuatSu" id="tent"></form:input></th>
                                    <td><form:errors path="xuatSu" cssClass="error text-danger"/></td>
                                </tr>
                                </tbody>
                                <tbody>
                                <tr>
                                    <td> Trang thai:</td>
                                    <th><form:radiobutton path="tinhTrang" value="0" label="Hoạt động"></form:radiobutton>
                                        <form:radiobutton path="tinhTrang" value="1" label="Ngừng hoạt động"></form:radiobutton>
                                    </th>
                                </tr>
                                </tbody>
                                <tbody>
                                <tr>
                                    <td>Mo ta:</td>
                                    <th><form:textarea path="moTa"></form:textarea></th>
                                    <td><form:errors path="moTa" cssClass="error text-danger"/></td>
                                </tr>
                                </tbody>
                                <tr>
                                    <td>

                                        <button type="submit" style="float: right" class="btn btn-success"
                                                id="btt" onclick="return myFunction1()">Add
                                        </button>
                                    </td>
                                    <th></th>
                                </tr>
                                </tbody>

                            </table>
                        </form:form>
                    </table>
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
            </div>
        </div>
    </div>
</div>
<div class="modal fade" id="exampleModalCamera" tabindex="-1" aria-labelledby="exampleModalLabelCamera"
     aria-hidden="true" data-backdrop="static">
    <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content">
            <div class="modal-header">
                <h1 class="modal-title fs-5" id="exampleModalLabelCamera">Camera</h1>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <div id="imeiList">
                    <table class="table">
                        <form:form action="/san-pham/modal-add-camera" method="post" modelAttribute="camera">
                            <h1 style="text-align: center">ADD Thông Tin Camera</h1>
                            <table class="table " style="border: aliceblue 1px">
                                <tbody>
                                <tr>
                                    <td><form:label path="thongSo">Thông số camera</form:label></td>
                                    <th><form:input path="thongSo" id="tent"></form:input></th>
                                    <th><form:errors path="thongSo" cssClass="error text-danger"></form:errors></th>
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
                    </table>
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
            </div>
        </div>
    </div>
</div>
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
        let text = "Bạn chắc chắn muốn sửa";
        let kt = confirm(text);
        if (kt == true) {
            return true
        } else {
            return false;
        }
    }

    function myFunction4() {
        let text = "Bạn chắc chắn muốn xóa";
        let kt = confirm(text);
        if (kt == true) {
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
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.13/js/select2.min.js"></script>
</html>