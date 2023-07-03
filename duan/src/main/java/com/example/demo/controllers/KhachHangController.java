package com.example.demo.controllers;

import com.example.demo.models.KhachHang;
import com.example.demo.services.HangKhachHangService;
import com.example.demo.services.KhachHangService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.UUID;

@Controller
@RequestMapping("/khach-hang")
public class KhachHangController {


    @Autowired
    KhachHangService khachHangService;
    @Autowired
    HangKhachHangService hangKhachHangService;


    @GetMapping("/hien-thi")
    public String hienThi(
            Model model,
            @ModelAttribute("kh") KhachHang khachHang


    ) {
        khachHang.setTinhTrang(0);
        khachHang.setGioiTinh(true);


        model.addAttribute("dulieu", khachHangService.getAllKH());
        model.addAttribute("hkh",hangKhachHangService.getAllHKH());
        return "khach-hang/khach-hang";
    }


    @GetMapping("/remove/{id}")

    public String remove(Model model,
                         @PathVariable("id") UUID id

    ) {
        khachHangService.remove(id);
        return "redirect:/khach-hang/hien-thi";
    }


    @GetMapping("/view-update/{id}")

    public String viewUpdate(Model model,
                             @PathVariable("id") UUID id,
                             @ModelAttribute("kh")KhachHang khachHang

    ) {
        khachHang.setTinhTrang(0);
        khachHang.setGioiTinh(true);
        model.addAttribute("kh", khachHangService.getOne(id));
        model.addAttribute("hkh",hangKhachHangService.getAllHKH());
        return "khach-hang/khach-hang-update";
    }


    @PostMapping("/update")
    public String updateDongSP(Model model,

                               @ModelAttribute("kh")KhachHang khachHang
    ) {



        khachHangService.addOrUpdate(khachHang);

        return "redirect:/khach-hang/hien-thi";
    }





    @PostMapping("/add")
    public String updateadd(Model model,
                            @ModelAttribute("kh") KhachHang khachHang
    ) {


        khachHangService.addOrUpdate(khachHang);
        return "redirect:/khach-hang/hien-thi";
    }

}