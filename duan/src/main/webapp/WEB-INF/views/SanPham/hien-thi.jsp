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
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://getbootstrap.com/docs/5.3/assets/css/docs.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</head>
<body>
<div class="container">
    <h1 style="text-align: center"> Sản Phẩm</h1>
    <c:if test="${f:length(hsp)==0}">
        <span style="text-align: center">Không có dữ liệu sản phẩm</span>
    </c:if>
    <c:if test="${f:length(hsp)!=0}">
        <table class="table table-bordered border-primary">
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
            <c:forEach var="list" varStatus="i" items="${hsp}">
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
                        <a type="" class="btn btn-primary" href="/san-pham/delete/${list.id}"
                           onclick="return myFunction4()">Delete</a>
                        <a class="btn btn-primary" href="/san-pham/view-update/${list.id}">Update</a>
                    </td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
        <br>
        <nav aria-label="Page navigation example">
            <ul class="pagination justify-content-center pagination-lg">
                <li class="page-item"><a class="page-link" href="/san-pham/hien-thi?num=0">First</a></li>

                <c:forEach begin="1" end="${total}" varStatus="status">
                    <li class="page-item">
                        <a href="${pageContext.request.contextPath}/san-pham/hien-thi?num=${status.index -1}"
                           class="page-link">${status.index}</a>
                    </li>
                </c:forEach>

                <li class="page-item"><a class="page-link" href="/san-pham/hien-thi?num=${total-1}">Last</a></li>
            </ul>
        </nav>
    </c:if>
</div>
<br>
<div class="container">
    <form:form action="/san-pham/add" method="post" modelAttribute="dulieuxem">
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
                <th><form:select path="hangSanPham" items="${listHangSP}" itemValue="id" itemLabel="ten"/></th>
                <td class="btn-group">
                    <a class="btn btn-secondary" data-bs-toggle="modal" data-bs-target="#exampleModalHangSanPham">
                        <img src="https://emojigraph.org/media/twitter/plus_2795.png" style="width: 25px; height: 60%">
                    </a>
                </td>
            </tr>
            </tbody>
            <tbody>
            <tr>
                <td><form:label path="manHinh">Màn Hình</form:label></td>
                <th><form:select path="manHinh" items="${listManHinh}" itemValue="id" itemLabel="thongSo"/></th>
                <td class="btn-group">
                    <a class="btn btn-secondary" data-bs-toggle="modal" data-bs-target="#exampleModalManHinh">
                        <img src="https://emojigraph.org/media/twitter/plus_2795.png" style="width: 25px; height: 60%">
                    </a>
                </td>
            </tr>
            </tbody>
            <tbody>
            <tr>
                <td><form:label path="camera">Camera</form:label></td>
                <th><form:select path="camera" items="${listCamera}" itemValue="id" itemLabel="thongSo"/></th>
                <td class="btn-group">
                    <a class="btn btn-secondary" data-bs-toggle="modal" data-bs-target="#exampleModalCamera">
                        <img src="https://emojigraph.org/media/twitter/plus_2795.png" style="width: 25px; height: 60%">
                    </a>
                </td>
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
</div>
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
</html>