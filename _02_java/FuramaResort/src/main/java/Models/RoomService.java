package Models;

public class RoomService extends Services{
    private String dichVuMienPhiDiKem;

    public RoomService() {
    }

    public RoomService(String id, String tenDichVu, double dienTich, int chiPhiThue, int soLuongNguoiToiDa, String kieuThue, String dichVuMienPhiDiKem) {
        super(id, tenDichVu, dienTich, chiPhiThue, soLuongNguoiToiDa, kieuThue);
        this.dichVuMienPhiDiKem = dichVuMienPhiDiKem;
    }

    public String getDichVuMienPhiDiKem() {
        return dichVuMienPhiDiKem;
    }

    public void setDichVuMienPhiDiKem(String dichVuMienPhiDiKem) {
        this.dichVuMienPhiDiKem = dichVuMienPhiDiKem;
    }


    public String toString() {
        return ";" + dichVuMienPhiDiKem + ";";
    }

    @Override
    public String showInfor() {
        return super.showInfor()
                + toString();
    }
}
