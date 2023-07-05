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

    <title>Document</title>
</head>
<body>
<h3 style="color: black; text-align: center"><b>Sản Phẩm Giảm Giá</b></h3>
<form action="/san-pham-giam-gia/add">
    <button type="submit" class="btn btn-primary">Add </button>
</form>
<c:if test="${size>0}">
    <table class="table container">
        <thead>
        <tr>
            <th scope="col">Ten san pham</th>
            <th scope="col">Ma khuyen mai</th>

            <th scope="col">Tinh trang</th>
            <th scope="col">Mo ta</th>

        </tr>
        </thead>
        <tbody>
        <c:forEach items="${listImei}" var="spgg" varStatus="index">
            <tr>
                <td>${spgg.chiTietSanPham.sanPham.ten}</td>
                <td>${spgg.khuyenMai.ma}</td>

                <td>${spgg.tinhTrang==1?"Dang dien ra":"Da ket thuc"}</td>

                <td>${spgg.moTa}</td>
                <td>
                    <a href="/san-pham-giam-gia/update/${spgg.id}" class="btn btn-success">Update</a>
                    <a href="#" onclick="remove('/san-pham-giam-gia/remove/${spgg.id}')" class="btn btn-danger">Delete</a>

                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
    <nav aria-label="Page navigation example" class="container">
        <ul class="pagination">
            <c:forEach begin="0" end="${total}" varStatus="loop">
                <%--            <li class="page-item"><a class="page-link" href="#">Previous</a></li>--%>
                <li class="page-item">
                    <a class="page-link"
                       href="/san-pham-giam-gia/hien-thi?page=${loop.begin + loop.count - 1}">${loop.begin + loop.count}</a>
                </li>
                <%--            <li class="page-item"><a class="page-link" href="#">Next</a></li>--%>
            </c:forEach>


        </ul>
    </nav>
</c:if>
<c:if test="${size==0}">
    Khong co ban ghi nao
</c:if>
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