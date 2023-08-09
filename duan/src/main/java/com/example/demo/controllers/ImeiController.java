package com.example.demo.controllers;

import com.example.demo.models.ChiTietSanPham;
import com.example.demo.models.IMEI;
import com.example.demo.services.ChiTietSanPhamService;
import com.example.demo.services.IMEIService;
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

    @GetMapping("/hien-thi")
    public String hienThi(Model model, @RequestParam(value = "pageNum") Optional<Integer> pageNum) {
        Pageable pageable = PageRequest.of(pageNum.orElse(0), 5);
        Sort sort = Sort.by("ngayTao").descending();

        Page<IMEI> imeiPage = imeiService.getAll(pageable);
        model.addAttribute("total", imeiPage.getTotalPages());
        model.addAttribute("listImei", imeiPage.getContent());
        model.addAttribute("size", imeiPage.getSize());
        model.addAttribute("size", imeiPage.getSize());
        model.addAttribute("contentPage", "imei/index.jsp");


        return "layout";

    }

    @GetMapping("/add")
    public String viewAd(Model model, @ModelAttribute("imei") IMEI imei) {
        model.addAttribute("listCTSP", chiTietSanPhamService.findAll());
        model.addAttribute("imei", new IMEI());
        String ma = "IMEI"+ imeiService.findAll().size();
        model.addAttribute("ma", ma);
        return "imei/add-imei";
    }

    @PostMapping("/add")
    public String add(@Valid @ModelAttribute(name = "imei") IMEI imei,
                      BindingResult result, Model model) {
        if (result.hasErrors()) {
            model.addAttribute("listCTSP", chiTietSanPhamService.findAll());
            return "imei/add-imei";
        }
        String ma = "IMEI"+ imeiService.findAll().size();
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

    @GetMapping("/view-update/{id}")
    public String viewUpdate(Model model, @PathVariable("id") UUID id, @ModelAttribute("imeiupdate") IMEI imei) {
        model.addAttribute("listCTSP", chiTietSanPhamService.findAll());
        IMEI imei1 = imeiService.findById(id);
        model.addAttribute("imeiupdate", imei1);
        return "imei/update-imei";

    }

    @PostMapping("/update/{id}")
    public String update(Model model,  @PathVariable("id") UUID id,@Valid @ModelAttribute("imeiupdate") IMEI imei,
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
        imeiService.update(id,imei1);
        return "redirect:/imei/hien-thi";


    }

}
