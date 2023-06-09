<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script src="/webjars/sockjs-client/sockjs.min.js"></script>
<script src="/webjars/stomp-websocket/stomp.min.js"></script>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>단기임대 No.1 DIGI실</title>
    <meta name="description" content="">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="robots" content="all,follow">
    <!-- Price Slider Stylesheets -->
    <link rel="stylesheet" href="/vendor/nouislider/nouislider.css">
    <!-- Google fonts - Playfair Display-->
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Playfair+Display:400,400i,700">
    <!-- Google fonts - Poppins-->
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Poppins:300,400,400i,700">
    <!-- swiper-->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.4.1/css/swiper.min.css">
    <!-- Magnigic Popup-->
    <link rel="stylesheet" href="/vendor/magnific-popup/magnific-popup.css">
    <!-- theme stylesheet-->
    <link rel="stylesheet" href="/css/style.default.css" id="theme-stylesheet">
    <!-- Custom stylesheet - for your changes-->
    <link rel="stylesheet" href="/css/custom.css">
    <!-- Favicon-->
    <link rel="shortcut icon" href="/img/favicon.png">
    <!-- Tweaks for older IEs--><!--[if lt IE 9]>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
    <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
    <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script><![endif]-->
    <!-- Font Awesome CSS-->
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.1/css/all.css" integrity="sha384-50oBUHEmvpQ+1lW4y57PTFmhCaXp0ML5d60M1M7uH2+nqUivzIebhndOJK28anvf" crossorigin="anonymous">
</head>
<script src="https://code.jquery.com/jquery-3.7.0.min.js" integrity="sha256-2Pmvv0kuTBOenSvLm6bvfBSSHrUJ+3A7x6P5Ebd07/g=" crossorigin="anonymous"></script>
<script>
    let websocket = {
        id:null,
        stompClient:null,
        init:function(){
            this.id = '${loginGuest.guestId}';
            websocket.connect();
            $("#disconnect").click(function() {
                websocket.disconnect();
            });
            $("#sendall").click(function() {
                websocket.sendAll();
            });
            $("#sendme").click(function() {
                websocket.sendMe();
            });
            $('#sendTo').click(function() {
                console.log('sendTo clicked');
                websocket.sendTo(sid);
            });
        },
        connect:function(){
            var sid = '${loginHost.hostId}';
            var socket = new SockJS('http://127.0.0.1:8088/ws');
            socket.withCredentials = false;
            this.stompClient = Stomp.over(socket);

            this.stompClient.connect({}, function(frame) {
                websocket.setConnected(true);
                console.log('Connected: ' + frame);
                this.subscribe('/send', function(msg) {

                });
                this.subscribe('/send/'+sid, function(msg) {


                });
                this.subscribe('/send/to/'+sid, function(msg) {

                });
            });
        },
        disconnect:function(){
            if (this.stompClient !== null) {
                this.stompClient.disconnect();
            }
            websocket.setConnected(false);
            console.log("Disconnected");
        },
        setConnected:function(connected){
            if (connected) {
                console.log('connected');
                $("#status").text("Connected");
            } else {
                $("#status").text("Disconnected");
            }
        },
        sendAll:function(){
            var msg = JSON.stringify({
                'sendid' : this.id,
                'content1' : $("#alltext").val()
            });
            this.stompClient.send("/receiveall", {}, msg);
        },
        sendTo:function(sid){
            var msg = JSON.stringify({
                'sendid' :  sid,
                'receiveid' : 'host1@host.com',
                'content1' : '등록되었습니다'
            });
            console.log(msg);
            this.stompClient.send('/receiveto', {}, msg);
        },
        sendMe:function(){
            var msg = JSON.stringify({
                'sendid' : this.id,
                'content1' : $('#metext').val()
            });
            this.stompClient.send("/receiveme", {}, msg);
        }
    };
    $(function(){
        websocket.init();
    })
</script>
<body style="padding-top: 72px;">
<header class="header">
    <!-- Navbar-->
    <nav class="navbar navbar-expand-lg fixed-top shadow navbar-light bg-white">

        <div class="container-fluid">
<%--            요기 이미지가 diretory 로고임--%>
            <div class="d-flex align-items-center"><a class="navbar-brand py-1" href="/"><img src="/img/logo.svg" alt="Directory logo"></a>
                <form class="form-inline d-none d-sm-flex" action="#" id="search">
                    <div class="input-label-absolute input-label-absolute-left input-expand ms-lg-2 ms-xl-3">
                        <label class="label-absolute" for="search_search"><i class="fa fa-search"></i><span class="sr-only">What are you looking for?</span></label>
                        <input class="form-control form-control-sm border-0 shadow-0 bg-gray-200" id="search_search" placeholder="Search" aria-label="Search" type="search">
                    </div>
                </form>
            </div>
    <div class="d-flex align-items-center justify-content-end" id="notificationBell">
        <svg class="svg-icon text-primary svg-icon-sd"><use xlink:href="#customer-suppot-1"> </use></svg>
        <button type="button" class="btn btn" data-bs-toggle="modal" data-bs-target="#myModal">
            <i class='fas fa-bell' style='font-size:24px'></i>
        </button>
    </div>
            <button class="navbar-toggler navbar-toggler-right" type="button" data-bs-toggle="collapse" data-bs-target="#navbarCollapse" aria-controls="navbarCollapse" aria-expanded="false" aria-label="Toggle navigation"><i class="fa fa-bars"></i></button>
            <!-- Navbar Collapse -->
            <div class="collapse navbar-collapse" id="navbarCollapse">
                <form class="form-inline mt-4 mb-2 d-sm-none" action="#" id="searchcollapsed">
                    <div class="input-label-absolute input-label-absolute-left w-100">
                        <label class="label-absolute" for="searchcollapsed_search"><i class="fa fa-search"></i><span class="sr-only">What are you looking for?</span></label>
                        <input class="form-control form-control-sm border-0 shadow-0 bg-gray-200" id="searchcollapsed_search" placeholder="Search" aria-label="Search" type="search">
                    </div>
                </form>
                <ul class="navbar-nav ms-auto">
                    <li class="nav-item dropdown"><a class="nav-link dropdown-toggle active" id="homeDropdownMenuLink" href="index.html" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                        Home</a>
                        <div class="dropdown-menu" aria-labelledby="homeDropdownMenuLink"><a class="dropdown-item" href="/room/list">Rooms</a><a class="dropdown-item" href="index-2.html">Restaurants</a><a class="dropdown-item" href="index-3.html">Travel</a><a class="dropdown-item" href="index-4.html">Real Estate <span class="badge badge-info-light ms-1 mt-n1">New</span></a></div>
                    </li>
                    <!-- Megamenu-->
                    <li class="nav-item dropdown position-static"><a class="nav-link dropdown-toggle" href="#" data-bs-toggle="dropdown">Template</a>
                        <div class="dropdown-menu megamenu py-lg-0">
                            <div class="row">
                                <div class="col-lg-9">
                                    <div class="row p-3 pe-lg-0 ps-lg-5 pt-lg-5">
                                        <div class="col-lg-3">
                                            <!-- Megamenu list-->
                                            <h6 class="text-uppercase">Homepage</h6>
                                            <ul class="megamenu-list list-unstyled">
                                                <li class="megamenu-list-item"><a class="megamenu-list-link" href="/room/list">Rooms   </a></li>
                                                <li class="megamenu-list-item"><a class="megamenu-list-link" href="index-2.html">Restaurants   </a></li>
                                                <li class="megamenu-list-item"><a class="megamenu-list-link" href="index-3.html">Travel   </a></li>
                                                <li class="megamenu-list-item"><a class="megamenu-list-link" href="index-4.html">Real estate <span class="badge badge-info-light ms-1">New</span>   </a></li>
                                            </ul>
                                            <!-- Megamenu list-->
                                            <h6 class="text-uppercase">Restaurants</h6>
                                            <ul class="megamenu-list list-unstyled">
                                                <li class="megamenu-list-item"><a class="megamenu-list-link" href="category.html">Category - Map on the top   </a></li>
                                                <li class="megamenu-list-item"><a class="megamenu-list-link" href="category-2.html">Category - Map on the right   </a></li>
                                                <li class="megamenu-list-item"><a class="megamenu-list-link" href="category-3.html">Category - no map   </a></li>
                                                <li class="megamenu-list-item"><a class="megamenu-list-link" href="detail.html">Restaurant detail   </a></li>
                                            </ul>
                                        </div>
                                        <div class="col-lg-3">
                                            <!-- Megamenu list-->
                                            <h6 class="text-uppercase">Rooms</h6>
                                            <ul class="megamenu-list list-unstyled">
                                                <li class="megamenu-list-item"><a class="megamenu-list-link" href="category-rooms.html">Category - Map on the top   </a></li>
                                                <li class="megamenu-list-item"><a class="megamenu-list-link" href="category-2-rooms.html">Category - Map on the right   </a></li>
                                                <li class="megamenu-list-item"><a class="megamenu-list-link" href="category-3-rooms.html">Category - no map   </a></li>
                                                <li class="megamenu-list-item"><a class="megamenu-list-link" href="detail-rooms.html">Room detail   </a></li>
                                            </ul>
                                            <!-- Megamenu list-->
                                            <h6 class="text-uppercase">Blog</h6>
                                            <ul class="megamenu-list list-unstyled">

                                                <li class="megamenu-list-item"><a class="megamenu-list-link" href="blog.html">Blog   </a></li>
                                                <li class="megamenu-list-item"><a class="megamenu-list-link" href="post.html">Post   </a></li>
                                            </ul>
                                            <!-- Megamenu list-->
                                            <h6 class="text-uppercase">Pages</h6>
                                            <ul class="megamenu-list list-unstyled">
                                                <li class="megamenu-list-item"><a class="megamenu-list-link" href="compare.html">Comparison   </a></li>
                                                <li class="megamenu-list-item"><a class="megamenu-list-link" href="team.html">Team   </a></li>
                                                <li class="megamenu-list-item"><a class="megamenu-list-link" href="contact.html">Contact   </a></li>
                                            </ul>
                                        </div>
                                        <div class="col-lg-3">
                                            <!-- Megamenu list-->
                                            <h6 class="text-uppercase">Pages</h6>
                                            <ul class="megamenu-list list-unstyled">
                                                <li class="megamenu-list-item"><a class="megamenu-list-link" href="pricing.html">Pricing   </a></li>
                                                <li class="megamenu-list-item"><a class="megamenu-list-link" href="text.html">Text page   </a></li>
                                                <li class="megamenu-list-item"><a class="megamenu-list-link" href="faq.html">F.A.Q.s   </a></li>
                                                <li class="megamenu-list-item"><a class="megamenu-list-link" href="coming-soon.html">Coming soon   </a></li>
                                                <li class="megamenu-list-item"><a class="megamenu-list-link" href="404.html">404 page   </a></li>
                                                <li class="megamenu-list-item"><a class="megamenu-list-link" href="knowledge-base.html">Knowledge Base  <span class="badge badge-info-light ms-1">New</span>   </a></li>
                                                <li class="megamenu-list-item"><a class="megamenu-list-link" href="knowledge-base-topic.html">Knowledge Base  &mdash; Topic<span class="badge badge-info-light ms-1">New</span>   </a></li>
                                                <li class="megamenu-list-item"><a class="megamenu-list-link" href="terms.html">Terms & Conditions  <span class="badge badge-info-light ms-1">New</span>   </a></li>
                                            </ul>
                                            <!-- Megamenu list-->
                                            <h6 class="text-uppercase">Host</h6>
                                            <ul class="megamenu-list list-unstyled">
                                                <li class="megamenu-list-item"><a class="megamenu-list-link" href="user-add-0.html">Add new listing - 6 pages   </a></li>
                                                <li class="megamenu-list-item"><a class="megamenu-list-link" href="user-list.html">Bookings &mdash; list view   </a></li>
                                            </ul>
                                        </div>
                                        <div class="col-lg-3">
                                            <!-- Megamenu list-->
                                            <h6 class="text-uppercase">User</h6>
                                            <ul class="megamenu-list list-unstyled">
                                                <li class="megamenu-list-item"><a class="megamenu-list-link" href="user-profile.html">Profile   </a></li>
                                                <li class="megamenu-list-item"><a class="megamenu-list-link" href="user-account.html">Account   </a></li>
                                                <li class="megamenu-list-item"><a class="megamenu-list-link" href="user-personal.html">Personal info - forms   </a></li>
                                                <li class="megamenu-list-item"><a class="megamenu-list-link" href="user-security.html">Password & security - forms   </a></li>
                                                <li class="megamenu-list-item"><a class="megamenu-list-link" href="login.html">Sign in   </a></li>
                                                <li class="megamenu-list-item"><a class="megamenu-list-link" href="/signup">Sign up   </a></li>
                                                <li class="megamenu-list-item"><a class="megamenu-list-link" href="user-booking-1.html">Booking process - 4 pages   </a></li>
                                                <li class="megamenu-list-item"><a class="megamenu-list-link" href="user-grid.html">Bookings &mdash; grid view   </a></li>
                                                <li class="megamenu-list-item"><a class="megamenu-list-link" href="user-booking-detail.html">Booking detail   </a></li>
                                                <li class="megamenu-list-item"><a class="megamenu-list-link" href="user-invoice.html">Invoice  <span class="badge badge-info-light ms-1">New</span>   </a></li>
                                                <li class="megamenu-list-item"><a class="megamenu-list-link" href="user-messages.html">Messages <span class="badge badge-info-light ms-1">New</span>   </a></li>
                                                <li class="megamenu-list-item"><a class="megamenu-list-link" href="user-messages-detail.html">Message Detail  <span class="badge badge-info-light ms-1">New</span>   </a></li>
                                            </ul>
                                        </div>
                                    </div>
                                    <div class="row megamenu-services d-none d-lg-flex ps-lg-5">
                                        <div class="col-xl-3 col-lg-6 d-flex">
                                            <div class="megamenu-services-item">
                                                <svg class="svg-icon megamenu-services-icon">
                                                    <use xlink:href="#destination-map-1"> </use>
                                                </svg>
                                                <div>
                                                    <h6 class="text-uppercase">Best rentals</h6>
                                                    <p class="mb-0 text-muted text-sm">Find the perfect place</p>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-xl-3 col-lg-6 d-flex">
                                            <div class="megamenu-services-item">
                                                <svg class="svg-icon megamenu-services-icon">
                                                    <use xlink:href="#money-box-1"> </use>
                                                </svg>
                                                <div>
                                                    <h6 class="text-uppercase">Earn points</h6>
                                                    <p class="mb-0 text-muted text-sm">And get great rewards</p>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-xl-3 col-lg-6 d-flex">
                                            <div class="megamenu-services-item">
                                                <svg class="svg-icon megamenu-services-icon">
                                                    <use xlink:href="#customer-support-1"> </use>
                                                </svg>
                                                <div>
                                                    <h6 class="text-uppercase">020-800-456-747</h6>
                                                    <p class="mb-0 text-muted text-sm">24/7 Available Support</p>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-xl-3 col-lg-6 d-flex">
                                            <div class="megamenu-services-item">
                                                <svg class="svg-icon megamenu-services-icon">
                                                    <use xlink:href="#secure-payment-1"> </use>
                                                </svg>
                                                <div>
                                                    <h6 class="text-uppercase">Secure Payment</h6>
                                                    <p class="mb-0 text-muted text-sm">Secure Payment</p>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-lg-3 d-none d-lg-block position-relative"><img class="bg-image" src="/img/photo/photo-1521170665346-3f21e2291d8b.jpg" alt=""></div>
                            </div>
                        </div>
                    </li>
                    <!-- /Megamenu end-->
                    <c:choose>
                        <c:when test="${loginGuest != null}">
                            <li class="nav-item"><a class="nav-link" href="/chat?guestId=${loginGuest.getGuestId()}"> 메신저 </a>
                        </c:when>
                        <c:otherwise>

                        </c:otherwise>
                    </c:choose>
                    </li>
                    <li class="nav-item dropdown"><a class="nav-link dropdown-toggle " id="docsDropdownMenuLink" href="/index" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                        Docs</a>
                        <div class="dropdown-menu dropdown-menu-end" aria-labelledby="docsDropdownMenuLink">
                            <h6 class="dropdown-header fw-normal">Documentation</h6><a class="dropdown-item" href="/randomChat">종이비행기 </a><a class="dropdown-item" href="/randomChat">Directory structure </a><a class="dropdown-item" href="docs/docs-gulp.html">Gulp </a><a class="dropdown-item" href="docs/docs-customizing-css.html">Customizing CSS </a><a class="dropdown-item" href="docs/docs-credits.html">Credits </a><a class="dropdown-item" href="docs/docs-changelog.html">Changelog </a>
                            <div class="dropdown-divider"></div>
                            <h6 class="dropdown-header fw-normal">Components</h6><a class="dropdown-item" href="docs/components-bootstrap.html">Bootstrap </a><a class="dropdown-item" href="docs/components-directory.html">Theme </a>
                        </div>
                    </li>
                    <c:choose>
                        <c:when test="${loginGuest == null}">
                            <li class="nav-item"><a class="nav-link" href="/login">로그인</a></li>
                            <li class="nav-item"><a class="nav-link" href="/register">회원가입</a></li>
                        </c:when>
                        <c:otherwise>
                            <c:if test="${loginGuest.guestImage == null}">
                                <img class="avatar avatar-border-white flex-shrink-0 me-2" src="/img/avatar/default_profile.png" alt="Julie"/>
                            </c:if>
                            <c:if test="${loginGuest.guestImage != null}">
                                <img class="avatar avatar-border-white flex-shrink-0 me-2" src="/uimg/${loginGuest.guestImage}" alt="Julie"/>
                            </c:if>
                            <li class="nav-item dropdown"><a id="loginDropdownMenuLink" class="nav-link dropdown-toggle" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false" href="/login">${loginGuest.guestName}</a>
                                <div class="dropdown-menu" aria-labelledby="loginDropdownMenuLink">
                                    <a class="dropdown-item" href="/guestInfo?id=${loginGuest.guestId}">회원정보 수정</a>
                                    <a class="dropdown-item" href="/guestPwd?id=${loginGuest.guestId}">비밀번호 변경</a>
                                    <a class="dropdown-item" href="/reservelist?guestId=${loginGuest.guestId}">나의 예약정보</a>
                                    <a class="dropdown-item" href="/likeList?guestId=${loginGuest.guestId}">찜 목록</a>
                                </div>
                            </li>
                            <li class="nav-item"><a class="nav-link" href="/logouts">로그아웃</a></li>
                        </c:otherwise>
                    </c:choose>
                    <li class="nav-item mt-3 mt-lg-0 ms-lg-3 d-lg-none d-xl-inline-block"><a class="btn btn-primary" href="user-add-0.html">당신의 공간을 DIGI실 하세요</a></li>
                </ul>
            </div>
        </div>
    </nav>
    <!-- /Navbar -->
</header>

        <c:choose>
            <c:when test="${center == null}">
                <jsp:include page="center.jsp"/>
            </c:when>
            <c:otherwise>
                <jsp:include page="${center}.jsp"/>
            </c:otherwise>
        </c:choose>


<!-- Footer-->
<footer class="position-relative z-index-10 d-print-none">
    <!-- Main block - menus, subscribe form-->
    <div class="py-6 bg-gray-200 text-muted">
        <div class="container">
            <div class="row">
                <div class="col-lg-4 mb-5 mb-lg-0">
                    <div class="fw-bold text-uppercase text-dark mb-3">Directory</div>
                    <p>Lorem ipsum dolor sit amet, consectetur adipisicing.</p>
                    <ul class="list-inline">
                        <li class="list-inline-item"><a class="text-muted text-primary-hover" href="#" target="_blank" title="twitter"><i class="fab fa-twitter"></i></a></li>
                        <li class="list-inline-item"><a class="text-muted text-primary-hover" href="#" target="_blank" title="facebook"><i class="fab fa-facebook"></i></a></li>
                        <li class="list-inline-item"><a class="text-muted text-primary-hover" href="#" target="_blank" title="instagram"><i class="fab fa-instagram"></i></a></li>
                        <li class="list-inline-item"><a class="text-muted text-primary-hover" href="#" target="_blank" title="pinterest"><i class="fab fa-pinterest"></i></a></li>
                        <li class="list-inline-item"><a class="text-muted text-primary-hover" href="#" target="_blank" title="vimeo"><i class="fab fa-vimeo"></i></a></li>
                    </ul>
                </div>
                <div class="col-lg-2 col-md-6 mb-5 mb-lg-0">
                    <h6 class="text-uppercase text-dark mb-3">Rentals</h6>
                    <ul class="list-unstyled">
                        <li><a class="text-muted" href="index.html">Rooms</a></li>
                        <li><a class="text-muted" href="category-rooms.html">Map on top</a></li>
                        <li><a class="text-muted" href="category-2-rooms.html">Side map</a></li>
                        <li><a class="text-muted" href="category-3-rooms.html">No map</a></li>
                        <li><a class="text-muted" href="detail-rooms.html">Room detail</a></li>
                    </ul>
                </div>
                <div class="col-lg-2 col-md-6 mb-5 mb-lg-0">
                    <h6 class="text-uppercase text-dark mb-3">Pages</h6>
                    <ul class="list-unstyled">
                        <li><a class="text-muted" href="compare.html">Comparison                                   </a></li>
                        <li><a class="text-muted" href="team.html">Team                                   </a></li>
                        <li><a class="text-muted" href="contact.html">Contact                                   </a></li>
                    </ul>
                </div>
                <div class="col-lg-4">
                    <h6 class="text-uppercase text-dark mb-3">Daily Offers & Discounts</h6>
                    <p class="mb-3"> Lorem ipsum dolor sit amet, consectetur adipisicing elit. At itaque temporibus.</p>
                    <form action="#" id="newsletter-form">
                        <div class="input-group mb-3">
                            <input class="form-control bg-transparent border-dark border-end-0" type="email" placeholder="Your Email Address" aria-label="Your Email Address">
                            <button class="btn btn-outline-dark border-start-0" type="submit"> <i class="fa fa-paper-plane text-lg"></i></button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
    <!-- Copyright section of the footer-->
    <div class="py-4 fw-light bg-gray-800 text-gray-300">
        <div class="container">
            <div class="row align-items-center">
                <div class="col-md-6 text-center text-md-start">
                    <p class="text-sm mb-md-0">&copy; 2021, Your company.  All rights reserved.</p>
                </div>
                <div class="col-md-6">
                    <ul class="list-inline mb-0 mt-2 mt-md-0 text-center text-md-end">
                        <li class="list-inline-item"><img class="w-2rem" src="/img/visa.svg" alt="..."></li>
                        <li class="list-inline-item"><img class="w-2rem" src="/img/mastercard.svg" alt="..."></li>
                        <li class="list-inline-item"><img class="w-2rem" src="/img/paypal.svg" alt="..."></li>
                        <li class="list-inline-item"><img class="w-2rem" src="/img/western-union.svg" alt="..."></li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
</footer>
<!-- JavaScript files-->
<script>
    // ------------------------------------------------------- //
    //   Inject SVG Sprite -
    //   see more here
    //   https://css-tricks.com/ajaxing-svg-sprite/
    // ------------------------------------------------------ //
    function injectSvgSprite(path) {

        var ajax = new XMLHttpRequest();
        ajax.open("GET", path, true);
        ajax.send();
        ajax.onload = function(e) {
            var div = document.createElement("div");
            div.className = 'd-none';
            div.innerHTML = ajax.responseText;
            document.body.insertBefore(div, document.body.childNodes[0]);
        }
    }
    // to avoid CORS issues when viewing using file:// protocol, using the demo URL for the SVG sprite
    // use your own URL in production, please :)
    // https://demo.bootstrapious.com/directory/1-0/icons/orion-svg-sprite.svg
    //- injectSvgSprite('${path}icons/orion-svg-sprite.svg');
    injectSvgSprite('https://demo.bootstrapious.com/directory/1-4/icons/orion-svg-sprite.svg');

</script>

<!-- jQuery-->
<script src="/vendor/jquery/jquery.min.js"></script>
<!-- Bootstrap JS bundle - Bootstrap + PopperJS-->
<script src="/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
<!-- Magnific Popup - Lightbox for the gallery-->
<script src="/vendor/magnific-popup/jquery.magnific-popup.min.js"></script>
<!-- Smooth scroll-->
<script src="/vendor/smooth-scroll/smooth-scroll.polyfills.min.js"></script>
<!-- Bootstrap Select-->
<script src="/vendor/bootstrap-select/js/bootstrap-select.min.js"></script>
<!-- Object Fit Images - Fallback for browsers that don't support object-fit-->
<script src="/vendor/object-fit-images/ofi.min.js"></script>
<!-- Swiper Carousel                       -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.4.1/js/swiper.min.js"></script>
<script>var basePath = ''</script>
<!-- Main Theme JS file    -->
<script src="/js/theme.js"></script>

<%--rooms daterange--%>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-date-range-picker/0.19.0/jquery.daterangepicker.min.js"> </script>
<div class="modal" id="myModal">
    <div class="modal-dialog">
        <div class="modal-content">

            <!-- Modal Header -->
            <div class="modal-header">
                <h4 class="modal-title">Modal Heading</h4>
                <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
            </div>

            <!-- Modal body -->
            <div class="modal-body">
                <h3>Some text to enable scrolling..</h3>
                <p>Some text to enable scrolling.. Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.</p>
                <p>Some text to enable scrolling.. Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.</p>

                <p>Some text to enable scrolling.. Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.</p>
            </div>

            <!-- Modal footer -->
            <div class="modal-footer">
                <button type="button" class="btn btn-danger" data-bs-dismiss="modal">Close</button>
            </div>

        </div>
    </div>
</div>
</body>
</html>