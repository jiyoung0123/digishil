<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<script>

  let register_form = {
    init:function(){
      $('#register_btn').addClass('disabled');

      $('#register_btn').click(function(){
        register_form.send();
      });

      $('#name').keyup(function(){
        var guestid = $('#guestid').val();
        var guestpwd = $('#guestpwd').val();
        var name = $('#name').val();
        if(guestid != '' && guestpwd != '' && name != ''){
          $('#register_btn').removeClass('disabled');
        }

      })
      $('#guestid').keyup(function(){

        var txt_id = $(this).val();
        if(txt_id.length<=3){
          return;
        }
        $.ajax({
          url:'/checkid',
          data:{'id':txt_id},
          //success일때는 콤마, 세미콜론 둘 다 없다 주의하기!
          success:function(result){
            if(result==0){
              $('#check_id').text('사용가능합니다.');
              $('#guestpwd').focus();
            }else{
              $('#check_id').text('사용불가능합니다.');

            }
          }
        });
      });
    },
    send:function(){
      var guestid = $('#guestid').val();
      var guestpwd = $('#guestpwd').val();
      var name = $('#name').val();
      if(guestid.length<=3){
        $('#check_id').text('4자리 이상이어야 합니다.');
        $('#guestid').focus();
        return;
      }
      if(guestpwd == ''){
        $('#guestpwd').focus();
        return;
      }
      if(name == ''){
        $('#name').focus();
        return;
      }

      $('#register_form').attr({
        'action':'/registerimpl',
        'method':'post'
      });
      $('#register_form').submit();
    }
  };
  $(function(){
    register_form.init();
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
        <form id="register_form" class="form-validate">
          <div class="mb-4">
            <label class="form-label" for="guestid">메일주소</label>
            <input class="form-control" name="guestid" id="guestid" type="email" placeholder="name@address.com" autocomplete="off" required data-msg="메일 주소를 입력해 주세요!">
          </div>
          <div class="mb-4">
            <label class="form-label" for="guestpwd">비밀번호</label>
            <input class="form-control" name="guestpwd" id="guestpwd" placeholder="비밀번호" type="password" required data-msg="비밀번호를 입력해 주세요!">
          </div>
          <div class="mb-4">
            <label class="form-label" for="guestpwd1">비밀번호확인</label>
            <input class="form-control" name="guestpwd1" id="guestpwd1" placeholder="비밀번호" type="password" required data-msg="비밀번호를 입력해 주세요!">
          </div>
          <div class="d-grid gap-2">
            <button class="btn btn-lg btn-primary" type="submit">회원 가입 하기</button>
          </div>

          <hr class="my-3 hr-text letter-spacing-2" data-content="OR">

          <div class="d-grid gap-2">
<%--            <button class="btn btn btn-outline-primary btn-social"><i class="fa-2x fa-facebook-f fab btn-social-icon"> </i>Connect <span class="d-none d-sm-inline">with Facebook</span></button>--%>
            <button id="register_btn" type="button" class="btn btn btn-outline-muted btn-social"><span class="d-none d-sm-inline">카카오톡으로 회원가입 하기</span></button>
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
