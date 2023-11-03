package fruitshop.service;

import fruitshop.dao.Dao;
import fruitshop.model.DanhGia;
import fruitshop.model.SanPham;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class SanPhamService {
	private static final Connection conn = Dao.getConnection();
	public void SanPhamServlet(){}

	//	@Override
	public SanPham getSanPhamById(int id) {
		SanPham sanPham = new SanPham();
		try {
			PreparedStatement ppst = conn.prepareStatement("select sp.*, sum(dh.so_luong) as so_luong_ban \n" +
					"from sanpham sp \n" +
					"join donhang dh on sp.id = dh.id_sp\n" +
					"where sp.id = ? \n" +
					"group by sp.id;");
			ppst.setInt(1,id);
			ResultSet res = ppst.executeQuery();
			if(!res.next()){
				return null;
			}
			sanPham.setId(id);
			sanPham.setTen(res.getString("ten"));
			sanPham.setDonVi(res.getString("don_vi"));
			sanPham.setTienTrenDonVi(res.getInt("tien_tren_don_vi"));
			sanPham.setNguonGoc(res.getString("nguon_goc"));
			sanPham.setSoLuongNhap(res.getInt("so_luong_nhap"));
			sanPham.setSoLuongTrenDonVi(res.getString("so_luong_tren_don_vi"));
			sanPham.setTomTat(res.getString("tom_tat"));
			sanPham.setVi(res.getString("vi"));
			sanPham.setDinhDuong(res.getString("dinh_duong"));
			sanPham.setBaoQuan(res.getString("bao_quan"));
			sanPham.setAnh(res.getString("anh"));
			sanPham.setSoLuongBan(res.getInt("so_luong_ban"));
			ppst = conn.prepareStatement("select round(avg(dg.so_sao_vote),1) as so_sao_vote, count(dg.id) as tong_so_vote from danhgia dg where dg.id_sp = ?");
			ppst.setInt(1,id);
			res = ppst.executeQuery();
			if(!res.next()){
				return null;
			}
			sanPham.setSoSaoVote(res.getFloat("so_sao_vote"));
			sanPham.setTongSoVote(res.getInt("tong_so_vote"));
		}
		catch (SQLException e){
			e.printStackTrace();
		}
		return sanPham;
	}
	public List<DanhGia> getAllDanhGiaByIdAndStar(int id_sp, int choose, int page){
		List<DanhGia> list = new ArrayList<>();
		try{
			PreparedStatement cursor = null;
			if(choose != -1) {
				cursor = conn.prepareStatement("select u.ten, dg.so_sao_vote, dg.noi_dung_binh_luan, dg.ngay_binh_luan, u.anh \n" +
						"from user u, danhgia dg \n" +
						"where dg.id_sp = ? and u.id = dg.id_user and dg.so_sao_vote = ? \n" +
						"group by dg.id \n" +
						"order by dg.ngay_binh_luan desc \n" +
						"limit ?, 5;");
				cursor.setInt(1, id_sp);
				cursor.setInt(2, choose);
				cursor.setInt(3, (page - 1) * 5);
			}
			else{
				cursor = conn.prepareStatement("select u.ten, dg.so_sao_vote, dg.noi_dung_binh_luan, dg.ngay_binh_luan, u.anh \n" +
						"from user u, danhgia dg \n" +
						"where dg.id_sp = ? and u.id = dg.id_user \n" +
						"group by dg.id \n" +
						"order by dg.ngay_binh_luan desc \n" +
						"limit ?, 5;");
				cursor.setInt(1, id_sp);
				cursor.setInt(2, (page - 1) * 5);
			}
			ResultSet res = cursor.executeQuery();
			while (res.next()){
				DanhGia danhGia = new DanhGia();
				danhGia.setNgayBinhLuan(res.getTimestamp("ngay_binh_luan"));
				danhGia.setIdSp(id_sp);
				danhGia.setNoiDungBinhLuan(res.getString("noi_dung_binh_luan"));
				danhGia.setSoSaoVote(res.getInt("so_sao_vote"));
				String anh = null;
				if (res.getString("anh") == null){
					anh = "./img/fb-no-img.png";
				}
				danhGia.setAnh(anh);
				list.add(danhGia);
			}
		}
		catch (SQLException e){
			e.printStackTrace();
		}
		return list;
	}
	public List<SanPham> getSanPhamOrderBySoLuongBan(int limit){
		List<SanPham> list = new ArrayList<>();
		PreparedStatement cursor = null;
		try{
			cursor = conn.prepareStatement("select sp.*, sum(dh.so_luong) as so_luong_ban, round(avg(dh.so_sao_vote),1) as so_sao_vote\n" +
					"from sanpham sp\n" +
					"join donhang dh on sp.id = dh.id_sp \n" +
					"group by sp.id \n" +
					"order by so_luong_ban desc \n" +
					"limit " + limit+";");
			ResultSet res = cursor.executeQuery();
			while (res.next()){
				SanPham sanPham = new SanPham();
				sanPham.setId(res.getInt("id"));
				sanPham.setTen(res.getString("ten"));
				sanPham.setAnh(res.getString("anh"));
				sanPham.setSoSaoVote(res.getFloat("so_sao_vote"));
				sanPham.setDonVi(res.getString("don_vi"));
				sanPham.setSoLuongBan(res.getInt("so_luong_ban"));
				sanPham.setTienTrenDonVi(res.getInt("tien_tren_don_vi"));
				list.add(sanPham);
			}
		}
		catch (SQLException e){
			e.printStackTrace();
		}
		return list;
	}
	public List<SanPham> getSanPhamOrderBySoSao(int limit){
		List<SanPham> list = new ArrayList<>();
		PreparedStatement cursor = null;
		try{
			cursor = conn.prepareStatement("select sp.*, round(avg(dh.so_sao_vote),1) as so_sao_vote, sum(dh.so_luong) as so_luong_ban\n" +
					"from sanpham sp\n" +
					"join donhang dh on sp.id = dh.id_sp \n" +
					"where dh.so_sao_vote is not null \n" +
					"group by sp.id \n" +
					"order by so_sao_vote desc \n" +
					"limit " + limit+ ";");
			ResultSet res = cursor.executeQuery();
			while (res.next()) {
				SanPham sanPham = new SanPham();
				sanPham.setId(res.getInt("id"));
				sanPham.setTen(res.getString("ten"));
				sanPham.setAnh(res.getString("anh"));
				sanPham.setSoSaoVote(res.getFloat("so_sao_vote"));
				sanPham.setDonVi(res.getString("don_vi"));
				sanPham.setSoLuongBan(res.getInt("so_luong_ban"));
				sanPham.setTienTrenDonVi(res.getInt("tien_tren_don_vi"));
				list.add(sanPham);
			}
		}
		catch (SQLException e){
			e.printStackTrace();
		}
		return list;
	}
	public List<Integer> getListSoDanhGiaBySoSao(int id){
		Connection conn = Dao.getConnection();
		PreparedStatement cursor = null;
		List<Integer> list = new ArrayList<>();
		List<Integer> none = new ArrayList<>();
		for(int i=0;i<=5;i++){
			none.add(0);
		}
		try{
			cursor = conn.prepareStatement("select count(dg.id) as tong_so_sao from danhgia dg where dg.id_sp = ? and dg.so_sao_vote = ?");
			cursor.setInt(1,id);
			for(int i=0;i<=5;i++){
				cursor.setInt(2,i);
				ResultSet res = cursor.executeQuery();
				if(!res.next()){
					return none;
				}
				list.add(res.getInt("tong_so_sao"));
			}
		}
		catch (SQLException e){
			e.printStackTrace();
		}
		return list;
	}
	public List<DanhGia> getListDanhGiaByIdAndPage(int id, int page, int star) throws SQLException {
		Connection conn = Dao.getConnection();
		PreparedStatement cursor = null;
		if(star>=0) {
			cursor = conn.prepareStatement("select * from danhgia dg where dg.id_sp = ? and dg.so_sao_vote = ? limit ?, 3");
			cursor.setInt(1, id);
			cursor.setInt(3, (page - 1)*3);
			cursor.setInt(2, star);
		}
		else {
			cursor = conn.prepareStatement("select * from danhgia dg where dg.id_sp = ? limit ?, 3");
			cursor.setInt(1,id);
			cursor.setInt(2,(page - 1)*3);
		}
		ResultSet res = cursor.executeQuery();
		List<DanhGia> list = new ArrayList<>();
		while (res.next()){
			DanhGia danhGia = new DanhGia();
			danhGia.setId(res.getInt("id"));
			danhGia.setIdUser(res.getInt("id_user"));
			danhGia.setNoiDungBinhLuan(res.getString("noi_dung_binh_luan"));
			danhGia.setNgayBinhLuan(res.getTimestamp("ngay_binh_luan"));
			danhGia.setSoSaoVote(res.getInt("so_sao_vote"));
			cursor = conn.prepareStatement("select u.ten, u.anh from user u where u.id = ?");
			cursor.setInt(1,danhGia.getIdUser());
			ResultSet res1 = cursor.executeQuery();
			res1.next();
			danhGia.setAnh(res1.getString("anh"));
			if(danhGia.getAnh() == null){
				danhGia.setAnh("./img/fb-no-img.png");
			}
			danhGia.setTenUser(res1.getString("ten"));
			list.add(danhGia);
		}
		return list;
	}
}