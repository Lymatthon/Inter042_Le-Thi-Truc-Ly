package Models;

public class VillaService extends Services{
    private String tieuChuanPhong;
    private String moTaTienNghiKhac;
    private double dienTichHoBoi;
    private int soTang;

    public VillaService() {
    }

    public VillaService(String id, String tenDichVu, double dienTich, int chiPhiThue, int soLuongNguoiToiDa, String kieuThue, String tieuChuanPhong, String moTaTienNghiKhac, double dienTichHoBoi, int soTang) {
        super(id, tenDichVu, dienTich, chiPhiThue, soLuongNguoiToiDa, kieuThue);
        this.tieuChuanPhong = tieuChuanPhong;
        this.moTaTienNghiKhac = moTaTienNghiKhac;
        this.dienTichHoBoi = dienTichHoBoi;
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

    public double getDienTichHoBoi() {
        return dienTichHoBoi;
    }

    public void setDienTichHoBoi(double dienTichHoBoi) {
        this.dienTichHoBoi = dienTichHoBoi;
    }

    public int getSoTang() {
        return soTang;
    }

    public void setSoTang(int soTang) {
        this.soTang = soTang;
    }

    public String toString() {
        return ";" + tieuChuanPhong + ";" + moTaTienNghiKhac + ";" + dienTichHoBoi + ";" + soTang;
    }
    @Override
    public String showInfor() {
        return super.showInfor()
                + toString();
    }


}

