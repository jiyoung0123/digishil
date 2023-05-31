<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>


<body style="padding-top: 72px;">

<div class="progress rounded-0 sticky-top" style="height: 8px; top: 72px;">
    <div class="progress-bar" role="progressbar" style="width: 100%" aria-valuenow="100" aria-valuemin="0" aria-valuemax="100"></div>
</div>
<section class="py-5">
    <div class="container">
        <div class="row">
            <div class="col-lg-7">
                <p class="subtitle text-primary">Book your holiday home</p>
                <h1 class="h2 mb-5">예약 완료<span class="text-muted float-end">Step 4</span>      </h1>
                <div class="text-block">
                    <p class="text-muted">예약해 주셔서 감사합니다.</p>
                    <p class="text-muted mb-5">${payResult.item_name}을 ${payResult.quantity}박 예약 하셨습니다.</p>
                    <p class="text-muted mb-5">총 결제금액 : ${payResult.amount.total} 원 <br>
                        결제 승인 시간 : ${payResult.approved_at}
                    </p>
                    <p class="text-center mb-5"><a class="btn btn-primary mx-2 mb-2" href="user-booking-detail.html"> <i class="far fa-file me-2"></i>내 예약 확인하기</a><a class="btn btn-outline-muted mb-2" href="#">다른 숙소 둘러보기</a></p>
                    <p class="mb-5 text-center"><img class="img-fluid" src="/img/illustration/undraw_celebration_0jvk.svg" alt="" style="width: 400px;"></p>
                </div>
            </div>
            <div class="col-lg-5 ps-xl-5">
                <div class="card border-0 shadow">
                    <div class="card-body p-4">
                        <div class="text-block pb-3">
                            <div class="d-flex align-items-center">
                                <div>
                                    <h6> <a class="text-reset" href="detail-rooms.html">Modern Apt - Vibrant Neighborhood</a></h6>
                                    <p class="text-muted text-sm mb-0">Entire home in New York</p>
                                    <div class="mt-n1"><i class="fa fa-xs fa-star text-primary"></i><i class="fa fa-xs fa-star text-primary"></i><i class="fa fa-xs fa-star text-primary"></i><i class="fa fa-xs fa-star text-primary"></i><i class="fa fa-xs fa-star text-gray-200"></i>
                                    </div>
                                </div><a class="flex-shrink-0" href="detail-rooms.html"><img class="ms-3 rounded" src="/img/photo/photo-1512917774080-9991f1c4c750.jpg" alt="" width="100"></a>
                            </div>
                        </div>
                        <div class="text-block py-3">
                            <ul class="list-unstyled mb-0">
                                <li class="mb-3"><i class="fas fa-users fa-fw text-muted me-2"></i>3 guests</li>
                                <li class="mb-0"><i class="far fa-calendar fa-fw text-muted me-2"></i>Apr 17, 2019 <i class="fas fa-arrow-right fa-fw text-muted mx-3"></i>Apr 18, 2019</li>
                            </ul>
                        </div>
                        <div class="text-block pt-3 pb-0">
                            <table class="w-100">
                                <tbody>
                                <tr>
                                    <th class="fw-normal py-2">$432.02 x 1 night</th>
                                    <td class="text-end py-2">$432.02</td>
                                </tr>
                                <tr>
                                    <th class="fw-normal pt-2 pb-3">Service fee</th>
                                    <td class="text-end pt-2 pb-3">$67.48</td>
                                </tr>
                                </tbody>
                                <tfoot>
                                <tr class="border-top">
                                    <th class="pt-3">Total</th>
                                    <td class="fw-bold text-end pt-3">$499.50</td>
                                </tr>
                                </tfoot>
                            </table>
                        </div>
                    </div>
                    <div class="card-footer bg-primary-light py-4 border-0">
                        <div class="d-flex align-items-center">
                            <div>
                                <h6 class="text-primary">Flexible – free cancellation</h6>
                                <p class="text-sm text-primary opacity-8 mb-0">Cancel within 48 hours of booking to get a full refund. <a href="#" class="text-reset ms-3">More details</a></p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
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
