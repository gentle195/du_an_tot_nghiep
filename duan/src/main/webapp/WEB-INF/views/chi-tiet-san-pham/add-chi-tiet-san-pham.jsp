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
    <title>Document</title>
</head>
<body>
<h3 style="color: black; text-align: center"><b>Thêm Chi Tiết Sản Phẩm</b></h3>
<form:form action="/chi-tiet-san-pham/add" class="container" method="post" modelAttribute="chitietsanpham">
    <div class="row">
        <div class="col-6">
            <div class="row">
                <div class="col-8">
                    <form:select path="sanPham" class="form-control" id="selectSanPham"
                                 cssStyle="font-weight: bold; width: 100%">
                        <option selected disabled>Sản phẩm</option>
                        <form:options items="${listSanPham}" itemLabel="ten" itemValue="id"/>
                    </form:select>
                </div>
                <div class="col-4">
                    <a type="button" data-bs-toggle="modal" data-bs-target="#exampleModalSanPham">
                        <img src="../img/plus.png">
                    </a>
                </div>
            </div>
            <div class="form-floating mb-3 mt-3">
                <div class="row"></div>
                <form:select path="mauSac" class="form-control" id="selectMauSac"
                             cssStyle="font-weight: bold; width: 100%">
                    <option selected disabled>Màu sắc</option>
                    <form:options items="${listMauSac}" itemLabel="ten" itemValue="id"/>
                </form:select>
                <td class="btn-group">
                    <a class="btn btn-secondary" data-bs-toggle="modal" data-bs-target="#exampleModalMauSac">
                        <img src="../img/plus.png">
                    </a>
                </td>
            </div>
            <div class="form-floating mb-3 mt-3">
                <form:select path="chip" class="form-control" id="selectChip" cssStyle="font-weight: bold; width: 100%">
                    <option selected disabled>Chip</option>
                    <form:options items="${listChip}" itemLabel="ten" itemValue="id"/>
                </form:select>
                <td class="btn-group">
                    <a class="btn btn-secondary" data-bs-toggle="modal" data-bs-target="#exampleModalChip">
                        <img src="../img/plus.png">
                    </a>
                </td>
            </div>
            <div class="form-floating mb-3 mt-3">
                <form:select path="ram" class="form-control" id="selectRam" cssStyle="font-weight: bold; width: 100%">
                    <option selected disabled>Dung lượng bộ nhớ</option>
                    <form:options items="${listRam}" itemLabel="dungLuong" itemValue="id"/>
                </form:select>
                <a class="btn btn-secondary" data-bs-toggle="modal" data-bs-target="#exampleModalRam">
                    <img src="../img/plus.png">
                </a>
                </td>
            </div>
            <div class="form-floating mb-3 mt-3">
                <form:select path="rom" class="form-control" id="selectRom" cssStyle="font-weight: bold; width: 100%">
                    <option selected disabled>Dung lượng lưu trữ</option>
                    <form:options items="${listRom}" itemLabel="dungLuong" itemValue="id"/>
                </form:select>
                <td class="btn-group">
                    <a class="btn btn-secondary" data-bs-toggle="modal" data-bs-target="#exampleModalRom">
                        <img src="../img/plus.png">
                    </a>
                </td>
            </div>
            <div class="form-floating mb-3 mt-3">
                <form:select path="pin" class="form-control" id="selectPin" cssStyle="font-weight: bold; width: 100%">
                    <option selected disabled>Pin</option>
                    <form:options items="${listPin}" itemLabel="dungLuongPin.thongSo" itemValue="id"/>
                </form:select>
                <td class="btn-group">
                    <a class="btn btn-secondary" data-bs-toggle="modal" data-bs-target="#exampleModalPin">
                        <img src="../img/plus.png">
                    </a>
                </td>
            </div>

            <div class="form-floating mb-3 mt-3">
                <form:input class="form-control" placeholder="" path="urlAnh" type="file"/>
                <form:label class="form-label" path="urlAnh">Ảnh:</form:label>
                <form:errors path="urlAnh" cssStyle="color: red"></form:errors>
            </div>

        </div>
        <div class="col-6">
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
                 onclick="if(!(confirm('Bạn có muốn thêm ? ')))return false;else return true">Add</form:button>
</form:form>

<%--           modal           --%>
<div class="modal fade" id="exampleModalPin" tabindex="-1" aria-labelledby="exampleModalLabel"
     aria-hidden="true" data-backdrop="static">
    <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content">
            <div class="modal-header">
                <h1 class="modal-title fs-5" id="exampleModalLabelPin">Pin</h1>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <div id="imeiList">
                    <table class="table">
                        <form:form action="/chi-tiet-san-pham/modal-add-pin" method="post" modelAttribute="Pin">
                            <div class="row">
                                <div class="col">
                                    <form:label path="loaiPin"><b>Loại Pin:</b></form:label>
                                    <form:input path="loaiPin" class="form-control"></form:input>
                                    <form:errors path="loaiPin"></form:errors>
                                </div>
                                <div class="col">
                                    <form:label path="congNghePin"><b>Công nghệ Pin:</b></form:label>
                                    <form:input path="congNghePin" class="form-control"></form:input>
                                    <form:errors path="congNghePin"></form:errors>
                                </div>
                                <div class="col">
                                    <form:label path="moTa"><b>Mô Tả:</b></form:label>
                                    <form:textarea path="moTa" class="form-control"></form:textarea>
                                    <form:errors path="moTa"></form:errors>
                                </div>
                                <div class="col">
                                    <form:label path="dungLuongPin"><b>Dung Lượng:</b></form:label>
                                    <form:select path="dungLuongPin" items="${dungLuongPin}" class="form-control"
                                                 itemLabel="thongSo"
                                                 itemValue="id"></form:select>
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
                <div id="imeiList">
                    <table class="table">
                        <form:form action="/chi-tiet-san-pham/modal-add-chip" method="post" modelAttribute="chip">
                            <div class="row">
                                <div class="col">
                                    <form:label path="ten"><b>Tên:</b></form:label>
                                    <form:input path="ten" class="form-control"></form:input>
                                    <form:errors path="ten"></form:errors>
                                </div>
                                <div class="col">
                                    <form:label path="loaiChip"><b>Loại Chip:</b></form:label>
                                    <form:input path="loaiChip" class="form-control"></form:input>
                                    <form:errors path="loaiChip"></form:errors>
                                </div>
                                <div class="col">
                                    <form:label path="soNhan"><b>Số nhân:</b></form:label>
                                    <form:input path="soNhan" class="form-control" type="number"></form:input>
                                    <form:errors path="soNhan"></form:errors>
                                </div>
                                <div class="col">
                                    <form:label path="tinhTrang"><b>Tình Trạng:</b></form:label>
                                    <br>
                                    <form:radiobutton path="tinhTrang" label="Thế hệ mới" value="0"></form:radiobutton>
                                    <form:radiobutton path="tinhTrang" label="thế hệ cũ" value="1"></form:radiobutton>
                                </div>
                                <div class="col">
                                    <form:label path="moTa"><b>Mô Tả:</b></form:label>
                                    <form:textarea path="moTa" class="form-control"></form:textarea>
                                    <form:errors path="moTa"></form:errors>
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
                <div id="imeiList">
                    <table class="table">
                        <form:form action="/chi-tiet-san-pham/modal-add-mau-sac" method="post" modelAttribute="mauSac">
                            <div class="row">
                                <div class="col">
                                    <form:label path="ten"><b>Tên:</b></form:label>
                                    <form:input path="ten" class="form-control"></form:input>
                                    <form:errors path="ten"></form:errors>
                                </div>
                                <div class="col">
                                    <form:label path="moTa"><b>Mô Tả:</b></form:label>
                                    <form:textarea path="moTa" class="form-control"></form:textarea>
                                    <form:errors path="moTa"></form:errors>
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
                <div id="imeiList">
                    <table class="table">
                        <form:form action="/chi-tiet-san-pham/modal-add-ram" method="post" modelAttribute="ram">
                            <div class="row">
                                <div class="col">
                                    <form:label path="dungLuong"><b>Dung Lượng:</b></form:label>
                                    <form:input path="dungLuong" class="form-control"></form:input>
                                    <form:errors path="dungLuong"></form:errors>
                                </div>
                                <div class="col">
                                    <form:label path="tinhTrang"><b>Tình Trạng:</b></form:label>
                                    <br>
                                    <form:radiobutton path="tinhTrang" label="Còn dùng" value="0"></form:radiobutton>
                                    <form:radiobutton path="tinhTrang" label="Không còn dùng"
                                                      value="1"></form:radiobutton>
                                </div>
                                <div class="col">
                                    <form:label path="moTa"><b>Mô Tả:</b></form:label>
                                    <form:textarea path="moTa" class="form-control"></form:textarea>
                                    <form:errors path="moTa"></form:errors>
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
                <div id="imeiList">
                    <table class="table">
                        <form:form action="/chi-tiet-san-pham/modal-add-rom" method="post" modelAttribute="rom">
                            <div class="row">
                                <div class="col">
                                    <form:label path="dungLuong"><b>Dung Lượng:</b></form:label>
                                    <form:input path="dungLuong" class="form-control"></form:input>
                                    <form:errors path="dungLuong"></form:errors>
                                </div>
                                <div class="col">
                                    <form:label path="tinhTrang"><b>Tình Trạng:</b></form:label>
                                    <br>
                                    <form:radiobutton path="tinhTrang" label="Còn dùng" value="0"></form:radiobutton>
                                    <form:radiobutton path="tinhTrang" label="Không còn dùng"
                                                      value="1"></form:radiobutton>
                                </div>
                                <div class="col">
                                    <form:label path="moTa"><b>Mô Tả:</b></form:label>
                                    <form:textarea path="moTa" class="form-control"></form:textarea>
                                    <form:errors path="moTa"></form:errors>
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
                <div id="imeiList">
                    <table class="table"><form:form action="/chi-tiet-san-pham/modal-add-san-pham" method="post"
                                                    modelAttribute="sanPham">
                        <h1 style="text-align: center">Add Sản Phẩm</h1>

                        <table class="table " style="border: aliceblue 1px">
                            <tbody>
                            <tr>
                                <td><form:label path="ten">Tên:</form:label></td>
                                <th><form:input path="ten" id="tent"></form:input></th>
                                <th><form:errors path="ten" cssClass="error text-danger"></form:errors></th>
                            </tr>
                            </tbody>
                            <tbody>
                            <tr>
                                <td><form:label path="heDieuHanh">Hệ điều hành:</form:label></td>
                                <th><form:input path="heDieuHanh" id="heDieuHanht"></form:input></th>
                                <th><form:errors path="heDieuHanh" cssClass="error text-danger"></form:errors></th>
                            </tr>
                            </tbody>
                            <tbody>
                            <tr>
                                <td><form:label path="soSim">Số khe sim:</form:label></td>
                                <th><form:input path="soSim" type="number"></form:input></th>
                                <th><form:errors path="soSim" cssClass="error text-danger"></form:errors></th>
                            </tr>
                            </tbody>
                            <tbody>
                            <tr>
                                <td><form:label path="bluetooth">Kết nối bluetooth:</form:label></td>
                                <th><form:input path="bluetooth"></form:input></th>
                                <th><form:errors path="bluetooth" cssClass="error text-danger"></form:errors></th>
                            </tr>
                            </tbody>
                            <tbody>
                            <tr>
                                <td><form:label path="hoTroMang">Hỗ trợ mạng:</form:label></td>
                                <th><form:input path="hoTroMang"></form:input></th>
                                <th><form:errors path="hoTroMang" cssClass="error text-danger"></form:errors></th>
                            </tr>
                            </tbody>
                            <tbody>
                            <tr>
                                <td><form:label path="congGiaoTiep">Cổng giao tiếp:</form:label></td>
                                <th><form:input path="congGiaoTiep"></form:input></th>
                                <th><form:errors path="congGiaoTiep" cssClass="error text-danger"></form:errors></th>
                            </tr>
                            </tbody>
                            <tbody>
                            <tr>
                                <td><form:label path="thongSoWifi">Thông số Wifi:</form:label></td>
                                <th><form:input path="thongSoWifi"></form:input></th>
                                <th><form:errors path="thongSoWifi" cssClass="error text-danger"></form:errors></th>
                            </tr>
                            </tbody>
                            <tbody>
                            <tr>
                                <td><form:label path="kichThuoc">Kích thước sản phẩm:</form:label></td>
                                <th><form:input path="kichThuoc"></form:input></th>
                                <th><form:errors path="kichThuoc" cssClass="error text-danger"></form:errors></th>
                            </tr>
                            </tbody>
                            <tbody>
                            <tr>
                                <td><form:label path="trongLuong">Trọng lượng:</form:label></td>
                                <th><form:input path="trongLuong"></form:input></th>
                                <th><form:errors path="trongLuong" cssClass="error text-danger"></form:errors></th>
                            </tr>
                            </tbody>
                            <tbody>
                            <tr>
                                <td><form:label path="chatLieu">Chất liệu:</form:label></td>
                                <th><form:input path="chatLieu"></form:input></th>
                                <th><form:errors path="chatLieu" cssClass="error text-danger"></form:errors></th>
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
                            <tbody>
                            <tr>
                                <td><form:label path="hangSanPham">Hãng Sản Phẩm</form:label></td>
                                <th><form:select path="hangSanPham" items="${hangsp}" itemValue="id"
                                                 itemLabel="ten"/></th>
                            </tr>
                            </tbody>
                            <tbody>
                            <tr>
                                <td><form:label path="manHinh">Màn Hình</form:label></td>
                                <th><form:select path="manHinh" items="${manHinh}" itemValue="id"
                                                 itemLabel="thongSo"/></th>
                            </tr>
                            </tbody>
                            <tbody>
                            <tr>
                                <td><form:label path="camera">Camera</form:label></td>
                                <th><form:select path="camera" items="${camera}" itemValue="id"
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
</body>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
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