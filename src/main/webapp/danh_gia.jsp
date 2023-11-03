<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="fruitshop.model.DanhGia" %>
<%@ page import="java.util.List" %><%--
  Created by IntelliJ IDEA.
  User: xuanq
  Date: 29/05/2023
  Time: 11:44 CH
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="./css/chi_tiet_san_pham.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" integrity="sha512-iecdLmaskl7CVkqkXNQ/ZH/XLlvWZOJyj7Yy7tcenmpD1ypASozpmT/E0iPtmFIB46ZmdtAc9eNBvH0H/ZpiBw==" crossorigin="anonymous" referrerpolicy="no-referrer" />
</head>
<body style="overflow: hidden; animation: rongDan 0.5s 1 forwards" class="danh-gia">
<%
    List<DanhGia> listDanhGia = (List<DanhGia>) request.getAttribute("listDanhGia");
%>
<c:forEach items="<%=listDanhGia%>" var="i">
    <div class="khung-danh-gia" style="display: flex">
        <div>
            <img src="${i.anh}" class="anh-dai-dien-cua-kh">
        </div>
        <div>
            <div class="ten-khach-hang">${i.tenUser}</div>
            <div>
                <c:forEach begin="1" end="${i.soSaoVote}">
                    <i class="fa-solid fa-star" id="sao_vang" style="scale: 0.8"></i>
                </c:forEach>
                <c:forEach begin="1" end="${5-i.soSaoVote}">
                    <i class="fa-solid fa-star" id="sao_den" style="scale: 0.8"></i>
                </c:forEach>
            </div>
            <div class="thoi-gian-danh-gia">${i.ngayBinhLuan.toLocaleString()}</div>
            <div class="chi-tiet-danh-gia">${i.noiDungBinhLuan}</div>
        </div>
    </div>
</c:forEach>
</body>
</html>
