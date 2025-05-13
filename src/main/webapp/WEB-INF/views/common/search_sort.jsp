<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<div>
    <select name="searchField" class="form-select">
        <c:forEach var="entry" items="${searchFields}">
            <option value="${entry.key}" ${searchField == entry.key ? 'selected' : ''}>
                ${entry.value}
            </option>
        </c:forEach>
    </select>

    <input type="text" name="keyword" value="${keyword}" class="form-control" placeholder="검색어 입력">
    <button class="btn btn-primary" type="submit">검색</button>&nbsp;

    <c:forEach var="entry" items="${sortFields}">
        <a href="?sortField=${entry.key}&order=asc&searchField=${searchField}&keyword=${keyword}" class="btn btn-outline-secondary btn-sm">
            ${entry.value} ↑
        </a>
        <a href="?sortField=${entry.key}&order=desc&searchField=${searchField}&keyword=${keyword}" class="btn btn-outline-secondary btn-sm">
            ${entry.value} ↓
        </a>
    </c:forEach>
</div>