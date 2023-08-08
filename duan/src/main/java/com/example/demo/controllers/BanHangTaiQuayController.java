package com.example.demo.controllers;

import com.example.demo.models.ChiTietSanPham;
import com.example.demo.models.DiaChi;
import com.example.demo.models.HangKhachHang;
import com.example.demo.models.HoaDon;
import com.example.demo.models.HoaDonChiTiet;
import com.example.demo.models.IMEI;
import com.example.demo.models.KhachHang;
import com.example.demo.models.NhanVien;
import com.example.demo.services.CameraService;
import com.example.demo.services.ChiTietSanPhamService;
import com.example.demo.services.ChipService;
import com.example.demo.services.DiaChiService;
import com.example.demo.services.DungLuongPinService;
import com.example.demo.services.HangKhachHangService;
import com.example.demo.services.HangSanPhamService;
import com.example.demo.services.HoaDonChiTietService;
import com.example.demo.services.HoaDonService;
import com.example.demo.services.IMEIService;
import com.example.demo.services.KhachHangService;
import com.example.demo.services.ManHinhService;
import com.example.demo.services.MauSacService;
import com.example.demo.services.NhanVienService;
import com.example.demo.services.PinService;
import com.example.demo.services.RamService;
import com.example.demo.services.RomService;
import com.example.demo.services.SanPhamService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.math.BigDecimal;
import java.sql.Date;
import java.time.LocalDate;
import java.util.List;
import java.util.UUID;

@Controller
@RequestMapping("/ban-hang")
public class BanHangTaiQuayController {
    @Autowired
    private HoaDonService hoaDonService;
    @Autowired
    private ChiTietSanPhamService chiTietSanPhamService;
    @Autowired
    private NhanVienService nhanVienService;
    @Autowired
    private KhachHangService khachHangService;
    @Autowired
    private HoaDonChiTietService hoaDonChiTietService;
    @Autowired
    private DiaChiService diaChiService;
    @Autowired
    private IMEIService imeiService;

    @Autowired
    private SanPhamService sanPhamService;
    @Autowired
    private MauSacService mauSacService;
    @Autowired
    private ChipService chipService;
    @Autowired
    private RamService ramService;
    @Autowired
    private RomService romService;
    @Autowired
    private PinService pinService;
    @Autowired
    private HangSanPhamService hangSanPhamService;
    @Autowired
    private HangKhachHangService hangKhachHangService;
    @Autowired
    private DungLuongPinService dungLuongPinService;
    @Autowired
    private ManHinhService manHinhService;
    @Autowired
    private CameraService cameraService;

    private HoaDon hoaDonnn = new HoaDon();
    private BigDecimal total = BigDecimal.ZERO;

    @GetMapping("hien-thi")
    public String hienThi(Model model, @ModelAttribute("hoaDon") HoaDon hoaDon, @ModelAttribute("modalAddKhachHang") KhachHang khachHang) {
        hoaDonnn=null;
        List<HoaDon> list = hoaDonService.find();
        model.addAttribute("listHoaDon", list);
        model.addAttribute("listHang", hangSanPhamService.findAll());
        model.addAttribute("listMauSac", mauSacService.findAll());
        model.addAttribute("listChip", chipService.findAll());
        model.addAttribute("listRam", ramService.findAll());
        model.addAttribute("listRom", romService.findAll());
        model.addAttribute("dungLuongPin", dungLuongPinService.findAll());
        model.addAttribute("listManHinh", manHinhService.findAll());
        model.addAttribute("listCamera", cameraService.findAll());
        model.addAttribute("listChiTietSanPham", chiTietSanPhamService.findAll());
        model.addAttribute("listNhanVien", nhanVienService.findAll());
        model.addAttribute("listKhachHang", khachHangService.findAll());
        model.addAttribute("listDiaChi", diaChiService.findAll());
        model.addAttribute("listHangKhachHang",hangKhachHangService.findAll());
        model.addAttribute("hoaDon",hoaDonnn);
        model.addAttribute("contentPage", "ban-hang/hien-thi.jsp");
        return "layout";
    }

    @PostMapping("/add-hoa-don")
    public String addHoaDon(Model model, @ModelAttribute("hoaDon") HoaDon hoaDon, @ModelAttribute("modalAddKhachHang") KhachHang khachHang) {
        List<HoaDon> list = hoaDonService.find();
        if (list.size() >= 3) {
            hoaDonnn=null;
            model.addAttribute("hoaDon",hoaDonnn);
            model.addAttribute("thongBaoHoaDon", "Đã quá số lượng hóa đơn chờ");
            model.addAttribute("listHoaDon", list);
            model.addAttribute("listHang", hangSanPhamService.findAll());
            model.addAttribute("listMauSac", mauSacService.findAll());
            model.addAttribute("listChip", chipService.findAll());
            model.addAttribute("listRam", ramService.findAll());
            model.addAttribute("listRom", romService.findAll());
            model.addAttribute("dungLuongPin", dungLuongPinService.findAll());
            model.addAttribute("listManHinh", manHinhService.findAll());
            model.addAttribute("listCamera", cameraService.findAll());
            model.addAttribute("listChiTietSanPham", chiTietSanPhamService.findAll());
            model.addAttribute("listNhanVien", nhanVienService.findAll());
            model.addAttribute("listKhachHang", khachHangService.findAll());
            model.addAttribute("listDiaChi", diaChiService.findAll());
            model.addAttribute("listHangKhachHang",hangKhachHangService.findAll());
            model.addAttribute("contentPage", "ban-hang/hien-thi.jsp");
            return "layout";
        }
        HoaDon hd = new HoaDon();
        hd.setMa("HD" + String.valueOf(hoaDonService.findAll().size() + 1));
        hd.setTinhTrang(0);
        hd.setNgayTao(Date.valueOf(LocalDate.now()));
        hoaDonService.add(hd);
        return "redirect:/ban-hang/hien-thi";
    }

    @GetMapping("/thong-tin-hoa-don/{id}")
    public String thongTin(Model model, @ModelAttribute("hoaDon") HoaDon hoaDon, @PathVariable("id") UUID id, @ModelAttribute("modalAddKhachHang") KhachHang khachHang) {
        HoaDon hd = hoaDonService.findById(id);
        model.addAttribute("hoaDon", hd);
        hoaDonnn = hd;
        List<HoaDon> list = hoaDonService.find();
        model.addAttribute("listHoaDon", list);
        List<HoaDonChiTiet> listHDCT = hoaDonChiTietService.getHoaDonChiTiet(hd.getId());
        model.addAttribute("listHoaDonChiTiet", listHDCT);
        model.addAttribute("listHang", hangSanPhamService.findAll());
        model.addAttribute("listMauSac", mauSacService.findAll());
        model.addAttribute("listChip", chipService.findAll());
        model.addAttribute("listRam", ramService.findAll());
        model.addAttribute("listRom", romService.findAll());
        model.addAttribute("dungLuongPin", dungLuongPinService.findAll());
        model.addAttribute("listManHinh", manHinhService.findAll());
        model.addAttribute("listCamera", cameraService.findAll());
        model.addAttribute("listChiTietSanPham", chiTietSanPhamService.findAll());
        model.addAttribute("listNhanVien", nhanVienService.findAll());
        model.addAttribute("listKhachHang", khachHangService.findAll());
        model.addAttribute("listDiaChi", diaChiService.findAll());
        model.addAttribute("listHangKhachHang",hangKhachHangService.findAll());
        model.addAttribute("contentPage", "ban-hang/hien-thi.jsp");
        return "layout";
    }

    @ResponseBody
    @GetMapping("/them-san-pham/{id}")
    public List<IMEI> themSanPham(Model model, @ModelAttribute("hoaDon") HoaDon hoaDon,
                                  @PathVariable("id") UUID id, @ModelAttribute("modalAddKhachHang") KhachHang khachHang) {
        if (hoaDonnn.getMa() == null) {
            model.addAttribute("thongBao", "Chưa chọn hóa đơn");
            List<HoaDon> list = hoaDonService.find();
            model.addAttribute("listHoaDon", list);
        }
        model.addAttribute("hoaDon", hoaDonnn);
        List<IMEI> list = imeiService.getIMEI(id);
        System.out.println(list);
        return list;

    }

    @GetMapping("/hien-thi-san-pham")
    public String hienThiSanPham(Model model) {
        model.addAttribute("listHang", hangSanPhamService.findAll());
        model.addAttribute("listMauSac", mauSacService.findAll());
        model.addAttribute("listChip", chipService.findAll());
        model.addAttribute("listRam", ramService.findAll());
        model.addAttribute("listRom", romService.findAll());
        model.addAttribute("dungLuongPin", dungLuongPinService.findAll());
        model.addAttribute("listManHinh", manHinhService.findAll());
        model.addAttribute("listCamera", cameraService.findAll());
        model.addAttribute("listChiTietSanPham", chiTietSanPhamService.findAll());
        model.addAttribute("listNhanVien", nhanVienService.findAll());
        model.addAttribute("listKhachHang", khachHangService.findAll());
        model.addAttribute("listDiaChi", diaChiService.findAll());
        model.addAttribute("listHangKhachHang",hangKhachHangService.findAll());
        model.addAttribute("contentPage", "ban-hang/hien-thi.jsp");
        return "layout";
    }
//    @GetMapping("/thay-doi-trang-thai/{id}")
//    public String updateTrangThai(Model model, @ModelAttribute("hoaDon") HoaDon hoaDon, @PathVariable("id") UUID id) {
//        HoaDon hd = hoaDonService.findById(id);
//        LocalDate ngayCapNhat = LocalDate.now();
//        if (hd.getTinhTrang() == 0) {
//            hoaDonService.update(id, 1, Date.valueOf(ngayCapNhat));
//            return "redirect:/ban-hang/hien-thi";
//        } else {
//            hoaDonService.update(id, 0, Date.valueOf(ngayCapNhat));
//            return "redirect:/ban-hang/hien-thi";
//        }
//    }

    @PostMapping("search-san-pham")
    public String search(Model model, @RequestParam("search-san-pham") String search,
                         @ModelAttribute("hoaDon") HoaDon hoaDon, @ModelAttribute("modalAddKhachHang") KhachHang khachHang
    ) {
        if (search.isEmpty()) {
            model.addAttribute("thongBao", "Không để trống thông tin");
            List<HoaDon> list = hoaDonService.find();
            model.addAttribute("listHoaDon", list);
            model.addAttribute("listHang", hangSanPhamService.findAll());
            model.addAttribute("listMauSac", mauSacService.findAll());
            model.addAttribute("listChip", chipService.findAll());
            model.addAttribute("listRam", ramService.findAll());
            model.addAttribute("listRom", romService.findAll());
            model.addAttribute("dungLuongPin", dungLuongPinService.findAll());
            model.addAttribute("listManHinh", manHinhService.findAll());
            model.addAttribute("listCamera", cameraService.findAll());
            model.addAttribute("listChiTietSanPham", chiTietSanPhamService.findAll());
            model.addAttribute("listNhanVien", nhanVienService.findAll());
            model.addAttribute("listKhachHang", khachHangService.findAll());
            model.addAttribute("listDiaChi", diaChiService.findAll());
            model.addAttribute("listHangKhachHang",hangKhachHangService.findAll());
            model.addAttribute("contentPage", "ban-hang/hien-thi.jsp");
            return "layout";
        } else {
            List<ChiTietSanPham> listCT = chiTietSanPhamService.search(search);
            model.addAttribute("listChiTietSanPham", listCT);
            List<HoaDon> list = hoaDonService.find();
            model.addAttribute("listHoaDon", list);
            model.addAttribute("listHang", hangSanPhamService.findAll());
            model.addAttribute("listMauSac", mauSacService.findAll());
            model.addAttribute("listChip", chipService.findAll());
            model.addAttribute("listRam", ramService.findAll());
            model.addAttribute("listRom", romService.findAll());
            model.addAttribute("dungLuongPin", dungLuongPinService.findAll());
            model.addAttribute("listManHinh", manHinhService.findAll());
            model.addAttribute("listCamera", cameraService.findAll());
            model.addAttribute("listNhanVien", nhanVienService.findAll());
            model.addAttribute("listKhachHang", khachHangService.findAll());
            model.addAttribute("listDiaChi", diaChiService.findAll());
            model.addAttribute("listHangKhachHang",hangKhachHangService.findAll());
            model.addAttribute("contentPage", "ban-hang/hien-thi.jsp");
            return "layout";
        }
    }

    @ResponseBody
    @GetMapping("search-imei")
    public List<IMEI> searchIMEI(Model model, @RequestParam("search-imei") String search,
                                 @ModelAttribute("hoaDon") HoaDon hoaDon, @ModelAttribute("modalAddKhachHang") KhachHang khachHang) {
//        if (search.isEmpty()) {
//            model.addAttribute("thongBaoIMEI", "Không để trống thông tin");
//            model.addAttribute("hoaDon", hoaDonnn);
//            List<HoaDon> list = hoaDonService.find();
//            model.addAttribute("listHoaDon", list);
//            return l;
//        } else {}
        List<IMEI> listIMEI = imeiService.search(search);
        System.out.println(listIMEI);
        model.addAttribute("hoaDon", hoaDonnn);
        model.addAttribute("listImei", listIMEI);
        List<HoaDon> list = hoaDonService.find();
        model.addAttribute("listHoaDon", list);
        return listIMEI;

    }

    @GetMapping("/them-imei/{id}")
    public String addIMEI(Model model, @PathVariable("id") UUID id,
                          @ModelAttribute("hoaDon") HoaDon hoaDon, @ModelAttribute("modalAddKhachHang") KhachHang khachHang) {
//        if(hoaDonnn.getMa().isEmpty()){
//            model.addAttribute("thongBaoImei","Chưa chọn hóa đơn");
//            model.addAttribute("hoaDon", hoaDonnn);
//            List<HoaDon> listHD = hoaDonService.find();
//            model.addAttribute("listHoaDon", listHD);
//            return "ban-hang/hien-thi";
//        }
        BigDecimal total = BigDecimal.ZERO;
        IMEI imei = imeiService.findById(id);
        HoaDonChiTiet hdct = new HoaDonChiTiet();
        hdct.setImei(imei);
        hdct.setHoaDon(hoaDonnn);
        hdct.setTinhTrang(1);
        hdct.setDonGia(imei.getChiTietSanPham().getGiaBan());
        hdct.setSoLuong(1);
        hoaDonChiTietService.add(hdct);
        ChiTietSanPham ct = chiTietSanPhamService.getChiTiet(id);
        ct.setSoLuong(ct.getSoLuong() - 1);
        long millis = System.currentTimeMillis();
        Date date = new java.sql.Date(millis);
        ct.setNgayTao(date);
        imeiService.updatImei(date, id);
        if (ct.getSoLuong() == 0) {
            ct.setTinhTrang(0);
            chiTietSanPhamService.update1(ct);
            List<HoaDonChiTiet> list = hoaDonChiTietService.getHoaDonChiTiet(hoaDonnn.getId());
            for (HoaDonChiTiet hd : list
            ) {
                total = total.add(hd.getDonGia());
            }
            System.out.println(total);
            model.addAttribute("tong", String.valueOf(total));
            model.addAttribute("listHoaDonChiTiet", list);
            List<HoaDon> listHD = hoaDonService.find();
            model.addAttribute("listHoaDon", listHD);
            model.addAttribute("hoaDon", hoaDonnn);
            model.addAttribute("listHang", hangSanPhamService.findAll());
            model.addAttribute("listMauSac", mauSacService.findAll());
            model.addAttribute("listChip", chipService.findAll());
            model.addAttribute("listRam", ramService.findAll());
            model.addAttribute("listRom", romService.findAll());
            model.addAttribute("dungLuongPin", dungLuongPinService.findAll());
            model.addAttribute("listManHinh", manHinhService.findAll());
            model.addAttribute("listCamera", cameraService.findAll());
            model.addAttribute("listChiTietSanPham", chiTietSanPhamService.findAll());
            model.addAttribute("listNhanVien", nhanVienService.findAll());
            model.addAttribute("listKhachHang", khachHangService.findAll());
            model.addAttribute("listDiaChi", diaChiService.findAll());
            model.addAttribute("listHangKhachHang",hangKhachHangService.findAll());
            model.addAttribute("contentPage", "ban-hang/hien-thi.jsp");
            return "layout";
        } else {
            chiTietSanPhamService.update1(ct);
            List<HoaDonChiTiet> list = hoaDonChiTietService.getHoaDonChiTiet(hoaDonnn.getId());
            for (HoaDonChiTiet hd : list
            ) {
                total = total.add(hd.getDonGia());
            }
            System.out.println(total);
            model.addAttribute("tong", String.valueOf(total));
            model.addAttribute("listHoaDonChiTiet", list);
            List<HoaDon> listHD = hoaDonService.find();
            model.addAttribute("listHoaDon", listHD);
            model.addAttribute("hoaDon", hoaDonnn);
            model.addAttribute("listHang", hangSanPhamService.findAll());
            model.addAttribute("listMauSac", mauSacService.findAll());
            model.addAttribute("listChip", chipService.findAll());
            model.addAttribute("listRam", ramService.findAll());
            model.addAttribute("listRom", romService.findAll());
            model.addAttribute("dungLuongPin", dungLuongPinService.findAll());
            model.addAttribute("listManHinh", manHinhService.findAll());
            model.addAttribute("listCamera", cameraService.findAll());
            model.addAttribute("listChiTietSanPham", chiTietSanPhamService.findAll());
            model.addAttribute("listNhanVien", nhanVienService.findAll());
            model.addAttribute("listKhachHang", khachHangService.findAll());
            model.addAttribute("listDiaChi", diaChiService.findAll());
            model.addAttribute("listHangKhachHang",hangKhachHangService.findAll());
            model.addAttribute("contentPage", "ban-hang/hien-thi.jsp");
            return "layout";
        }
    }

    @GetMapping("/delete-hoa-don-chi-tiet/{id}")
    public String deleteHDCT(Model model, @PathVariable("id") UUID id,
                             @ModelAttribute("hoaDon") HoaDon hoaDon, @ModelAttribute("modalAddKhachHang") KhachHang khachHang) {
        HoaDonChiTiet hd = hoaDonChiTietService.findById(id);
        ChiTietSanPham ct = chiTietSanPhamService.getChiTiet(hd.getImei().getId());
        ct.setSoLuong(ct.getSoLuong() + 1);
        long millis = System.currentTimeMillis();
        Date date = new java.sql.Date(millis);
        ct.setNgayTao(date);
        if (ct.getSoLuong() > 0) {
            ct.setTinhTrang(1);
        }
        chiTietSanPhamService.update1(ct);
        imeiService.updatImei1(date, id);
        hoaDonChiTietService.delete(id);
        List<HoaDonChiTiet> list = hoaDonChiTietService.getHoaDonChiTiet(hoaDonnn.getId());
        for (HoaDonChiTiet hdd : list
        ) {
            total = total.add(hdd.getDonGia());
        }
        model.addAttribute("tong", String.valueOf(total));
        model.addAttribute("listHoaDonChiTiet", list);
        model.addAttribute("hoaDon", hoaDonnn);
        List<HoaDon> listHD = hoaDonService.find();
        model.addAttribute("listHoaDon", listHD);
        model.addAttribute("listHang", hangSanPhamService.findAll());
        model.addAttribute("listMauSac", mauSacService.findAll());
        model.addAttribute("listChip", chipService.findAll());
        model.addAttribute("listRam", ramService.findAll());
        model.addAttribute("listRom", romService.findAll());
        model.addAttribute("dungLuongPin", dungLuongPinService.findAll());
        model.addAttribute("listManHinh", manHinhService.findAll());
        model.addAttribute("listCamera", cameraService.findAll());
        model.addAttribute("listChiTietSanPham", chiTietSanPhamService.findAll());
        model.addAttribute("listNhanVien", nhanVienService.findAll());
        model.addAttribute("listKhachHang", khachHangService.findAll());
        model.addAttribute("listDiaChi", diaChiService.findAll());
        model.addAttribute("listHangKhachHang",hangKhachHangService.findAll());
        model.addAttribute("contentPage", "ban-hang/hien-thi.jsp");
        return "layout";
    }

    @PostMapping("/thanh-toan/{id}")
    public String thanhToan(Model model, @ModelAttribute("hoaDon") HoaDon hoaDon, @PathVariable("id") UUID id, @ModelAttribute("modalAddKhachHang") KhachHang khachHang) {
//        if(hoaDon.getMa().isEmpty()){
//            model.addAttribute("thongBaoThanhToan","Chưa chọn hóa đơn");
//            model.addAttribute("hoaDon", hoaDonnn);
//            List<HoaDon> listHD = hoaDonService.find();
//            model.addAttribute("listHoaDon", listHD);
//            return "ban-hang/hien-thi";
//        }
        HoaDon hd = hoaDonService.findById(id);
        hd.setKhachHang(hoaDon.getKhachHang());
        hd.setDiaChi(hoaDon.getDiaChi());
        hd.setNhanVien(hoaDon.getNhanVien());
        hd.setTongTien(hoaDon.getTongTien());
        hd.setQuyDoi(hoaDon.getQuyDoi());
        hd.setSdt(hoaDon.getSdt());
        long millis = System.currentTimeMillis();
        Date date = new java.sql.Date(millis);
        hd.setNgayCapNhat(date);
        hd.setNgayNhan(date);
        hd.setNgayShip(date);
        hd.setGhiChu(hoaDon.getGhiChu());
        hd.setTinhTrang(1);
        hoaDonService.thanhToan(hd);
        return "redirect:/ban-hang/hien-thi";
    }

    @PostMapping("/loc")
    public String loc(Model model, @RequestParam(value = "hang", required = false) UUID hang, @RequestParam(value = "ram", required = false) UUID ram,
                      @RequestParam(value = "rom", required = false) UUID rom, @RequestParam(value = "dungLuongPin", required = false) UUID dungLuongPin,
                      @RequestParam(value = "chip", required = false) UUID chip,
                      @RequestParam(value = "manHinh", required = false) UUID moTaMan,
                      @RequestParam(value = "camera", required = false) UUID moTaCam,
                      @ModelAttribute("hoaDon") HoaDon hoaDon, @ModelAttribute("modalAddKhachHang") KhachHang khachHang) {
        List<ChiTietSanPham> list = chiTietSanPhamService.loc(hang, ram, rom, dungLuongPin, chip, moTaMan, moTaCam);
        model.addAttribute("listChiTietSanPham", list);
        model.addAttribute("listHoaDon", hoaDonService.find());
        model.addAttribute("listHang", hangSanPhamService.findAll());
        model.addAttribute("listMauSac", mauSacService.findAll());
        model.addAttribute("listChip", chipService.findAll());
        model.addAttribute("listRam", ramService.findAll());
        model.addAttribute("listRom", romService.findAll());
        model.addAttribute("dungLuongPin", dungLuongPinService.findAll());
        model.addAttribute("listManHinh", manHinhService.findAll());
        model.addAttribute("listCamera", cameraService.findAll());
        model.addAttribute("listNhanVien", nhanVienService.findAll());
        model.addAttribute("listKhachHang", khachHangService.findAll());
        model.addAttribute("listDiaChi", diaChiService.findAll());
        model.addAttribute("listHangKhachHang",hangKhachHangService.findAll());
        model.addAttribute("contentPage", "ban-hang/hien-thi.jsp");
        return "layout";
    }

    @GetMapping("modal-khach-hang")
    public String modalKhachHang(Model model,@ModelAttribute("hoaDon") HoaDon hoaDon, @ModelAttribute("modalAddKhachHang") KhachHang khachHang){
        model.addAttribute("listHangKhachHang",hangKhachHangService.findAll());
        model.addAttribute("contentPage", "ban-hang/hien-thi.jsp");
        return "layout";
    }
    @PostMapping("add-khach-hang")
    public String addKhachHang(Model model,@ModelAttribute("hoaDon") HoaDon hoaDon, @ModelAttribute("modalAddKhachHang") KhachHang khachHang){
        khachHang.setMa("KH"+ String.valueOf(khachHangService.findAll().size())+1);
        khachHang.setNgayTao(Date.valueOf(LocalDate.now()));
        khachHang.setTinhTrang(1);
        khachHangService.add(khachHang);
        return "redirect:/ban-hang/hien-thi";
    }
}
