package fruitshop.controller;

import fruitshop.model.SanPham;
import fruitshop.service.SanPhamService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(value = "/chi-tiet-san-pham")
public class ChiTietSanPhamController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static final SanPhamService sanPhamService = new SanPhamService();
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		if(req.getParameter("id") == null){
			req.getRequestDispatcher("./khong_tim_thay_san_pham.jsp").forward(req,resp);
		}
		else {
			int id;
			try {
				id = Integer.parseInt(req.getParameter("id"));
			} catch (NumberFormatException e) {
				req.getRequestDispatcher("./khong_tim_thay_san_pham.jsp").forward(req, resp);
                                return;
			}
			SanPham sanPham = sanPhamService.getSanPhamById(id);
			if (sanPham == null) {
				req.getRequestDispatcher("./khong_tim_thay_san_pham.jsp").forward(req, resp);
				return;
			}
			List<Integer> listSoSao = sanPhamService.getListSoDanhGiaBySoSao(id);
			req.setAttribute("listSoSao", listSoSao);
			req.setAttribute("sanPham", sanPham);
			req.getRequestDispatcher("./chi_tiet_san_pham.jsp").forward(req, resp);
		}
	}
}