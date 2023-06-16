<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<script src="https://kit.fontawesome.com/5f198f7eda.js" crossorigin="anonymous"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/4.6.0/js/bootstrap.min.js"></script>

<script>
    let hostIntro = {
        init : function(){
            $('#hostIntro').click(
                function(){
                    alert("호스트정보");
                }
            );
        }
    };
    $(function(){
        hostIntro.init();
    });

</script>
<div class="container-fluid pt-5 pb-3 border-bottom px-lg-5">
    <div class="row" style="padding-left: 50px; padding-right: 50px;">
        <div class="col-xl-8">
            <h1><span style="color: #0b5ed7;">${roomLoc}&nbsp;<i class='fas fa-plane-departure' style='font-size:30px;color:#0b5ed7'></i></span><span style="font-size: medium;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;로 떠나는 여행</span></h1>
<%--            <p class="lead text-muted" style="font-size: medium">&nbsp;&nbsp&nbsp;&nbsp;총 &nbsp;${roomLocList.size()}개의 숙소</p>--%>
        </div>
    </div>
</div>
<div class="container-fluid py-5 px-lg-5">
    <div class="row">
        <div class="col-lg-12">
            <div class="d-flex justify-content-between align-items-center flex-column flex-md-row mb-4" style="padding-left: 50px; padding-right: 50px;">
                <div class="me-3">
                    <p class="mb-3 mb-md-0">총 &nbsp;<strong>${roomLocList.size()}</strong> 개의 숙소</p>
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
            <div class="container-fluid py-5 px-lg-5">
            <div class="row">
            <c:forEach var="obj" items="${roomLocList}">
                <!-- place item-->
                <div class="col-sm-6 col-xl-3 mb-5 hover-animate" data-marker-id="59c0c8e33b1527bfe2abaf92">
                    <div class="card h-100 border-0 shadow">

                        <div class="card-img-top overflow-hidden gradient-overlay">
                            <a href="/room/detail?id=${obj.roomId}">
                                <img class="img-fluid" src="/img/photo/photo-1484154218962-a197022b5858.jpg" alt="Modern, Well-Appointed Room"/>
                                <div class="card-img-overlay-bottom z-index-20">
                                    <div class="d-flex text-white text-sm align-items-center">
                                        <button id="hostIntro" type="button" class="btn">
                                            <img class="avatar avatar-border-white flex-shrink-0 me-2" src="/img/avatar/avatar-0.jpg" alt="Pamela"/>
                                        </button>
                                        <div style="font-size: 20px;">${obj.hostName}</div>
                                    </div>
                                </div>
                                <div class="card-img-overlay-top text-end">
                                        <i class="fa-solid fa-heart" style="font-size:35px; color: red !important;"></i>
                                </div>
                            </a>
                        </div>

                        <div class="card-body d-flex align-items-center">
                            <div class="w-100">
                                <h6 class="card-title"><a class="text-decoration-none text-dark" href="/room/detail?id=${obj.roomId}">${obj.roomName}</a></h6>
                                <div class="d-flex card-subtitle mb-3">
                                    <p class="flex-grow-1 mb-0 text-muted text-sm">${obj.roomType}</p>
                                    <p class="flex-shrink-1 mb-0 card-stars text-xs text-end">
                                        <i class="fa fa-star text-warning"></i>
                                        <i class="fa fa-star text-warning"></i>
                                        <i class="fa fa-star text-warning"></i>
                                        <i class="fa fa-star text-warning"></i>
                                        <i class="fa fa-star text-warning"></i>
                                    </p>
                                </div>
                                <p class="card-text text-muted"><span class="h4 text-primary">
                                    <fmt:formatNumber type="number" pattern="###,###원" value="${obj.roomPrice}"/></span>/박</p>
                            </div>
                        </div>
                    </div>
                </div>
            </c:forEach>
            </div>
            </div>
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
    </div>
</div>

