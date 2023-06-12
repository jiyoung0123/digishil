<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>

<!-- pagination start -->
<div class="col text-center">
  <ul class="pagination ">
    <c:choose>
      <c:when test="${roomSearchList.getPrePage() != 0}">
        <li>
          <a href="/${target}/roomSearch?pageNo=${roomSearchList.getPrePage()}&roomName=${rs.roomName}&&roomLoc=${rs.roomLoc}&&roomType=${rs.roomType}">Previous</a>
        </li>
      </c:when>
      <c:otherwise>
        <li class="disabled">
          <a href="#">Previous</a>
        </li>
      </c:otherwise>
    </c:choose>

    <c:forEach begin="${roomSearchList.getNavigateFirstPage() }" end="${roomSearchList.getNavigateLastPage() }" var="page">
      <c:choose>
        <c:when test="${roomSearchList.getPageNum() == page}">
          <li class="active">
            <a  href="/${target}/roomSearch?pageNo=${page}&roomName=${rs.roomName}&&roomLoc=${rs.roomLoc}&&roomType=${rs.roomType}">${page }</a>
          </li>
        </c:when>
        <c:otherwise>
          <li>
            <a href="/${target}/roomSearch?pageNo=${page}&roomName=${rs.roomName}&&roomLoc=${rs.roomLoc}&&roomType=${rs.roomType}">${page }</a>
          </li>
        </c:otherwise>
      </c:choose>

    </c:forEach>
    <c:choose>
      <c:when test="${roomSearchList.getNextPage() != 0}">
        <li>
          <a href="/${target}/roomSearch?pageNo=${roomSearchList.getNextPage()}&roomName=${rs.roomName}&&roomLoc=${rs.roomLoc}&&roomType=${rs.roomType}">Next</a>
        </li>
      </c:when>
      <c:otherwise>
        <li class="disabled">
          <a href="#">Next</a>
        </li>
      </c:otherwise>
    </c:choose>

  </ul>
</div>
<!-- pagination end -->
