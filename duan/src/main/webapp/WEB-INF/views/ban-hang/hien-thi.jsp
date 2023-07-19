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
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD" crossorigin="anonymous">
</head>
<body class="container outer-border p-3 border border-secondary">
<section style="text-align: center">
    <div>
        <h6>BÁN HÀNG</h6>
    </div>
    <br>
    <div class="row">
        <div class="col-8">
            <div class="outer-border p-3 border border-secondary">
                <table class="table">
                    <tr>
                        <form action="/ban-hang/add-hoa-don" method="post">
                            <button type="submit">Tạo hóa đơn</button>
                        </form>
                    </tr>
                    <thead>
                    <tr>
                        <th>STT</th>
                        <th>Mã hóa đơn</th>
                        <th>Ngày tạo</th>
                        <th>Tình trạng</th>
                        <th>Chức năng</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach items="${listHoaDon}" var="hd" varStatus="i">
                        <tr>
                            <td>${i.index+1}</td>
                            <td>${hd.ma}</td>
                            <td>${hd.ngayTao}</td>
                            <td>
                                <c:if test="${hd.tinhTrang==0}">Chờ Thanh Toán</c:if>
                                <c:if test="${hd.tinhTrang==1}">Đã Thanh Toán</c:if>
                            </td>
                            <td class="btn-group">
                                <button class="btn btn-info"><a href="/ban-hang/thong-tin-hoa-don/${hd.id}"
                                                                style="text-decoration: none;color: black">Xem thông
                                    tin</a></button>
                                <button class="btn btn-info"><a href="/ban-hang/thay-doi-trang-thai/${hd.id}"
                                                                style="text-decoration: none;color: black">Thay đổi
                                    trạng thái</a></button>
                            </td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
                <nav aria-label="Page navigation example">
                    <ul class="pagination justify-content-center pagination-lg">
                        <li class="page-item"><a class="page-link" href="/ban-hang/hien-thi?num=0">First</a></li>

                        <c:forEach begin="1" end="${total}" varStatus="status">
                            <li class="page-item">
                                <a href="${pageContext.request.contextPath}/ban-hang/hien-thi?num=${status.index -1}"
                                   class="page-link">${status.index}</a>
                            </li>
                        </c:forEach>

                        <li class="page-item"><a class="page-link" href="/ban-hang/hien-thi?num=${total-1}">Last</a>
                        </li>
                    </ul>
                </nav>
            </div>
            <hr>
            <div class="outer-border p-3 border border-secondary">
                <table class="table">
                    <tr>
                        <form method="post" action="/ban-hang/search-san-pham">
                            <th>Tìm kiếm sản phẩm: <input type="text" name="search-san-pham"></th>
                            <th>
                                <button type="submit">Tìm kiếm</button>
                            </th>
                        </form>
                    </tr>
                </table>
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
                            <td>${ctsp.tinhTrang}</td>
                            <td class="btn-group">
                                <button class="btn btn-info"><a href="/ban-hang/them-san-pham/${ctsp.id}"
                                                                style="text-decoration: none">Thêm Sản Phẩm</a></button>
                            </td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
            </div>
            <hr>
            <div class="outer-border p-3 border border-secondary">
                <table class="table">
                    <thead>
                    <tr>
                        <th>STT</th>
                        <th>Tên Sản Phẩm</th>
                        <th>Đơn Giá</th>
                        <th>Số Lượng</th>
                        <th>Thành tiền</th>
                        <th></th>
                    </tr>
                    </thead>
                    <tbody>
<%--                    <c:forEach items="${listChiTietSanPham}" var="ctsp" varStatus="i">--%>
<%--                        <tr>--%>
<%--                            <td>${ctsp.sanPham.ma}</td>--%>
<%--                            <td>${ctsp.sanPham.ten}</td>--%>
<%--                            <td>${ctsp.sanPham.hangSanPham.ten}</td>--%>
<%--                            <td>${ctsp.giaBan}</td>--%>
<%--                            <td>${ctsp.soLuong}</td>--%>
<%--                            <td>${ctsp.tinhTrang}</td>--%>
<%--                            <td class="btn-group">--%>
<%--                                <button class="btn btn-info"><a href="/ban-hang/them-san-pham/${ctsp.id}"--%>
<%--                                                                style="text-decoration: none">Thêm Sản Phẩm</a></button>--%>
<%--                            </td>--%>
<%--                        </tr>--%>
<%--                    </c:forEach>--%>
                    </tbody>
                </table>
            </div>
        </div>
        <div class="col-4 outer-border p-3 border border-secondary">
            <form:form action="/ban-hang/thanh-toan/${hoaDon.id}" modelAttribute="hoaDon" method="post">
                <div class="row">
                    <div class="col">
                        <label style="text-align: center">Thông Tin Hóa Đơn</label>
                        <div class="form-floating mb-3 mt-3">
                            <form:input class="form-control" path="ma" disabled="true"/>
                            <form:label class="form-label" path="ma">Mã Hóa Đơn:</form:label>
                        </div>

                        <div class="form-floating mb-3 mt-3">
                            <form:select path="nhanVien" class="form-control">
                                <form:options items="${listNhanVien}" itemLabel="hoTen" itemValue="id"/>
                            </form:select>
                            <form:label class="form-label" path="nhanVien">Nhân Viên:</form:label>
                        </div>

                        <div class="form-floating mb-3 mt-3">
                            <form:select path="khachHang" class="form-control">
                                <form:options items="${listKhachHang}" itemLabel="hoTen" itemValue="id"/>
                            </form:select>
                            <form:label class="form-label" path="khachHang">Khách Hàng:</form:label>
                        </div>

                        <div class="form-floating mb-3 mt-3">
                            <form:select path="diaChi" class="form-control">
                                <form:options items="${listDiaChi}" itemLabel="diaChi" itemValue="id"/>
                            </form:select>
                            <form:label class="form-label" path="diaChi">Địa Chỉ:</form:label>
                        </div>

                        <div class="form-floating mb-3 mt-3">
                            <form:input class="form-control" path="sdt"/>
                            <form:label class="form-label" path="sdt">Số điện thoại:</form:label>
                        </div>

                        <div class="form-floating mb-3 mt-3">
                            <form:input class="form-control" path="tongTien"/>
                            <form:label class="form-label" path="tongTien">Tổng tiền:</form:label>
                        </div>

                        <div class="form-floating mb-3 mt-3">
                            <input class="form-control" name="khachGui" type="number"/>
                            <label class="form-label">Tiền Khách Gửi:</label>
                        </div>

                        <div class="form-floating mb-3 mt-3">
                            <input class="form-control" name="tienThua" type="number" disabled/>
                            <label class="form-label">Tiền Thừa:</label>
                        </div>

                        <div class="form-floating mb-3 mt-3">
                            <form:textarea class="form-control" path="ghiChu"/>
                            <form:label class="form-label" path="ghiChu">Ghi Chú:</form:label>
                        </div>
                        <div class="form-floating mb-3 mt-3">
                            <form:button type="submit" class="btn btn-primary">Thanh Toán</form:button>
                        </div>
                    </div>
                </div>
            </form:form>
        </div>
    </div>
</section>
</body>
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


</script>
</html>