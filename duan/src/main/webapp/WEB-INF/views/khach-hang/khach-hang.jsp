<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<!doctype html>
<html lang="en">
<head>
    <title>Title</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://getbootstrap.com/docs/5.3/assets/css/docs.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</head>
<body>


<br>

<form:form action="/khach-hang/add" method="post" modelAttribute="kh">
    <table class="table" id="myForm">
        <thead>
        <tr>
            <th scope="col">HO TEN</th>
            <th scope="col">GIOI TINH</th>
            <th scope="col">EMAIL</th>
        </tr>
        </thead>
        <thead>
        <tr>
            <th scope="col">
                <form:input path="hoTen"></form:input><br>
                <form:errors path="hoTen" cssClass="error text-danger"/>
            </th>
            <th scope="col">
                <form:radiobutton path="gioiTinh" label="nam" value="true"></form:radiobutton><br>
                <form:radiobutton path="gioiTinh" label="nu" value="false"></form:radiobutton>
            </th>
            <th scope="col">
                <form:input path="email"></form:input><br>
                <form:errors path="email" cssClass="error text-danger"/>
            </th>
        </tr>
        </thead>
        <thead>
        <tr>
            <th scope="col">SDT</th>
            <th scope="col">NGAY SINH</th>
            <th scope="col">TAI KHOAN</th>
        </tr>
        </thead>
        <thead>
        <tr>
            <th scope="col">
                <form:input path="sdt" type="number"></form:input><br>
                <form:errors path="sdt" cssClass="error text-danger"/>
            </th>
            <th scope="col">
                <form:input path="ngaySinh" type="date" id="ns" name="myField" required="true"/>
                <br>
                    <%--                <P id="tb" style="color: crimson"></P>--%>
                    <%--                <form:errors path="ngaySinh" cssClass="error-message" />--%>
            </th>
            <th scope="col">
                <form:input path="taiKhoan"></form:input><br>
                <form:errors path="taiKhoan" cssClass="error text-danger"/>
            </th>

        </tr>
        </thead>


        <thead>
        <tr>


            <th scope="col">MAT KHAU</th>
            <th scope="col">DIEM</th>
            <th scope="col">HANG KHACH HANG</th>


        </tr>
        </thead>
        <thead>
        <tr>


            <th scope="col">
                <form:input path="matKhau"></form:input><br>
                <form:errors path="matKhau" cssClass="error text-danger"/>
            </th>
            <th scope="col">
                <form:input path="diem" type="number"></form:input><br>
                <form:errors path="diem" cssClass="error text-danger"/>
            </th>
            <th>

                <form:select path="hangKhachHang" items="${hkh}" itemValue="id" itemLabel="ten">

                </form:select>
                <br>
                    <form:errors path="hangKhachHang" cssClass="error text-danger"/>
            <td class="btn-group">
                <a class="btn btn-secondary" data-bs-toggle="modal" data-bs-target="#exampleModalHangKhachHang">
                    <img src="https://emojigraph.org/media/twitter/plus_2795.png" style="width: 25px; height: 60%">
                </a>
            </td>
            </th>

        </tr>

        </thead>


    </table>
    <BUTTON type="submit" style="margin-left: 5cm" id="bt" onclick="return thongbao()">ADD</BUTTON>
</form:form>


<table class="table" id="bang">
    <tr>
        <th>STT</th>
        <th>MA</th>
        <th>TEN</th>
        <th>GIOI TINH</th>
        <th>Email</th>
        <th>SDT</th>
        <th>NGAY SINH</th>
        <th>TAI KHOAN</th>
        <th>MAT KHAU</th>
        <th>NGAY TAO</th>
        <th>NGAY CAP NHAT</th>
        <th>TINH TRANG</th>
        <th>DIEM</th>
        <th>HANG KHACH HANG</th>
        <th>REMOVE</th>
        <th>UPDATE</th>
    </tr>


    <c:forEach items="${dulieu}" var="ht" varStatus="stt">
        <tr>
            <td>${stt.index+1}</td>
            <td>${ht.ma}</td>
            <td>${ht.hoTen} </td>
            <td>${ht.goitinh()}</td>
            <td>${ht.email}</td>
            <td>${ht.sdt}</td>
            <td>${ht.ngaySinh}</td>
            <td>${ht.taiKhoan}</td>
            <td>${ht.matKhau}</td>
            <td>${ht.ngayTao}</td>
            <td>${ht.ngayCapNhat}</td>
            <td>${ht.tt()}</td>
            <td>${ht.diem}</td>
            <td>${ht.hangKhachHang.ten}</td>

            <td>
                <a href="/khach-hang/remove/${ht.id}" class="btn btn-success" onclick="return tbxd()">REMOVE</a>
            </td>
            <td>
                <a href="/khach-hang/view-update/${ht.id}" class="btn btn-success" onclick="return tbxd()">VIEW
                    UPDATE</a>
            </td>
        </tr>
    </c:forEach>
</table>
<P id="bc" style="color: crimson"></P>
<%--modal--%>
<div class="modal fade" id="exampleModalHangKhachHang" tabindex="-1" aria-labelledby="exampleModalLabelHangKhachHang"
     aria-hidden="true" data-backdrop="static">
    <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content">
            <div class="modal-header">
                <h1 class="modal-title fs-5" id="exampleModalLabelHangKhachHang">Hạng khách hàng</h1>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <div id="imeiList">
                    <table class="table">
                        <form:form action="/khach-hang/modal-add-hang-khach-hang" method="post"
                                   modelAttribute="hangKhachHang">
                            <div class="row">
                                <div class="col">
                                    <form:label path="ten"><b>Tên:</b></form:label>
                                    <form:input path="ten" class="form-control"></form:input>
                                    <form:errors path="ten"></form:errors>
                                </div>
                                <div class="col">
                                    <form:label path="diem_toi_thieu"><b>Điểm tối thiểu:</b></form:label>
                                    <form:input path="diem_toi_thieu" class="form-control"></form:input>
                                    <form:errors path="diem_toi_thieu"></form:errors>
                                </div>
                                <div class="col">
                                    <form:label path="moTa"><b>Mô Tả:</b></form:label>
                                    <form:textarea path="moTa" class="form-control"></form:textarea>
                                    <form:errors path="moTa"></form:errors>
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
<script>


    if ("${tong}" <= 0) {
        document.getElementById("bang").style.display = "none"
        document.getElementById("bc").innerText = "Hết để xóa rồi cu"
    } else {
        document.getElementById("bang").style.display = ""
        document.getElementById("bc").innerText = ""
    }


    function thongbao() {
        var ns = document.getElementById("ns").value;
        if (confirm("Bạn muốn dùng trức năng") == true) {
            if (ns.trim() === '') {
                document.getElementById("tb").innerHTML = "Không để trống ngày sinh";
                document.getElementById("bt").type = "button"
                return false;
            } else {
                document.getElementById("bt").type = "submit";
                return true;
            }
        } else {
            return false;
        }


    }

    function tbxd() {
        if (confirm("Bạn muốn dùng chức năng") == true) {
            return true;
        }
        return false;
    }
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
</body>
</html>