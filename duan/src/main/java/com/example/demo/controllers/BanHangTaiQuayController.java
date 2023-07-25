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
                          @RequestParam(name = "size", defaultValue = "5", required = false) Integer size,
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
                              @RequestParam("num") Optional<Integer> num,@RequestParam(name = "size", defaultValue = "20", required = false) Integer size
            , @PathVariable("id") UUID id) {
        Pageable pageable = PageRequest.of(num.orElse(0), size);
        Page<IMEI> list = imeiService.getAll(pageable);
        model.addAttribute("listImei", list.getContent());
        System.out.println(list.getContent());
        model.addAttribute("total", list.getTotalPages());
        return "ban-hang/hien-thi";
    }
}
