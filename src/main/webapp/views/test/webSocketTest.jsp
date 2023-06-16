<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<script src="/webjars/sockjs-client/sockjs.min.js"></script>
<script src="/webjars/stomp-websocket/stomp.min.js"></script>
<script>
    let websocket = {
        id:null,
        stompClient:null,
        init:function(){
            this.id = 'host1@host.com';
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
                websocket.sendTo();
            });
        },
        connect:function(){
            var sid = 'host1@host.com';
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
        sendTo:function(){
            var msg = JSON.stringify({
                'sendid' : this.id,
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

<%--맨 위에 사진 부분--%>
<section class="hero-home">
  <div>
      <button type="button"class="btn btn-warning" id="sendTo"> button </button>
  </div>
</section>