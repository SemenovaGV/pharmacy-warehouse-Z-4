<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

        <div class="container content">
            <c:choose>
                <c:when test="${pageContext.request.getParameter('id') == null}">
                    <c:forEach items="${allItems}" var="item">
                        <div class="flex-row item-short" onclick="location.href='<c:url value="/item?id=${item.id}"/>'">
                            <img src="data:image/jpg;base64,${item.base64Image}" class="preview" alt="Картинка">
                            <table >
                                <caption>${item.name}</caption>
                                <tr><th>Артикул:</th><td>${item.code}</td></tr>
                                <tr><th>Производитель:</th><td>${item.manufacturer}</td></tr>
                                <tr><th>Цена:</th><td>${item.price} руб.</td></tr>
                                <tr><th>Количество на складе:</th><td>${item.count}</td></tr>
                            </table>
                        </div>
                    </c:forEach>
                </c:when>
                <c:when test="${catItems != null and !catItems.isEmpty()}">
                    <c:forEach items="${catItems}" var="item">
                        <div class="flex-row item-short" onclick="location.href='<c:url value="/item?id=${item.id}"/>'">
                            <img src="data:image/jpg;base64,${item.base64Image}" class="preview" alt="Картинка">
                            <table >
                                <caption>${item.name}</caption>
                                <tr><th>Артикул:</th><td>${item.code}</td></tr>
                                <tr><th>Производитель:</th><td>${item.manufacturer}</td></tr>
                                <tr><th>Цена:</th><td>${item.price} руб.</td></tr>
                                <tr><th>Количество на складе:</th><td>${item.count}</td></tr>
                            </table>
                        </div>
                    </c:forEach>
                </c:when>
                <c:otherwise>
                    <h3>Ничего не найдено &#128543;</h3>
                </c:otherwise>
            </c:choose>
        </div>