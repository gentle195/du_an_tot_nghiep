<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!doctype html>
<html lang="en">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <!-- Meta, title, CSS, favicons, etc. -->
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="icon" href="../../images/favicon.ico" type="image/ico"/>
    <!-- Bootstrap -->
    <link href="../vendors/bootstrap/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Font Awesome -->
    <link href="../vendors/font-awesome/css/font-awesome.min.css" rel="stylesheet">
    <!-- NProgress -->
    <link href="../vendors/nprogress/nprogress.css" rel="stylesheet">
    <!-- iCheck -->
    <link href="../vendors/iCheck/skins/flat/green.css" rel="stylesheet">

    <!-- bootstrap-progressbar -->
    <link href="../vendors/bootstrap-progressbar/css/bootstrap-progressbar-3.3.4.min.css" rel="stylesheet">
    <!-- JQVMap -->
    <link href="../vendors/jqvmap/dist/jqvmap.min.css" rel="stylesheet"/>
    <!-- bootstrap-daterangepicker -->
    <link href="../vendors/bootstrap-daterangepicker/daterangepicker.css" rel="stylesheet">

    <!-- Custom Theme Style -->
    <link href="../../build/css/custom.min.css" rel="stylesheet">
<body>

<form:form action="/mau-sac/add-mau-sac" method="post" modelAttribute="ms">
    <div class="row">
        <div class="col">
            <form:label path="ma">Mã màu : </form:label>
            <form:input path="ma" readonly="true"></form:input>
        </div>
        <div class="col">
            <form:label path="ten">Tên màu : </form:label>
            <form:input path="ten"></form:input>
            <form:errors path="ten"></form:errors>
        </div>
        <div class="col">
            <form:label path="moTa">Mô tả</form:label>
            <form:textarea path="moTa"></form:textarea>
        </div>

        <div style="margin-top: 20px;margin-bottom: 20px">

            <button type="submit" class="btn btn-primary" onclick="validateForm()">Thêm màu sắc</button>
        </div>
    </div>
</form:form>
<br>
<br>


<div class="clearfix">
    <div class="col-md-12 col-sm-12 ">
        <div class="x_panel">
            <div class="x_title">
                <h2>Thông tin màu sắc</h2>
                <div class="clearfix"></div>
            </div>
            <div class="x_content">
                <div class="row">
                    <div class="col-sm-12">
                        <div class="card-box table-responsive">
                            <table id="datatable-responsive"
                                   class="table table-striped table-bordered dt-responsive nowrap"
                                   cellspacing="0" width="100%">
                                <thead>
                                <tr>
                                    <th scope="col">#</th>
                                    <th scope="col">Mã</th>
                                    <th scope="col">Tên màu</th>
                                    <th scope="col">Ngày tạo</th>
                                    <th scope="col">Ngày cập nhật</th>
                                    <th scope="col">Tình trạng</th>
                                    <th scope="col">Mô tả</th>

                                    <th scope="col">Action</th>
                                </tr>
                                </thead>


                                <c:forEach items="${duLieu}" var="mauSac" varStatus="i">
                                    <tbody>
                                    <tr>
                                        <th scope="row">${i.index+1}</th>
                                        <td>${mauSac.ma}</td>
                                        <td>${mauSac.ten}</td>
                                        <td>${mauSac.ngayTao}</td>
                                        <td>${mauSac.ngayCapNhat}</td>
                                        <td>${mauSac.trangThai()}</td>
                                        <td>${mauSac.moTa}</td>
                                        <td>
                                            <a href="/mau-sac/view-update-mau-sac/${mauSac.id}" class="btn btn-success">Update</a>
                                            <a href="/mau-sac/remove-mau-sac/${mauSac.id}"
                                               class="btn btn-success">Delete</a>
                                        </td>
                                    </tr>
                                    </tbody>
                                </c:forEach>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<br>
<br>

<div>
    <nav aria-label="Page navigation example">
        <ul class="pagination justify-content-center pagination-lg">
            <li class="page-item">
                <a class="page-link" href="/mau-sac/hien-thi?num=0">Previous</a>
            </li>
            <c:forEach begin="1" end="${tongSoTrang}" varStatus="STT">
                <li class="page-item"><a class="page-link" href="/mau-sac/hien-thi?num=${STT.index-1}">${STT.index}</a>
                </li>
            </c:forEach>
            <li class="page-item">
                <a class="page-link" href="/mau-sac/hien-thi?num=${tongSoTrang-1}">Next</a>
            </li>
        </ul>
    </nav>
</div>
<script>
    function validateForm() {
        var tenValue = document.querySelector('input[name="ten"]').value;
        var moTaValue = document.querySelector('textarea[name="moTa"]').value;

        if (tenValue.trim() === '') {
            alert('Vui lòng không để trống trường Tên màu');
            return false;
        }

        if (moTaValue.trim() === '') {
            alert('Vui lòng không để trống trường Mô tả');
            return false;
        }
    }
</script>

</body>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.13/js/select2.min.js"></script>
</html>