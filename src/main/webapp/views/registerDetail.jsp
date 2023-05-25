<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<body>
<div class="container-fluid px-3">
  <div class="row min-vh-100">
    <div class="col-md-8 col-lg-6 col-xl-5 d-flex align-items-center">
      <div class="w-100 py-5 px-md-5 px-xxl-6 position-relative">
        <div class="mb-5">
          <h2>프로필 완성하기</h2>
        </div>
        <form class="form-validate">
          <div class="mb-4">
            <label class="form-label" for="guestpic">내 사진 올리기</label>
            <input class="form-control" name="guestpic" id="guestpic" type="file" placeholder="나의 사진을 올려주세요" autocomplete="off">
          </div>
          <div class="mb-4">
            <div class="row">
              <div class="col">
                <label class="form-label" for="guestlan">구사언어</label>
              </div>
            </div>
            <input class="form-control" name="guestlan" id="guestlan" placeholder="구사언어를 적어주세요" type="text" >
          </div>

          <div class="mb-4">
            <div class="row">
              <div class="col">
                <label class="form-label">자기소개</label>
              </div>
            </div>
            <textarea class="form-control" name="introduce" rows="4" cols="50">호스트가 회원님에 대해 알 수 있도록 간략하게 자기소개를 해주세요.</textarea>
          </div>
          <!-- Submit-->
          <div class="d-grid">
            <button class="btn btn-lg btn-primary">프로필 수정하기</button>
          </div>
          <hr class="my-3 hr-text letter-spacing-2" data-content="">
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
</body>