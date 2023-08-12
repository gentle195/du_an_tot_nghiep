package com.example.demo.controllers;

import com.example.demo.models.ChiTietSanPham;
import com.example.demo.models.Chip;
import com.example.demo.models.IMEI;
import com.example.demo.models.MauSac;
import com.example.demo.models.Pin;
import com.example.demo.models.Ram;
import com.example.demo.models.Rom;
import com.example.demo.models.SanPham;
import com.example.demo.services.CameraService;
import com.example.demo.services.ChiTietSanPhamService;
import com.example.demo.services.ChipService;
import com.example.demo.services.DungLuongPinService;
import com.example.demo.services.HangSanPhamService;
import com.example.demo.services.IMEIService;
import com.example.demo.services.ManHinhService;
import com.example.demo.services.MauSacService;
import com.example.demo.services.PinService;
import com.example.demo.services.RamService;
import com.example.demo.services.RomService;
import com.example.demo.services.SanPhamService;
import jakarta.validation.Valid;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.sql.Date;
import java.time.LocalDate;
import java.util.Optional;
import java.util.UUID;

@Controller
@RequestMapping("/imei")
public class ImeiController {
    @Autowired
    IMEIService imeiService;
    @Autowired
    ChiTietSanPhamService chiTietSanPhamService;
    @Autowired
    SanPhamService sanPhamService;
    @Autowired
    MauSacService mauSacService;
    @Autowired
    ChipService chipService;
    @Autowired
    RamService ramService;
    @Autowired
    RomService romService;
    @Autowired
    PinService pinService;
    @Autowired
    HangSanPhamService hangSanPhamService;
    @Autowired
    DungLuongPinService dungLuongPinService;
    @Autowired
    ManHinhService manHinhService;
    @Autowired
    CameraService cameraService;

    @GetMapping("/hien-thi")
    public String hienThi(Model model, @RequestParam(value = "pageNum") Optional<Integer> pageNum, @ModelAttribute("imei") IMEI imei) {
        Pageable pageable = PageRequest.of(pageNum.orElse(0), 5);
        Sort sort = Sort.by("ngayTao").descending();

        Page<IMEI> imeiPage = imeiService.getAll(pageable);
        model.addAttribute("total", imeiPage.getTotalPages());
        model.addAttribute("listImei", imeiPage.getContent());
        model.addAttribute("size", imeiPage.getSize());
        model.addAttribute("size", imeiPage.getSize());
        model.addAttribute("contentPage", "imei/index.jsp");
        model.addAttribute("imei", new IMEI());
        String ma = "IMEI" + imeiService.findAll().size();
        model.addAttribute("listCTSP", chiTietSanPhamService.findAll());
        model.addAttribute("chitietsanpham", new ChiTietSanPham());
        model.addAttribute("listSanPham", sanPhamService.findAll());
        model.addAttribute("listMauSac", mauSacService.findAll());
        model.addAttribute("listChip", chipService.findAll());
        model.addAttribute("listRam", ramService.findAll());
        model.addAttribute("listRom", romService.findAll());
        model.addAttribute("listHang", hangSanPhamService.findAll());
        model.addAttribute("dungLuongPin", dungLuongPinService.findAll());
        model.addAttribute("listPin", pinService.findAll());
        model.addAttribute("listManHinh", manHinhService.findAll());
        model.addAttribute("listCamera", cameraService.findAll());
        model.addAttribute("Pin", new Pin());
        model.addAttribute("chip", new Chip());
        model.addAttribute("mauSac", new MauSac());
        model.addAttribute("ram", new Ram());
        model.addAttribute("rom", new Rom());
        model.addAttribute("sanPham", new SanPham());


        model.addAttribute("ma", ma);


        return "layout";

    }

    @GetMapping("/add")
    public String viewAd(Model model, @ModelAttribute("imei") IMEI imei) {
        model.addAttribute("listCTSP", chiTietSanPhamService.findAll());
        model.addAttribute("imei", new IMEI());
        String ma = "IMEI" + imeiService.findAll().size();
        model.addAttribute("ma", ma);
        return "imei/add-imei";
    }

    @PostMapping("/add")
    public String add(@Valid @ModelAttribute(name = "imei") IMEI imei,
                      BindingResult result, Model model, @RequestParam(value = "pageNum") Optional<Integer> pageNum) {
        if (result.hasErrors()) {
            Pageable pageable = PageRequest.of(pageNum.orElse(0), 5);
            Sort sort = Sort.by("ngayTao").descending();

            Page<IMEI> imeiPage = imeiService.getAll(pageable);
            model.addAttribute("total", imeiPage.getTotalPages());
            model.addAttribute("listImei", imeiPage.getContent());
            model.addAttribute("size", imeiPage.getSize());
            model.addAttribute("size", imeiPage.getSize());
            model.addAttribute("contentPage", "imei/index.jsp");
            model.addAttribute("imei", new IMEI());
            model.addAttribute("chitietsanpham", new ChiTietSanPham());
            String ma = "IMEI" + imeiService.findAll().size();
            model.addAttribute("listCTSP", chiTietSanPhamService.findAll());

            model.addAttribute("ma", ma);


            return "layout";
        }
        String ma = "IMEI" + imeiService.findAll().size();
        imei.setMa(ma);
        LocalDate localDate = LocalDate.now();
        imei.setNgayTao(Date.valueOf(localDate));
        imeiService.add(imei);
        return "redirect:/imei/hien-thi";


    }

    @GetMapping("/remove/{id}")
    public String remove(@PathVariable("id") UUID id) {
        imeiService.delete(id);
        return "redirect:/imei/hien-thi";
    }
//    @PostMapping("/chi-tiet-san-pham/modal-add-san-pham")
//    public String addCTSP(@Valid @ModelAttribute(name = "chitietsanpham") ChiTietSanPham chiTietSanPham,
//                      BindingResult result, Model model, @RequestParam("pageNum") Optional<Integer> pageNum,
//                      @RequestParam(name = "pageSize", required = false, defaultValue = "5") Integer pageSize) {
//        Sort sort = Sort.by("ngayTao").ascending();
//        Pageable pageable = PageRequest.of(pageNum.orElse(0), pageSize, sort);
//        Page<ChiTietSanPham> page = chiTietSanPhamService.getAll(pageable);
//        if (result.hasErrors()) {
//            model.addAttribute("total", page.getTotalPages());
//            model.addAttribute("list", page.getContent());
//            model.addAttribute("size", page.getSize());
//            model.addAttribute("listSanPham", sanPhamService.findAll());
//            model.addAttribute("listMauSac", mauSacService.findAll());
//            model.addAttribute("listChip", chipService.findAll());
//            model.addAttribute("listRam", ramService.findAll());
//            model.addAttribute("listRom", romService.findAll());
//            model.addAttribute("listHang", hangSanPhamService.findAll());
//            model.addAttribute("dungLuongPin", dungLuongPinService.findAll());
//            model.addAttribute("listPin", pinService.findAll());
//            model.addAttribute("listManHinh", manHinhService.findAll());
//            model.addAttribute("listCamera", cameraService.findAll());
//            model.addAttribute("contentPage", "chi-tiet-san-pham/index.jsp");
//            model.addAttribute("page", page.getNumber());
//            return "layout";
//        }
//        LocalDate localDate = LocalDate.now();
//        chiTietSanPham.setNgayTao(Date.valueOf(localDate));
//        chiTietSanPham.setTinhTrang(1);
//        chiTietSanPhamService.add(chiTietSanPham);
//        return "redirect:/imei/hien-thi";
//
//
//    }

    @GetMapping("/view-update/{id}")
    public String viewUpdate(Model model, @PathVariable("id") UUID id, @ModelAttribute("imeiupdate") IMEI imei) {
        model.addAttribute("listCTSP", chiTietSanPhamService.findAll());
        IMEI imei1 = imeiService.findById(id);
        model.addAttribute("imeiupdate", imei1);
        return "imei/update-imei";

    }

    @PostMapping("/update/{id}")
    public String update(Model model, @PathVariable("id") UUID id, @Valid @ModelAttribute("imeiupdate") IMEI imei,
                         BindingResult result) {
        if (result.hasErrors()) {
            model.addAttribute("listCTSP", chiTietSanPhamService.findAll());
            return "imei/update-imei";
        }
        IMEI imei1 = imeiService.findById(id);
        imei1.setMa(imei.getMa());
        imei1.setNgayTao(imei.getNgayTao());
        imei1.setChiTietSanPham(imei.getChiTietSanPham());
        imei1.setSoImei(imei.getSoImei());
        imei1.setMoTa(imei.getMoTa());
        LocalDate localDate = LocalDate.now();
        imei1.setNgayCapNhat(Date.valueOf(localDate));
        imei1.setNgayTao(imei.getNgayTao());
        imei1.setTinhTrang(imei.getTinhTrang());
        imeiService.update(id, imei1);
        return "redirect:/imei/hien-thi";


    }

}
