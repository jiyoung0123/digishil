<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<body style="padding-top: 72px;">
<section class="py-5">
  <div class="container">
    <div class="row">
      <div class="col-lg-3 me-lg-auto">
        <div class="card border-0 shadow mb-6 mb-lg-0">

        </div>
      </div>

      <!-- Breadcrumbs -->
      <div class="col-lg-9 ps-lg-5">
        <h2> 채팅방 </h2>
        <section class="py-5">
          <div class="list-group shadow mb-5">
            <c:forEach var="obj" items="${mList}">
              <div class="list-group-item list-group-item-action p-4">
                <div class="row">
                  <div class="col-2 col-lg-1 align-self-lg-center py-3 d-flex align-items-lg-center z-index-10">
                    <div class="form-check">
                      <input class="form-check-input" id="select_message_0" type="checkbox">
                      <label class="form-check-label" for="select_message_0"> </label>
                    </div>
                    <div class="form-star d-none d-sm-inline-block mt-n1">
                      <input id="star_message_0" type="checkbox" name="star" checked>
                      <label class="star-label" for="star_message_0"><span class="sr-only">Important Message</span></label>
                    </div>
                  </div>
                  <div class="col-9 col-lg-4 align-self-center mb-3 mb-lg-0">
                    <div class="d-flex align-items-center mb-1 mb-lg-3">
                      <h2 class="h5 mb-0">${obj.chatRoomInfo.hostId}</h2><img class="avatar avatar-sm avatar-border-white ms-3" src="img/avatar/avatar-0.jpg" alt="Jack London">
                    </div>
                    <p class="text-sm text-muted">Double Room</p><a class="stretched-link" href="user-messages-detail.html"></a>
                  </div>
                  <div class="col-10 ms-auto col-lg-7">
                    <div class="row">
                      <div class="col-md-8 py-3">
              <c:choose>
                <c:when test="${obj.recent.recentSender != guestId}">
                  <p class="text-sm mb-0">${obj.recent.recentContents} &nbsp; &nbsp; &nbsp; &nbsp;  <i class='far fa-paper-plane' style='font-size:20px;color:deepskyblue'>Your Turn</i></p>
                </c:when>
                <c:otherwise>
                  <p class="text-sm mb-0">${obj.recent.recentContents}</p>
                </c:otherwise>
              </c:choose>

                      </div>
                      <div class="col-md-4 text-end py-3">
                        <span class="badge badge-pill p-2 badge-secondary-light">${obj.recent.recentDate}</span>
                      </div><a class="stretched-link" href="/chatdetail?chatRoomId=${obj.chatRoomInfo.chatRoomId}&hostId=${obj.chatRoomInfo.hostId}&guestId=${obj.chatRoomInfo.guestId}"></a>
                    </div>
                  </div>
                </div>
              </div>
            </c:forEach>
          </div><!-- obj Div 태그 -->
        </section>

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
      </div>
    </div>
  </div>
</section>
<!-- Footer-->
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
<script src="/https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.4.1/js/swiper.min.js"></script>
<script>var basePath = ''</script>
<!-- Main Theme JS file    -->
<script src="/js/theme.js"></script>
</body>




</div>
</body>