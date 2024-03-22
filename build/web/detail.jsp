
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Detail</title>
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
                                <li><strong><span itemprop="title">${prod.prName}</span></strong></li><li>
                            </li></ul>
                    </div>
                </div>
            </div>
        </section>
        <div class="container">
            <div class="col-xs-12 details-product">
                <div class="row">
                    <div class="col-xs-12 col-sm-12 col-md-6 col-lg-7">
                        <div class="relative product-image-block">
                            <div class="large-image">
                                <img src="${prod.prImg}">
                            </div>
                        </div>
                    </div>
                    <div class="col-xs-12 col-sm-12 col-md-6 col-lg-5 details-pro">
                        <h1 class="title-head">${prod.prName}</h1>
                        <div class="detail-header-info">
                            Tình trạng:
                            <span class="inventory_quantity">
                                <c:if test="${prod.quantity > 0}">
                                    <span>Còn ${prod.quantity} sản phẩm</span>
                                </c:if>
                                <c:if test="${prod.quantity == 0}">
                                    <span style="color: red;">Hết hàng</span>
                                </c:if>
                            </span>							
                            <span class="line">|</span>
                            Mã SP: 
                            <span class="masp">${param.id}</span>
                            <div class="price-box " itemprop="offers" itemscope="" itemtype="http://schema.org/Offer">

                                <span class="special-price""><span class="price product-price"><fmt:formatNumber value="${prod.price}"/>₫</span> </span>
                            </div>
                            <div class="product_description margin-bottom-30">
                                <div class="rte description">
                                    ${prod.description}
                                </div>
                            </div>
                                    <c:if test="${sessionScope.acc.role == 1}">
                                <form action="addcartservlet?pid=${prod.prId}" method="post">
                                    <div class="form-group form-groupx form-detail-action clearfix">
                                        <label class="hidden ">Số lượng: </label>
                                        <div class=" custom custom-btn-number f-left">																			
                                            <span class="qtyminus" data-field="quantity"><i class="fa fa-caret-left"></i></span>
                                            <input type="text" class="input-text qty" data-field="quantity" title="Só lượng" value="1" maxlength="${prod.quantity}" id="qty" name="quantity" onkeypress="if (isNaN(this.value + String.fromCharCode(event.keyCode)))
                                                        return false;">
                                            <span class="qtyplus" data-field="quantity">
                                                <i class="fa fa-caret-right"></i>
                                            </span>
                                        </div>
                                        <c:if test="${prod.quantity > 0}">
                                            <button type="submit" class=" btn btn-lg btn-primary btn-cart btn-cart2 add_to_cart btn_buy add_to_cart" title="Cho vào giỏ hàng">Thêm vào giỏ hàng</button>
                                        </c:if>
                                        <c:if test="${prod.quantity == 0}">
                                            <button style="background-color: #ADADAD;" type="submit" class=" btn btn-lg btn-primary btn-cart btn-cart2 add_to_cart btn_buy add_to_cart" title="Cho vào giỏ hàng" disabled>Thêm vào giỏ hàng</button>
                                        </c:if>

                                        <a class="iWishAdd iwishAddWrapper" title="Yêu thích" href="javascript:;"><i class="fa fa-heart-o"></i></a>
                                        <a class="iWishAdded iwishAddWrapper  iWishHidden" title="Bỏ yêu thích" href="javascript:;"><i class="fa fa-heart"></i></a>							
                                    </div>
                                </form>
                            </c:if>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <jsp:include page="footer.jsp"></jsp:include>
    </body>
</html>
