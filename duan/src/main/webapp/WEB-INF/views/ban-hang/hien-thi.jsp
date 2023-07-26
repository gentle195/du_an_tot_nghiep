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
                <h4 style="text-align: center">Hóa đơn</h4>
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
                <h4 style="text-align: center">Thông tin sản phẩm</h4>
                <table class="table">
                    <tr>
                        <form method="post" action="/ban-hang/search-san-pham">
                            <th>Tìm kiếm sản phẩm: <input type="text" name="search-san-pham"></th>
                            <th>
                                <button type="submit">Tìm kiếm</button>
                            </th>
                        </form>
                        <h6 style="text-align: center">${thongBao}</h6>
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
                            <td>
                                <c:if test="${ctsp.tinhTrang==1}">Còn hàng</c:if>
                                <c:if test="${ctsp.tinhTrang==0}">Hết hàng</c:if>
                            </td>
                            <td class="btn-group">
                                <a href="/ban-hang/them-san-pham/${ctsp.id}"
                                   class="btn btn-info"
                                   data-bs-toggle="modal" data-bs-target="#exampleModal"
                                >
                                    Thêm IMEI
                                </a>
                            </td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
            </div>
            <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel"
                 aria-hidden="true" data-backdrop="static">
                <div class="modal-dialog modal-dialog-centered">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h1 class="modal-title fs-5" id="exampleModalLabel">Danh sách IMEI</h1>
                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                        </div>
                        <div class="modal-body">
                            <table class="table">
                                <tr>
                                    <form method="post" action="/ban-hang/search-imei">
                                        <th>Tìm kiếm IMEI: <input type="text" name="search-imei" id="searchInput"
                                                                  placeholder="Tìm kiếm IMEI"></th>
                                        <th>
                                            <button type="submit" id="searchButton" data-dismiss="modal">Tìm kiếm</button>
                                        </th>
                                    </form>
                                    <h6 style="text-align: center">${thongBaoIMEI}</h6>
                                </tr>
                            </table>
                            <div id="imeiList">
                                <table class="table">
                                    <thead>
                                    <tr>
                                        <th>STT</th>
                                        <th>Tên Sản Phẩm</th>
                                        <th>Số IMEI</th>
                                        <th>Trạng Thái</th>
                                        <th>Chức năng</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <c:forEach items="${listImei}" var="imei" varStatus="i">
                                        <tr>
                                            <td>${i.index+1}</td>
                                            <td>${imei.chiTietSanPham.sanPham.ten}</td>
                                            <td>${imei.soImei}</td>
                                            <td>
                                                <c:if test="${imei.tinhTrang==1}">Chưa bán</c:if>
                                                <c:if test="${imei.tinhTrang==0}">Đã bán</c:if>
                                            </td>
                                            <td class="btn-group">
                                                <button class="btn btn-info">
                                                    <a href="/ban-hang/them-imei/${imei.id}"
                                                                                style="text-decoration: none">Thêm Sản Phẩm</a></button>
                                            </td>
                                        </tr>
                                    </c:forEach>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                        </div>
                    </div>
                </div>
            </div>
            <hr>
            <div class="outer-border p-3 border border-secondary">
                <h4 style="text-align: center">Hóa đơn chi tiết</h4>
                <table class="table">
                    <thead>
                    <tr>
                        <th>STT</th>
                        <th>Tên Sản Phẩm</th>
                        <th>Đơn Giá</th>
                        <th>Số Lượng</th>
                        <th>Thành tiền</th>
                        <th>Chức năng</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach items="${listHoaDonChiTiet}" var="hdct" varStatus="i">
                        <tr>
                            <td>${i.index+1}</td>
                            <td>${hdct.imei.chiTietSanPham.sanPham.ten}</td>
                            <td>${hdct.donGia}</td>
                            <td>${hdct.soLuong}</td>
                            <td>${hdct.donGia * hdct.soLuong}</td>
                            <td class="btn-group">
                                <button class="btn btn-info"><a href="/ban-hang/delete-hoa-don-chi-tiet/${hdct.id}"
                                                                style="text-decoration: none">Xóa sản phẩm</a></button>
                            </td>
                        </tr>
                    </c:forEach>
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
<script>
    $(document).ready(function() {
        // Bắt sự kiện khi người dùng nhấn nút Tìm kiếm
        $('#searchButton').on('click', function() {
            // Lấy giá trị từ ô tìm kiếm
            var searchText = $('#searchInput').val();

            // Gửi yêu cầu tìm kiếm bằng AJAX
            $.ajax({
                url: '/ban-hang/search-imei', // Thay thế bằng URL của controller xử lý tìm kiếm
                type: 'POST', // Hoặc 'GET' nếu phương thức trong controller là @GetMapping
                data: $('#searchForm').serialize(), // Gửi dữ liệu từ form tìm kiếm
                success: function(data) {
                    // Cập nhật dữ liệu tìm kiếm trong thẻ modal
                    $('#imeiList').html(data);
                }
            });
        });
    });
</script>
<script>
    // Bắt sự kiện khi nút Close được bấm
    $('#exampleModal').on('hide.bs.modal', function (e) {
        // Lấy nguồn sự kiện khi bấm nút
        var clickedButton = $(e.relatedTarget);

        // Kiểm tra xem nút bấm có data-dismiss="modal" hay không
        // Nếu có, chặn sự kiện ẩn modal để giữ modal không bị đóng
        if (clickedButton.attr('data-dismiss') === 'modal') {
            e.preventDefault();
        }
    });
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
</html>