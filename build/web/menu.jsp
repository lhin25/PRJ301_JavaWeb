<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Home</title>
    </head>
    <body>
        <header class="header" style="height: 170px;">
            <div class="header-topbar">
                <div class="header-topbar-inner">
                    <div class="topbar-left hidden-sm-down">
                        <div class="phone">
                            <i class="fa fa-phone left" aria-hidden="true"></i>
                            Hỗ trợ miễn phí: <a href="tel:0865409129">0865409129</a>
                        </div>

                    </div>
                    <div class="topbar_right">
                        <ul class="list-none">
                            <li class="dropdown-nav">
                                <a class="jsfixmobile" href="#">
                                    <i class="fa fa-user left" aria-hidden="true"></i>
                                    <c:if test="${sessionScope.acc == null}">
                                    <span class="hidden-sm-down">Tài khoản</span>
                                    </c:if>
                                    <c:if test="${sessionScope.acc != null}">
                                        <span class="hidden-sm-down">${sessionScope.acc.usName}</span>
                                    </c:if>
                                    <i class="fa fa-angle-down right" aria-hidden="true"></i>
                                </a>
                                <div class="dropdown-menu">
                                    <ul>
                                        <c:if test="${sessionScope.acc != null}">
                                            <li>
                                                <a href="accountservlet">Tài khoản</a>
                                            </li>
                                        </c:if>
                                        <c:if test="${sessionScope.acc.role == 1}">
                                            <li>
                                                <a class="iWishView" href="javascript:;" data-customer-id="${sessionScope.acc.usId}">Yêu thích</a>
                                            </li>
                                            <li>
                                                <a href="cart.jsp">Thanh toán</a>
                                            </li>
                                        </c:if>
                                    </ul>

                                    <ul>
                                        <c:if test="${sessionScope.acc != null}">
                                            <span class="divider"></span>
                                            <li>
                                                <a href="logoutservlet">
                                                    <i class="fa fa-lock left" aria-hidden="true"></i>
                                                    Đăng xuất
                                                </a>
                                            </li>
                                        </c:if>
                                        <c:if test="${sessionScope.acc == null}">
                                            <li>
                                                <a href="loginservlet">
                                                    <i class="fa fa-lock left" aria-hidden="true"></i>
                                                    Đăng nhập
                                                </a>
                                            </li>
                                            <li>
                                                <a href="registerservlet">
                                                    <i class="fa fa-user left" aria-hidden="true"></i>
                                                    Đăng ký
                                                </a>
                                            </li>
                                        </c:if>
                                    </ul>
                                </div>
                            </li>
                            <li>
                                <c:if test="${sessionScope.acc.role == 0}">

                                    <a href="addnewservlet">Thêm mới</a>

                                </c:if>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
            <div id="header-sticky" class="header-main">
                <div class="header-main-inner">
                    <div class="logo">
                        <a href="home.jsp">
                            <img src="https://1000logos.net/wp-content/uploads/2023/02/HoYoverse-Logo.png">
                        </a>
                    </div>
                    <div class="header-rightside-nav">
                        <div class="sidebar-icon-nav">
                            <ul class="list-none-ib">
                                <li>
                                    <a id="search-overlay-menu-btn" href="searchservlet">
                                        <i aria-hidden="true" class="fa fa-search"></i>
                                    </a>
                                </li>
                                <li>
                                    <a class="iWishView js_whishlist-btn" href="javascript:;" data-customer-id="0">
                                        <i aria-hidden="true" class="fa fa-heart"></i>
                                    </a>
                                </li>
                                <li>
                                    <a href="cart.jsp">
                                        <div class="cart-icon">
                                            <i aria-hidden="true" class="fa fa-shopping-bag"></i>
                                        </div>

                                        <div class="cart-title">
                                            <span class="cart-count cartCount count_item_pr" id="cart-total">${sessionScope.size}</span>								
                                            
                                        </div>
                                    </a>
                                </li>
                            </ul>
                        </div>
                    </div>
                    <nav class="navigation-menu">
                        <ul>
                            <li>
                                <a href="allservlet?org=all">Tất cả sản phẩm</a>
                            </li>
                            <c:forEach var="o" items="${sessionScope.origin}">
                                <li class="menudon menu-dropdown-icon">
                                    <a href="allservlet?org=${o.orgId}">${o.orgName}
                                        <i class="fa fa-angle-right hidden-sm hidden-xs" style="margin-left: 3px;"></i>
                                    </a>
                                    <ul class="nav-dropdown js-nav-dropdown normal-sub" style="display: none;">
                                        <c:forEach var="t" items="${sessionScope.cate}">
                                            <c:if test="${t.orgId eq o.orgId}">
                                                <li class="nav-item-lv2">
                                                    <a class="nav-link" href="allservlet?category=${t.typeId}">${t.typeName}</a>
                                                </li>
                                            </c:if>
                                        </c:forEach>
                                    </ul>
                                    <div class="dropworn-arrow"></div>
                                </li>
                            </c:forEach>
                        </ul>
                    </nav>
                </div>
            </div>
        </header>
    </body>
</html>
