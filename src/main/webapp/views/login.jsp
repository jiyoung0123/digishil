<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/4.6.0/js/bootstrap.min.js"></script>

<script>
    let loginForm = {
        init:function(){
            $("#loginBtn").click(function(){
                loginForm.send();
            });
        },
        send:function(){
            $("#loginForm").attr({
                'action':'/loginImpl',
                'method':'post'
            });
            $("#loginForm").submit();
        }
    };
    $(function(){
        loginForm.init();
        let msg = "${msg}";
        if(msg != ""){
            alert(msg);
        }
    });

    $(function(){
        $("#pwdBtn").click(function(){
            let guestId = $("#searchPwd").val();
            $.ajax({
                url:"/findPwd",
                dataType:'json',
                data:{"guestId":guestId},
                success:function(data){
                    if(data==true){
                        alert("임시 비밀번호가 발급되었습니다.메일함을 확인해 주세요");
                        console.log(data);
                    }else{
                        alert("아이디를 정확하게 입력해 주세요");
                        console.log(data);
                    }
                }
            });
        });
    });


</script>

<body>
<div class="container-fluid px-3">
  <div class="row min-vh-100">
    <div class="col-md-8 col-lg-6 col-xl-5 d-flex align-items-center">
      <div class="w-100 py-5 px-md-5 px-xxl-6 position-relative">
        <div class="mb-5">
          <h2>로그인</h2>
        </div>
        <form class="form-validate" id="loginForm">
          <div class="mb-4">
            <label class="form-label" for="guestId"> 메일주소</label>
            <input class="form-control" name="guestId" id="guestId" type="email" placeholder="name@address.com" autocomplete="off" required data-msg="Please enter your email">
          </div>
          <div class="mb-4">
            <div class="row">
              <div class="col">
                <label class="form-label" for="guestPwd"> 비밀번호</label>
              </div>
              <div class="col-auto"><a class="form-text small text-primary" data-toggle="modal" href="#" data-target="#pwdModal">비밀번호 찾기</a></div>
            </div>
            <input class="form-control" name="guestPwd" id="guestPwd" placeholder="Password" type="password" required data-msg="Please enter your password">
          </div>
          <div class="mb-4">
            <div class="form-check">
              <input class="form-check-input" id="loginRemember" type="checkbox">
              <label class="form-check-label text-muted" for="loginRemember"> <span class="text-sm">30일동안 기억하기</span></label>
            </div>
          </div>
          <!-- Submit-->
          <div class="d-grid">
            <button style="height: 61.28px;" id="loginBtn" class="btn btn-lg btn-primary">로그인 하기</button>
          </div>
          <hr class="my-3 hr-text letter-spacing-2" data-content="OR">
            <div class="d-grid gap-2">
                <a href="https://kauth.kakao.com/oauth/authorize?client_id=9b7c02c3cdf81109f8023cd5a12156ee&redirect_uri=http://127.0.0.1/auth/kakao/callback&response_type=code">
                    <img class="img-fluid" src="/img/photo/kakaoLogin.jpg"></a>
            </div>
          <hr class="my-4">
          <p class="text-center"><small class="text-muted text-center"><a href="/register">회원 가입 하러 가기</a></small></p>
        </form>
      </div>
    </div>
    <div class="col-md-4 col-lg-6 col-xl-7 d-none d-md-block">
      <!-- Image-->
      <div class="bg-cover h-100 me-n3" style="background-image: url(img/photo/london.jpg);"></div>
<%--        <div class="bg-cover h-100 me-n3" style="background-image: url(img/photo/london.jpg);"></div>--%>
    </div>
  </div>
</div>

<!-- Modal -->
<form action="/findPwd" method="get">

<div class="modal fade" id="pwdModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">비밀번호를 잊으셨나요?</h5>
                <button type="button" class="btn btn-light" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <h2>임시 비밀번호 발급</h2>
                <label class="form-label" for="guestId"> 메일주소</label>
                <input id="searchPwd" class="form-control" name="guestId" type="email" placeholder="name@address.com" autocomplete="off" required data-msg="Please enter your email">
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-light" data-dismiss="modal">Close</button>
                <button type="button" class="btn btn-primary" id="pwdBtn">Temp Passwoord</button>
            </div>
        </div>
    </div>
</div>
</form>


</body>

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


