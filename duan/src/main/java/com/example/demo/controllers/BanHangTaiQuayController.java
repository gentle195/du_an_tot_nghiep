package com.example.demo.controllers;

import com.example.demo.models.ChiTietSanPham;
import com.example.demo.models.DiaChi;
import com.example.demo.models.HoaDon;
import com.example.demo.models.HoaDonChiTiet;
import com.example.demo.models.IMEI;
import com.example.demo.models.KhachHang;
import com.example.demo.models.NhanVien;
import com.example.demo.services.ChiTietSanPhamService;
import com.example.demo.services.DiaChiService;
import com.example.demo.services.HoaDonChiTietService;
import com.example.demo.services.HoaDonService;
import com.example.demo.services.IMEIService;
import com.example.demo.services.KhachHangService;
import com.example.demo.services.NhanVienService;
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

    private HoaDon hoaDonnn = new HoaDon();

    @GetMapping("hien-thi")
    public String hienThi(Model model, @ModelAttribute("hoaDon") HoaDon hoaDon) {
        List<HoaDon> list = hoaDonService.find();
        model.addAttribute("listHoaDon", list);
        return "ban-hang/hien-thi";
    }

    @ModelAttribute("listChiTietSanPham")
    public List<ChiTietSanPham> chiTietSanPham(Model model) {
        return chiTietSanPhamService.findAll();
    }

    @ModelAttribute("listNhanVien")
    public List<NhanVien> nhanVien(Model model) {
        return nhanVienService.findAll();
    }

    @ModelAttribute("listKhachHang")
    public List<KhachHang> khachHang(Model model) {
        return khachHangService.findAll();
    }

    @ModelAttribute("listDiaChi")
    public List<DiaChi> diaChi(Model model) {
        return diaChiService.findAll();
    }

    @PostMapping("/add-hoa-don")
    public String addHoaDon(Model model, @ModelAttribute("hoaDon") HoaDon hoaDon) {
        HoaDon hd = new HoaDon();
        hd.setMa("HD" + String.valueOf(hoaDonService.findAll().size() + 1));
        hd.setTinhTrang(0);
        hd.setNgayTao(Date.valueOf(LocalDate.now()));
        hoaDonService.add(hd);
        hoaDonnn = hd;
        model.addAttribute("hoaDon", hoaDonnn);
        return "redirect:/ban-hang/hien-thi";
    }

    @GetMapping("/thong-tin-hoa-don/{id}")
    public String thongTin(Model model, @ModelAttribute("hoaDon") HoaDon hoaDon, @PathVariable("id") UUID id) {
        HoaDon hd = hoaDonService.findById(id);
        model.addAttribute("hoaDon", hd);
        hoaDonnn = hd;
        List<HoaDon> list = hoaDonService.findAll();
        model.addAttribute("listHoaDon", list);
        List<HoaDonChiTiet> listHDCT = hoaDonChiTietService.getHoaDonChiTiet(hd.getId());
        model.addAttribute("listHoaDonChiTiet", listHDCT);
        return "ban-hang/hien-thi";
    }

    @ResponseBody
    @GetMapping("/them-san-pham/{id}")
    public List<IMEI> themSanPham(Model model, @ModelAttribute("hoaDon") HoaDon hoaDon,
                                  @PathVariable("id") UUID id) {
        if (hoaDonnn.getMa() == null) {
            model.addAttribute("thongBao", "Chưa chọn hóa đơn");
            List<HoaDon> list = hoaDonService.findAll();
            model.addAttribute("listHoaDon", list);
        }
        model.addAttribute("hoaDon", hoaDonnn);
        List<IMEI> list = imeiService.getIMEI(id);
        return list;

    }

    @GetMapping("/thay-doi-trang-thai/{id}")
    public String updateTrangThai(Model model, @ModelAttribute("hoaDon") HoaDon hoaDon, @PathVariable("id") UUID id) {
        HoaDon hd = hoaDonService.findById(id);
        LocalDate ngayCapNhat = LocalDate.now();
        if (hd.getTinhTrang() == 0) {
            hoaDonService.update(id, 1, Date.valueOf(ngayCapNhat));
            return "redirect:/ban-hang/hien-thi";
        } else {
            hoaDonService.update(id, 0, Date.valueOf(ngayCapNhat));
            return "redirect:/ban-hang/hien-thi";
        }
    }

    @PostMapping("search-san-pham")
    public String search(Model model, @RequestParam("search-san-pham") String search,
                         @ModelAttribute("hoaDon") HoaDon hoaDon
    ) {
        if (search.isEmpty()) {
            model.addAttribute("thongBao", "Không để trống thông tin");
            List<HoaDon> list = hoaDonService.findAll();
            model.addAttribute("listHoaDon", list);
            return "ban-hang/hien-thi";
        } else {
            List<ChiTietSanPham> listCT = chiTietSanPhamService.search(search);
            model.addAttribute("listChiTietSanPham", listCT);
            List<HoaDon> list = hoaDonService.findAll();
            model.addAttribute("listHoaDon", list);
            return "ban-hang/hien-thi";
        }
    }

    @ResponseBody
    @GetMapping("search-imei")
    public List<IMEI> searchIMEI(Model model, @RequestParam("search-imei") String search,
                           @ModelAttribute("hoaDon") HoaDon hoaDon) {
//        if (search.isEmpty()) {
//            model.addAttribute("thongBaoIMEI", "Không để trống thông tin");
//            model.addAttribute("hoaDon", hoaDonnn);
//            List<HoaDon> list = hoaDonService.findAll();
//            model.addAttribute("listHoaDon", list);
//            return l;
//        } else {}
        List<IMEI> listIMEI = imeiService.search(search);
        System.out.println(listIMEI);
        model.addAttribute("hoaDon", hoaDonnn);
        model.addAttribute("listImei", listIMEI);
        List<HoaDon> list = hoaDonService.findAll();
        model.addAttribute("listHoaDon", list);
        return listIMEI;

    }

    @GetMapping("/them-imei/{id}")
    public String addIMEI(Model model, @PathVariable("id") UUID id,
                          @ModelAttribute("hoaDon") HoaDon hoaDon) {
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
            List<HoaDon> listHD = hoaDonService.findAll();
            model.addAttribute("listHoaDon", listHD);
            model.addAttribute("hoaDon", hoaDonnn);
            return "ban-hang/hien-thi";
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
            List<HoaDon> listHD = hoaDonService.findAll();
            model.addAttribute("listHoaDon", listHD);
            model.addAttribute("hoaDon", hoaDonnn);
            return "ban-hang/hien-thi";
        }
    }

    @GetMapping("/delete-hoa-don-chi-tiet/{id}")
    public String deleteHDCT(Model model, @PathVariable("id") UUID id,
                             @ModelAttribute("hoaDon") HoaDon hoaDon) {
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
        hoaDonChiTietService.delete(id);
        BigDecimal total = BigDecimal.ZERO;
        List<HoaDonChiTiet> list = hoaDonChiTietService.getHoaDonChiTiet(hoaDonnn.getId());
        for (HoaDonChiTiet hdd : list
        ) {
            total = total.add(hdd.getDonGia());
        }
        System.out.println(total);
        model.addAttribute("tong", String.valueOf(total));
        model.addAttribute("listHoaDonChiTiet", list);
        model.addAttribute("hoaDon", hoaDonnn);
        List<HoaDon> listHD = hoaDonService.findAll();
        model.addAttribute("listHoaDon", listHD);
        return "ban-hang/hien-thi";
    }

    @PostMapping("/thanh-toan/{id}")
    public String thanhToan(Model model,@ModelAttribute("hoaDon") HoaDon hoaDon,@PathVariable("id") UUID id){
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
        imeiService.updatImei(date,id);
        return "ban-hang/hien-thi";
    }
}
