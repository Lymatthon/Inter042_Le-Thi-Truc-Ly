package Models;

public class HouseService extends Services{
    private String tieuChuanPhong;
    private String moTaTienNghiKhac;
    private int soTang;

    public HouseService() {
    }

    public HouseService(String id, String tenDichVu, double dienTich, int chiPhiThue, int soLuongNguoiToiDa, String kieuThue, String tieuChuanPhong, String moTaTienNghiKhac, int soTang) {
        super(id, tenDichVu, dienTich, chiPhiThue, soLuongNguoiToiDa, kieuThue);
        this.tieuChuanPhong = tieuChuanPhong;
        this.moTaTienNghiKhac = moTaTienNghiKhac;
        this.soTang = soTang;
    }

    public String getTieuChuanPhong() {
        return tieuChuanPhong;
    }

    public void setTieuChuanPhong(String tieuChuanPhong) {
        this.tieuChuanPhong = tieuChuanPhong;
    }

    public String getMoTaTienNghiKhac() {
        return moTaTienNghiKhac;
    }

    public void setMoTaTienNghiKhac(String moTaTienNghiKhac) {
        this.moTaTienNghiKhac = moTaTienNghiKhac;
    }

    public int getSoTang() {
        return soTang;
    }

    public void setSoTang(int soTang) {
        this.soTang = soTang;
    }


    public String toString() {
        return ";" + tieuChuanPhong + ";" + moTaTienNghiKhac + ";" + soTang;
    }
    @Override
    public String showInfor() {
        return super.showInfor()
                + toString();
    }
}
