
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Giỏ hàng</title>
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

                                <li><strong itemprop="title">Giỏ hàng</strong></li>
                            </ul>
                        </div>
                    </div>
                </div>
            </section>
            <div class="container">
                <div class="box-heading relative">
                    <h1 class="title-head page_title">Giỏ hàng của bạn</h1>
                </div>
                <section class="main-cart-page main-container col1-layout">
                    <div class="main container hidden-xs">
                        <div class="col-main cart_desktop_page cart-page">
                            <div class="cart page_cart hidden-xs">

                                <div class="bg-scroll">
                                    <div class="cart-thead">
                                        <div style="width: 17%;">Hình ảnh</div>
                                        <div style="width: 33%">
                                            <span class="nobr">Tên sản phẩm</span>
                                        </div>
                                        <div style="width: 15%" class="a-center">
                                            <span class="nobr">Đơn giá</span>
                                        </div>
                                        <div style="width: 14%" class="a-center">Số lượng</div>
                                        <div style="width: 15%" class="a-center">Thành tiền</div>
                                        <div style="width: 6%">Xoá</div>
                                    </div>
                                    <div class="cart-tbody">
                                    <c:set var="o" value="${sessionScope.cart}"/> 
                                    <c:forEach var="i" items="${o.items}">
                                        <div class="item-cart">
                                            <div style="width: 17%" class="image">
                                                <a class="product-image" title="${i.product.prName}" href="detailservlet?id=${i.product.prId}">
                                                    <img width="120" height="auto" alt="${i.product.prName}" src="${i.product.prImg}"></a>
                                            </div>
                                            <div style="width: 33%" class="a-center">
                                                <h2 class="product-name"> 
                                                    <a href="detailservlet?id=${i.product.prId}">${i.product.prName}</a>
                                                </h2>
                                            </div>
                                            <div style="width: 15%" class="a-center">
                                                <span class="item-price"> 
                                                    <span class="price"><fmt:formatNumber value="${i.oPrice}"/></span>
                                                </span>
                                            </div>
                                            <div style="width: 14%" class="a-center">
                                                <div class="input_qty_pr relative">
                                                    <input class="variantID" type="hidden" name="variantId" value="">
                                                    <button class="reduced_pop items-count btn-minus" type="button"><a href="process?num=-1&pid=${i.product.prId}">–</a></button>
                                                    <input type="text" class="input-text number-sidebar input_pop input_pop" id="${product.prId}" name="Lines" value="${i.oQuantity}">
                                                    <button class="increase_pop items-count btn-plus" type="button"><a href="process?num=+1&pid=${i.product.prId}">+</a></button>
                                                </div>
                                            </div>
                                            <div style="width: 15%" class="a-center">
                                                <span class="cart-price">
                                                    <span class="price"><fmt:formatNumber value="${i.oPrice * i.oQuantity}"/>₫</span>
                                                </span>
                                            </div>
                                            <div style="width: 6%">
                                                <form action="process?pid=${i.product.prId}" method="post">
                                                    <input type="submit" style="background-color: white;" value="Xóa">
                                                </form>
                                            </div>
                                        </div>


                                    </c:forEach>

                                </div>

                                <div class="cart-collaterals cart_submit row">
                                    <div class="totals col-sm-12 col-md-12 col-xs-12">
                                        <div class="totals">
                                            <div class="inner">
                                                <table class="table shopping-cart-table-total margin-bottom-0" id="shopping-cart-totals-table">
                                                    <colgroup>
                                                        <col><col>
                                                    </colgroup>
                                                    <tfoot>
                                                        <tr>
                                                            <td colspan="20" class="a-right"></td>
                                                            <td class="a-right">
                                                                <span>Tổng tiền:</span> 
                                                                <strong><span class="totals_price price"><fmt:formatNumber value="${o.totalPrice}"/>₫</span></strong>
                                                            </td>
                                                        </tr>
                                                    </tfoot>
                                                </table>
                                                <ul class="checkout">
                                                    <li class="clearfix">
                                                        <c:if test="${not empty sessionScope.cart.items}">
                                                            <form action="checkoutservlet" method="post">

                                                                <button class="btn btn-primary button btn-proceed-checkout f-right" title="Tiến hành đặt hàng" type="submit">
                                                                    <span style=" text-transform: initial; ">Tiến hành đặt hàng</span>
                                                                </button>

                                                            </form>
                                                        </c:if>
                                                        <button class="btn btn-gray margin-right-15 f-right" title="Tiếp tục mua hàng" type="button" onclick="window.location.href = 'homeservlet'">
                                                            <span style=" text-transform: initial; ">Tiếp tục mua hàng</span>
                                                        </button>
                                                    </li>
                                                </ul>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                    </div>


            </section>
        </div>
        <jsp:include page="footer.jsp"></jsp:include>
    </body>
</html>
