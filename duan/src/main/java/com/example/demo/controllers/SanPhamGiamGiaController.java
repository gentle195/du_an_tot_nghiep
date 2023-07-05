package com.example.demo.controllers;

import com.example.demo.models.IMEI;
import com.example.demo.models.SanPhamGiamGia;
import com.example.demo.services.ChiTietSanPhamService;
import com.example.demo.services.KhuyenMaiService;
import com.example.demo.services.SanPhamGiamGiaService;
import jakarta.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
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
import java.util.UUID;

@Controller
@RequestMapping("/san-pham-giam-gia")
public class SanPhamGiamGiaController {
    @Autowired
    ChiTietSanPhamService chiTietSanPhamService;

    @Autowired
    KhuyenMaiService khuyenMaiService;
    @Autowired
    SanPhamGiamGiaService sanPhamGiamGiaService;
    @GetMapping("/hien-thi")
    public String hienThi(Model model, @RequestParam(value = "page", defaultValue = "0", required = false) Integer pageNum) {
        Pageable pageable = PageRequest.of(pageNum, 5);

        Page<SanPhamGiamGia> sanPhamGG = sanPhamGiamGiaService.getAll(pageable);

        model.addAttribute("total", sanPhamGG.getTotalPages() - 1);
        model.addAttribute("listImei", sanPhamGG.getContent());
        model.addAttribute("size", sanPhamGG.getSize());

        return "san-pham-giam-gia/index";

    }
    @GetMapping("/add")
    public String viewAd(Model model, @ModelAttribute("sanphamgiamgia") SanPhamGiamGia sanPhamGiamGia) {
        model.addAttribute("listCTSP", chiTietSanPhamService.findAll());
        model.addAttribute("listKM", khuyenMaiService.findAll());
        model.addAttribute("sanphamgiamgia", new SanPhamGiamGia());


        return "san-pham-giam-gia/add-san-pham-giam-gia";
    }

    @PostMapping("/add")
    public String add(@Valid @ModelAttribute(name = "sanphamgiamgia") SanPhamGiamGia sanPhamGiamGia,
                      BindingResult result, Model model) {
        if (result.hasErrors()) {

            model.addAttribute("listCTSP", chiTietSanPhamService.findAll());
            model.addAttribute("listKM", khuyenMaiService.findAll());
            return "san-pham-giam-gia/add-san-pham-giam-gia";
        }

       sanPhamGiamGiaService.add(sanPhamGiamGia);
        return "redirect:/san-pham-giam-gia/hien-thi";


    }

    @GetMapping("/remove/{id}")
    public String remove(@PathVariable("id") UUID id) {

        sanPhamGiamGiaService.delete(id);
        return "redirect:/san-pham-giam-gia/hien-thi";

    }

    @GetMapping("/update/{id}")
    public String viewUpdate(Model model, @PathVariable("id") UUID id, @ModelAttribute("sanphamgiamgiaupdate") SanPhamGiamGia sanPhamGiamGia) {
        model.addAttribute("listCTSP", chiTietSanPhamService.findAll());
        model.addAttribute("listKM", khuyenMaiService.findAll());
        SanPhamGiamGia sanPhamGiamGia1 = sanPhamGiamGiaService.findById(id);

        model.addAttribute("sanphamgiamgiaupdate", sanPhamGiamGia1);

        return "san-pham-giam-gia/update-san-pham-giam-gia";

    }

    @PostMapping("/update/{id}")
    public String update(Model model,  @PathVariable("id") UUID id, @Valid @ModelAttribute("sanphamgiamgiaupdate") SanPhamGiamGia sanPhamGiamGia,
                         BindingResult result) {
        if (result.hasErrors()) {
            model.addAttribute("listCTSP", chiTietSanPhamService.findAll());
            model.addAttribute("listKM",khuyenMaiService.findAll());

            return "san-pham-giam-gia/update-san-pham-giam-gia";
        }


        sanPhamGiamGiaService.update(id, sanPhamGiamGia);
        return "redirect:/san-pham-giam-gia/hien-thi";


    }
}
