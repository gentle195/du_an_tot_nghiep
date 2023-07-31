package com.example.demo.controllers;

import com.example.demo.models.DiaChi;
import com.example.demo.models.HangKhachHang;
import com.example.demo.models.KhachHang;
import com.example.demo.services.DiaChiService;
import com.example.demo.services.KhachHangService;
import jakarta.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import java.sql.Date;
import java.util.UUID;

@Controller
@RequestMapping("/dia-chi")
public class DiaChiController {
    @Autowired
    DiaChiService diaChiService;
    @Autowired
    KhachHangService khachHangService;


    @GetMapping("/hien-thi")
    public String hienThi(
            Model model,
            @ModelAttribute("dc") DiaChi diaChi,
            @ModelAttribute("hangKhachHang") HangKhachHang hangKhachHang,
            @ModelAttribute("khachHang") HangKhachHang khachHang

    ) {
        diaChi.setTinhTrang(0);
        model.addAttribute("dulieu", diaChiService.getAll0());
        model.addAttribute("kh", khachHangService.getALL0());
        model.addAttribute("tong", diaChiService.getAll0().size());
        return "dia-chi/dia-chi";
    }


    @GetMapping("/remove/{id}")
    public String remove(Model model,
                         @PathVariable("id") UUID id
    ) {


        DiaChi diaChi = diaChiService.findById(id);
        diaChi.setTinhTrang(1);
        diaChiService.add(diaChi);
        return "redirect:/dia-chi/hien-thi";
    }

    @GetMapping("/view-update/{id}")
    public String viewUpdate(Model model,
                             @PathVariable("id") UUID id,
                             @ModelAttribute("dc") DiaChi diaChi

    ) {
        model.addAttribute("dc", diaChiService.findById(id));
        model.addAttribute("kh", khachHangService.getALL0());
        return "dia-chi/dia-chi-update";
    }


    @PostMapping("/update")
    public String updateDongSP(Model model,
                               @ModelAttribute("dc") @Valid DiaChi diaChi
            , BindingResult bindingResult
    ) {

        if (bindingResult.hasErrors()) {

            return "dia-chi/dia-chi-update";
        }


        long millis = System.currentTimeMillis();
        java.sql.Date date = new java.sql.Date(millis);
        diaChi.setNgayCapNhat(date);

        diaChiService.add(diaChi);

        return "redirect:/dia-chi/hien-thi";
    }


    @PostMapping("/add")
    public String updateadd(Model model,
                            @ModelAttribute("dc") @Valid DiaChi diaChi
//                            @ModelAttribute("hangKhachHang")@Valid HangKhachHang hangKhachHang,
//                            @ModelAttribute("KhachHang")@Valid KhachHang khachHang


            , BindingResult bindingResult
    ) {
        long millis = System.currentTimeMillis();
        Date date = new java.sql.Date(millis);

        if (bindingResult.hasErrors()) {
            model.addAttribute("dulieu", diaChiService.getAll0());
            model.addAttribute("kh", khachHangService.getALL0());
            return "dia-chi/dia-chi";
        }

        Integer sl = khachHangService.findAll().size() + 1;

        String mhd = "MDC" + sl;
        diaChi.setMa(mhd);
        diaChi.setNgayTao(date);
        diaChi.setNgayCapNhat(date);
        diaChi.setTinhTrang(0);
        diaChiService.add(diaChi);
        return "redirect:/dia-chi/hien-thi";
    }
}
