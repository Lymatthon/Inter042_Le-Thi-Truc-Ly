
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
    <link rel="stylesheet" href="template/bootstrap.min.css">
</head>
<body>
<div class="container">
    <br>
    <h2 align="center">Add New Customer</h2>
    <br>
    <br>

    <form action="/customer" method="post">
        <input type="hidden" name="actionUser" value="create" >
        <div class="form-group">
            <label>Type Id</label>
            <input type="text" name="customer_type_id" >

        </div>
        <br>
        <div class="form-group">
            <label>Name</label>
            <input type="text" name="customer_name" >

        </div>
        <br>
        <div class="form-group">
            <label>Day Of Birth</label>
            <input type="date" name="customer_birthday" >

        </div>
        <br>
        <div class="form-group">
            <label>Gender</label>
            <select name="customer_gender">
                <option value="0">Female</option>
                <option value="1">Male</option>
            </select>
        </div>
        <br>
        <div class="form-group">
            <label>Id Card</label>
            <input type="text" name="customer_id_card" >

        </div>
        <br>
        <div class="form-group">
            <label>Phone</label>
            <input type="text" name="customer_phone" >

        </div>
        <br>
        <div class="form-group">
            <label>Email</label>
            <input type="text" name="customer_email" >

        </div>
        <br>
        <div class="form-group">
            <label>Address</label>
            <input type="text" name="customer_address" >

        </div>
        <br>
        <button type="submit">Submit</button>
        <br>



    </form>
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
