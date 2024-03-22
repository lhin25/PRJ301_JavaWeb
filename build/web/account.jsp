<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Tài khoản</title>
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

                                <li><strong itemprop="title">Thông tin tài khoản</strong></li>
                            </ul>
                        </div>
                    </div>
                </div>
            </section>
            <section class="signup page_customer_account">
                <div clas="container">
                    <div class="row">
                        <div class="col-xs-12 col-sm-12 col-md-12 col-main-account">
                            <div id="parent" class="row">
                                <div id="a" class="col-xs-12 col-sm-12 col-lg-9 col-left-account">
                                    <div class="page-title m992">
                                        <h1 class="title-head margin-top-0"><a href="#">Thông tin tài khoản</a></h1>
                                    </div>
                                    <div class="form-signup name-account m992"> 
                                        <p><strong>Xin chào, <a href="editacc.jsp" style="color:#34b79d;">${acc.usName}</a>&nbsp;!</strong></p>
                                </div>
                                <div class="col-xs-12 col-sm-12 col-lg-12 no-padding">
                                    <div class="my-account">
                                        <div class="dashboard">
                                            <div class="recent-orders">
                                                <div class="table-responsive tab-all" style="overflow-x:auto;">
                                                    <table class="table table-cart" id="my-orders-table">
                                                        <c:if test="${sessionScope.acc.role == 1}">
                                                            <thead class="thead-default" style="background-color: #ECEEEF;">
                                                                <tr>
                                                                    <th>Đơn hàng</th>
                                                                    <th>Ngày</th>
                                                                    <th>Địa chỉ</th>
                                                                    <th>Giá trị đơn hàng</th>
                                                                </tr>
                                                            </thead>
                                                            <tbody>
                                                                <c:forEach var="ord" items="${sessionScope.orderListByUser}" begin="${first2}" end="${last2}">
                                                                    <tr class="first-odd">
                                                                        <td>#${ord.ordId}</td>
                                                                        <td>${ord.ordDate}</td>
                                                                        <td>${ord.address}</td>
                                                                        <td><fmt:formatNumber value="${ord.totalPrice}"/>₫</td>
                                                                    </tr>
                                                                </c:forEach>
                                                            </tbody>
                                                        </c:if>
                                                        <c:if test="${sessionScope.acc.role == 0}">
                                                            <thead class="thead-default" style="background-color: #ECEEEF;">
                                                                <tr>
                                                                    <th>Khách hàng</th>
                                                                    <th>Đơn hàng</th>
                                                                    <th>Ngày</th>
                                                                    <th>Địa chỉ</th>
                                                                    <th>Giá trị đơn hàng</th>
                                                                </tr>
                                                            </thead>
                                                            <tbody>
                                                                <c:forEach var="order" items="${sessionScope.ords}" begin="${first1}" end="${last1}">
                                                                    <tr class="first-odd">
                                                                        <td>${order.usId}</td>
                                                                        <td>#${order.ordId}</td>
                                                                        <td>${order.ordDate}</td>
                                                                        <td>${order.address}</td>
                                                                        <td><fmt:formatNumber value="${order.totalPrice}"/>₫</td>
                                                                    </tr>
                                                                </c:forEach>
                                                            </tbody>
                                                        </c:if>
                                                    </table>
                                                </div>
                                                <div class="text-xs-right">
                                                </div>
                                            </div>

                                            <c:if test="${sessionScope.acc.role == 0}">
                                                <div class="paginate-pages pull-right page-account">
                                                    <nav class="clearfix">
                                                        <ul class="pagination clearfix f-right">
                                                            <c:if test="${param.page != null}">
                                                                <c:set var="page" value="${param.page}"/>
                                                            </c:if>
                                                            <c:if test="${param.page == null}">
                                                                <c:set var="page" value="${1}"/>
                                                            </c:if>
                                                            <c:if test="${page == 1}">
                                                                <li class="page-item disabled"><a class="page-link" href="#" tabindex="-1">&laquo;</a></li>
                                                                </c:if>

                                                            <c:if test="${page > 1}">
                                                                <li class="page-item"><a class="page-link" href="accountservlet?page=${page - 1}">&laquo;</a></li>
                                                                </c:if>
                                                            <li class="active page-item"><a class="page-link" href="accountservlet?page=${page}">${page}</a></li>

                                                            <c:if test="${page == num1}">
                                                                <li class="page-item disabled"><a class="page-link" href="#"  tabindex="-1">&raquo;</a></li>
                                                                </c:if>
                                                                <c:if test="${page < num1}">
                                                                <li class="page-item"><a class="page-link" href="accountservlet?page=${page + 1}">&raquo;</a></li>
                                                                </c:if>

                                                        </ul>
                                                    </nav>
                                                </div>


                                            </c:if>   
                                            <c:if test="${sessionScope.acc.role == 1}">
                                                <div class="paginate-pages pull-right page-account">
                                                    <nav class="clearfix">
                                                        <ul class="pagination clearfix f-right">
                                                            <c:if test="${param.page != null}">
                                                                <c:set var="page" value="${param.page}"/>
                                                            </c:if>
                                                            <c:if test="${param.page == null}">
                                                                <c:set var="page" value="${1}"/>
                                                            </c:if>
                                                            <c:if test="${page == 1}">
                                                                <li class="page-item disabled"><a class="page-link" href="#" tabindex="-1">&laquo;</a></li>
                                                                </c:if>
                                                                
                                                            <c:if test="${page > 1}">
                                                                <li class="page-item"><a class="page-link" href="accountservlet?page=${page - 1}">&laquo;</a></li>
                                                                </c:if>
                                                            <li class="active page-item"><a class="page-link" href="accountservlet?page=${page}">${page}</a></li>

                                                            <c:if test="${page == num2}">
                                                                <li class="page-item disabled"><a class="page-link" href="#"  tabindex="-1">&raquo;</a></li>
                                                                </c:if>
                                                                <c:if test="${page < num2}">
                                                                <li class="page-item"><a class="page-link" href="accountservlet?page=${page + 1}">&raquo;</a></li>
                                                                </c:if>

                                                        </ul>
                                                    </nav>
                                                </div>
                                            </c:if>

                                        </div>
                                    </div>

                                </div>
                            </div>

                            <div id="b" class="col-xs-12 col-sm-12 col-lg-3 col-right-account margin-top-20">
                                <div class="page-title mx991">
                                    <h1 class="title-head"><a href="#">DANH SÁCH ĐƠN HÀNG</a></h1>
                                </div>
                                <div class="form-signup body_right mx991"> 
                                    <p><strong>Xin chào, <a href="editacc.jsp?id=${sessionScope.acc.usId}" style="color:#34b79d;">${sessionScope.acc.usName}</a>&nbsp;!</strong></p>
                                </div>
                                <div class="block-account">
                                    <div class="block-title-account">
                                        <h5 style="text-align: center;">TÀI KHOẢN CỦA TÔI</h5>
                                    </div>
                                    <div class="block-content form-signup">
                                        <p>Tên tài khoản: <strong style="line-height: 20px;"> ${sessionScope.acc.usName}</strong></p>
                                        <p><i class="fa fa-home font-some" aria-hidden="true"></i>  <span>Địa chỉ: ${sessionScope.acc.address}</span></p>
                                        <p><i class="fa fa-mobile font-some" aria-hidden="true"></i> <span>Điện thoại: ${sessionScope.acc.phone}</span> </p>
                                        <p><i class="fa fa-envelope font-some" aria-hidden="true"></i> <span> Email: ${sessionScope.acc.mail}</span></p> 
                                        <p><i class="fa fa-calendar font-some" aria-hidden="true"></i> <span> Ngày tham gia: ${sessionScope.acc.signupDate} </span></p>
                                        <p style="margin-top:20px;"><a href="editacc.jsp?id=${sessionScope.acc.usId}" class="btn btn-full btn-primary">Chỉnh sửa thông tin</a></p>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <jsp:include page="footer.jsp"></jsp:include>
    </body>
</html>
