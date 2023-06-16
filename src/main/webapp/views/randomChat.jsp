<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/4.6.0/js/bootstrap.min.js"></script>

<script>
let websocket={
    id:null,
    stompClient:null,
    init:function(){
        this.id = $('#loginGuestId').text();
        $("#connectBtn").click(function() {
            websocket.connect();
        });
        $("#disconnectBtn").click(function() {
            websocket.disconnect();
        });
        $("#sendall").click(function() {
            websocket.sendAll();
        });

    },
    connect:function(){
        var sid = this.id;

        // 관리자 서버로 접속:8088
        var socket = new SockJS('${adminserver}/ws');
        this.stompClient = Stomp.over(socket);

        this.stompClient.connect({}, function(frame) {
            websocket.setConnected(true);
            console.log('Connected: ' + frame);
            this.subscribe('/send', function(msg) {
                $("#all").prepend(
                    "<h4>" + JSON.parse(msg.body).sendid +":"+
                    JSON.parse(msg.body).content1
                    + "</h4>");
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
            $("#status").text("Connected");
        } else {
            $("#status").text("Disconnected");
        }
    },
    // receiveall한테 메세지를 보내는것 -receiveall은 8088/ws에 있음-관리자의 msgcontroller로 들어옴
    sendAll:function(){
        var msg = JSON.stringify({
            'sendid' : this.id,
            'content1' : $("#alltext").val()
        });
        this.stompClient.send("/receiveall", {}, msg);
    }
};

$(function(){
    websocket.init();
})


</script>


<body style="padding-top: 72px;">
<!-- Hero Section-->
<section class="hero py-6 py-lg-7 text-white dark-overlay"><img class="bg-image" src="img/photo/photo-1522143049013-2519756a52d4.jpg" alt="How can we help you today?">
    <div class="container overlay-content">
        <!-- Breadcrumbs -->
        <ol class="breadcrumb text-white justify-content-center no-border mb-0">
            <li class="breadcrumb-item"><a href="index.html">Home</a></li>
            <li class="breadcrumb-item active">Contact                         </li>
        </ol>
        <h1 class="hero-heading">How can we help you today?</h1>
    </div>
</section>

<section class="py-6 bg-gray-100">
    <div class="container">
        <h2 class="h4 mb-5">종이 비행기</h2>
        <div class="row">
            <div class="col-md-5 mb-5 mb-md-0">
                <form class="form" id="contact-form" method="post" action="contact.php">
                    <h1 id="loginGuestId">${loginGuest.getGuestId()}</h1>
                    <H1 id="status">Status</H1>
                    <div class="controls">
                        <div class="row">
                            <div class="col-sm-6">
                                <div class="mb-4">
                                    <label class="form-label" for="name">닉네임</label>
                                    <input class="form-control" type="text" name="name" id="name" placeholder="대화명을 입력 해 주세요">
                                </div>
                            </div>
<%--                            <div class="col-sm-6">--%>
<%--                                <div class="mb-4">--%>
<%--                                    <label class="form-label" for="surname">Your lastname *</label>--%>
<%--                                    <input class="form-control" type="text" name="surname" id="surname" placeholder="Enter your  lastname" required="required">--%>
<%--                                </div>--%>
<%--                            </div>--%>
                        </div>
                        <div class="mb-4">
                            <label class="form-label" for="email">Your email *</label>
                            <input class="form-control" type="email" name="email" id="email" placeholder="Enter your  email">
                        </div>
                        <div class="mb-4">
                            <label class="form-label" for="message">Your message for us *</label>
                            <textarea class="form-control" rows="4" name="message" id="message" placeholder="Enter your message"></textarea>
                        </div>
                        <button class="btn btn-outline-primary" id="connectBtn">종이비행기 날리기</button>
                        <img src="img/paperPlaneWhite.jpg" style="width: 50px;margin-left: 10px;">

                        <button class="btn btn-outline-primary" id="disconnectBtn">연결해제</button>
                    </div>
                </form>
            </div>
            <div class="col-md-5">
                <div class="ps-lg-4 text-sm">
                    <p class="text-muted"></p>
                    <p class="text-muted"></p>
                </div>
            </div>
        </div>
    </div>
</section>
</body>
