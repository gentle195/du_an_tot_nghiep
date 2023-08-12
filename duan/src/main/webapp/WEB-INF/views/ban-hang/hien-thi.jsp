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
    <title>Bán Hàng</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
    <link href="https://getbootstrap.com/docs/5.3/assets/css/docs.css" rel="stylesheet">
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
<body class="container outer-border p-3 border border-secondary">
<section style="text-align: center">
    <div class="row outer-border border border-secondary" style="height: 40px">
        <div class="col-3">
            <form action="/ban-hang/add-hoa-don" method="post" style="text-align: center;margin-top: 6px">
                <button type="submit"><img src="/img/plus.png"></button>
            </form>
        </div>
        <div class="col-9">
            <div class="row">
                <c:forEach items="${listHoaDon}" var="hd" varStatus="i">
                    <div class="col-4">
                        <div>
                            <a href="/ban-hang/thong-tin-hoa-don/${hd.id}" class="btn btn-info"
                               id="toggleLink">${hd.ma}</a>
                        </div>
                    </div>
                </c:forEach>
            </div>
        </div>
    </div>
    <br>
    <div class="row " style="text-align: center">
        <h2 style="color: red">${thongBaoHoaDon}</h2>
    </div>
    <br>
    <c:if test="${hoaDon==null}">
        <div class="row outer-border border border-secondary" style="text-align: center">
            <h2 style="color: red">Mời chọn hóa đơn</h2>
        </div>
    </c:if>
    <c:if test="${hoaDon!=null}">
        <div class="row">
            <div class="outer-border p-3 border border-secondary">
                <div class="row">
                    <div class="col-6">
                        <div class="outer-border p-3 border border-secondary">
                            <div class="row">
                                <div class="col-6">
                                    <form method="post" action="/ban-hang/search-san-pham">
                                        <input type="text" name="search-san-pham"
                                               placeholder="Tìm kiếm sản phẩm">
                                        <button type="submit">Tìm kiếm</button>
                                    </form>
                                    <h6 style="text-align: center;color: red">${thongBao}</h6>
                                </div>
                                <div class="col-6">
                                    <a href="/ban-hang/hien-thi-san-pham" class="btn btn-info" data-bs-toggle="modal"
                                       data-bs-target="#hienThiSanPham">Lọc sản phẩm</a>
                                    <div class="modal fade" id="hienThiSanPham" tabindex="-1"
                                         aria-labelledby="hienThiSanPhamLable"
                                         aria-hidden="true">
                                        <div class="modal-dialog modal-dialog-centered modal-xl">
                                            <div class="modal-content">
                                                <div class="modal-body">
                                                    <table id="datatable-responsive"
                                                           class="table table-striped table-bordered dt-responsive nowrap"
                                                           cellspacing="0" width="100%">
                                                        <form action="/ban-hang/loc" method="post"
                                                              onsubmit="return checkLoc()">
                                                            <tr>
                                                                <td style="text-align: center" colspan="1">
                                                                    <select name="hang">
                                                                        <option selected disabled>Hãng</option>
                                                                        <c:forEach items="${listHang}" var="hang"
                                                                                   varStatus="i">
                                                                            <option value="${hang.id}">${hang.ten}</option>
                                                                        </c:forEach>
                                                                    </select>
                                                                </td>
                                                                <td style="text-align: center" colspan="1">
                                                                    <select name="ram">
                                                                        <option selected disabled>Ram</option>
                                                                        <c:forEach items="${listRam}" var="ram"
                                                                                   varStatus="i">
                                                                            <option value="${ram.id}">${ram.dungLuong}</option>
                                                                        </c:forEach>
                                                                    </select>
                                                                </td>
                                                                <td style="text-align: center" colspan="1">
                                                                    <select name="rom">
                                                                        <option selected disabled>Rom</option>
                                                                        <c:forEach items="${listRom}" var="rom"
                                                                                   varStatus="i">
                                                                            <option value="${rom.id}">${rom.dungLuong}</option>
                                                                        </c:forEach>
                                                                    </select>
                                                                </td>
                                                                <td style="text-align: center" colspan="1">
                                                                    <select name="dungLuongPin">
                                                                        <option selected disabled>Dung Lượng Pin
                                                                        </option>
                                                                        <c:forEach items="${dungLuongPin}" var="pin"
                                                                                   varStatus="i">
                                                                            <option value="${pin.id}">${pin.thongSo}</option>
                                                                        </c:forEach>
                                                                    </select>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td style="text-align: center" colspan="1">
                                                                    <select name="chip">
                                                                        <option selected disabled>Chip</option>
                                                                        <c:forEach items="${listChip}" var="chip"
                                                                                   varStatus="i">
                                                                            <option value="${chip.id}">${chip.ten}</option>
                                                                        </c:forEach>
                                                                    </select>
                                                                </td>
                                                                <td style="text-align: center" colspan="1">
                                                                    <select name="manHinh">
                                                                        <option selected disabled>Màn Hình</option>
                                                                        <c:forEach items="${listManHinh}" var="man"
                                                                                   varStatus="i">
                                                                            <option value="${man.id}">${man.thongSo}</option>
                                                                        </c:forEach>
                                                                    </select>
                                                                </td>
                                                                <td style="text-align: center" colspan="1">
                                                                    <select name="camera">
                                                                        <option selected disabled>Camera</option>
                                                                        <c:forEach items="${listCamera}" var="cam"
                                                                                   varStatus="i">
                                                                            <option value="${cam.id}">${cam.thongSo}</option>
                                                                        </c:forEach>
                                                                    </select>
                                                                </td>

                                                            </tr>
                                                            <tr>
                                                                <td style="text-align: center" colspan="2"><input
                                                                        type="number" name="giaBanMin"
                                                                        placeholder="Giá min"></td>
                                                                <td style="text-align: center" colspan="2"><input
                                                                        type="number" name="giaBanMax"
                                                                        placeholder="Giá max"></td>
                                                            </tr>
                                                            <tr>
                                                                <td style="text-align: center" colspan="4">
                                                                    <button class="btn btn-secondary">Lọc</button>
                                                                </td>
                                                            </tr>
                                                        </form>
                                                    </table>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <table class="table">
                                <thead>
                                <tr>
                                    <th>Mã Sản Phẩm</th>
                                    <th>Tên Sản Phẩm</th>
                                    <th>Hãng</th>
                                    <th>Đơn Giá</th>
                                    <th>Số Lượng</th>
                                    <th>Trạng Thái</th>
                                    <th></th>
                                </tr>
                                </thead>
                                <tbody>
                                <c:forEach items="${listChiTietSanPham}" var="ctsp">
                                    <tr>
                                        <td>${ctsp.sanPham.ma}</td>
                                        <td>${ctsp.sanPham.ten}</td>
                                        <td>${ctsp.sanPham.hangSanPham.ten}</td>
                                        <td>${ctsp.giaBan}</td>
                                        <td>${ctsp.soLuong}</td>
                                        <td>
                                            <c:if test="${ctsp.tinhTrang==1}">Còn hàng</c:if>
                                            <c:if test="${ctsp.tinhTrang==0}">Hết hàng</c:if>
                                        </td>
                                        <td class="btn-group">
                                            <a href="/ban-hang/them-san-pham/${ctsp.id}"
                                               class="btn btn-info"
                                               data-bs-toggle="modal" data-bs-target="#nhapImei_${ctsp.id}"
                                                <%--                                           onclick="openModal('nhapImei_${ctsp.id}')"--%>
                                            >
                                                Nhập IMEI</a>
                                            <div class="modal fade" id="nhapImei_${ctsp.id}" tabindex="-1"
                                                 aria-labelledby="exampleModalLabel"
                                                 aria-hidden="true" data-backdrop="static">
                                                <div class="modal-dialog modal-dialog-centered">
                                                    <div class="modal-content">
                                                        <div class="modal-header">
                                                            <h1 class="modal-title fs-5"
                                                                id="exampleModalLabel">Danh sách IMEI</h1>
                                                        </div>
                                                        <div class="modal-body">
                                                            <table class="table">
                                                                <tr>
                                                                        <%--                                                                <form method="post" action="/ban-hang/search-imei"--%>
                                                                        <%--                                                                      id="searchImeiForm">--%>
                                                                    <div>
                                                                        <th>Tìm kiếm IMEI: <input
                                                                                type="text"
                                                                                name="search-imei"
                                                                                placeholder="Tìm kiếm IMEI"
                                                                                id="imeiSearchInput"></th>
                                                                        <th>
                                                                            <button id="searchImei"
                                                                                    type="button">
                                                                                Tìm kiếm
                                                                            </button>
                                                                        </th>
                                                                    </div>
                                                                        <%--                                                                </form>--%>

                                                                    <h6 style="text-align: center"
                                                                        id="thongBaoIMEI">${thongBaoIMEI}</h6>
                                                                </tr>
                                                            </table>
                                                            <div>
                                                                <table class="table" id="table_id">
                                                                    <thead>
                                                                    <tr>
                                                                        <th>STT</th>
                                                                        <th>Số IMEI</th>
                                                                        <th>Trạng Thái</th>
                                                                        <th>Chức năng</th>
                                                                    </tr>
                                                                    </thead>
                                                                    <tbody id="listImei_${ctsp.id}"
                                                                           class="imei_search">
                                                                    </tbody>
                                                                </table>
                                                            </div>
                                                        </div>
                                                        <div class="modal-footer">
                                                            <button type="button" class="btn btn-secondary"
                                                                    data-bs-dismiss="modal">
                                                                Close
                                                            </button>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </td>
                                    </tr>
                                </c:forEach>
                                </tbody>
                            </table>
                        </div>
                    </div>
                        <%--                <div class="modal-footer">--%>
                        <%--                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close--%>
                        <%--                    </button>--%>
                        <%--                </div>--%>
                        <%--                <a href="/ban-hang/hien-thi-san-pham" class="btn btn-info" data-bs-toggle="modal"--%>
                        <%--                   data-bs-target="#hienThiSanPham">Thêm sản phẩm</a>--%>
                        <%--                <div class="modal fade" id="hienThiSanPham" tabindex="-1" aria-labelledby="hienThiSanPhamLable"--%>
                        <%--                     aria-hidden="true">--%>
                        <%--                    <div class="modal-dialog modal-dialog-centered modal-xl">--%>
                        <%--                        <div class="modal-content">--%>
                        <%--                            <div class="modal-body">--%>
                        <%--                                --%>
                        <%--                            </div>--%>
                        <%--                        </div>--%>
                        <%--                    </div>--%>
                        <%--                </div>--%>
                    <div class="col-6">
                        <div class="outer-border p-3 border border-secondary">
                            <table class="table">
                                <thead>
                                <tr>
                                        <%--                            <th>STT</th>--%>
                                    <th>Tên Sản Phẩm</th>
                                    <th>Số IMEI</th>
                                    <th>Đơn Giá</th>
                                    <th>Số Lượng</th>
                                    <th>Thành tiền</th>
                                    <th>Chức năng</th>
                                </tr>
                                </thead>
                                <tbody>
                                <c:forEach items="${listHoaDonChiTiet}" var="hdct" varStatus="i">
                                    <tr>
                                            <%--                                <td>${i.index+1}</td>--%>
                                        <td>${hdct.imei.chiTietSanPham.sanPham.ten}</td>
                                        <td>${hdct.imei.soImei}</td>
                                        <td>${hdct.donGia}</td>
                                        <td>${hdct.soLuong}</td>
                                        <td>${hdct.donGia * hdct.soLuong}</td>
                                        <td class="btn-group">
                                            <button class="btn btn-info"><a
                                                    href="/ban-hang/delete-hoa-don-chi-tiet/${hdct.id}"
                                                    style="text-decoration: none">Xóa sản phẩm</a>
                                            </button>
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
        <br>
        <c:if test="${not listHoaDonChiTiet.isEmpty()}">
            <div class="row">
                <div class="col-12 outer-border p-3 border border-secondary">
                    <form:form action="/ban-hang/thanh-toan/${hoaDon.id}" modelAttribute="hoaDon" method="post">
                        <div class="row">
                            <div class="col-6">
                                <label style="text-align: center">Thông Tin Hóa Đơn</label>
                                <div class="form-floating mb-3 mt-3">
                                    <form:input class="form-control" path="ma" readonly="true"/>
                                    <form:label class="form-label" path="ma">Mã Hóa Đơn:</form:label>
                                </div>

                                <div class="form-floating mb-3 mt-3">
                                    <form:select path="nhanVien" class="form-control">
                                        <form:options items="${listNhanVien}" itemLabel="hoTen" itemValue="id"/>
                                    </form:select>
                                    <form:label class="form-label" path="nhanVien">Nhân Viên:</form:label>
                                </div>
                                <div class="row">
                                    <div class="form-floating mb-3 mt-3 col-9">
                                        <form:select path="khachHang" class="form-control">
                                            <form:options items="${listKhachHang}" itemLabel="hoTen" itemValue="id"/>
                                        </form:select>
                                        <form:label class="form-label" path="khachHang">Khách Hàng:</form:label>
                                    </div>
                                    <div class="form-floating mb-2 mt-3 col-3">
                                        <a href="/ban-hang/modal-khach-hang" class="btn btn-secondary"
                                           data-bs-toggle="modal"
                                           data-bs-target="#newKhachHang">Thêm khách hàng</a>
                                    </div>
                                </div>
                                <div class="form-floating mb-3 mt-3">
                                    <form:select path="diaChi" class="form-control">
                                        <form:options items="${listDiaChi}" itemLabel="diaChi" itemValue="id"/>
                                    </form:select>
                                    <form:label class="form-label" path="diaChi">Địa Chỉ:</form:label>
                                </div>
                            </div>
                            <div class="col-6">
                                <div class="form-floating mb-3 mt-3">
                                    <form:input class="form-control" path="sdt"/>
                                    <form:label class="form-label" path="sdt">Số điện thoại:</form:label>
                                </div>

                                <div class="form-floating mb-3 mt-3">
                                    <form:input class="form-control" path="tongTien" readonly="true" value="${tong}"
                                                id="tienCanThanhToan"/>
                                    <form:label class="form-label" path="tongTien"
                                                for="tienCanThanhToan">Tổng tiền:</form:label>
                                </div>

                                <div class="form-floating mb-3 mt-3">
                                    <input class="form-control" type="text" id="tienKhachDua"/>
                                    <label class="form-label">Tiền Khách Gửi:</label>
                                </div>

                                <div class="form-floating mb-3 mt-3">
                                    <input class="form-control" type="text" id="ketQua" readonly/>
                                    <label class="form-label" for="ketQua">Tiền Thừa:</label>
                                </div>

                                <div class="form-floating mb-3 mt-3">
                                    <form:textarea class="form-control" path="ghiChu"/>
                                    <form:label class="form-label" path="ghiChu">Ghi Chú:</form:label>
                                </div>
                                <div class="form-floating mb-3 mt-3">
                                    <button type="submit" class="btn btn-primary" onclick="return myFunction4()">Thanh
                                        Toán
                                    </button>
                                </div>
                            </div>
                        </div>
                    </form:form>
                </div>
            </div>
        </c:if>
    </c:if>
    <div class="modal fade" id="newKhachHang" tabindex="-1" aria-labelledby="khachHangLabel"
         aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered">
            <div class="modal-content">
                <div class="modal-header">
                </div>
                <div class="modal-body">
                    <form:form modelAttribute="modalAddKhachHang"
                               action="/ban-hang/add-khach-hang" method="post">
                        <div class="row">
                            <div class="col-6">
                                <div class="form-floating mb-3 mt-3">
                                    <form:input class="form-control" placeholder=""
                                                path="hoTen"/>
                                    <form:label class="form-label"
                                                path="hoTen">Họ Tên Khách Hàng:</form:label>
                                    <form:errors path="hoTen"
                                                 cssStyle="color: red"/>
                                </div>

                                <div class="form-floating mb-3 mt-3">
                                    <form:input class="form-control" placeholder=""
                                                path="email"/>
                                    <form:label class="form-label"
                                                path="email">Email:</form:label>
                                    <form:errors path="email"
                                                 cssStyle="color: red"/>
                                </div>
                                <div class="form-floating mb-3 mt-3">
                                    <form:input class="form-control" placeholder="" path="sdt"/>
                                    <form:label class="form-label" path="sdt">SĐT:</form:label>
                                    <form:errors path="sdt"
                                                 cssStyle="color: red"/>
                                </div>
                                <div class="form-floating mb-3 mt-3">
                                    <form:input class="form-control" placeholder=""
                                                path="ngaySinh" type="date"/>
                                    <form:label class="form-label"
                                                path="ngaySinh">Ngày Sinh Khách Hàng:</form:label>
                                </div>
                                <div class="form-floating mb-3 mt-3">
                                    <form:input class="form-control" placeholder=""
                                                type="number"
                                                path="diem"/>
                                    <form:label class="form-label"
                                                path="diem">Điểm:</form:label>
                                    <form:errors path="diem"
                                                 cssStyle="color: red"/>
                                </div>
                            </div>
                            <div class="col-6">
                                <div class="form-check mb-3 mt-3">
                                    <form:label class="form-label"
                                                path="gioiTinh">Giới Tính:</form:label>
                                    <form:radiobutton path="gioiTinh"
                                                      value="true" checked="true"/>Nam
                                    <form:radiobutton path="gioiTinh"
                                                      value="false"/>Nữ
                                </div>
                                <div class="form-floating mb-3 mt-3">
                                    <form:input class="form-control" placeholder=""
                                                path="taiKhoan"/>
                                    <form:label class="form-label"
                                                path="taiKhoan">Tài Khoản:</form:label>
                                    <form:errors path="taiKhoan"
                                                 cssStyle="color: red"/>
                                </div>
                                <div class="form-floating mb-3 mt-3">
                                    <form:input class="form-control" placeholder=""
                                                path="matKhau"/>
                                    <form:label class="form-label"
                                                path="matKhau">Mật Khẩu:</form:label>
                                    <form:errors path="matKhau"
                                                 cssStyle="color: red"/>
                                </div>
                                <div class="form-floating mb-3 mt-3 ">
                                    <form:select path="hangKhachHang" class="form-control">
                                        <form:options items="${listHangKhachHang}"
                                                      itemLabel="ten"
                                                      itemValue="id"/>
                                    </form:select>
                                    <form:label class="form-label"
                                                path="hangKhachHang">Hạng Khách Hàng:</form:label>
                                </div>
                                <div class="form-floating mb-3 mt-3">
                                    <button type="submit" class="btn btn-primary"
                                    >Thêm Khách Hàng
                                    </button>
                                </div>
                            </div>
                        </div>
                    </form:form>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">
                        Close
                    </button>
                </div>
            </div>
        </div>
    </div>
</section>
</body>
<script src="https://code.jquery.com/jquery-3.7.0.min.js"
        integrity="sha256-2Pmvv0kuTBOenSvLm6bvfBSSHrUJ+3A7x6P5Ebd07/g=" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm"
        crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-w76AqPfDkMBDXo30jS1Sgez6pr3x5MlQ1ZAGC+nuZB+EYdgRZgiwxhTBTkF7CXvN"
        crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"
        integrity="sha384-oBqDVmMz9ATKxIep9tiCxS/Z9fNfEXiDAYTujMAeBAsjFuCZSmKbSSUnQlmh/jp3"
        crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.min.js"
        integrity="sha384-mQ93GR66B00ZXjt0YO5KlohRA5SY2XofN4zfuZxLkoj1gXtW8ANNCe9d5Y3eG5eD"
        crossorigin="anonymous"></script>
<script>
    function myFunction1() {
        let text = "Bạn chắc chắn muốn thêm";
        let kt = confirm(text);
        if (kt == true) {
            return true
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

    function myFunction4() {
        let text = "Bạn chắc chắn muốn thanh toán không";
        let kt = confirm(text);
        if (kt == true) {
            confirm("Thanh toán thành công");
            return true
        } else {
            return false;
        }
    }

    document.getElementById("tienKhachDua").addEventListener("keyup", function () {
        tinhTienThua();
    });

    function tinhTienThua() {
        var tongTien = parseFloat(document.getElementById("tienCanThanhToan").value);
        var tienKhachDua = parseFloat(document.getElementById("tienKhachDua").value);
        var tienThua = tienKhachDua - tongTien;

        var ketQuaElement = document.getElementById("ketQua");
        if (tienThua >= 0) {
            ketQuaElement.value = tienThua.toFixed(2);
        } else {
            ketQuaElement.value = "Khách đưa không đủ tiền.";
        }
    }

</script>
<script>
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
</script>
<script>
    $('button[id^="searchImei"]').on('click', async function (e) {
        const btn = $(this);
        const parentModal = btn.closest('.modal'); // Lấy modal cha gần nhất của nút "Tìm kiếm" được nhấn
        const search = parentModal.find("#imeiSearchInput").val();
        const url = "http://localhost:8080/ban-hang/search-imei?search-imei=" + search;
        try {
            const resp = await fetch(url);
            const data = await resp.json();
            console.log(data)
            let html = ``;
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
            parentModal.find(".imei_search").html(html);
        } catch (err) {
            console.error(err)
        }
    });
</script>
<!-- jQuery -->
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
<script src="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.13/js/select2.min.js"></script>

</html>