<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div class="progress rounded-0 sticky-top" style="height: 8px; top: 72px;">
    <div class="progress-bar" role="progressbar" style="width: 75%" aria-valuenow="75" aria-valuemin="0" aria-valuemax="100"></div>
</div>
<section class="py-5">
    <div class="container">
        <div class="row">
            <div class="col-lg-7">
                <p class="subtitle text-primary">Book your holiday home</p>
                <h1 class="h2 mb-5"> Confirm and pay <span class="text-muted float-end">Step 3</span>      </h1>
                <div class="text-block">
                    <div class="alert alert-warning text-sm mb-3">
                        <div class="d-flex align-items-center">
                            <svg class="svg-icon svg-icon svg-icon-light w-2rem h-2rem me-3 text-reset flex-shrink-0">
                                <use xlink:href="#heart-1"> </use>
                            </svg>
                            <div><strong>This home is on people’s minds.</strong> It’s been viewed 43 times in the past week.</div>
                        </div>
                    </div>
                </div>
                <div class="text-block">
                    <form action="#">
                        <div class="d-flex justify-content-between align-items-end mb-4">
                            <h5 class="mb-0">Pay with your card</h5>
                            <div class="text-muted"><i class="fab fa-cc-amex fa-2x me-2"> </i><i class="fab fa-cc-visa fa-2x me-2"> </i><i class="fab fa-cc-mastercard fa-2x"></i></div>
                        </div>
                        <select class="selectpicker form-control mb-3" name="payment" id="form_payment" data-style="btn-selectpicker">
                            <option value="">Visa •••• 5687</option>
                            <option value="">Mastercard •••• 4569</option>
                        </select>
                        <button class="btn btn-link btn-collapse ps-0 text-muted" type="button" data-bs-toggle="collapse" data-bs-target="#addNewCard" aria-expanded="false" aria-controls="addNewCard" data-expanded-text="Close" data-collapsed-text="Add a new card">Add a new card</button>
                        <div class="row collapse" id="addNewCard">
                            <div class="mb-4 col-md-6">
                                <label class="form-label" for="card-name">Name on Card</label>
                                <input class="form-control" type="text" name="card-name" placeholder="Name on card" id="card-name">
                            </div>
                            <div class="mb-4 col-md-6">
                                <label class="form-label" for="card-number">Card Number</label>
                                <input class="form-control" type="text" name="card-number" placeholder="Card number" id="card-number">
                            </div>
                            <div class="mb-4 col-md-4">
                                <label class="form-label" for="expiry-date">Expiry Date</label>
                                <input class="form-control" type="text" name="expiry-date" placeholder="MM/YY" id="expiry-date">
                            </div>
                            <div class="mb-4 col-md-4">
                                <label class="form-label" for="cvv">CVC/CVV</label>
                                <input class="form-control" type="text" name="cvv" placeholder="123" id="cvv">
                            </div>
                            <div class="mb-4 col-md-4">
                                <label class="form-label" for="zip">ZIP</label>
                                <input class="form-control" type="text" name="zip" placeholder="123" id="zip">
                            </div>
                        </div>
                    </form>
                </div>
<%--                cancellation box start--%>
                <div class="text-block">
                    <h6>Cancellation policy</h6>
                    <p class="text-sm text-muted">Samsa was a travelling salesman - and above it there hung a picture that he had recently cut out of .</p>
                    <p class="text-sm text-muted">He must have tried it a hundred times, shut his eyes so that he wouldn't have to look at the flounde.</p>
                </div>
<%--                cancellation box end--%>
                <%--        message box to host for reserve start--%>
                <div class="text-block">
                    <div class="d-flex">
                        <div>
                            <h5>Say hello to your host</h5>
                            <p class="text-sm text-muted">His room, a proper human room although a little too small, lay peacefully between its four familiar .</p>
                        </div><img class="avatar avatar-md p-1 flex-shrink-0 ms-4" src="img/avatar/avatar-10.jpg" alt="Jack London">
                    </div>
                    <textarea class="form-control" name="hello" rows="4"></textarea>
                </div>
                <%--        message box to host for reserve end--%>
                <div class="row form-block flex-column flex-sm-row">
                    <div class="col text-center text-sm-start"><a class="btn btn-link text-muted" href="user-booking-2.html"> <i class="fa-chevron-left fa me-2"></i>Back</a>
                    </div>
                    <div class="col text-center text-sm-end"><a class="btn btn-primary px-3" href="user-booking-4.html"> Next step<i class="fa-chevron-right fa ms-2"></i></a></div>
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
                                </div><a class="flex-shrink-0" href="detail-rooms.html"><img class="ms-3 rounded" src="img/photo/photo-1512917774080-9991f1c4c750.jpg" alt="" width="100"></a>
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