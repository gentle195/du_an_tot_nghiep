<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!doctype html>
<html lang="en">
<head>
    <title>Title</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD" crossorigin="anonymous">


</head>
<body>

<form:form action="/khach-hang/update" method="post" modelAttribute="kh">
    <div  >
        <p scope="col">
            Mã
        </p>
        <p scope="col">
            <form:input path="ma"  readonly="true"></form:input>
        </p>
    </div>
    <table class="table">
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
                <form:errors path="hoTen" cssClass="error text-danger" />
            </th>


            <th scope="col">
                <form:radiobutton path="gioiTinh" label="nam" value="true"></form:radiobutton><br>
                <form:radiobutton path="gioiTinh" label="nu" value="false"></form:radiobutton>
            </th>
            <th scope="col">
                <form:input path="email"></form:input><br>
                <form:errors path="email" cssClass="error text-danger" />
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
                <form:errors path="sdt" cssClass="error text-danger" />
            </th>
            <th scope="col">
                <form:input path="ngaySinh" type="date" id="ns"/>
                <br>
                <P id="tb" style="color: crimson"></P>
                    <%--                <form:errors path="ngaySinh" cssClass="error-message" />--%>
            </th>
            <th scope="col">
                <form:input path="taiKhoan"  ></form:input><br>
                <form:errors path="taiKhoan" cssClass="error text-danger" />
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
                <form:input path="matKhau"  ></form:input><br>
                <form:errors path="matKhau" cssClass="error text-danger" />
            </th>
            <th scope="col">
                <form:input path="diem"  type="number"></form:input><br>
                <form:errors path="diem" cssClass="error text-danger" />
            </th>
            <th>

                <form:select path="hangKhachHang"  items="${hkh}" itemValue="id" itemLabel="ten">

                </form:select>
                <br>
                <form:errors path="hangKhachHang" cssClass="error text-danger" />
            </th>

        </tr>

        </thead>



        <P style="display: none">
            <form:input path="id"></form:input>
        </P>
        <th scope="col" style="display: none">
            <form:input path="ngayTao" type="date"></form:input>
        </th>

    </table>


    <BUTTON type="submit"  style="margin-left: 5cm" id="bt" onclick="return thongbao()">update</BUTTON>
</form:form>





<script>

    function thongbao() {
        var ns=document.getElementById("ns").value;
        if(confirm("Bạn muốn dùng trức năng")==true){
            if(ns.trim()===''){
                document.getElementById("tb").innerHTML="Không để trống ngày sinh";
                document.getElementById("bt").type="button"
                return false;
            }else {
                document.getElementById("bt").type="submit";
                return true;
            }
        }else {
            return false;
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