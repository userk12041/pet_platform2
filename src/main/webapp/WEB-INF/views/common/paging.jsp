<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<style>
    .pagination {
        margin-top: 10px;
        display: flex;
        justify-content: center;
        gap: 5px;
        font-family: sans-serif;
    }

    .pagination a, .pagination strong {
        padding: 8px 12px;
        text-decoration: none;
        border: 1px solid #ccc;
        border-radius: 5px;
        color: #333;
        background-color: #f9f9f9;
        transition: all 0.2s;
    }

    .pagination a:hover {
        background-color: #007bff;
        color: white;
        border-color: #007bff;
    }

    .pagination strong {
        background-color: #007bff;
        color: white;
        border-color: #007bff;
        font-weight: bold;
    }
</style>

<div class="pagination">
    <c:if test="${hasPrev}">
        <a href="?page=${startPage - 1}&sortField=${sortField}&order=${order}&searchField=${searchField}&keyword=${keyword}">&laquo;</a>
    </c:if>

    <c:forEach var="i" begin="${startPage}" end="${endPage}">
        <c:choose>
            <c:when test="${i == currentPage}">
                <strong>${i}</strong>
            </c:when>
            <c:otherwise>
                <a href="?page=${i}&sortField=${sortField}&order=${order}&searchField=${searchField}&keyword=${keyword}">${i}</a>
            </c:otherwise>
        </c:choose>
    </c:forEach>

    <c:if test="${hasNext}">
        <a href="?page=${endPage + 1}&sortField=${sortField}&order=${order}&searchField=${searchField}&keyword=${keyword}">&raquo;</a>
    </c:if>
</div>
