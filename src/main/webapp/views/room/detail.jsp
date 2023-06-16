<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>

<script>
    let roomId = ${roomDetail.roomId};
    let roomPrice = ${roomDetail.roomPrice};

    let reserveDate = $('#reserveDate').val();
    let reserveForm = {

        init:function(){
            let hostId =`${roomDetail.hostId}`;
            console.log(hostId);
            $('#reserveBtn').click(function(){
                if(reserveDate==''){
                    $('#checkDate').text("예약일을 입력하세요");
                    return;
                }else{
                    reserveForm.send();
                    websocket.sendTo(hostId);
                }
            })
        },
        send:function(){
            reserveDate = $('#reserveDate').val();

            let reserveCheckIn = reserveDate.substring(0, 10);
            let reserveCheckOut = reserveDate.substring(14);
            if (reserveCheckIn == reserveCheckOut) {
                $('#checkDate').text("체크인과 체크아웃 날짜가 동일합니다.");
                return;
            }

            $('input[name="reserveCheckIn"]').val(reserveCheckIn);
            $('input[name="reserveCheckOut"]').val(reserveCheckOut);
            $('#reserveForm').attr({
                'action':'/reserve',
                'method':'post'
            });
            $('#reserveForm').submit();
        }
    }

    $(function(){
        reserveForm.init();

    })
</script>

<section>
    <!-- Slider main container-->
    <div class="swiper-container detail-slider slider-gallery">
        <!-- Additional required wrapper-->
        <div class="swiper-wrapper">
            <!-- Slides-->
            <div class="swiper-slide"><a href="/img/photo/photo-1426122402199-be02db90eb90.jpg" data-toggle="gallery-top" title="Our street"><img class="img-fluid" src="/img/photo/photo-1426122402199-be02db90eb90.jpg" alt="Our street"></a></div>
            <div class="swiper-slide"><a href="/img/photo/photo-1512917774080-9991f1c4c750.jpg" data-toggle="gallery-top" title="Outside"><img class="img-fluid" src="/img/photo/photo-1512917774080-9991f1c4c750.jpg" alt="Outside"></a></div>
            <div class="swiper-slide"><a href="/img/photo/photo-1494526585095-c41746248156.jpg" data-toggle="gallery-top" title="Rear entrance"><img class="img-fluid" src="/img/photo/photo-1494526585095-c41746248156.jpg" alt="Rear entrance"></a></div>
            <div class="swiper-slide"><a href="/img/photo/photo-1484154218962-a197022b5858.jpg" data-toggle="gallery-top" title="Kitchen"><img class="img-fluid" src="/img/photo/photo-1484154218962-a197022b5858.jpg" alt="Kitchen"></a></div>
            <div class="swiper-slide"><a href="/img/photo/photo-1522771739844-6a9f6d5f14af.jpg" data-toggle="gallery-top" title="Bedroom"><img class="img-fluid" src="/img/photo/photo-1522771739844-6a9f6d5f14af.jpg" alt="Bedroom"></a></div>
            <div class="swiper-slide"><a href="/img/photo/photo-1488805990569-3c9e1d76d51c.jpg" data-toggle="gallery-top" title="Bedroom"><img class="img-fluid" src="/img/photo/photo-1488805990569-3c9e1d76d51c.jpg" alt="Bedroom"></a></div>
        </div>
        <div class="swiper-pagination swiper-pagination-white"></div>
        <div class="swiper-button-prev swiper-button-white"></div>
        <div class="swiper-button-next swiper-button-white"></div>
    </div>
</section>
<div class="container py-5">
    <div class="row">
        <div class="col-lg-8">
            <div class="text-block">
                <p class="text-primary"><i class="fa-map-marker-alt fa me-1"></i>${roomDetail.roomLoc}</p>
                <h1>${roomDetail.roomName}</h1>
                <p class="text-muted text-uppercase mb-4">${roomDetail.roomType}</p>
                <ul class="list-inline text-sm mb-4">
                    <li class="list-inline-item me-3"><i class="fa fa-users me-1 text-secondary"></i>${roomDetail.roomCap}명 가능</li>
                    <li class="list-inline-item me-3"><i class="fa fa-door-open me-1 text-secondary"></i> ${roomDetail.roomInfo}</li>
                    <li class="list-inline-item me-3"><i class="fa fa-bed me-1 text-secondary"></i>더블 침대 1개</li>
                    <li class="list-inline-item me-3"><i class="fa fa-bath me-1 text-secondary"></i>공용 욕실</li>
                </ul>
                <h6 class="mb-3">객실소개</h6>
                <c:choose>
                    <c:when test="${roomDetail.roomIntro == null}">
                        <p class="text-muted fw-light">호스트에 의해서 업데이트 될 예정입니다.</p>
                    </c:when>
                    <c:otherwise>
                        <p class="text-muted fw-light">${roomDetail.roomIntro}</p>
                    </c:otherwise>
                </c:choose>
            </div>
            <div class="text-block">
                <p class="subtitle text-sm text-primary">AMENITIES</p>
                <h4 class="mb-4">숙소 편의시설</h4>
                <div class="row">
                    <div class="col-md-6">
                        <ul class="list-unstyled text-muted">
                            <li class="mb-2"> <i class="fa fa-wifi text-secondary w-1rem me-3 text-center"></i><span class="text-sm">무선인터넷</span></li>
                            <li class="mb-2"> <i class="fa fa-tv text-secondary w-1rem me-3 text-center"></i><span class="text-sm">TV</span></li>
                            <li class="mb-2"> <i class="fa fa-snowflake text-secondary w-1rem me-3 text-center"></i><span class="text-sm">에어컨</span></li>
                            <li class="mb-2"> <i class="fa fa-thermometer-three-quarters text-secondary w-1rem me-3 text-center"></i><span class="text-sm">난방완비</span></li>
                        </ul>
                    </div>
                    <div class="col-md-6">
                        <ul class="list-unstyled text-muted">
                            <li class="mb-2"> <i class="fa fa-bath text-secondary w-1rem me-3 text-center"></i><span class="text-sm">개인 욕실</span></li>
                            <li class="mb-2"> <i class="fa fa-utensils text-secondary w-1rem me-3 text-center"></i><span class="text-sm">개인 주방</span></li>
                            <li class="mb-2"> <i class="fa fa-laptop text-secondary w-1rem me-3 text-center"></i><span class="text-sm">책상</span></li>
                            <li class="mb-2"> <i class="fa fa-tshirt text-secondary w-1rem me-3 text-center"></i><span class="text-sm">식기세척기</span></li>
                        </ul>
                    </div>
                </div>
            </div>

            <div class="text-block">
                <div class="d-flex"><img class="avatar avatar-lg p-1 flex-shrink-0 me-4" src="/img/avatar/avatar-10.jpg" alt="Jack London">
                    <div>
                        <p> <span class="text-muted text-uppercase text-sm">호스트 소개</span><br><strong>${roomDetail.hostName}</strong></p>
                        <c:choose>
                            <c:when test="${roomDetail.hostIntro == null}">
                                <p class="text-muted fw-light">호스트소개 페이지입니다..</p>
                            </c:when>
                            <c:otherwise>
                                <p class="text-muted fw-light">${roomDetail.hostIntro}</p>
                            </c:otherwise>
                        </c:choose>
                        <p class="text-sm"><a href="user-profile.html">${roomDetail.hostName}님의 다른 숙소 둘러보기<i class="fa fa-long-arrow-alt-right ms-2"></i></a></p>
                    </div>
                </div>
            </div>
            <div class="text-block">
                <h5 class="mb-4">호스팅 지역</h5>
                <div class="map-wrapper-300 mb-3">
                    <div class="h-100" id="detailMap"></div>
                </div>
            </div>
            <c:forEach var="obj" items="${roomReviewList}">
            <div class="text-block">
                <p class="subtitle text-sm text-primary">REVIEWS</p>
                <h5 class="mb-4">후기</h5>
                <div class="d-flex d-block d-sm-flex review">
                    <div class="text-md-center flex-shrink-0 me-4 me-xl-5"><img class="d-block avatar avatar-xl p-2 mb-2" src="/img/avatar/avatar-8.jpg"><span class="text-uppercase text-muted text-sm"></span></div>
                    <div>
                        <h6 class="mt-2 mb-1">${obj.guestId2}</h6>
                        <div class="mb-2">
                                ${obj.reviewRate}
                            <script>

                                var reviewRate = ${obj.reviewRate};
                                for (var i = 0; i < reviewRate; i++) {
                                    document.write('<i class="fa fa-xs fa-star text-primary"></i>');
                                }
                            </script>
<%--                            ${obj.reviewRate}--%>
<%--                            <i class="fa fa-xs fa-star text-primary"></i>--%>
<%--                            <i class="fa fa-xs fa-star text-primary"></i>--%>
<%--                            <i class="fa fa-xs fa-star text-primary"></i>--%>
<%--                            <i class="fa fa-xs fa-star text-primary"></i>--%>
<%--                            <i class="fa fa-xs fa-star text-primary"></i>--%>
                        </div>
                        <p class="text-muted text-sm">${obj.reviewContents1}</p>
                    </div>
                </div>
                </div>
            </c:forEach>
        </div>

<%--        reserve Form Start--%>
        <div class="col-lg-4">
            <div class="p-4 shadow ms-lg-4 rounded sticky-top" style="top: 100px;">
                <p class="text-muted"><span class="text-primary h2"><fmt:formatNumber type="number" pattern="###,###원" value="${roomDetail.roomPrice}"/></span>/박</p>
                <hr class="my-4">
                <form class="form" id="reserveForm" autocomplete="off">
                    <input type="hidden" name="roomId" value="${roomDetail.roomId}"/>
                    <input type="hidden" name="roomPrice" value="${roomDetail.roomPrice}"/>
                    <input type="hidden" name="guestId" value="${loginGuest.guestId}"/>
                    <input type="hidden" name="reserveCheckIn"/>
                    <input type="hidden" name="reserveCheckOut"/>
                    <div class="mb-4">
                        <label class="form-label" for="reserveDate">예약일자</label>
                        <div class="datepicker-container datepicker-container-right">
                            <input class="form-control" type="text" name="reserveDate" id="reserveDate" placeholder="날짜를 선택 해 주세요" required="required">
                        </div>
                    </div>
                    <div class="mb-4">
                        <span id="checkDate" style="color:rgb(77,102,247)"></span>
                    </div>
                    <div class="mb-4">
                        <label class="form-label" for="guests">숙박인원</label>
                        <select class="form-control" name="reserveCap" id="guests">
                            <c:forEach var="roomCap" begin="1" end="${roomDetail.roomCap}">
                                <option value="${roomCap}">${roomCap} 명</option>
                            </c:forEach>
                        </select>
                    </div>
                    <div class="d-grid mb-4">
                        <button id="reserveBtn" class="btn btn-primary" type="button">예약 하러 가기</button>
                    </div>
                </form>
                <p class="text-muted text-sm text-center">예약 확정 전에는 요금이 청구되지 않습니다.</p>
                <hr class="my-4">
                <div class="text-center">
                    <p> <a class="text-secondary text-sm" href="#"> <i class="fa fa-heart"></i>&nbsp;찜 하기&nbsp;<i class="fa fa-heart"></i></a></p>
                    <p class="text-muted text-sm">${roomDetail.roomLikes}명이 좋아합니다</p>
                </div>
            </div>
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


<%-- Map 임 일단 죽여놨음--%>
<%--<script src="https://unpkg.com/leaflet@1.5.1/dist/leaflet.js" integrity="sha512-GffPMF3RvMeYyc1LWMHtK8EbPv0iNZ8/oTtHPx9/cc2ILxQ+u905qIwdpULaqDkyBKgOaB57QTMg7ztg8Jm2Og==" crossorigin=""></script>--%>
<!-- Available tile layers-->
<script src="/js/map-layers.js"> </script>
<script src="/js/map-detail.js"></script>
<script>
    createDetailMap({
        mapId: 'detailMap',
        mapZoom: 14,
        mapCenter: [40.732346, -74.0014247],
        circleShow: true,
        circlePosition: [40.732346, -74.0014247]
    })

</script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.22.2/moment.min.js"> </script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-date-range-picker/0.19.0/jquery.daterangepicker.min.js"> </script>
<script src="/js/datepicker-detail.js"></script>
