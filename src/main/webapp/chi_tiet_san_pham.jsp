<%@ page import="fruitshop.model.SanPham" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.Arrays" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="fruitshop.model.DanhGia" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>
<%@taglib uri='http://java.sun.com/jsp/jstl/core' prefix='c'%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!doctype html>
<html lang="en">
<head>
	<title>Thông tin sản phẩm | Fruitshop</title>
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<link rel="stylesheet" href="./css/common.css">
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" integrity="sha512-iecdLmaskl7CVkqkXNQ/ZH/XLlvWZOJyj7Yy7tcenmpD1ypASozpmT/E0iPtmFIB46ZmdtAc9eNBvH0H/ZpiBw==" crossorigin="anonymous" referrerpolicy="no-referrer" />
	<link rel="stylesheet" href="./css/chi_tiet_san_pham.css">
	<link rel="icon" type="image/x-icon" href="./img/shop_icon.ico">
	<link rel="stylesheet" href="./css/load_page.css">
</head>
<body>
<jsp:include page="header.jsp"></jsp:include>
<jsp:include page="load_page.jsp"></jsp:include>
<div class="than-website">
	<div class="phan-1">
		<div class="anh-san-pham">
                    <img src="${sanPham.anh}" title="${sanPham.ten}">
		</div>
		<div class="ben-phai-anh-san-pham">
			<div class="thong-tin-co-ban">
				<h1 class="ten-san-pham">${sanPham.ten}</h1>
				<div class="so-sao-va-luot-ban"><span style="color: #8b8b93">${sanPham.soSaoVote}</span><i class="fa-solid fa-star sao" id="sao_vang"></i><span style="color: #8b8b93">(${sanPham.tongSoVote} đánh giá) | Đã bán ${sanPham.soLuongBan} </span></div>
				<div class="thong-tin-phu-san-pham">
					<div class="don-vi"><span style="color: #8b8b93; margin-left: 5px">Đơn vị: </span><span style="color: #28a745;">${sanPham.donVi}</span></div>
					<div class="nguon-goc" style="display: flex; justify-content: left;"><span style="color: #8b8b93">Nguồn gốc: </span><span style="color: #28a745">${sanPham.nguonGoc}</span></div>
					<%
						SanPham sanPham = (SanPham) request.getAttribute("sanPham");
						String tinhTrang = (sanPham.getSoLuongNhap() > sanPham.getSoLuongBan()) ? "Còn hàng" : "Hết hàng";
					%>
					<div class="tinh-trang"><span style="color: #8b8b93">Tình trạng: </span><span style="color: #28a745"><%=tinhTrang%></span></div>
				</div>
				<div class="gia-san-pham"><span style="color: red; font-size: 25px; font-weight: bold">${sanPham.tienTrenDonVi} VND</span><span style="font-size: 25px; font-weight: bold">/${sanPham.donVi}</span></div>
				<div class="tieu-de-so-luong">Số lượng</div>
				<div class="so-luong-va-lua-chon-mua">
					<div class="dieu-chinh-so-luong">
						<div><button class="tru">-</button></div>
						<div class="so-luong">1</div>
						<div><button class="cong">+</button></div>
					</div>
					<div class="nut-them-vao-gio">
						<button id="nut-them-vao-gio">Thêm vào giỏ</button>
					</div>
					<div class="nut-mua-ngay">
						<button id="nut-mua-ngay">Mua ngay</button>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="phan-2">
		<div class="tab" style="display: flex">
			<div style="flex: 1"></div>
			<div class="hai-button-tab-va-thanh-gach-chan">
				<div class="hai-button-tab">
					<button class="nut-mo-ta">Mô tả</button>
					<button class="nut-danh-gia">Đánh giá</button>
				</div>
				<div class="thanh-gach-chan-tab"></div>
			</div>
			<div style="flex: 1"></div>
		</div>
		<div class="chi-tiet-tab">
			<div class="tab1">
				<div class="nguon-goc">
					<h1>Nguồn gốc</h1>
					<p>${sanPham.nguonGoc}</p>
				</div>
				<div class="so-luong-tren-don-vi">
					<h1>Số lượng trên đơn vị</h1>
					<p>${sanPham.soLuongTrenDonVi}</p>
				</div>
				<div class="tom-tat">
					<h1>Tóm tắt</h1>
					<%List<String> tomTat = Arrays.asList(sanPham.getTomTat().split("\\$")); %>
					<c:forEach items="<%=tomTat%>" var="item">
						<p class="thong-tin-mo-ta-thuoc-tinh-san-pham">${item}</p>
					</c:forEach>
				</div>
				<div class="vi">
					<h1>Vị</h1>
					<p>${sanPham.vi}</p>
				</div>
				<div class="dinh-duong">
					<h1>Dinh dưỡng</h1>
					<%List<String> dinhDuong = Arrays.asList(sanPham.getDinhDuong().split("\\$")); %>
					<c:forEach items="<%=dinhDuong%>" var="items">
						<p>${items}</p>
					</c:forEach>
				</div>
				<div class="bao-quan">
					<h1>Bảo quản</h1>
					<%List<String> baoQuan = Arrays.asList(sanPham.getBaoQuan().split("\\$")); %>
					<c:forEach items="<%=baoQuan%>" var="items">
						<p>${items}</p>
					</c:forEach>
				</div>
			</div>
			<div class="tab2">
				<div class="tieu-de-tab2">
					<h2 class="tieu-de-danh-gia">
						Đánh giá - Nhận xét từ khách hàng
					</h2>
				</div>
				<div class="than-tab2">
					<div class="tong-quan-so-sao">
						<div class="sao-trung-binh-va-so-danh-gia">
							<div class="sao-trung-binh">
								<span id="sao-trung-binh">${sanPham.soSaoVote}</span>
							</div>
							<div class="tong-so-danh-gia-va-sao-vang">
								<div class="sao-vang">
									<i class="fa-solid fa-star sao" id="sao_vang"></i>
								</div>
								<div>
									<span id="tong-so-danh-gia">${sanPham.tongSoVote} đánh giá</span>
								</div>
							</div>
						</div>
						<%
							List<Integer> listSoSao = (ArrayList<Integer>) request.getAttribute("listSoSao");
						%>
						<div class="chi-tiet-so-sao">
							<div class="danh-sach-so-sao-5-1">
								<div class="thanh-sao-va-phan-tram-sao nam-sao">
									<div id="thanh-sao">
										<i class="fa-solid fa-star sao" id="sao_vang"></i>
										<i class="fa-solid fa-star sao" id="sao_vang"></i>
										<i class="fa-solid fa-star sao" id="sao_vang"></i>
										<i class="fa-solid fa-star sao" id="sao_vang"></i>
										<i class="fa-solid fa-star sao" id="sao_vang"></i>
									</div>
									<div class="thanh-phan-tram-sao">
										<div style="display: inline-block; background: #3D464D; height: 5px; width: <%=((double)listSoSao.get(5)/sanPham.getTongSoVote()*100.0)%>%; margin-bottom: 50%; border-radius: 10px;"></div>
									</div>
									<div class="so-danh-gia nam-sao"><%=listSoSao.get(5)%></div>
								</div>
								<div class="thanh-sao-va-phan-tram-sao bon-sao">
									<div id="thanh-sao">
										<i class="fa-solid fa-star sao" id="sao_vang"></i>
										<i class="fa-solid fa-star sao" id="sao_vang"></i>
										<i class="fa-solid fa-star sao" id="sao_vang"></i>
										<i class="fa-solid fa-star sao" id="sao_vang"></i>
										<i class="fa-solid fa-star sao" id="sao_den"></i>
									</div>
									<div class="thanh-phan-tram-sao">
										<div style="display: inline-block; background: #3D464D; height: 5px; width: <%=((double)listSoSao.get(4)/sanPham.getTongSoVote()*100.0)%>%; margin-bottom: 50%; border-radius: 10px;"></div>
									</div>
									<div class="so-danh-gia nam-sao"><%=listSoSao.get(4)%></div>
								</div>
								<div class="thanh-sao-va-phan-tram-sao ba-sao">
									<div id="thanh-sao">
										<i class="fa-solid fa-star sao" id="sao_vang"></i>
										<i class="fa-solid fa-star sao" id="sao_vang"></i>
										<i class="fa-solid fa-star sao" id="sao_vang"></i>
										<i class="fa-solid fa-star sao" id="sao_den"></i>
										<i class="fa-solid fa-star sao" id="sao_den"></i>
									</div>
									<div class="thanh-phan-tram-sao">
										<div style="display: inline-block; background: #3D464D; height: 5px; width: <%=((double)listSoSao.get(3)/sanPham.getTongSoVote()*100.0)%>%; margin-bottom: 50%; border-radius: 10px;"></div>
									</div>
									<div class="so-danh-gia nam-sao"><%=listSoSao.get(3)%></div>
								</div>
								<div class="thanh-sao-va-phan-tram-sao hai-sao">
									<div id="thanh-sao">
										<i class="fa-solid fa-star sao" id="sao_vang"></i>
										<i class="fa-solid fa-star sao" id="sao_vang"></i>
										<i class="fa-solid fa-star sao" id="sao_den"></i>
										<i class="fa-solid fa-star sao" id="sao_den"></i>
										<i class="fa-solid fa-star sao" id="sao_den"></i>
									</div>
									<div class="thanh-phan-tram-sao">
										<div style="display: inline-block; background: #3D464D; height: 5px; width: <%=((double)listSoSao.get(2)/sanPham.getTongSoVote()*100.0)%>%; margin-bottom: 50%; border-radius: 10px;"></div>
									</div>
									<div class="so-danh-gia nam-sao"><%=listSoSao.get(2)%></div>
								</div>
								<div class="thanh-sao-va-phan-tram-sao mot-sao">
									<div id="thanh-sao">
										<i class="fa-solid fa-star sao" id="sao_vang"></i>
										<i class="fa-solid fa-star sao" id="sao_den"></i>
										<i class="fa-solid fa-star sao" id="sao_den"></i>
										<i class="fa-solid fa-star sao" id="sao_den"></i>
										<i class="fa-solid fa-star sao" id="sao_den"></i>
									</div>
									<div class="thanh-phan-tram-sao">
										<div style="display: inline-block; background: #3D464D; height: 5px; width: <%=((double)listSoSao.get(1)/sanPham.getTongSoVote()*100.0)%>%; margin-bottom: 50%; border-radius: 10px;"></div>
									</div>
									<div class="so-danh-gia nam-sao"><%=listSoSao.get(1)%></div>
								</div>
								<div class="thanh-sao-va-phan-tram-sao khong-sao">
									<div id="thanh-sao">
										<i class="fa-solid fa-star sao" id="sao_den"></i>
										<i class="fa-solid fa-star sao" id="sao_den"></i>
										<i class="fa-solid fa-star sao" id="sao_den"></i>
										<i class="fa-solid fa-star sao" id="sao_den"></i>
										<i class="fa-solid fa-star sao" id="sao_den"></i>
									</div>
									<div class="thanh-phan-tram-sao">
										<div style="display: inline-block; background: #3D464D; height: 5px; width: <%=((double)listSoSao.get(0)/sanPham.getTongSoVote()*100.0)%>%; margin-bottom: 50%; border-radius: 10px;"></div>
									</div>
									<div class="so-danh-gia nam-sao"><%=listSoSao.get(0)%></div>
								</div>
							</div>
						</div>
					</div>
					<div class="tong-quan-danh-gia">
						<div class="phan-loai-danh-gia-theo-so-sao">
							<div class="tieu-de-phan-loai-theo" style="margin-right: 20px">Phân loại theo: </div>
							<script>
								var id = <%=sanPham.getId()%>;
							</script>
							<button class="phan-loai-theo-tat-ca" id="nut-phan-loai">Tất cả</button>
							<button class="phan-loai-theo-5-sao" id="nut-phan-loai">5 <i class="fa-solid fa-star sao" id="sao_vang"></i></button>
							<button class="phan-loai-theo-4-sao" id="nut-phan-loai">4 <i class="fa-solid fa-star sao" id="sao_vang"></i></button>
							<button class="phan-loai-theo-3-sao" id="nut-phan-loai">3 <i class="fa-solid fa-star sao" id="sao_vang"></i></button>
							<button class="phan-loai-theo-2-sao" id="nut-phan-loai">2 <i class="fa-solid fa-star sao" id="sao_vang"></i></button>
							<button class="phan-loai-theo-1-sao" id="nut-phan-loai">1 <i class="fa-solid fa-star sao" id="sao_vang"></i></button>
							<button class="phan-loai-theo-0-sao" id="nut-phan-loai">0 <i class="fa-solid fa-star sao" id="sao_vang"></i></button>
						</div>
						<div class="danh-sach-danh-gia-cua-khach-hang">
							<iframe src="./danh-gia?id=${sanPham.id}&page=1" class="frame" style="width: 100%;height: 100%; border: 0; padding-bottom: 20px; overflow: hidden"></iframe>
						</div>
						<%
							int star = -1;
							int end0 = (int)(listSoSao.get(0)/3)+((listSoSao.get(0)%3>0) ? 1 : 0);
							int end1 = (listSoSao.get(1)/3)+((listSoSao.get(1)%3>0) ? 1 : 0);
							int end2 = (listSoSao.get(2)/3)+((listSoSao.get(2)%3>0) ? 1 : 0);
							int end3 = (listSoSao.get(3)/3)+((listSoSao.get(3)%3>0) ? 1 : 0);
							int end4 = (listSoSao.get(4)/3)+((listSoSao.get(4)%3>0) ? 1 : 0);
							int end5 = (listSoSao.get(5)/3)+((listSoSao.get(5)%3>0) ? 1 : 0);
							int endAll = (sanPham.getTongSoVote()/3)+((sanPham.getTongSoVote()%3>0) ? 1 : 0);
						%>
						<script>
							var endAll = <%=endAll%>;
							var listEnd = [];
							listEnd.push(<%=end0%>);
							listEnd.push(<%=end1%>);
							listEnd.push(<%=end2%>);
							listEnd.push(<%=end3%>);
							listEnd.push(<%=end4%>);
							listEnd.push(<%=end5%>);
							var star = <%=star%>
						</script>
						<div class="thanh-trang-danh-gia">
							<button class="lui" id="lui"><i class="fa-solid fa-angle-right" style="transform: scaleX(-1)"></i></button>
							<button class="so-trang">1</button>
							<button class="so-trang">2</button>
							<button class="so-trang">3</button>
							<button class="so-trang">4</button>
							<button class="so-trang">5</button>
							<button class="tien" id="tien"><i class="fa-solid fa-angle-right"></i></button>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<script src="js/chi_tiet_san_pham.js"></script>
<jsp:include page="footer.jsp"></jsp:include>
<script src="./js/common.js"></script>
<script src="./js/load_page.js"></script>
</body>
</html>