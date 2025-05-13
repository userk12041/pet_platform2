<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<div style="margin-top: 10px;">
    <c:if test="${hasPrev}">
        <a href="?page=${startPage - 1}&sortField=${sortField}&order=${order}&searchField=${searchField}&keyword=${keyword}">&lt;</a>
    </c:if>

    <c:forEach var="i" begin="${startPage}" end="${endPage}">
        <c:choose>
            <c:when test="${i == currentPage}">
                <strong>[${i}]</strong>
            </c:when>
            <c:otherwise>
                <a href="?page=${i}&sortField=${sortField}&order=${order}&searchField=${searchField}&keyword=${keyword}">${i}</a>
            </c:otherwise>
        </c:choose>
    </c:forEach>

    <c:if test="${hasNext}">
        <a href="?page=${endPage + 1}&sortField=${sortField}&order=${order}&searchField=${searchField}&keyword=${keyword}">&gt;</a>
    </c:if>
</div>
