
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <title>Simply Construction || HTML5 Template</title>
    <meta name="description" content="">
    <meta name="viewport" content="width=device-width, initial-scale=1">


    <!-- Place favicon.ico in the root directory -->
    <link rel="shortcut icon" type="image/x-icon" href="images/favicon.ico">
    <link rel="apple-touch-icon" href="apple-touch-icon.png">


    <!-- All css files are included here. -->
    <!-- Bootstrap fremwork main css -->
    <link rel="stylesheet" href="template/css/bootstrap.min.css">
    <!-- Owl Carousel  main css -->
    <link rel="stylesheet" href="template/css/owl.carousel.min.css">
    <link rel="stylesheet" href="template/css/owl.theme.default.min.css">
    <!-- This core.css file contents all plugings css file. -->
    <link rel="stylesheet" href="template/css/core.css">
    <!-- Theme shortcodes/elements style -->
    <link rel="stylesheet" href="template/css/shortcode/shortcodes.css">
    <!-- Theme main style -->
    <link rel="stylesheet" href="template/style.css">
    <!-- Responsive css -->
    <link rel="stylesheet" href="template/css/responsive.css">
    <!-- User style -->
    <link rel="stylesheet" href="template/css/custom.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-alpha.4/css/bootstrap.min.css" />
    <script src="https://code.jquery.com/jquery-3.2.1.js" ></script>
    <!-- JS tạo nút bấm di chuyển trang start -->
    <script src="http://1892.yn.lt/blogger/JQuery/Pagging/js/jquery.twbsPagination.js" type="text/javascript"></script>
    <!-- JS tạo nút bấm di chuyển trang end -->
    <script type="text/javascript">
        $(function () {
            var pageSize = 2; // Hiển thị 2 sản phẩm trên 1 trang
            showPage = function (page) {
                $(".contentPage").hide();
                $(".contentPage").each(function (n) {
                    if (n >= pageSize * (page - 1) && n < pageSize * page)
                        $(this).show();
                });
            }
            showPage(1);
            ///** Cần truyền giá trị vào đây **///
            var totalRows = 20; // Tổng số sản phẩm hiển thị
            var btnPage = 5; // Số nút bấm hiển thị di chuyển trang
            var iTotalPages = Math.ceil(totalRows / pageSize);

            var obj = $('#pagination').twbsPagination({
                totalPages: iTotalPages,
                visiblePages: btnPage,
                onPageClick: function (event, page) {
                    console.info(page);
                    showPage(page);
                }
            });
            console.info(obj.data());
        });
    </script>
    <style>
        /** css///
        #pagination {
            display: flex;
            display: -webkit-flex; /* Safari 8 */
            flex-wrap:wrap;
            -webkit-flex-wrap: wrap; /* Safari 8 */
            justify-content: center;
            -webkit-justify-content: center;
        }
    </style>
</head>
<body>
<div class="container">
    <br>
    <h2 align="center">Customer Information</h2>
    <br>
    <p style="color: green"><c:out value="${msg}"/></p>
    <br>
    <button><a href="/customer?action=create" style="color: #0b0b0b" > Add New Customer </a></button>
    <br>
    <form action="/customer" >
        <input type="text" placeholder="Search.." name="search" style="width: 160px">
        <button type="submit"><a href="/customer?action=search"> search</a></button>
    </form>

    <table class="table">
        <thead>
        <tr align="center">
            <th>ID</th>
            <th>Type ID</th>
            <th>Name</th>
            <th>Birthday</th>
            <th>Gender</th>
            <th>ID Card</th>
            <th>Phone</th>
            <th>Email</th>
            <th>Address</th>
            <th colspan="2">Action</th>
        </tr>
        </thead>

        <tbody>
            <c:forEach items="${CustomerList}" var="tempCus">
        <tr class="contentPage">
            <td>${tempCus.customer_id}</td>
            <td>${tempCus.customer_type_id}</td>
            <td>${tempCus.customer_name}</td>
            <td>${tempCus.customer_birthday}</td>
            <td>${tempCus.customer_gender}</td>
            <td>${tempCus.customer_id_card}</td>
            <td>${tempCus.customer_phone}</td>
            <td>${tempCus.customer_email}</td>
            <td>${tempCus.customer_address}</td>
            <td>
            <a href="/customer?action=edit&id=<c:out value='${tempCus.customer_id}' />" style="color: blue">Edit </a>

            <a href="/customer?action=delete&id=<c:out value='${tempCus.customer_id}' />" style="color: blue" >Delete</a>
            </td>
        </tr>
        </c:forEach>
        </tbody>
    </table>
    <ul id="pagination"></ul>
</div>
<div class="copyright bg__theme">
    <div class="container">
        <div class="row">
            <div class="col-xs-12">
                <div class="copyright__inner">
                    <p>Footer Here</p>
                </div>
            </div>
        </div>
    </div>
</div>

</body>
</html>
