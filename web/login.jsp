<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Log In</title>
        <link href="//fonts.googleapis.com/css?family=Open+Sans:400,700" rel="stylesheet" type="text/css" media="all">
        <link href="https://fonts.googleapis.com/css?family=Montserrat:300,300i,400,400i,500,500i,600,600i,700,700i,900,900i&amp;subset=vietnamese" rel="stylesheet">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/font-awesome/4.5.0/css/font-awesome.min.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/Swiper/3.4.2/css/swiper.min.css">
        <link href="//bizweb.dktcdn.net/100/326/331/themes/679924/assets/owl.carousel.min.css?1626065768489" rel="stylesheet" type="text/css" media="all">
        <link href="//bizweb.dktcdn.net/100/326/331/themes/679924/assets/base.scss.css?1626065768489" rel="stylesheet" type="text/css" media="all">
        <link href="//bizweb.dktcdn.net/100/326/331/themes/679924/assets/style.scss.css?1626065768489" rel="stylesheet" type="text/css" media="all">
        <link href="//bizweb.dktcdn.net/100/326/331/themes/679924/assets/update.scss.css?1626065768489" rel="stylesheet" type="text/css" media="all">
        <link href="//bizweb.dktcdn.net/100/326/331/themes/679924/assets/module.scss.css?1626065768489" rel="stylesheet" type="text/css" media="all">
        <link href="//bizweb.dktcdn.net/100/326/331/themes/679924/assets/responsive.scss.css?1626065768489" rel="stylesheet" type="text/css" media="all">
        <link href="//bizweb.dktcdn.net/100/326/331/themes/679924/assets/style_fashion.scss.css?1626065768489" rel="stylesheet" type="text/css" media="all">
        <link href="//bizweb.dktcdn.net/100/326/331/themes/679924/assets/iwish.css?1626065768489" rel="stylesheet" type="text/css" media="all">
        <link href="css/style.css" rel="stylesheet" type="text/css"/>
        <link href="css/index.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
        <jsp:include page="menu.jsp"></jsp:include>
            <section class="bread-crumb" style="background-image: url(//bizweb.dktcdn.net/100/326/331/themes/679924/assets/breadcrumb-bg.png?1626065768489)">	
                <div class="container">
                    <div class="row">
                        <div class="col-xs-12">
                            <ul class="breadcrumb" itemscope="" itemtype="http://data-vocabulary.org/Breadcrumb">					
                                <li class="home">
                                    <a itemprop="url" href="homeservlet"><span itemprop="title">Trang chủ</span></a>						
                                    <span><i class="fa fa-angle-right"></i></span>
                                </li>

                                <li><strong itemprop="title">Đăng nhập tài khoản</strong></li>
                            </ul>
                        </div>
                    </div>
                </div>
            </section>
            <div class="container margin-bottom-20">
                <h1 class="title-head">Đăng nhập tài khoản</h1>
                <div class="row">
                    <div class="col-lg-6">
                        <div class="page-login margin-bottom-30">
                            <div id="login">
                                <span>Nếu đã có tài khoản, đăng nhập tại đây.</span>
                                <div class="form-signup" style="color: red;">${requestScope.error}<br></div>
                            <form action="loginservlet" method="post" id="customer_login">
                                <div class="form-signup clearfix">
                                    <fielset class="form-group">
                                        <label>Email <span class="required">*</span></label>
                                        <input type="email" pattern="[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,63}$" class="form-control form-control-lg" value="" name="email" id="customer_email" placeholder="Email" required="">
                                    </fielset>
                                    <fieldset class="form-group">
                                        <label>Mật khẩu <span class="required">*</span></label>
                                        <input type="password" class="form-control form-control-lg" value="" name="password" id="customer_password" placeholder="Mật khẩu" required="">
                                    </fieldset>
                                    <div class="pull-xs-left" style="margin-top: 25px;">
                                        <input class="btn btn-style btn-primary" type="submit" value="Đăng nhập">
                                        <a href="registerservlet" class="btn-link-style btn-register" style="margin-left: 20px;text-decoration: underline; ">Đăng ký</a>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <jsp:include page="footer.jsp"></jsp:include>
    </body>
</html>
