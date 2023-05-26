<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
<script>
    // window.Kakao.init("2fcf1ae3889fb2cc04ae6d2eac555670");
    // function kakaoLogin(){
    //     window.Kakao.Auth.login({
    //         scope:'profile_nickname, profile_image, account_email',
    //         success:function(authObj){
    //             console.log(authObj);
    //             window.Kakao.API.request({
    //                 url:'/v2/user/me',
    //             })
    //         }
    //     })
    // };

  let idCheck = {
      init:function(){
          $('#idCheck').click(function(){
              idCheck.send();
          });
      },
      send:function(){
          var guestId = $('#guestId').val();
          if (!validateEmail(guestId)) {
              $('#checkId').text('ID는 메일 주소 형식입니다.');
              return;
          }
          $.ajax({
              url:'/checkId',
              data:{'guestId':guestId},
              success:function(result){
                  if(result==0){
                      $('#checkId').text('룔룔사용가능합니다.');
                      $('#guestName').focus();
                  }else{
                      $('#checkId').text('중복된 ID 입니다.');
                      // $('#checkId').text('룔룔사용불가능합니다.');
                  }
              }
          });
      }
  };
  let registerForm = {
    init:function(){
        $('#guestPwd').keyup(function(){
            var guestPwd = $('#guestPwd').val();
            var guestPwd1 = $('#guestPwd1').val();
            if(guestPwd.length<=3){
                $('#checkPwd').text('비밀번호는 4자리 이상입니다.');
            }else{
                $('#checkPwd').text('사용가능한 비밀번호 입니다.');
            }
            // if(guestPwd != guestPwd1){
            //     alert("동일한 비밀번호를 입력해 주세요");
            //     return;
            // }
        });
      $('#registerBtn').click(function(){
        registerForm.send();
      });
    },
    send:function(){
      var guestId = $('#guestId').val();
      var guestPwd = $('#guestPwd').val();
      var guestPwd1 = $('#guestPwd1').val();
      var guestName = $('#guestName').val();
      if(guestName == ''){
            $('#Name').focus();
            return;
      }
      if(guestPwd != guestPwd1){
        alert("동일한 비밀번호를 입력해 주세요");
        return;
      }
      $('#registerForm').attr({
        'action':'/registerImpl',
        'method':'post'
      });
      $('#registerForm').submit();
    }
  };
  function validateEmail(email) {
      var emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
      return emailRegex.test(email);
  }
  $(function(){
      registerForm.init();
      idCheck.init();
  });
</script>
<body>
<div class="container-fluid px-3">
  <div class="row min-vh-100">
    <div class="col-md-8 col-lg-6 col-xl-5 d-flex align-items-center">
      <div class="w-100 py-5 px-md-5 px-xxl-6 position-relative">
        <div class="mb-4">
          <h2>회원가입</h2>
          <p class="text-muted">DIGI실에 오신 것을 환영합니다.</p>
        </div>
          <br>
        <form id="registerForm" class="form-validate">
            <div class="mb-4">
                <div class="row">
                     <div class="col">
                        <label class="form-label" for="guestId">아이디(e-mail)</label>
                     </div>
                    <div class="col-auto"><a class="form-text small text-primary" id="idCheck">아이디 중복체크</a></div>
                </div>
            <input class="form-control" name="guestId" id="guestId" type="email" placeholder="name@address.com" autocomplete="off" required data-msg="메일 주소를 입력해 주세요!">
          </div>

            <div class="mb-4">
                <span id="checkId" style="color:rgb(77,102,247)"></span>
            </div>
            <div class="mb-4">
                <label class="form-label" for="guestName">이름</label>
                <input class="form-control" name="guestName" id="guestName" type="text" placeholder="홍길동" autocomplete="off" required data-msg="이름을 입력해 주세요!">
            </div>
          <div class="mb-4">
            <label class="form-label" for="guestPwd">비밀번호</label>
            <input class="form-control" name="guestPwd" id="guestPwd" placeholder="비밀번호를 입력 해 주세요" type="password" required data-msg="비밀번호를 입력해 주세요!">
          </div>
            <div class="mb-4">
                <span id="checkPwd" style="color:rgb(77,102,247)"></span>
            </div>
          <div class="mb-4">
            <label class="form-label" for="guestPwd1">비밀번호확인</label>
            <input class="form-control" name="guestPwd1" id="guestPwd1" placeholder="비밀번호를 똑같이 한번 더 입력해 주세요" type="password" required data-msg="비밀번호를 입력해 주세요!">
          </div>
          <div class="d-grid gap-2">
            <button class="btn btn-lg btn-primary" id="registerBtn" type="button">회원 가입 하기</button>
          </div>
          <hr class="my-3 hr-text letter-spacing-2" data-content="OR">

          <div class="d-grid gap-2">
<%--            <button class="btn btn btn-outline-primary btn-social"><i class="fa-2x fa-facebook-f fab btn-social-icon"> </i>Connect <span class="d-none d-sm-inline">with Facebook</span></button>--%>
<%--            <button class="btn btn btn-outline-muted btn-social"><span class="d-none d-sm-inline">카카오톡으로 회원가입 하기</span></button>--%>
            <a href="https://kauth.kakao.com/oauth/authorize?response_type=code&client_id=2fcf1ae3889fb2cc04ae6d2eac555670&redirect_uri=http://127.0.0.1/register/kakao"><img style="width: 408px; height: 51.5px;" src="img/photo/kakao11.jpg"/></a>
          </div>

        </form>
      </div>
    </div>
    <div class="col-md-4 col-lg-6 col-xl-7 d-none d-md-block">
      <!-- Image-->
      <div class="bg-cover h-100 me-n3" style="background-image: url(img/photo/photo-1497436072909-60f360e1d4b1.jpg);"></div>
    </div>
  </div>
</div>
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
<script src="vendor/jquery/jquery.min.js"></script>
<!-- Bootstrap JS bundle - Bootstrap + PopperJS-->
<script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
<!-- Magnific Popup - Lightbox for the gallery-->
<script src="vendor/magnific-popup/jquery.magnific-popup.min.js"></script>
<!-- Smooth scroll-->
<script src="vendor/smooth-scroll/smooth-scroll.polyfills.min.js"></script>
<!-- Bootstrap Select-->
<script src="vendor/bootstrap-select/js/bootstrap-select.min.js"></script>
<!-- Object Fit Images - Fallback for browsers that don't support object-fit-->
<script src="vendor/object-fit-images/ofi.min.js"></script>
<!-- Swiper Carousel                       -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.4.1/js/swiper.min.js"></script>
<script>var basePath = ''</script>
<!-- Main Theme JS file    -->
<script src="js/theme.js"></script>
