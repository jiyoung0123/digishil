<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<script src="https://kit.fontawesome.com/5f198f7eda.js" crossorigin="anonymous"></script>
<script>
    $(document).on('click', '#likeFormBtn', function(e) {
        e.preventDefault();  // 기본 동작(폼 제출)을 막음

        let likeForm = $(this).closest('form');  // 클릭된 버튼의 가장 가까운 form 요소를 선택
        let likeHeart = $(this).closest('form').find('#likeHeart');

        $.ajax({
            url: '/likeAdd',
            type: 'post',
            data: likeForm.serialize(),
            success: function (response) {
                if (response == 'true') {
                    let heart = '<i id="likeHeart" class="fa-solid fa-heart" style="color: #fff700;">'+'</i>';
                    $(likeHeart).replaceWith(heart);
                    alert('찜했습니다');
                }else if(response == 'login'){
                    alert('로그인하세요');
                }else if(response == 'delete'){
                    let heartDel = '<i id="likeHeart" class="fa-regular fa-heart" style="color: #ffffff;">'+'</i>';
                    $(likeHeart).replaceWith(heartDel);
                    alert('찜 해제');
                }else{
                    alert('실패');
                }
            }
        });
    });

</script>

<div class="container-fluid">
    <div class="row">
        <div class="col-lg-6 py-4 p-xl-5">
            <h2 class="mb-4">Stay on Manhattan, NY</h2>
            <hr class="my-4">
            <form action="#" autocomplete="off">
                <div class="row">
                    <div class="col-xl-4 col-md-6 mb-4">
                        <label class="form-label" for="form_dates">Dates</label>
                        <div class="datepicker-container datepicker-container-left">
                            <input class="form-control" type="text" name="bookingDate" id="form_dates" placeholder="Choose your dates">
                        </div>
                    </div>
                    <div class="col-xl-4 col-md-6 mb-4">
                        <label class="form-label" for="form_guests">Guests</label>
                        <select class="selectpicker form-control" name="guests" id="form_guests" data-style="btn-selectpicker" title=" ">
                            <option value="guests_0">1    </option>
                            <option value="guests_1">2    </option>
                            <option value="guests_2">3    </option>
                            <option value="guests_3">4    </option>
                            <option value="guests_4">5    </option>
                        </select>
                    </div>
                    <div class="col-xl-4 col-md-6 mb-4">
                        <label class="form-label" for="form_type">Home type</label>
                        <select class="selectpicker form-control" name="type" id="form_type" multiple data-style="btn-selectpicker" data-none-selected-text="">
                            <option value="type_0">Entire place    </option>
                            <option value="type_1">Private room    </option>
                            <option value="type_2">Shared room    </option>
                        </select>
                    </div>
                    <div class="col-xl-4 col-md-6 mb-4">
                        <label class="form-label">Price range</label>
                        <div class="text-primary" id="slider-snap"></div>
                        <div class="nouislider-values">
                            <div class="min">From $<span id="slider-snap-value-from"></span></div>
                            <div class="max">To $<span id="slider-snap-value-to"></span></div>
                        </div>
                        <input type="hidden" name="pricefrom" id="slider-snap-input-from" value="40">
                        <input type="hidden" name="priceto" id="slider-snap-input-to" value="110">
                    </div>
                    <div class="col-md-6 col-lg-12 col-xl-8 mb-4 d-xl-flex justify-content-center">
                        <div>
                            <label class="form-label">Host and booking</label>
                            <ul class="list-inline mb-0 mt-1">
                                <li class="list-inline-item">
                                    <div class="form-check form-switch">
                                        <input class="form-check-input" id="instantBook" type="checkbox">
                                        <label class="form-check-label" for="instantBook"> <span class="text-sm">Instant book</span></label>
                                    </div>
                                </li>
                                <li class="list-inline-item">
                                    <div class="form-check form-switch">
                                        <input class="form-check-input" id="superhost" type="checkbox">
                                        <label class="form-check-label" for="superhost"> <span class="text-sm">Superhost</span></label>
                                    </div>
                                </li>
                            </ul>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-sm-6 mb-4 order-2 order-sm-1">
                        <button class="btn btn-primary" type="submit"> <i class="fas fa-search me-1"></i>Search                </button>
                    </div>
                </div>
            </form>
            <hr class="my-4">
            <div class="d-flex justify-content-between align-items-center flex-column flex-md-row mb-4">
                <div class="me-3">
                    <p class="mb-3 mb-md-0"><strong>12</strong> results found</p>
                </div>
                <div>
                    <label class="form-label me-2" for="form_sort">Sort by</label>
                    <select class="selectpicker" name="sort" id="form_sort" data-style="btn-selectpicker" title="">
                        <option value="sortBy_0">Most popular   </option>
                        <option value="sortBy_1">Recommended   </option>
                        <option value="sortBy_2">Newest   </option>
                        <option value="sortBy_3">Oldest   </option>
                        <option value="sortBy_4">Closest   </option>
                    </select>
                </div>
            </div>
            <div class="row">
                <!-- place item-->
                <c:choose>
                    <c:when test="${roomList != null}">
                        <c:forEach var="roomList" items="${roomList.getList()}">
                            <div class="col-sm-6 mb-5 hover-animate" data-marker-id="59c0c8e33b1527bfe2abaf92">
                                <div class="card h-100 border-0 shadow">
                                    <div class="card-img-top overflow-hidden gradient-overlay"> <img class="img-fluid" src="/img/photo/photo-1484154218962-a197022b5858.jpg" alt="Modern, Well-Appointed Room"/><a class="tile-link" href="/room/detail?id=${roomList.roomId}"></a>
                                        <div class="card-img-overlay-bottom z-index-20">
                                            <div class="d-flex text-white text-sm align-items-center"><img class="avatar avatar-border-white flex-shrink-0 me-2" src="/img/avatar/avatar-0.jpg" alt="Pamela"/>
                                                <div>${roomList.hostName}</div>
                                            </div>
                                        </div>
                                        <form id="likeForm_${roomList.roomId}">
                                            <input type="hidden" name="guestId" value="${loginGuest.guestId}">
                                            <input type="hidden" name="roomId" value="${roomList.roomId}">
                                            <div class="card-img-overlay-top text-end">
                                                <button id="likeFormBtn" class="card-fav-icon position-relative z-index-40" type="button">
                                                    <i id="likeHeart" class="fa-regular fa-heart" style="color: #ffffff;"></i>
                                                </button>
                                            </div>
                                        </form>
                                    </div>
                                    <div class="card-body d-flex align-items-center">
                                        <div class="w-100">
                                            <h6 class="card-title"><a class="text-decoration-none text-dark" href="/room/detail?id=${roomList.roomId}">${roomList.roomName}</a></h6>
                                            <div class="d-flex card-subtitle mb-3">
                                                <p class="flex-grow-1 mb-0 text-muted text-sm">${roomList.roomType}</p>
                                                <p class="flex-shrink-1 mb-0 card-stars text-xs text-end"><i class="fa fa-star text-warning"></i><i class="fa fa-star text-warning"></i><i class="fa fa-star text-warning"></i><i class="fa fa-star text-warning"></i><i class="fa fa-star text-warning"></i>
                                                </p>
                                            </div>
                                            <p class="card-text text-muted"><span class="h4 text-primary"><fmt:formatNumber type="number" pattern="₩###,###" value="${roomList.roomPrice}"/></span>/1박</p>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </c:forEach>
                        <%-- pagination start --%>
                        <jsp:include page="../page.jsp"/>
                        <%-- pagination end--%>
                    </c:when>

                    <c:otherwise>
                        <c:forEach var="roomSearchList" items="${roomSearchList.getList()}">
                            <div class="col-sm-6 mb-5 hover-animate" data-marker-id="59c0c8e33b1527bfe2abaf92">
                                <div class="card h-100 border-0 shadow">
                                    <div class="card-img-top overflow-hidden gradient-overlay"> <img class="img-fluid" src="/img/photo/photo-1484154218962-a197022b5858.jpg" alt="Modern, Well-Appointed Room"/><a class="tile-link" href="/room/detail?id=${roomSearchList.roomId}"></a>
                                        <div class="card-img-overlay-bottom z-index-20">
                                            <div class="d-flex text-white text-sm align-items-center"><img class="avatar avatar-border-white flex-shrink-0 me-2" src="/img/avatar/avatar-0.jpg" alt="Pamela"/>
                                                <div>${roomSearchList.hostName}</div>
                                            </div>
                                        </div>
                                        <form id="likeForm_${roomSearchList.roomId}">
                                            <input type="hidden" name="guestId" value="${loginGuest.guestId}">
                                            <input type="hidden" name="roomId" value="${roomSearchList.roomId}">
                                            <div class="card-img-overlay-top text-end">
                                                <button id="likeFormBtn" class="card-fav-icon position-relative z-index-40" type="button">
                                                    <i id="likeHeart" class="fa-regular fa-heart" style="color: #ffffff;"></i>
                                                </button>
                                            </div>
                                        </form>
                                    </div>
                                    <div class="card-body d-flex align-items-center">
                                        <div class="w-100">
                                            <h6 class="card-title"><a class="text-decoration-none text-dark" href="/room/detail?id=${roomSearchList.roomId}">${roomSearchList.roomName}</a></h6>
                                            <div class="d-flex card-subtitle mb-3">
                                                <p class="flex-grow-1 mb-0 text-muted text-sm">${roomSearchList.roomType}</p>
                                                <p class="flex-shrink-1 mb-0 card-stars text-xs text-end"><i class="fa fa-star text-warning"></i><i class="fa fa-star text-warning"></i><i class="fa fa-star text-warning"></i><i class="fa fa-star text-warning"></i><i class="fa fa-star text-warning"></i>
                                                </p>
                                            </div>
                                            <p class="card-text text-muted"><span class="h4 text-primary"><fmt:formatNumber type="number" pattern="₩###,###" value="${roomSearchList.roomPrice}"/></span> per night</p>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </c:forEach>
                        <%-- pagination start --%>
                        <jsp:include page="../pageSearch.jsp"/>
                        <%-- pagination end--%>
                    </c:otherwise>
                </c:choose>
        </div>
        <div class="col-lg-6 map-side-lg pe-lg-0">
            <div class="map-full shadow-left" id="categorySideMap"></div>
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

<script>
    createListingsMap({
        mapId: 'categorySideMap',
        jsonFile: 'js/rooms-geojson.json',
        mapPopupType: 'rental',
        useTextIcon: true,
        //tileLayer: tileLayers[5]  - uncomment for a different map styling
    });

</script>
<!-- Daterange picker-->
<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.22.2/moment.min.js"> </script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-date-range-picker/0.19.0/jquery.daterangepicker.min.js"> </script>
<script src="/js/datepicker-category.js"> </script>
<!-- Price Slider-->
<script src="/vendor/nouislider/nouislider.min.js"></script>
<script>
    var snapSlider = document.getElementById('slider-snap');

    noUiSlider.create(snapSlider, {
        start: [ 40, 110 ],
        snap: false,
        connect: true,
        step: 1,
        range: {
            'min': 40,
            'max': 110
        }
    });
    var snapValues = [
        document.getElementById('slider-snap-value-from'),
        document.getElementById('slider-snap-value-to')
    ];
    var inputValues = [
        document.getElementById('slider-snap-input-from'),
        document.getElementById('slider-snap-input-to')
    ];
    snapSlider.noUiSlider.on('update', function( values, handle ) {
        snapValues[handle].innerHTML = values[handle];
        inputValues[handle].value = values[handle];
    })
</script>
