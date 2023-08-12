<%@ page import="java.util.List" %>
<%@ page import="com.example.demo.models.ChiTietSanPham" %>
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

    <title>Document</title>
</head>
<body>
<section style="text-align: center">
    <h3 style="color: black; text-align: center"><b>Imei</b></h3>
    <%--    <form action="/imei/add">--%>
    <%--        <button type="submit" class="btn btn-primary">Add Imei</button>--%>
    <%--    </form>--%>
    <br>
    <div class="row outer-border border border-secondary">
        <form:form action="/imei/add" class="container" method="post" modelAttribute="imei">
            <div class="row">
                <div class="col-12">
                    <div class="form-floating mb-3 mt-3">
                        <div class="row">
                            <div class="col-11">
                                <form:select path="chiTietSanPham" class="form-control" id="selectSanPham"
                                             cssStyle="font-weight: bold; width: 100%">
                                    <option selected disabled>Sản phẩm</option>
                                    <form:options items="${listCTSP}" itemLabel="sanPham.ten" itemValue="id"/>
                                </form:select>
                            </div>
                            <div class="col-1">
                                <a type="button" data-bs-toggle="modal" data-bs-target="#exampleModalSanPham">
                                    <img src="../img/plus.png">
                                </a>
                            </div>
                        </div>
                    </div>

                    <div class="form-floating mb-3 mt-3">
                        <div class="row">
                            <div class="col-11">
                                <form:label class="form-label" path="ma">Ma:</form:label>
                                <form:input class="form-control" placeholder="" path="ma" value="${ma}"
                                            readonly="true"/>

                                <form:errors path="ma" cssStyle="color: red"></form:errors>
                            </div>

                        </div>
                    </div>
                    <div class="form-floating mb-3 mt-3">
                        <div class="row">
                            <div class="col-11">
                                <form:label class="form-label" path="soImei">Imei:</form:label>
                                <form:input class="form-control" placeholder="" path="soImei"/>

                                <form:errors path="soImei" cssStyle="color: red"></form:errors>
                            </div>

                        </div>
                    </div>
                    <div class="form-floating mb-3 mt-3">
                        <div class="row">
                            <div class="col-11">
                                <form:label class="form-label" path="tinhTrang">Tình Trạng:</form:label>
                                <form:radiobutton path="tinhTrang" value="0" label="Chưa bán" checked="true"/>
                                <form:radiobutton path="tinhTrang" value="1" label="Đã bán"/>
                                <form:errors path="tinhTrang" cssStyle="color: red"></form:errors>
                            </div>

                        </div>
                    </div>
                    <div class="form-floating mb-3 mt-3">
                        <div class="row">
                            <div class="col-11">
                                <form:label class="form-label" path="moTa">Mô tả:</form:label>
                                <form:textarea class="form-control" placeholder="" path="moTa"/>

                                <form:errors path="moTa" cssStyle="color: red"></form:errors>
                            </div>

                        </div>
                    </div>


                </div>

            </div>

            <form:button type="submit" class="btn btn-primary"
                         onclick="if(!(confirm('Bạn có muốn thêm ? ')))return false;else return true">Add</form:button>
        </form:form>
    </div>
    <div class="modal fade" id="exampleModalSanPham" tabindex="-1" aria-labelledby="exampleModalLabelSanPham"
         aria-hidden="true" data-backdrop="static">
        <div class="modal-dialog modal-dialog-centered">
            <div class="modal-content">
                <div class="modal-header">
                    <h1 class="modal-title fs-5" id="exampleModalLabelSanPham">Sản Phẩm</h1>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <div>
                        <table class="table"><form:form action="/chi-tiet-san-pham/modal-add-chi-tiet-san-pham" method="post"
                                                        modelAttribute="chitietsanpham">
                            <h1 style="text-align: center">Add Chi Tiết Sản Phẩm</h1>

                            <table class="table " style="border: aliceblue 1px">
                                <tbody>
                                <tr>
                                <td>
                                    <form:select path="sanPham" class="form-control" id="selectSanPham"
                                                 cssStyle="font-weight: bold; width: 100%">
                                        <option selected disabled>Sản phẩm</option>
                                        <form:options items="${listSanPham}" itemLabel="ten" itemValue="id"/>
                                    </form:select>
                                </td>
                                    <td>
                                        <a type="button" target="_blank"  href="/san-pham/hien-thi">
                                            <img src="../img/plus.png">
                                        </a>
                                    </td>
                                </tr>
                                </tbody>
                                <tbody>
                                <tr>
                                <td>
                                    <form:select path="mauSac" class="form-control" id="selectMauSac"
                                                 cssStyle="font-weight: bold; width: 100%">
                                        <option selected disabled>Màu sắc</option>
                                        <form:options items="${listMauSac}" itemLabel="ten" itemValue="id"/>
                                    </form:select>
                                </td>
                                    <td>
                                        <a type="button" target="_blank" href="/mau-sac/hien-thi" >
                                            <img src="../img/plus.png">
                                        </a>
                                    </td>
                                </tr>
                                </tbody>
                                <tbody>
                                <tr>
                                    <td>
                                        <form:select path="chip" class="form-control" id="selectChip"
                                                     cssStyle="font-weight: bold; width: 100%">
                                            <option selected disabled>Chip</option>
                                            <form:options items="${listChip}" itemLabel="ten" itemValue="id"/>
                                        </form:select>
                                    </td>
                                    <td>
                                        <a type="button" target="_blank" href="/chip/hien-thi" >
                                            <img src="../img/plus.png">
                                        </a>
                                    </td>
                                </tr>
                                </tbody>
                                <tbody>
                                <tr>
                                    <td>
                                        <form:select path="ram" class="form-control" id="selectRam"
                                                     cssStyle="font-weight: bold; width: 100%">
                                            <option selected disabled>Dung lượng bộ nhớ</option>
                                            <form:options items="${listRam}" itemLabel="dungLuong" itemValue="id"/>
                                        </form:select>
                                    </td>
                                    <td>
                                        <a type="button" target="_blank" href="/ram/hien-thi" >
                                            <img src="../img/plus.png">
                                        </a>
                                    </td>
                                </tr>
                                </tbody>
                                <tbody>
                                <tr>
                                    <td>
                                        <form:select path="rom"  class="form-control" id="selectRom"
                                                     cssStyle="font-weight: bold; width: 100%">
                                            <option selected disabled>Dung lượng lưu trữ</option>
                                            <form:options items="${listRom}" itemLabel="dungLuong" itemValue="id"/>
                                        </form:select>
                                    </td>
                                    <td>
                                        <a type="button" target="_blank" href="/rom/hien-thi" >
                                            <img src="../img/plus.png">
                                        </a>
                                    </td>
                                </tr>
                                </tbody>
                                <tbody>
                                <tr>
                                    <td>
                                        <form:select path="pin" class="form-control"
                                                     cssStyle="font-weight: bold; width: 100%">
                                            <option selected disabled>Pin</option>
                                            <form:options items="${listPin}" itemLabel="dungLuongPin.thongSo" itemValue="id"/>
                                        </form:select>
                                    </td>
                                    <td>
                                        <a type="button" target="_blank" href="/pin/hien-thi" >
                                            <img src="../img/plus.png">
                                        </a>
                                    </td>
                                </tr>
                                </tbody>
                                <tbody>
                                <tr>
                                    <form:label class="form-label" path="tinhTrang">Tình Trạng:</form:label>
                                    <form:radiobutton path="tinhTrang" value="0"/>Ngừng kinh doanh
                                    <form:radiobutton path="tinhTrang" value="1" checked="true"/> Còn kinh doanh
                                </tr>
                                </tbody>
                                <tbody>
                                <tr>
                                    <form:input class="form-control" placeholder="" path="giaNhap"/>
                                    <form:label class="form-label" path="giaNhap">Giá nhấp:</form:label>
                                    <form:errors path="giaNhap" cssStyle="color: red"/>
                                </tr>
                                </tbody>
                                <tbody>
                                <tr>
                                    <form:input class="form-control" placeholder="" path="giaBan"/>
                                    <form:label class="form-label" path="giaBan">Giá bán:</form:label>
                                    <form:errors path="giaBan" cssStyle="color: red"/>
                                </tr>
                                </tbody>
                                <tbody>
                                <tr>
                                    <form:input class="form-control" placeholder="" path="urlAnh" type="file"/>
                                    <form:label class="form-label" path="urlAnh">Ảnh:</form:label>
                                    <form:errors path="urlAnh" cssStyle="color: red"/>
                                </tr>
                                </tbody>
                                <tbody>
                                <tr>
                                    <form:input class="form-control" placeholder="" path="namBaoHanh"/>
                                    <form:label class="form-label" path="namBaoHanh">Năm bảo hành:</form:label>
                                    <form:errors path="namBaoHanh" cssStyle="color: red"/>
                                </tr>
                                </tbody>
                                <tbody>
                                <tr>
                                    <form:input class="form-control" placeholder="" path="soLuong"/>
                                    <form:label class="form-label" path="soLuong">Số lượng tồn:</form:label>
                                    <form:errors path="soLuong" cssStyle="color: red"/>
                                </tr>
                                </tbody>
                                <tbody>
                                <tr>
                                    <form:textarea class="form-control" placeholder="" path="moTa"/>
                                    <form:label class="form-label" path="moTa">Mô tả:</form:label>
                                    <form:errors path="moTa" cssStyle="color: red"/>
                                </tr>
                                </tbody>


                                </tbody>
                            </table>
                            <form:button type="submit" class="btn btn-primary"
                                         onclick="if(!(confirm('Bạn có muốn thêm ? ')))return false;else return true">Add</form:button>

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
    <div>
        <form action="/imei/search" method="post" onsubmit="return checkSearch()">
            <table class="table">
                <tr>
                    <td style="text-align: center" colspan="10">Tìm Kiếm: <input type="text" name="search"
                                                                                 style="text-align: center ;">
                        <button class="btn btn-secondary">Search</button>
                    </td>
                </tr>
            </table>
        </form>
        <%--        <form action="/imei/loc" method="post" onsubmit="return checkLoc()">--%>
        <%--            <table class="table">--%>
        <%--                <tr>--%>
        <%--                    <td style="text-align: center" colspan="1">Hãng Điện Thoại</td>--%>
        <%--                    <td style="text-align: center" colspan="1">Ram</td>--%>
        <%--                    <td style="text-align: center" colspan="1">Dung Lượng Bộ Nhớ</td>--%>
        <%--                    <td style="text-align: center" colspan="1">Dung Lượng Pin</td>--%>
        <%--                    <td style="text-align: center" colspan="1">Chip</td>--%>
        <%--                </tr>--%>
        <%--                <tr>--%>
        <%--                    <td style="text-align: center" colspan="1">--%>
        <%--                        <select name="hang">--%>
        <%--                            <option selected disabled>Hãng</option>--%>
        <%--                            <c:forEach items="${listHang}" var="hang" varStatus="i">--%>

        <%--                                <option value="${hang.id}">${hang.ten}</option>--%>
        <%--                            </c:forEach>--%>
        <%--                        </select>--%>
        <%--                    </td>--%>
        <%--                    <td style="text-align: center" colspan="1">--%>
        <%--                        <select name="ram">--%>
        <%--                            <option selected disabled>Ram</option>--%>
        <%--                            <c:forEach items="${listRam}" var="ram" varStatus="i">--%>

        <%--                                <option value="${ram.id}">${ram.dungLuong}</option>--%>
        <%--                            </c:forEach>--%>
        <%--                        </select>--%>
        <%--                    </td>--%>
        <%--                    <td style="text-align: center" colspan="1">--%>
        <%--                        <select name="rom">--%>
        <%--                            <option selected disabled>Rom</option>--%>
        <%--                            <c:forEach items="${listRom}" var="rom" varStatus="i">--%>

        <%--                                <option value="${rom.id}">${rom.dungLuong}</option>--%>
        <%--                            </c:forEach>--%>
        <%--                        </select>--%>
        <%--                    </td>--%>
        <%--                    <td style="text-align: center" colspan="1">--%>
        <%--                        <select name="dungLuongPin">--%>
        <%--                            <option selected disabled>Dung Lượng Pin</option>--%>
        <%--                            <c:forEach items="${dungLuongPin}" var="pin" varStatus="i">--%>
        <%--                                <option value="${pin.id}">${pin.thongSo}</option>--%>
        <%--                            </c:forEach>--%>
        <%--                        </select>--%>
        <%--                    </td>--%>
        <%--                    <td style="text-align: center" colspan="1">--%>
        <%--                        <select name="chip">--%>
        <%--                            <option selected disabled>Chip</option>--%>
        <%--                            <c:forEach items="${listChip}" var="chip" varStatus="i">--%>

        <%--                                <option value="${chip.id}">${chip.ten}</option>--%>
        <%--                            </c:forEach>--%>
        <%--                        </select>--%>
        <%--                    </td>--%>
        <%--                </tr>--%>
        <%--                <tr>--%>
        <%--                    <td style="text-align: center" colspan="2">Màn Hình</td>--%>
        <%--                    <td style="text-align: center" colspan="1">Camera</td>--%>
        <%--                    <td style="text-align: center" colspan="1">Giá Bán Min</td>--%>
        <%--                    <td style="text-align: center" colspan="1">Giá bán Max</td>--%>
        <%--                </tr>--%>
        <%--                <tr>--%>

        <%--                    <td style="text-align: center" colspan="2">--%>
        <%--                        <select name="manHinh">--%>
        <%--                            <option selected disabled>Màn Hình</option>--%>
        <%--                            <c:forEach items="${listManHinh}" var="man" varStatus="i">--%>
        <%--                                <option value="${man.id}">${man.thongSo}</option>--%>
        <%--                            </c:forEach>--%>
        <%--                        </select>--%>
        <%--                    </td>--%>
        <%--                    <td style="text-align: center" colspan="1">--%>
        <%--                        <select name="camera">--%>
        <%--                            <option selected disabled>Camera</option>--%>
        <%--                            <c:forEach items="${listCamera}" var="cam" varStatus="i">--%>
        <%--                                <option value="${cam.id}">${cam.thongSo}</option>--%>
        <%--                            </c:forEach>--%>
        <%--                        </select>--%>
        <%--                    </td>--%>
        <%--                    <td style="text-align: center" colspan="1"><input type="number" name="giaBanMin"></td>--%>
        <%--                    <td style="text-align: center" colspan="1"><input type="number" name="giaBanMin"></td>--%>
        <%--                </tr>--%>
        <%--                <tr>--%>
        <%--                    <td style="text-align: center" colspan="7">--%>
        <%--                        <button class="btn btn-secondary">Lọc</button>--%>
        <%--                    </td>--%>
        <%--                </tr>--%>
        <%--            </table>--%>
        <%--        </form>--%>
    </div>
    <c:if test="${listImei.isEmpty()}">
        <div class="container">
            <h4>Không có sản phẩm !</h4>
        </div>
    </c:if>
    <c:if test="${not listImei.isEmpty()}">
        <table class="table container">
            <thead>
            <tr>
                <th scope="col">Tên sản phẩm</th>
                <th scope="col">Ma</th>
                <th scope="col">Imei</th>
                <th scope="col">Ngày tạo</th>
                <th scope="col">Tình trạng</th>
                <th scope="col">Mô tả</th>

            </tr>
            </thead>
            <tbody>
            <c:forEach items="${listImei}" var="imei" varStatus="index">
                <tr>
                    <td>${imei.chiTietSanPham.sanPham.ten}</td>
                    <td>${imei.ma}</td>
                    <td>${imei.soImei}</td>
                    <td>${imei.ngayTao}</td>
                    <td>${imei.tinhTrang==1?"Đã bán":"Chưa bán"}</td>
                    <td>${imei.moTa}</td>


                    <td>
                        <a href="/imei/view-update/${imei.id}" class="btn btn-success">Update</a>
                        <a href="#" onclick="remove('/imei/remove/${imei.id}')" class="btn btn-danger">Delete</a>

                    </td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
        <ul class="pagination justify-content-center pagination-lg">
            <li class="page-item"><a class="page-link" href="/imei/hien-thi?pageNum=0">First</a></li>
            <c:forEach begin="1" end="${total}" varStatus="status">
                <li class="page-item">
                    <a href="/imei/hien-thi?pageNum=${status.index -1}"
                       class="page-link">${status.index}</a>
                </li>
            </c:forEach>
            <li class="page-item"><a class="page-link" href="/imei/hien-thi?pageNum=${total-1}">Last</a>
            </li>
        </ul>
    </c:if>
    <div class="modal fade" id="exampleModalPin" tabindex="-1" aria-labelledby="exampleModalLabel"
         aria-hidden="true" data-backdrop="static">
        <div class="modal-dialog modal-dialog-centered">
            <div class="modal-content">
                <div class="modal-header">
                    <h1 class="modal-title fs-5" id="exampleModalLabelPin">Pin</h1>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <div>
                        <table class="table">
                            <form:form action="/chi-tiet-san-pham/modal-add-pin" method="post" modelAttribute="Pin">
                                <div class="row">
                                    <div class="col">
                                        <form:label path="loaiPin"><b>Loại Pin:</b></form:label>
                                        <form:input path="loaiPin" class="form-control"/>
                                        <form:errors path="loaiPin"/>
                                    </div>
                                    <div class="col">
                                        <form:label path="congNghePin"><b>Công nghệ Pin:</b></form:label>
                                        <form:input path="congNghePin" class="form-control"/>
                                        <form:errors path="congNghePin"/>
                                    </div>
                                    <div class="col">
                                        <form:label path="moTa"><b>Mô Tả:</b></form:label>
                                        <form:textarea path="moTa" class="form-control"/>
                                        <form:errors path="moTa"/>
                                    </div>
                                    <div class="col">
                                        <form:label path="dungLuongPin"><b>Dung Lượng:</b></form:label>
                                        <form:select path="dungLuongPin" items="${dungLuongPin}" class="form-control"
                                                     itemLabel="thongSo"
                                                     itemValue="id"/>
                                    </div>
                                    <div style="margin-top: 20px; margin-bottom: 20px">
                                        <button type="submit" class="btn btn-primary"
                                                onclick="if(!(confirm('Bạn có muốn thực hiện thao tác này không ? ')))return false;">
                                            ADD
                                        </button>
                                    </div>
                                </div>
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
    <%--Chip--%>
    <div class="modal fade" id="exampleModalChip" tabindex="-1" aria-labelledby="exampleModalLabelChip"
         aria-hidden="true" data-backdrop="static">
        <div class="modal-dialog modal-dialog-centered">
            <div class="modal-content">
                <div class="modal-header">
                    <h1 class="modal-title fs-5" id="exampleModalLabelChip">Chip</h1>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <div>
                        <table class="table">
                            <form:form action="/chi-tiet-san-pham/modal-add-chip" method="post" modelAttribute="chip">
                                <div class="row">
                                    <div class="col">
                                        <form:label path="ten"><b>Tên:</b></form:label>
                                        <form:input path="ten" class="form-control"/>
                                        <form:errors path="ten"/>
                                    </div>
                                    <div class="col">
                                        <form:label path="loaiChip"><b>Loại Chip:</b></form:label>
                                        <form:input path="loaiChip" class="form-control"/>
                                        <form:errors path="loaiChip"/>
                                    </div>
                                    <div class="col">
                                        <form:label path="soNhan"><b>Số nhân:</b></form:label>
                                        <form:input path="soNhan" class="form-control" type="number"/>
                                        <form:errors path="soNhan"/>
                                    </div>
                                    <div class="col">
                                        <form:label path="tinhTrang"><b>Tình Trạng:</b></form:label>
                                        <br>
                                        <form:radiobutton path="tinhTrang" label="Thế hệ mới"
                                                          value="0"/>
                                        <form:radiobutton path="tinhTrang" label="thế hệ cũ"
                                                          value="1"/>
                                    </div>
                                    <div class="col">
                                        <form:label path="moTa"><b>Mô Tả:</b></form:label>
                                        <form:textarea path="moTa" class="form-control"/>
                                        <form:errors path="moTa"/>
                                    </div>
                                    <div style="margin-top: 20px;margin-bottom: 20px">
                                        <button type="submit" class="btn btn-primary"
                                                onclick="if(!(confirm('Bạn có muốn thực hiện thao tác này không ? ')))return false;">
                                            ADD
                                        </button>
                                    </div>
                                </div>

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
    <%--Màu sắc--%>
    <div class="modal fade" id="exampleModalMauSac" tabindex="-1" aria-labelledby="exampleModalLabelMauSac"
         aria-hidden="true" data-backdrop="static">
        <div class="modal-dialog modal-dialog-centered">
            <div class="modal-content">
                <div class="modal-header">
                    <h1 class="modal-title fs-5" id="exampleModalLabelMauSac">Màu Sắc</h1>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <div>
                        <table class="table">
                            <form:form action="/chi-tiet-san-pham/modal-add-mau-sac" method="post"
                                       modelAttribute="mauSac">
                                <div class="row">
                                    <div class="col">
                                        <form:label path="ten"><b>Tên:</b></form:label>
                                        <form:input path="ten" class="form-control"/>
                                        <form:errors path="ten"/>
                                    </div>
                                    <div class="col">
                                        <form:label path="moTa"><b>Mô Tả:</b></form:label>
                                        <form:textarea path="moTa" class="form-control"/>
                                        <form:errors path="moTa"/>
                                    </div>
                                    <div style="margin-top: 20px;margin-bottom: 20px">
                                        <button type="submit" class="btn btn-primary"
                                                onclick="if(!(confirm('Bạn có muốn thực hiện thao tác này không ? ')))return false;">
                                            ADD
                                        </button>
                                    </div>
                                </div>

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
    <div class="modal fade" id="exampleModalRam" tabindex="-1" aria-labelledby="exampleModalLabelRam"
         aria-hidden="true" data-backdrop="static">
        <div class="modal-dialog modal-dialog-centered">
            <div class="modal-content">
                <div class="modal-header">
                    <h1 class="modal-title fs-5" id="exampleModalLabelRam">Ram</h1>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <div>
                        <table class="table">
                            <form:form action="/chi-tiet-san-pham/modal-add-ram" method="post" modelAttribute="ram">
                                <div class="row">
                                    <div class="col">
                                        <form:label path="dungLuong"><b>Dung Lượng:</b></form:label>
                                        <form:input path="dungLuong" class="form-control"/>
                                        <form:errors path="dungLuong"/>
                                    </div>
                                    <div class="col">
                                        <form:label path="tinhTrang"><b>Tình Trạng:</b></form:label>
                                        <br>
                                        <form:radiobutton path="tinhTrang" label="Còn dùng"
                                                          value="0"/>
                                        <form:radiobutton path="tinhTrang" label="Không còn dùng"
                                                          value="1"/>
                                    </div>
                                    <div class="col">
                                        <form:label path="moTa"><b>Mô Tả:</b></form:label>
                                        <form:textarea path="moTa" class="form-control"/>
                                        <form:errors path="moTa"/>
                                    </div>
                                    <div style="margin-top: 20px;margin-bottom: 20px">
                                        <button type="submit" class="btn btn-primary"
                                                onclick="if(!(confirm('Bạn có muốn thực hiện thao tác này không ? ')))return false;">
                                            ADD
                                        </button>
                                    </div>
                                </div>
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
    <div class="modal fade" id="exampleModalRom" tabindex="-1" aria-labelledby="exampleModalLabelRom"
         aria-hidden="true" data-backdrop="static">
        <div class="modal-dialog modal-dialog-centered">
            <div class="modal-content">
                <div class="modal-header">
                    <h1 class="modal-title fs-5" id="exampleModalLabelRom">Rom</h1>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <div>
                        <table class="table">
                            <form:form action="/chi-tiet-san-pham/modal-add-rom" method="post" modelAttribute="rom">
                                <div class="row">
                                    <div class="col">
                                        <form:label path="dungLuong"><b>Dung Lượng:</b></form:label>
                                        <form:input path="dungLuong" class="form-control"/>
                                        <form:errors path="dungLuong"/>
                                    </div>
                                    <div class="col">
                                        <form:label path="tinhTrang"><b>Tình Trạng:</b></form:label>
                                        <br>
                                        <form:radiobutton path="tinhTrang" label="Còn dùng"
                                                          value="0"/>
                                        <form:radiobutton path="tinhTrang" label="Không còn dùng"
                                                          value="1"/>
                                    </div>
                                    <div class="col">
                                        <form:label path="moTa"><b>Mô Tả:</b></form:label>
                                        <form:textarea path="moTa" class="form-control"></form:textarea>
                                        <form:errors path="moTa"/>
                                    </div>
                                    <div style="margin-top: 20px;margin-bottom: 20px">
                                        <button type="submit" class="btn btn-primary"
                                                onclick="if(!(confirm('Bạn có muốn thực hiện thao tác này không ? ')))return false;">
                                            ADD
                                        </button>
                                    </div>
                                </div>
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
    <div class="modal fade" id="exampleModalSanPham" tabindex="-1" aria-labelledby="exampleModalLabelSanPham"
         aria-hidden="true" data-backdrop="static">
        <div class="modal-dialog modal-dialog-centered">
            <div class="modal-content">
                <div class="modal-header">
                    <h1 class="modal-title fs-5" id="exampleModalLabelSanPham">Sản Phẩm</h1>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <div>
                        <table class="table"><form:form action="/chi-tiet-san-pham/modal-add-san-pham" method="post"
                                                        modelAttribute="sanPham">
                            <h1 style="text-align: center">Add Sản Phẩm</h1>

                            <table class="table " style="border: aliceblue 1px">
                                <tbody>
                                <tr>
                                    <td><form:label path="ten">Tên:</form:label></td>
                                    <th><form:input path="ten" id="tent"/></th>
                                    <th><form:errors path="ten" cssClass="error text-danger"/></th>
                                </tr>
                                </tbody>
                                <tbody>
                                <tr>
                                    <td><form:label path="heDieuHanh">Hệ điều hành:</form:label></td>
                                    <th><form:input path="heDieuHanh" id="heDieuHanht"/></th>
                                    <th><form:errors path="heDieuHanh" cssClass="error text-danger"/></th>
                                </tr>
                                </tbody>
                                <tbody>
                                <tr>
                                    <td><form:label path="soSim">Số khe sim:</form:label></td>
                                    <th><form:input path="soSim" type="number"/></th>
                                    <th><form:errors path="soSim" cssClass="error text-danger"/></th>
                                </tr>
                                </tbody>
                                <tbody>
                                <tr>
                                    <td><form:label path="bluetooth">Kết nối bluetooth:</form:label></td>
                                    <th><form:input path="bluetooth"/></th>
                                    <th><form:errors path="bluetooth" cssClass="error text-danger"/></th>
                                </tr>
                                </tbody>
                                <tbody>
                                <tr>
                                    <td><form:label path="hoTroMang">Hỗ trợ mạng:</form:label></td>
                                    <th><form:input path="hoTroMang"/></th>
                                    <th><form:errors path="hoTroMang" cssClass="error text-danger"/></th>
                                </tr>
                                </tbody>
                                <tbody>
                                <tr>
                                    <td><form:label path="congGiaoTiep">Cổng giao tiếp:</form:label></td>
                                    <th><form:input path="congGiaoTiep"/></th>
                                    <th><form:errors path="congGiaoTiep"
                                                     cssClass="error text-danger"/></th>
                                </tr>
                                </tbody>
                                <tbody>
                                <tr>
                                    <td><form:label path="thongSoWifi">Thông số Wifi:</form:label></td>
                                    <th><form:input path="thongSoWifi"/></th>
                                    <th><form:errors path="thongSoWifi" cssClass="error text-danger"/></th>
                                </tr>
                                </tbody>
                                <tbody>
                                <tr>
                                    <td><form:label path="kichThuoc">Kích thước sản phẩm:</form:label></td>
                                    <th><form:input path="kichThuoc"/></th>
                                    <th><form:errors path="kichThuoc" cssClass="error text-danger"/></th>
                                </tr>
                                </tbody>
                                <tbody>
                                <tr>
                                    <td><form:label path="trongLuong">Trọng lượng:</form:label></td>
                                    <th><form:input path="trongLuong"/></th>
                                    <th><form:errors path="trongLuong" cssClass="error text-danger"/></th>
                                </tr>
                                </tbody>
                                <tbody>
                                <tr>
                                    <td><form:label path="chatLieu">Chất liệu:</form:label></td>
                                    <th><form:input path="chatLieu"/></th>
                                    <th><form:errors path="chatLieu" cssClass="error text-danger"/></th>
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
                                    <th><form:errors path="moTa" cssClass="error text-danger"/></th>
                                </tr>
                                </tbody>
                                <tbody>
                                <tr>
                                    <td><form:label path="hangSanPham">Hãng Sản Phẩm</form:label></td>
                                    <th><form:select path="hangSanPham" items="${listHang}" itemValue="id"
                                                     itemLabel="ten"/></th>
                                </tr>
                                </tbody>
                                <tbody>
                                <tr>
                                    <td><form:label path="manHinh">Màn Hình</form:label></td>
                                    <th><form:select path="manHinh" items="${listManHinh}" itemValue="id"
                                                     itemLabel="thongSo"/></th>
                                </tr>
                                </tbody>
                                <tbody>
                                <tr>
                                    <td><form:label path="camera">Camera</form:label></td>
                                    <th><form:select path="camera" items="${listCamera}" itemValue="id"
                                                     itemLabel="thongSo"/></th>
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
</section>
<script>
    function remove(url) {
        var confirmed = false;
        var message = confirm("ban co muon xoa?");
        if (message) {
            confirmed = true;
            alert("Xoa thanh cong");
        } else {
            confirmed = false;
        }
        if (confirmed) {
            window.location.href = url;
        }
    }

    function checkSearch() {
        var cf = confirm("Bạn có chắc chắn muốn tìm sản phẩm không?");
        if (cf == true) {
            return true;
        } else {
            return false;
        }
    }

    function checkLoc() {
        var cf = confirm("Bạn có chắc chắn muốn tìm sản phẩm không?");
        if (cf == true) {
            return true;
        } else {
            return false;
        }
    }

</script>
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
</body>
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