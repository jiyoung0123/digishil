<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>

<!-- Pagination -->
<nav aria-label="Page navigation example">
    <ul class="pagination pagination-template d-flex justify-content-center">
        <c:choose>
            <c:when test="${roomList.getPrePage() != 0}">
                <li class="page-item">
                    <a class="page-link" href="/${target}/list?pageNo=${roomList.getPrePage()}"><i class="fa fa-angle-left"></i></a>
                </li>
            </c:when>
            <c:otherwise>
                <li class="disabled">
                    <a class="page-link" href="#"><i class="fa fa-angle-left"></i></a>
                </li>
            </c:otherwise>
        </c:choose>

        <c:forEach begin="${roomList.getNavigateFirstPage() }" end="${roomList.getNavigateLastPage() }" var="page">
            <c:choose>
                <c:when test="${roomList.getPageNum() == page}">
                    <li class="active">
                        <a class="page-link" href="/${target}/list?pageNo=${page}">${page }</a>
                    </li>
                </c:when>
                <c:otherwise>
                    <li class="page-item">
                        <a class="page-link" href="/${target}/list?pageNo=${page}">${page }</a>
                    </li>
                </c:otherwise>
            </c:choose>

        </c:forEach>
        <c:choose>
            <c:when test="${roomList.getNextPage() != 0}">
                <li class="page-item">
                    <a class="page-link" href="/${target}/list?pageNo=${roomList.getNextPage()}"><i class="fa fa-angle-right"></i></a>
                </li>
            </c:when>
            <c:otherwise>
                <li class="disabled">
                    <a class="page-link" href="#"><i class="fa fa-angle-right"></i></a>
                </li>
            </c:otherwise>
        </c:choose>
    </ul>
</nav>