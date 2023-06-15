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

<div class="container-fluid pt-5 pb-3 border-bottom px-lg-5">
    <div class="row">
        <div class="col-xl-8">
            <h1>${loginGuest.guestName}님의 찜한 숙소 목록</h1>
        </div>
    </div>
</div>
<div class="container-fluid py-5 px-lg-5">
    <div class="row">
        <div class="col-lg-9">
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
                <c:forEach var="roomList" items="${roomList.getList()}">
                    <div class="col-sm-6 col-xl-4 mb-5 hover-animate" data-marker-id="59c0c8e3a31e62979bf147c9">
                        <div class="card h-100 border-0 shadow">
                            <div class="card-img-top overflow-hidden gradient-overlay"> <img class="img-fluid" src="img/photo/photo-1512917774080-9991f1c4c750.jpg" alt="Modern Apt - Vibrant Neighborhood!"/><a class="tile-link" href="/room/detail?id=${roomList.roomId}"></a>
                                <div class="card-img-overlay-bottom z-index-20">
                                    <div class="d-flex text-white text-sm align-items-center"><img class="avatar avatar-border-white flex-shrink-0 me-2" src="img/avatar/avatar-8.jpg" alt="Julie"/>
                                        <div>${roomList.hostName}</div>
                                    </div>
                                </div>
                                <form id="likeForm_${roomList.roomId}">
                                    <input type="hidden" name="guestId" value="${loginGuest.guestId}">
                                    <input type="hidden" name="roomId" value="${roomList.roomId}">
                                    <div class="card-img-overlay-top text-end">
                                        <button id="likeFormBtn" class="card-fav-icon position-relative z-index-40" type="button">
                                            <i id="likeHeart" class="fa-solid fa-heart" style="color: #fff700;"></i>
                                        </button>
                                    </div>
                                </form>
                            </div>
                            <div class="card-body d-flex align-items-center">
                                <div class="w-100">
                                    <h6 class="card-title"><a class="text-decoration-none text-dark" href="/room/detail?id=${roomList.roomId}">${roomList.roomName}</a></h6>
                                    <div class="d-flex card-subtitle mb-3">
                                        <p class="flex-grow-1 mb-0 text-muted text-sm">${roomList.roomType}</p>
                                        <p class="flex-shrink-1 mb-0 card-stars text-xs text-end"><i class="fa fa-star text-warning"></i><i class="fa fa-star text-warning"></i><i class="fa fa-star text-warning"></i><i class="fa fa-star text-gray-300"></i><i class="fa fa-star text-gray-300">                                  </i>
                                        </p>
                                    </div>
                                    <p class="card-text text-muted"><span class="h4 text-primary"><fmt:formatNumber type="number" pattern="₩###,###" value="${roomList.roomPrice}"/></span>/1박</p>
                                </div>
                            </div>
                        </div>
                    </div>
                </c:forEach>
                <jsp:include page="page.jsp"/>
            </div>
            <!-- Pagination -->
        </div>
    </div>
</div>
