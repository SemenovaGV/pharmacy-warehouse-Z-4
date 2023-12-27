<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
        <div class="container content">
            <div class="item-block">
                <c:choose>
                    <c:when test="${item != null}">
                        <div class="item">
                            <div class="flex-row">
                                <img class="full-view" src="data:image/jpg;base64,${item.base64Image}" alt="Картинка">
                                <table>
                                    <caption>${item.name}</caption>
                                    <tr><th>Артикул:</th><td>${item.code}</td></tr>
                                    <tr><th>Производитель:</th><td>${item.manufacturer}</td></tr>
                                    <tr><th>Цена:</th><td>${item.price} руб.</td></tr>
                                    <tr><th>Количество на складе:</th><td>${item.count}</td></tr>
                                </table>
                            </div>
                        </div>
                        <hr>
                        <p>${item.description}</p>
                    </c:when>
                    <c:otherwise>
                        <h3>Ничего не найдено &#128543;</h3>
                    </c:otherwise>
                </c:choose>
            </div>
        </div>