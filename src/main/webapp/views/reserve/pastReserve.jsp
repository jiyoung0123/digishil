<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/4.6.0/js/bootstrap.min.js"></script>

<script>

//  let wirteReview={
//    init:function(){
//        $('.reviewBtn').click(function (){
//          let guestId = $('.guestId').val();
//          let reviewRate = $('.rating').val();
//          let reviewContents1 = $('.reviewContents1').val();
//          let guestId2 = $('.name').val();
//          let reserveId = $('.reserveId').val();
//          let roomId = $('.roomId').val();
//          $.ajax({
//            url: '/review',
//            data:  { guestId: guestId, reviewRate: reviewRate, reviewContents1: reviewContents1, guestId2:guestId2, reserveId:reserveId, roomId:roomId},
//            success: function () {
//              $('#review').hide();
//              $('#reviewBtn2').hide();
//              $('#reviewBtn1').html('후기작성완료');
//              alert("후기를 남겨주셔서 감사합니다♡");
//            }
//          });
//        })
//     }
//  };

let wirteReview = {
  init: function() {
    $('.reviewBtn').click(function() {
      // 폼 데이터를 생성합니다.
      let likeForm = $(this).closest('#reviewForm');
      let review = $(this).closest('#review');
      let reviewBtn2 =$(this).closest('#reviewBtn2');
      let reviewBtn1 =$(this).closest('#reviewBtn1');


      // AJAX 요청을 보냅니다.
      $.ajax({
        url: '/review',
        type: 'POST',
        data: likeForm.serialize(),
        success: function() {
          review.hide();
          reviewBtn2.hide();
          let htmlDiv =
                  `
                  <div class="col-12 col-lg-3 align-self-center" id="reviewBtn1">
                          <p>후기작성완료</p>
                        </div>
                  `
          reviewBtn1.html(htmlDiv);
          alert("후기를 남겨주셔서 감사합니다♡");
        }
      });
    })
  }
};
  $(function(){
    wirteReview.init();
  });

</script>
<body style="padding-top: 72px;">

<section class="py-5">
  <div class="container">
    <!-- Breadcrumbs -->
    <div class="d-flex justify-content-between align-items-end mb-5">
      <h1 class="hero-heading mb-0">${guest.guestName}님의 이전 여행지</h1><a class="btn btn-link text-muted" href="/reservelist?guestId=${guest.guestId}">nearest bookings</a>
    </div>
    <div class="d-flex justify-content-between align-items-center flex-column flex-lg-row mb-5">
      <div class="me-3">
        <p class="mb-3 mb-lg-0">당신의 여행은 어땠나요? </p>
      </div>
    </div>

   <c:forEach var="obj" items="${getMyPastReserve}">
     <c:choose>
       <c:when test="${obj.reserveStatus == '결제완료'}">
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
              <div class="col-lg-8" style="padding-top: 16px;">
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
                        <h6 class="label-heading">예약날짜(결제일자)</h6>
                        <p class="text-sm fw-bold"><fmt:formatDate value="${obj.reservePayDate}" pattern="yyyy, MMM dd"/></p>
                    <h6 class="label-heading">객실주소</h6>
                    <p class="text-sm fw-bold mb-0">${obj.roomAddress}</p>
                  </div>
                  <c:choose>
                    <c:when test="${obj.reviewId == null}">
                    <div class="col-12 col-lg-3 align-self-center" id="reviewBtn1" class="reviewBtn1">
                      <button  id="reviewBtn2" class="btn btn-outline-primary" class="reviewBtn2" type="button" data-bs-toggle="collapse" data-bs-target="#leaveReview${obj.reserveId}" aria-expanded="false" aria-controls="leaveReview">
                        후기 남기기</button>
                    </div>
                    </c:when>
                    <c:otherwise>
                        <div class="col-12 col-lg-3 align-self-center" id="reviewBtn1">
                          <p>후기작성완료</p>
                        </div>
                    </c:otherwise>
                  </c:choose>
                </div>
              </div>
            </div>
            <div class="container" id="review" class="review">
              <div class="row" >
                <div class="collapse mt-4" id="leaveReview${obj.reserveId}" style="padding-left: 30px; padding-right: 30px;">
                  <h5 class="mb-4">후기</h5>
                  <form class="form" id="reviewForm">
                    <div class="row">
                      <div class="col-sm-6">
                        <div class="mb-4">
                          <label class="form-label" for="name">이름</label>
                          <input class="form-control" type="text" name="guestId2" id="name" class="name" value="${guest.guestName}" required="required">
                          <input class="form-control" type="hidden" name="guestId" id="guestId" class="guestId" value="${guest.guestId}" required="required">
                          <input class="form-control" type="hidden" name="reserveId" id="reserveId" class="reserveId" value="${obj.reserveId}" required="required">
                          <input class="form-control" type="hidden" name="roomId" id="roomId" class="roomId" value="${obj.roomId}" required="required">
                        </div>
                      </div>
                      <div class="col-sm-6">
                        <div class="mb-4">
                          <label class="form-label" for="rating">별점</label>
                          <select class="form-select focus-shadow-0" name="reviewRate" id="rating"class="rating">
                            <option value="5">&#9733;&#9733;&#9733;&#9733;&#9733; (5/5)</option>
                            <option value="4">&#9733;&#9733;&#9733;&#9733;&#9734; (4/5)</option>
                            <option value="3">&#9733;&#9733;&#9733;&#9734;&#9734; (3/5)</option>
                            <option value="2">&#9733;&#9733;&#9734;&#9734;&#9734; (2/5)</option>
                            <option value="1">&#9733;&#9734;&#9734;&#9734;&#9734; (1/5)</option>
                          </select>
                        </div>
                      </div>
                    </div>
                    <div class="mb-4">
                      <label class="form-label" for="reviewContents1">후기를 작성해 주세요</label>
                      <textarea class="form-control" rows="4" name="reviewContents1" id="reviewContents1" class="reviewContents1" required="required"></textarea>
                    </div>
                    <div class="col-sm-12 text-end" style="padding-bottom: 10px;">
                      <a class="reviewBtn" id="reviewBtn" type="button"><i class="far fa-edit"></i>저장하기</a>
                    </div>
                  </form>
                </div>
              </div>
            </div>
           </div>
          </c:when>
       </c:choose>
      </c:forEach>
  </div>
</section>


<!-- Modal -->
<div id="myModal" class="modal fade" role="dialog">
  <div class="modal-dialog">
    <!-- Modal content-->
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal">&times;</button>
        <h4 class="modal-title">Modal Header</h4>
      </div>
      <div class="modal-body">
        <a href="/" class="btn btn-info" role="button">장바구니로이동</a>
        <a href="/" class="btn btn-info" role="button">계속 쇼핑</a>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
      </div>
    </div>
  </div>
</div>

<!-- JavaScript files-->

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
