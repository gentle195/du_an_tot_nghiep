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
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-w76AqPfDkMBDXo30jS1Sgez6pr3x5MlQ1ZAGC+nuZB+EYdgRZgiwxhTBTkF7CXvN"
            crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"
            integrity="sha384-oBqDVmMz9ATKxIep9tiCxS/Z9fNfEXiDAYTujMAeBAsjFuCZSmKbSSUnQlmh/jp3"
            crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.min.js"
            integrity="sha384-mQ93GR66B00ZXjt0YO5KlohRA5SY2XofN4zfuZxLkoj1gXtW8ANNCe9d5Y3eG5eD"
            crossorigin="anonymous"></script>
    <title>Document</title>
</head>
<body>
<section style="text-align: center">
    <h3 style="color: black; text-align: center"><b>Imei</b></h3>
    <form action="/imei/add">
        <button type="submit" class="btn btn-primary">Add Imei</button>
    </form>
    <br>
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
</body>
</html>