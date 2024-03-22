<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Home</title>
        <link href="//fonts.googleapis.com/css?family=Open+Sans:400,700" rel="stylesheet" type="text/css" media="all">
        <link href="https://fonts.googleapis.com/css?family=Montserrat:300,300i,400,400i,500,500i,600,600i,700,700i,900,900i&amp;subset=vietnamese" rel="stylesheet">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
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
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/normalize/5.0.0/normalize.min.css">
        <link href="css/style.css" rel="stylesheet" type="text/css"/>
        <link href="css/index.css" rel="stylesheet" type="text/css"/>
        <style>
            .bread-crumb{
                margin: 0;
            }
        </style>
    </head>
    <body>
        <jsp:include page="menu.jsp"></jsp:include>
            <div id="main">
                <div class="container">
                    <div class="row">
                        <div class="col-md-12">
                            <div id="carousel-simple" class="carousel slide multi-item-carousel" data-ride="carousel">
                                <!-- Wrapper for slides -->
                                <div class="carousel-inner">
                                    <div class="item active">
                                        <div class="col-md-4">
                                            <img src="${sessionScope.prolist.get(0).prImg}" alt="">
                                    </div>
                                </div>
                                <c:forEach var="p" begin="2" end="9" items="${sessionScope.prolist}">
                                    <div class="item">
                                        <div class="col-md-4">
                                            <img src="${p.prImg}" alt="">
                                        </div>
                                    </div>
                                </c:forEach>
                            </div>

                            <!-- Controls -->
                            <a class="left carousel-control" href="#carousel-simple" role="button" data-slide="prev">
                                <span class="glyphicon glyphicon-chevron-left"></span>
                            </a>
                            <a class="right carousel-control" href="#carousel-simple" role="button" data-slide="next">
                                <span class="glyphicon glyphicon-chevron-right"></span>
                            </a>
                        </div>
                    </div>
                </div>
                <section class="bread-crumb" style="background-image: url(//bizweb.dktcdn.net/100/326/331/themes/679924/assets/breadcrumb-bg.png?1626065768489)">	
                    <div class="container">
                        <div class="row">
                            <div class="col-xs-12">
                                <ul class="breadcrumb" itemscope="" itemtype="http://data-vocabulary.org/Breadcrumb">					
                                    <li class="home">
                                        <a itemprop="url" href="homeservlet"><span itemprop="title">Trang chủ</span></a>
                                    </li>
                                </ul>
                            </div>
                        </div>
                    </div>
            </div>
        </div>
    </section>
    <h1 style="text-align: center; margin: 25px 0;">Sản phẩm nổi bật</h1>
    <section class="products-view products-view-grid">
        <div class="row">
            <c:forEach var="pr" items="${sessionScope.prolist}">
                <div class="col-xs-6 col-sm-4 col-md-4 col-lg-4">
                    <div class="product-box">	
                        <div class="product-thumbnail relative">		

                            <a href="detailservlet?id=${pr.prId}" title="${pr.prName}">

                                <img src="${pr.prImg}" alt="">

                            </a>			

                            <div class="product-action clearfix">
                                <c:if test="${sessionScope.acc.role == 1}">
                                    <form action="addcartservlet?pid=${pr.prId}" method="post" class="variants form-nut-grid" enctype="multipart/form-data">
                                        <div>
                                            <input class="hidden" type="hidden" name="variantId">
                                            <c:if test="${pr.quantity == 0}">
                                                <button class="btn btn-cart btn btn-circle left-to" data-toggle="tooltip" title="Hết hàng" type="submit" disabled>
                                                    <i class="fa fa-shopping-cart"></i>
                                                </button>
                                            </c:if>
                                            <c:if test="${pr.quantity > 0}">
                                                <button class="btn btn-cart btn btn-circle left-to" data-toggle="tooltip" title="Thêm vào giỏ hàng" type="submit">
                                                    <i class="fa fa-shopping-cart"></i>
                                                </button>
                                            </c:if>
                                            <a data-toggle="tooltip" title="Yêu thích" class="btn btn-circle iWishAdd iwishAddWrapper" href="javascript:;"><i class="fa fa-heart-o"></i></a>
                                            <a data-toggle="tooltip" title="Bỏ yêu thích" class="btn btn-circle iWishAdded iwishAddWrapper iWishHidden" href="javascript:;"><i class="fa fa-heart"></i></a>
                                        </div>
                                    </form>
                                </c:if>
                                <c:if test="${sessionScope.acc.role == 0}">
                                    <<form class="variants form-nut-grid">
                                        <div>
                                            <button class="btn btn-color btn btn-circle" data-toggle="tooltip" title="Chỉnh sửa" type="button" onclick="window.location.href = 'updateproductservlet?id=${pr.prId}'">
                                                <i class="fa fa-edit"></i>
                                            </button>
                                            <a data-toggle="tooltip" title="Xóa" href="deleteproductservlet?id=${pr.prId}" class="btn-circle btn btn-color">
                                                <i class="fa fa-close"></i>
                                            </a>
                                        </div>
                                    </form>
                                </c:if>
                            </div>
                        </div>
                        <div class="product-info a-center">		
                            <h3 class="product-name"><a href="detailservlet?id=${pr.prId}" title="${pr.prName}">${pr.prName}</a></h3>
                            <div class="price-box clearfix">

                                <div class="special-price">
                                    <span class="price product-price"><fmt:formatNumber value="${pr.price}"/>₫</span>
                                </div>											
                            </div>
                        </div>
                    </div>			
                </div>
            </c:forEach>
        </div>

    </section>
    <jsp:include page="footer.jsp"></jsp:include>
    <script src='http://cdnjs.cloudflare.com/ajax/libs/jquery/2.2.2/jquery.min.js'></script>
    <script src='http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js'></script>
    <script  src="js/index.js"></script>
    <script src="//bizweb.dktcdn.net/100/326/331/themes/679924/assets/iwish.js?1626065768489" type="text/javascript"></script>
</body>
</html>
