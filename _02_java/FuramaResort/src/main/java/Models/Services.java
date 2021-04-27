package Models;

public abstract class Services {
    private String id;
    private String tenDichVu;
    private double dienTich;
    private int chiPhiThue;
    private int soLuongNguoiToiDa;
    private String kieuThue;

    public Services() {
    }

    public Services(String id, String tenDichVu, double dienTich, int chiPhiThue, int soLuongNguoiToiDa, String kieuThue) {
        this.id = id;
        this.tenDichVu = tenDichVu;
        this.dienTich = dienTich;
        this.chiPhiThue = chiPhiThue;
        this.soLuongNguoiToiDa = soLuongNguoiToiDa;
        this.kieuThue = kieuThue;
    }

    public int getChiPhiThue() {
        return chiPhiThue;
    }

    public void setChiPhiThue(int chiPhiThue) {
        this.chiPhiThue = chiPhiThue;
    }

    public String showInfor() {
        return  id + ';' + tenDichVu + ';' + dienTich +
                ';' + chiPhiThue +
                ';' + soLuongNguoiToiDa +
                ';' + kieuThue;
    }
}
