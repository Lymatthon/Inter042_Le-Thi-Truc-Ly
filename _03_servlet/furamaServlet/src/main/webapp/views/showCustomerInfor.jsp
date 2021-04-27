<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 4/27/2021
  Time: 4:18 PM
  To change this template use File | Settings | File Templates.
--%>
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
</head>
<body>
<div class="container">
    <h2>Customer Information</h2>

    <table class="table">
        <thead>
        <tr>
            <th>ID</th>
            <th>Type ID</th>
            <th>Name</th>
            <th>Birthday</th>
            <th>Gender</th>
            <th>ID Card</th>
            <th>Phone</th>
            <th>Email</th>
            <th>Address</th>


        </tr>
        </thead>

        <tbody>
            <c:forEach items="${Customer}", var="tempCus">
        <tr>
            <td>${tempCus.customer_id}</td>
            <td>${tempCus.customer_type_id}</td>
            <td>${tempCus.customer_name}</td>
            <td>${tempCus.customer_birthday}</td>
            <td>${tempCus.customer_gender}</td>
            <td>${tempCus.customer_id_card}</td>
            <td>${tempCus.customer_phone}</td>
            <td>${tempCus.customer_email}</td>
            <td>${tempCus.customer_address}</td>
        </tr>
        </c:forEach>
        </tbody>
    </table>
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
