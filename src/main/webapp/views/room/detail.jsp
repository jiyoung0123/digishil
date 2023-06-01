<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>

<script>
    var reserveDate = $('#bookingDate').val();
    let reserveForm = {

        init:function(){
            $('#reserveBtn').click(function(){
            // var reserveDate = $('#bookingDate').val();
                if(reserveDate==''){
                    $('#checkDate').text("예약일을 입력하세요");
                    return;
                }else{
                    console.log(${roomId});
                    reserveForm.send();
                }
            })
        },
        send:function(){
            // let reserveDate = $('#bookingDate').val();
            reserveDate = $('#bookingDate').val();

            let reserveCheckIn = reserveDate.substring(0, 10);
            let reserveCheckOut = reserveDate.substring(13);
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
                <p class="text-primary"><i class="fa-map-marker-alt fa me-1"></i> Brooklyn, New York</p>
                <h1>${roomDetail.roomName}</h1>
                <p class="text-muted text-uppercase mb-4">${roomDetail.roomType}</p>
                <ul class="list-inline text-sm mb-4">
                    <li class="list-inline-item me-3"><i class="fa fa-users me-1 text-secondary"></i> ${roomDetail.roomCap} guests</li>
                    <li class="list-inline-item me-3"><i class="fa fa-door-open me-1 text-secondary"></i> 1 bedroom</li>
                    <li class="list-inline-item me-3"><i class="fa fa-bed me-1 text-secondary"></i> 3 beds</li>
                    <li class="list-inline-item me-3"><i class="fa fa-bath me-1 text-secondary"></i> 1 bath</li>
                </ul>
                <h6 class="mb-3">Room Intro</h6>
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
                <h4 class="mb-4">Amenities</h4>
                <div class="row">
                    <div class="col-md-6">
                        <ul class="list-unstyled text-muted">
                            <li class="mb-2"> <i class="fa fa-wifi text-secondary w-1rem me-3 text-center"></i><span class="text-sm">Wifi</span></li>
                            <li class="mb-2"> <i class="fa fa-tv text-secondary w-1rem me-3 text-center"></i><span class="text-sm">Cable TV</span></li>
                            <li class="mb-2"> <i class="fa fa-snowflake text-secondary w-1rem me-3 text-center"></i><span class="text-sm">Air conditioning</span></li>
                            <li class="mb-2"> <i class="fa fa-thermometer-three-quarters text-secondary w-1rem me-3 text-center"></i><span class="text-sm">Heating</span></li>
                        </ul>
                    </div>
                    <div class="col-md-6">
                        <ul class="list-unstyled text-muted">
                            <li class="mb-2"> <i class="fa fa-bath text-secondary w-1rem me-3 text-center"></i><span class="text-sm">Toiletteries</span></li>
                            <li class="mb-2"> <i class="fa fa-utensils text-secondary w-1rem me-3 text-center"></i><span class="text-sm">Equipped Kitchen</span></li>
                            <li class="mb-2"> <i class="fa fa-laptop text-secondary w-1rem me-3 text-center"></i><span class="text-sm">Desk for work</span></li>
                            <li class="mb-2"> <i class="fa fa-tshirt text-secondary w-1rem me-3 text-center"></i><span class="text-sm">Washing machine</span></li>
                        </ul>
                    </div>
                </div>
            </div>
            <div class="text-block">
                <h4 class="mb-0">Amenities alternative</h4>
                <p class="subtitle text-sm text-primary mb-4">Alternative amenities display</p>
                <ul class="list-inline">
                    <li class="list-inline-item mb-2"><span class="badge rounded-pill bg-light p-3 text-muted fw-normal">Wifi</span></li>
                    <li class="list-inline-item mb-2"><span class="badge rounded-pill bg-light p-3 text-muted fw-normal">Cable TV</span></li>
                    <li class="list-inline-item mb-2"><span class="badge rounded-pill bg-light p-3 text-muted fw-normal">Air conditioning</span></li>
                    <li class="list-inline-item mb-2"><span class="badge rounded-pill bg-light p-3 text-muted fw-normal">Heating</span></li>
                    <li class="list-inline-item mb-2"><span class="badge rounded-pill bg-light p-3 text-muted fw-normal">Toiletteries</span></li>
                    <li class="list-inline-item mb-2"><span class="badge rounded-pill bg-light p-3 text-muted fw-normal">Equipped Kitchen</span></li>
                    <li class="list-inline-item mb-2"><span class="badge rounded-pill bg-light p-3 text-muted fw-normal">Desk for work</span></li>
                    <li class="list-inline-item mb-2"><span class="badge rounded-pill bg-light p-3 text-muted fw-normal">Washing machine</span></li>
                </ul>
            </div>
            <div class="text-block">
                <div class="d-flex"><img class="avatar avatar-lg p-1 flex-shrink-0 me-4" src="/img/avatar/avatar-10.jpg" alt="Jack London">
                    <div>
                        <p> <span class="text-muted text-uppercase text-sm">Hosted by </span><br><strong>${roomDetail.hostName}</strong></p>
                        <c:choose>
                            <c:when test="${roomDetail.hostIntro == null}">
                                <p class="text-muted fw-light">호스트소개 페이지입니다..</p>
                            </c:when>
                            <c:otherwise>
                                <p class="text-muted fw-light">${roomDetail.hostIntro}</p>
                            </c:otherwise>
                        </c:choose>
                        <p class="text-sm"><a href="user-profile.html">See Jack's 3 other listings <i class="fa fa-long-arrow-alt-right ms-2"></i></a></p>
                    </div>
                </div>
            </div>
            <div class="text-block">
                <h5 class="mb-4">Listing location</h5>
                <div class="map-wrapper-300 mb-3">
                    <div class="h-100" id="detailMap"></div>
                </div>
            </div>

            <div class="text-block">
                <p class="subtitle text-sm text-primary">Reviews    </p>
                <h5 class="mb-4">Listing Reviews </h5>
                <div class="d-flex d-block d-sm-flex review">
                    <div class="text-md-center flex-shrink-0 me-4 me-xl-5"><img class="d-block avatar avatar-xl p-2 mb-2" src="/img/avatar/avatar-8.jpg" alt="Padmé Amidala"><span class="text-uppercase text-muted text-sm">Dec 2018</span></div>
                    <div>
                        <h6 class="mt-2 mb-1">Padmé Amidala</h6>
                        <div class="mb-2"><i class="fa fa-xs fa-star text-primary"></i><i class="fa fa-xs fa-star text-primary"></i><i class="fa fa-xs fa-star text-primary"></i><i class="fa fa-xs fa-star text-primary"></i><i class="fa fa-xs fa-star text-primary"></i>
                        </div>
                        <p class="text-muted text-sm">One morning, when Gregor Samsa woke from troubled dreams, he found himself transformed in his bed into a horrible vermin. He lay on his armour-like back, and if he lifted his head a little he could see his brown belly, slightly domed and divided by arches into stiff sections     </p>
                    </div>
                </div>
                <div class="d-flex d-block d-sm-flex review">
                    <div class="text-md-center flex-shrink-0 me-4 me-xl-5"><img class="d-block avatar avatar-xl p-2 mb-2" src="/img/avatar/avatar-2.jpg" alt="Luke Skywalker"><span class="text-uppercase text-muted text-sm">Dec 2018</span></div>
                    <div>
                        <h6 class="mt-2 mb-1">Luke Skywalker</h6>
                        <div class="mb-2"><i class="fa fa-xs fa-star text-primary"></i><i class="fa fa-xs fa-star text-primary"></i><i class="fa fa-xs fa-star text-primary"></i><i class="fa fa-xs fa-star text-primary"></i><i class="fa fa-xs fa-star text-gray-200"></i>
                        </div>
                        <p class="text-muted text-sm">The bedding was hardly able to cover it and seemed ready to slide off any moment. His many legs, pitifully thin compared with the size of the rest of him, waved about helplessly as he looked. &quot;What's happened to me?&quot; he thought. It wasn't a dream.     </p>
                    </div>
                </div>
                <div class="d-flex d-block d-sm-flex review">
                    <div class="text-md-center flex-shrink-0 me-4 me-xl-5"><img class="d-block avatar avatar-xl p-2 mb-2" src="/img/avatar/avatar-3.jpg" alt="Princess Leia"><span class="text-uppercase text-muted text-sm">Dec 2018</span></div>
                    <div>
                        <h6 class="mt-2 mb-1">Princess Leia</h6>
                        <div class="mb-2"><i class="fa fa-xs fa-star text-primary"></i><i class="fa fa-xs fa-star text-primary"></i><i class="fa fa-xs fa-star text-primary"></i><i class="fa fa-xs fa-star text-gray-200"></i><i class="fa fa-xs fa-star text-gray-200"></i>
                        </div>
                        <p class="text-muted text-sm">His room, a proper human room although a little too small, lay peacefully between its four familiar walls. A collection of textile samples lay spread out on the table.     </p>
                    </div>
                </div>
                <div class="d-flex d-block d-sm-flex review">
                    <div class="text-md-center flex-shrink-0 me-4 me-xl-5"><img class="d-block avatar avatar-xl p-2 mb-2" src="/img/avatar/avatar-4.jpg" alt="Jabba Hut"><span class="text-uppercase text-muted text-sm">Dec 2018</span></div>
                    <div>
                        <h6 class="mt-2 mb-1">Jabba Hut</h6>
                        <div class="mb-2"><i class="fa fa-xs fa-star text-primary"></i><i class="fa fa-xs fa-star text-primary"></i><i class="fa fa-xs fa-star text-primary"></i><i class="fa fa-xs fa-star text-primary"></i><i class="fa fa-xs fa-star text-primary"></i>
                        </div>
                        <p class="text-muted text-sm">Samsa was a travelling salesman - and above it there hung a picture that he had recently cut out of an illustrated magazine and housed in a nice, gilded frame.     </p>
                    </div>
                </div>
                <div class="py-5">
                    <button class="btn btn-outline-primary" type="button" data-bs-toggle="collapse" data-bs-target="#leaveReview" aria-expanded="false" aria-controls="leaveReview">Leave a review</button>
                    <div class="collapse mt-4" id="leaveReview">
                        <h5 class="mb-4">Leave a review</h5>
                        <form class="form" id="contact-form" method="get" action="#">
                            <div class="row">
                                <div class="col-sm-6">
                                    <div class="mb-4">
                                        <label class="form-label" for="name">Your name *</label>
                                        <input class="form-control" type="text" name="name" id="name" placeholder="Enter your name" required="required">
                                    </div>
                                </div>
                                <div class="col-sm-6">
                                    <div class="mb-4">
                                        <label class="form-label" for="rating">Your rating *</label>
                                        <select class="form-select focus-shadow-0" name="rating" id="rating">
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
                                <label class="form-label" for="email">Your email *</label>
                                <input class="form-control" type="email" name="email" id="email" placeholder="Enter your  email" required="required">
                            </div>
                            <div class="mb-4">
                                <label class="form-label" for="review">Review text *</label>
                                <textarea class="form-control" rows="4" name="review" id="review" placeholder="Enter your review" required="required"></textarea>
                            </div>
                            <button class="btn btn-primary" type="button">Post review</button>
                        </form>
                    </div>
                </div>
            </div>
        </div>
<%--        reserve Form Start--%>
        <div class="col-lg-4">
            <div class="p-4 shadow ms-lg-4 rounded sticky-top" style="top: 100px;">
                <p class="text-muted"><span class="text-primary h2"><fmt:formatNumber type="number" pattern="₩###,###" value="${roomDetail.roomPrice}"/></span> per night</p>
                <hr class="my-4">
                <form class="form" id="reserveForm" autocomplete="off">
                    <input type="hidden" name="roomId" value="${roomDetail.roomId}"/>
                    <input type="hidden" name="roomPrice" value="${roomDetail.roomPrice}"/>
                    <input type="hidden" name="guestId" value="${loginGuest.guestId}"/>
                    <input type="hidden" name="reserveCheckIn"/>
                    <input type="hidden" name="reserveCheckOut"/>
                    <div class="mb-4">
                        <label class="form-label" for="bookingDate">Your stay *</label>
                        <div class="datepicker-container datepicker-container-right">
                            <input class="form-control" type="text" name="reserveDate" id="bookingDate" placeholder="Choose your dates" required="required">
                        </div>
                    </div>
                    <div class="mb-4">
                        <span id="checkDate" style="color:rgb(77,102,247)"></span>
                    </div>
                    <div class="mb-4">
                        <label class="form-label" for="guests">Guests *</label>
                        <select class="form-control" name="reserveCap" id="guests">
                            <c:forEach var="roomCap" begin="1" end="${roomDetail.roomCap}">
                                <option value="${roomCap}">${roomCap} Guest${roomCap > 1 ? 's' : ''}</option>
                            </c:forEach>
                        </select>
                    </div>
                    <div class="d-grid mb-4">
                        <button id="reserveBtn" class="btn btn-primary" type="submit">Reserve DIGI실</button>
                    </div>
                </form>
                <p class="text-muted text-sm text-center">Some additional text can be also placed here.</p>
                <hr class="my-4">
                <div class="text-center">
                    <p> <a class="text-secondary text-sm" href="#"> <i class="fa fa-heart"></i> Bookmark This Listing</a></p>
                    <p class="text-muted text-sm">79 people bookmarked this place </p>
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
