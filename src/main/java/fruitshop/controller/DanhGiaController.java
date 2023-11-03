package fruitshop.controller;

import fruitshop.model.DanhGia;
import fruitshop.service.SanPhamService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

@WebServlet("/danh-gia")
public class DanhGiaController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        SanPhamService sanPhamService = new SanPhamService();
        int page = 1;
        int star = -1;
        int id = Integer.parseInt(req.getParameter("id"));
        try {
            page = Integer.parseInt(req.getParameter("page"));
            star = Integer.parseInt(req.getParameter("star"));
        } catch (NumberFormatException e) {

        }
        List<DanhGia> listDanhGia = new ArrayList<>();
        try {
            listDanhGia = sanPhamService.getListDanhGiaByIdAndPage(id, page, star);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        req.setAttribute("listDanhGia", listDanhGia);
        req.getRequestDispatcher("./danh_gia.jsp").forward(req, resp);
        
    }

    public DanhGiaController() {
    }
}
