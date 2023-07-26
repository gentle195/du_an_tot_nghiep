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
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.sql.Date;
import java.time.LocalDate;
import java.util.List;
import java.util.Optional;
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

    @GetMapping("hien-thi")
    public String hienThi(Model model, @RequestParam("num") Optional<Integer> num,
                          @RequestParam(name = "size", defaultValue = "10", required = false) Integer size,
                          @ModelAttribute("hoaDon") HoaDon hoaDon) {
//        Sort sort = Sort.by("ngayTao").ascending();
        Pageable pageable = PageRequest.of(num.orElse(0), size);
        Page<HoaDon> list = hoaDonService.getAll(pageable);
        model.addAttribute("listHoaDon", list.getContent());
        model.addAttribute("total", list.getTotalPages());
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
    public String addHoaDon(Model model, @RequestParam("num") Optional<Integer> num,
                            @RequestParam(name = "size", defaultValue = "5", required = false) Integer size
            , @ModelAttribute("hoaDon") HoaDon hoaDon) {
        HoaDon hd = new HoaDon();
        hd.setMa("HD" + String.valueOf(hoaDonService.findAll().size() + 1));
        hd.setTinhTrang(0);
        hd.setNgayTao(Date.valueOf(LocalDate.now()));
        hoaDonService.add(hd);
        Pageable pageable = PageRequest.of(num.orElse(0), size);
        Page<HoaDon> list = hoaDonService.getAll(pageable);
        model.addAttribute("listHoaDon", list.getContent());
        model.addAttribute("total", list.getTotalPages());
        return "redirect:/ban-hang/hien-thi";
    }

    @GetMapping("/thong-tin-hoa-don/{id}")
    public String thongTin(Model model, @RequestParam("num") Optional<Integer> num,
                           @RequestParam(name = "size", defaultValue = "5", required = false) Integer size
            , @ModelAttribute("hoaDon") HoaDon hoaDon, @PathVariable("id") UUID id) {
        HoaDon hd = hoaDonService.findById(id);
        model.addAttribute("hoaDon", hd);
        Pageable pageable = PageRequest.of(num.orElse(0), size);
        Page<HoaDon> list = hoaDonService.getAll(pageable);
        model.addAttribute("listHoaDon", list.getContent());
        model.addAttribute("total", list.getTotalPages());

//        Pageable pageablee = PageRequest.of(num.orElse(0), size);
//        Page<HoaDonChiTiet> listHDCT = hoaDonChiTietService.getHoaDonChiTiet(pageablee, id);
//        model.addAttribute("listHoaDonChiTiet", listHDCT.getContent());
//        model.addAttribute("totalHDCT", listHDCT.getTotalPages());
        return "ban-hang/hien-thi";
    }

    @GetMapping("/them-san-pham/{id}")
    public String themSanPham(Model model, @ModelAttribute("hoaDon") HoaDon hoaDon,
                              @RequestParam("num") Optional<Integer> num, @RequestParam(name = "size", defaultValue = "20", required = false) Integer size
            , @PathVariable("id") UUID id) {
        System.out.println("Đã truy cập vào");
        Pageable pageable = PageRequest.of(num.orElse(0), size);
        Page<IMEI> list = imeiService.getAll(pageable);
        model.addAttribute("listImei", list.getContent());
        model.addAttribute("total", list.getTotalPages());
        return "ban-hang/hien-thi";
    }

    @GetMapping("/thay-doi-trang-thai/{id}")
    public String updateTrangThai(Model model, @RequestParam("num") Optional<Integer> num,
                                  @RequestParam(name = "size", defaultValue = "5", required = false) Integer size,
                                  @ModelAttribute("hoaDon") HoaDon hoaDon, @PathVariable("id") UUID id) {
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
                         @ModelAttribute("hoaDon") HoaDon hoaDon,
                         @RequestParam("num") Optional<Integer> num,
                         @RequestParam(name = "size", defaultValue = "10", required = false) Integer size) {
        if (search.isEmpty()) {
            model.addAttribute("thongBao", "Không để trống thông tin");
            Pageable pageable = PageRequest.of(num.orElse(0), size);
            Page<HoaDon> list = hoaDonService.getAll(pageable);
            model.addAttribute("listHoaDon", list.getContent());
            model.addAttribute("total", list.getTotalPages());
            return "ban-hang/hien-thi";
        } else {
            List<ChiTietSanPham> listCT = chiTietSanPhamService.search(search);
            model.addAttribute("listChiTietSanPham", listCT);
            Pageable pageable = PageRequest.of(num.orElse(0), size);
            Page<HoaDon> list = hoaDonService.getAll(pageable);
            model.addAttribute("listHoaDon", list.getContent());
            model.addAttribute("total", list.getTotalPages());
            return "ban-hang/hien-thi";
        }
    }

    @PostMapping("search-imei")
    public String searchIMEI(Model model, @RequestParam("search-imei") String search,
                             @ModelAttribute("hoaDon") HoaDon hoaDon,
                             @RequestParam("num") Optional<Integer> num,
                             @RequestParam(name = "size", defaultValue = "10", required = false) Integer size) {
        if (search.isEmpty()) {
            model.addAttribute("thongBaoIMEI", "Không để trống thông tin");
            Pageable pageable = PageRequest.of(num.orElse(0), size);
            Page<HoaDon> list = hoaDonService.getAll(pageable);
            model.addAttribute("listHoaDon", list.getContent());
            model.addAttribute("total", list.getTotalPages());
            return "ban-hang/hien-thi";
        } else {
            List<IMEI> listIMEI = imeiService.search(search);
            model.addAttribute("listImei", listIMEI);
            Pageable pageable = PageRequest.of(num.orElse(0), size);
            Page<HoaDon> list = hoaDonService.getAll(pageable);
            model.addAttribute("listHoaDon", list.getContent());
            model.addAttribute("total", list.getTotalPages());
            return "ban-hang/hien-thi";
        }
    }

    @GetMapping("/them-imei/{id}")
    public String addIMEI(Model model, @PathVariable("id") UUID id,
                          @ModelAttribute("hoaDon") HoaDon hoaDon,
                          @RequestParam("num") Optional<Integer> num,
                          @RequestParam(name = "size", defaultValue = "10", required = false) Integer size) {
        IMEI imei = imeiService.findById(id);
        HoaDonChiTiet hdct = new HoaDonChiTiet();
        hdct.setImei(imei);
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
            List<HoaDonChiTiet> list = hoaDonChiTietService.findAll();
            model.addAttribute("listHoaDonChiTiet", list);
            Pageable pageable = PageRequest.of(num.orElse(0), size);
            Page<HoaDon> listt = hoaDonService.getAll(pageable);
            model.addAttribute("listHoaDon", listt.getContent());
            model.addAttribute("total", listt.getTotalPages());
            return "ban-hang/hien-thi";
        } else {
            chiTietSanPhamService.update1(ct);
            List<HoaDonChiTiet> list = hoaDonChiTietService.findAll();
            model.addAttribute("listHoaDonChiTiet", list);
            Pageable pageable = PageRequest.of(num.orElse(0), size);
            Page<HoaDon> listt = hoaDonService.getAll(pageable);
            model.addAttribute("listHoaDon", listt.getContent());
            model.addAttribute("total", listt.getTotalPages());
            return "ban-hang/hien-thi";
        }
    }

    @GetMapping("/delete-hoa-don-chi-tiet/{id}")
    public String deleteHDCT(Model model, @PathVariable("id") UUID id,
                             @ModelAttribute("hoaDon") HoaDon hoaDon,
                             @RequestParam("num") Optional<Integer> num,
                             @RequestParam(name = "size", defaultValue = "10", required = false) Integer size) {
        hoaDonChiTietService.delete(id);
        ChiTietSanPham ct = chiTietSanPhamService.getChiTiet2(id);
        System.out.println(ct);
//        ct.setSoLuong(ct.getSoLuong() + 1);
//        long millis = System.currentTimeMillis();
//        Date date = new java.sql.Date(millis);
//        ct.setNgayTao(date);
//        if (ct.getSoLuong() > 0) {
//            ct.setTinhTrang(1);
//        }
//        chiTietSanPhamService.update1(ct);
        List<HoaDonChiTiet> list = hoaDonChiTietService.findAll();
        model.addAttribute("listHoaDonChiTiet", list);
        Pageable pageable = PageRequest.of(num.orElse(0), size);
        Page<HoaDon> listt = hoaDonService.getAll(pageable);
        model.addAttribute("listHoaDon", listt.getContent());
        model.addAttribute("total", listt.getTotalPages());
        return "ban-hang/hien-thi";
    }
}
