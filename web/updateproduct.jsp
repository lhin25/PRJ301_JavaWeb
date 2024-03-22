
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Cập nhật</title>
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

                                <li><strong itemprop="title">Chỉnh sửa sản phẩm</strong></li>
                            </ul>
                        </div>
                    </div>
                </div>
            </section>
            <div class="container margin-bottom-20">
                <h1 class="title-head">Chỉnh sửa sản phẩm</h1>
                <div class="row">
                    <div class="col-lg-6">
                        <div class="margin-bottom-30">
                            <div id="update">
                                
                            <form action="updateproductservlet?id=${param.id}" method="post" id="customer_login">
                                <div class="form-signup clearfix">
                                    <fielset class="form-group">
                                        <label>Mã sản phẩm</label>
                                        <input type="text" class="form-control form-control-lg" value="${proc.prId}" name="p_id" id="proc_id" placeholder="Mã sản phẩm" readonly="">
                                    </fielset>
                                    <fielset class="form-group">
                                        <label>Tên sản phẩm <span class="required">*</span></label>
                                        <input type="text" class="form-control form-control-lg" value="${proc.prName}" name="p_name" id="proc_name" placeholder="Tên sản phẩm" required="">
                                    </fielset>
                                    <fieldset class="form-group">
                                        <label>Link hình ảnh <span class="required">*</span></label>
                                        <input type="text" class="form-control form-control-lg" value="${proc.prImg}" name="p_img" id="proc_img" placeholder="Link" required="">
                                    </fieldset>
                                    <fieldset class="form-group">
                                        <label>Loại sản phẩm <span class="required">*</span></label>
                                        <input type="text" class="form-control form-control-lg" value="${proc.prType}" name="p_type" id="proc_type" placeholder="Loại sản phẩm" required="">
                                    </fieldset>
                                    <fieldset class="form-group">
                                        <label>Nguyên tác <span class="required">*</span></label>
                                        <input type="text" class="form-control form-control-lg" value="${proc.prOrg}" name="p_org" id="proc_org" placeholder="Nguyên tác" required="">
                                    </fieldset>
                                    <fieldset class="form-group">
                                        <label>Giá cả<span class="required">*</span></label>
                                        <input type="text" pattern="/^[+-]?((\d+(\.\d*)?)|(\.\d+))$/" class="form-control form-control-lg" value="${proc.price}" name="p_price" id="proc_price" placeholder="Giá cả" required="">
                                    </fieldset>
                                    <fieldset class="form-group">
                                        <label>Số lượng<span class="required">*</span></label>
                                        <input type="number" class="form-control form-control-lg" value="${proc.quantity}" name="p_quantity" id="proc_quantity" required="">
                                    </fieldset>
                                    <fieldset class="form-group">
                                        <label>Mô tả<span class="required">*</span></label>
                                        <input type="text" class="form-control form-control-lg" maxlength="280" value="${proc.description}" name="p_description" id="proc_description" placeholder="Mô tả" required="">
                                    </fieldset>
                                    <div class="pull-xs-left" style="margin-top: 25px;">
                                        <input class="btn btn-style btn-primary" type="submit" value="Cập nhật">
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
