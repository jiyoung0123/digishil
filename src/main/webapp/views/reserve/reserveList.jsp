<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/4.6.0/js/bootstrap.min.js"></script>


<body style="padding-top: 72px;">

<section class="py-5">
  <div class="container">
    <!-- Breadcrumbs -->
    <div class="d-flex justify-content-between align-items-end mb-5">
      <h1 class="hero-heading mb-0">${guest.guestName}님의 예정된 예약</h1><a class="btn btn-link text-muted" href="#">Past bookings</a>
    </div>
    <div class="d-flex justify-content-between align-items-center flex-column flex-lg-row mb-5">
      <div class="me-3">
        <p class="mb-3 mb-lg-0"><strong>${getMyReserve.size()}개의 예약이</strong> 있습니다.</p>
      </div>
    </div>

<%--    =====================================================================================================--%>

<%--    --%>
<%--      <tr>--%>
<%--          &lt;%&ndash;                        application property에서 uimg 등록했으니, uimg만 써도 그 폴더 찾음&ndash;%&gt;--%>
<%--        <td ><img class="small_img" src="/uimg/${obj.item_imgname}"></td>--%>
<%--        <td>${obj.item_id}</td>--%>
<%--        <td>${obj.item_name}</td>--%>
<%--        <td><fmt:formatNumber value="${obj.item_price}" pattern="###,###원" /></td>--%>
<%--        <td>${obj.cnt}</td>--%>
<%--        <td><fmt:formatNumber value="${obj.cnt * obj.item_price}" pattern="###,###원" /></td>--%>
<%--        <td><fmt:formatDate  value="${obj.rdate}" pattern="yyyy-MM-dd" /></td>--%>
<%--        <td><a href="/item/delcart?id=${obj.id}" class="btn btn-info" role="button">DELETE</a></td>--%>
<%--      </tr>--%>
<%--      <c:set var="total" value="${total + (obj.cnt * obj.item_price)}"/>--%>
<%--    --%>
<%--    =====================================================================================================--%>

   <c:forEach var="obj" items="${getMyReserve}">
        <div class="list-group shadow mb-5">
          <div class="row">
              <div class="col-lg-4 align-self-center mb-4 mb-lg-0">
                <a class="list-group-item list-group-item-action p-4" href="/room/detail?id=${obj.roomId}">
                  <div class="d-flex align-items-center mb-3">
                    <h2 class="h5 mb-0">${obj.hostName}</h2><img class="avatar avatar-sm avatar-border-white ms-3" src="/img/avatar/avatar-0.jpg" alt="Jack London">
                  </div>
                  <p class="text-sm text-muted">${obj.roomName}</p>
                  <c:choose>
                  <c:when test="${obj.reserveStatus == null}">
                  <span class="badge badge-pill p-2 badge-secondary-light"><fmt:formatDate value="${obj.reserveCheckIn}" pattern="yyyy, MMM dd"/> - <fmt:formatDate value="${obj.reserveCheckOut}" pattern="yyyy, MMM dd"/></span>
                  </c:when>
                  <c:otherwise>
                  <span class="badge badge-pill p-2 badge-primary-light"><fmt:formatDate value="${obj.reserveCheckIn}" pattern="yyyy, MMM dd"/> - <fmt:formatDate value="${obj.reserveCheckOut}" pattern="yyyy, MMM dd"/></span>
                  </c:otherwise>
                  </c:choose>
                </a>
              </div>

            <div class="col-lg-8">
              <div class="row">
                <div class="col-6 col-md-4 col-lg-3 py-3 mb-3 mb-lg-0">
                  <h6 class="label-heading">객실형태</h6>
                  <p class="text-sm fw-bold">${obj.roomType}</p>
                  <h6 class="label-heading">지역</h6>
                  <p class="text-sm fw-bold mb-0">${obj.roomLoc}</p>
                </div>
                <div class="col-6 col-md-4 col-lg-3 py-3">
                  <h6 class="label-heading">1박당 금액</h6>
                  <p class="text-sm fw-bold">${obj.roomWPrice}</p>
                  <h6 class="label-heading">결제금액</h6>
                  <p class="text-sm fw-bold mb-0"><fmt:formatNumber type="number" pattern="###,###원" value="${obj.reservePayAmount}"/></p>
                </div>
                <div class="col-6 col-md-4 col-lg-3 py-3">
                  <c:choose>
                    <c:when test="${obj.reservePayDate == null}">
                      <h6 class="label-heading">예약날짜(결제일자)</h6>
                      <p class="text-sm fw-bold">결제 후 예약확정</p>
                    </c:when>
                    <c:otherwise>
                      <h6 class="label-heading">예약날짜(결제일자)</h6>
                      <p class="text-sm fw-bold"><fmt:formatDate value="${obj.reservePayDate}" pattern="yyyy, MMM dd"/></p>
                    </c:otherwise>
                  </c:choose>
                  <h6 class="label-heading">객실주소</h6>
                  <p class="text-sm fw-bold mb-0">${obj.roomAddress}</p>
                </div>
                <div class="col-12 col-lg-3 align-self-center">

                    <c:choose>
                      <c:when test="${obj.reserveStatus == null}">
                        <span class="text-muted text-sm text-uppercase">
                          <i class="fa fa-times fa-fw me-2"> </i>예약미확정

                        </span><br class="d-none d-lg-block">
<%--                        <span class="text-primary text-sm text-uppercase">--%>
<%--                          <i class="fa fa-check fa-fw me-2"> </i>Confirmed--%>
<%--                        </span>--%>
                      </c:when>
                      <c:otherwise>
                      <span class="text-primary text-sm text-uppercase me-4 me-lg-0">
                          <i class="fa fa-check fa-fw me-2"> </i>${obj.reserveStatus}
                      </span><br class="d-none d-lg-block">
                        <span class="text-primary text-sm text-uppercase">
                          <form action="/payment/refund" method="GET">
                             <input type="hidden" id="reserveId" name="reserveId" value="${obj.reserveId}">
                             <a id="refund" href="payment/refund?reserveId=${obj.reserveId}"
                                onclick='return confirm("결제취소를 진행하시겠습니까? 한번 더 확인해 주세요");'>
                               <i class="fa fa-check fa-fw me-2"></i>환불하기</a>
                          </form>
                          <%--                            <a id="refund" href="payment/refund?reserveId=${obj.reserveId}"><i class="fa fa-check fa-fw me-2"></i>환불하기</a>--%>
                        </span>
                      </c:otherwise>
                    </c:choose>
                   <br class="d-none d-lg-block">

<%--                  <span class="text-primary text-sm text-uppercase me-4 me-lg-0">--%>
<%--                    <i class="fa fa-check fa-fw me-2"> </i> ${obj.reserveStatus}--%>
<%--                   </span><br class="d-none d-lg-block">--%>
<%--                  <span class="text-primary text-sm text-uppercase">--%>
<%--                    <i class="fa fa-check fa-fw me-2"> </i>Confirmed--%>
<%--                  </span>--%>
                </div>
              </div>
            </div>
          </div>
<%--        </a>--%>
        </div>
      </c:forEach>





    <!-- Pagination -->
    <nav aria-label="Page navigation example">
      <ul class="pagination pagination-template d-flex justify-content-center">
        <li class="page-item"><a class="page-link" href="#"> <i class="fa fa-angle-left"></i></a></li>
        <li class="page-item active"><a class="page-link" href="#">1</a></li>
        <li class="page-item"><a class="page-link" href="#">2</a></li>
        <li class="page-item"><a class="page-link" href="#">3</a></li>
        <li class="page-item"><a class="page-link" href="#"> <i class="fa fa-angle-right"></i></a></li>
      </ul>
    </nav>
  </div>
</section>

<!-- JavaScript files-->
<%--<script>--%>
<%--  // ------------------------------------------------------- //--%>
<%--  //   Inject SVG Sprite ---%>
<%--  //   see more here--%>
<%--  //   https://css-tricks.com/ajaxing-svg-sprite/--%>
<%--  // ------------------------------------------------------ //--%>
<%--  function injectSvgSprite(path) {--%>

<%--    var ajax = new XMLHttpRequest();--%>
<%--    ajax.open("GET", path, true);--%>
<%--    ajax.send();--%>
<%--    ajax.onload = function(e) {--%>
<%--      var div = document.createElement("div");--%>
<%--      div.className = 'd-none';--%>
<%--      div.innerHTML = ajax.responseText;--%>
<%--      document.body.insertBefore(div, document.body.childNodes[0]);--%>
<%--    }--%>
<%--  }--%>
<%--  // to avoid CORS issues when viewing using file:// protocol, using the demo URL for the SVG sprite--%>
<%--  // use your own URL in production, please :)--%>
<%--  // https://demo.bootstrapious.com/directory/1-0/icons/orion-svg-sprite.svg--%>
<%--  //- injectSvgSprite('${path}icons/orion-svg-sprite.svg');--%>
<%--  injectSvgSprite('https://demo.bootstrapious.com/directory/1-4/icons/orion-svg-sprite.svg');--%>

<%--</script>--%>
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
