package fruitshop.model;

import java.util.Date;

public class DanhGia {
    private int id;
    private int idUser;
    private int idSp;
    private String noiDungBinhLuan;
    private  int soSaoVote;
    private Date ngayBinhLuan;
    private String anh;
    private String tenUser;

    public String getTenUser() {
        return tenUser;
    }

    public void setTenUser(String tenUser) {
        this.tenUser = tenUser;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getIdUser() {
        return idUser;
    }

    public void setIdUser(int idUser) {
        this.idUser = idUser;
    }

    public int getIdSp() {
        return idSp;
    }

    public void setIdSp(int idSp) {
        this.idSp = idSp;
    }

    public String getNoiDungBinhLuan() {
        return noiDungBinhLuan;
    }

    public void setNoiDungBinhLuan(String noiDungBinhLuan) {
        this.noiDungBinhLuan = noiDungBinhLuan;
    }

    public int getSoSaoVote() {
        return soSaoVote;
    }

    public void setSoSaoVote(int soSaoVote) {
        this.soSaoVote = soSaoVote;
    }

    public Date getNgayBinhLuan() {
        return ngayBinhLuan;
    }

    public void setNgayBinhLuan(Date ngayBinhLuan) {
        this.ngayBinhLuan = ngayBinhLuan;
    }

    public String getAnh() {
        return anh;
    }

    public void setAnh(String anh) {
        this.anh = anh;
    }
}
