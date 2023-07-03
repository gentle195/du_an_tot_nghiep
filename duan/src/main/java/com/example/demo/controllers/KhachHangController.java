package com.example.demo.controllers;

import com.example.demo.models.HangKhachHang;
import com.example.demo.models.KhachHang;
import com.example.demo.services.HangKhachHangService;
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


        khachHang.setGioiTinh(true);


        model.addAttribute("dulieu", khachHangService.getALL0());
        model.addAttribute("hkh",hangKhachHangService.getALL0());
        model.addAttribute("tong", khachHangService.getALL0().size());
        return "khach-hang/khach-hang";
    }


    @GetMapping("/remove/{id}")

    public String remove(Model model,
                         @PathVariable("id") UUID id

    ) {
        KhachHang khachHang=khachHangService.findById(id);
        khachHang.setTinhTrang(1);
        khachHangService.add(khachHang);
        return "redirect:/khach-hang/hien-thi";
    }


    @GetMapping("/view-update/{id}")

    public String viewUpdate(Model model,
                             @PathVariable("id") UUID id,
                             @ModelAttribute("kh")KhachHang khachHang

    ) {
        khachHang.setTinhTrang(0);
        khachHang.setGioiTinh(true);
        model.addAttribute("kh", khachHangService.findById(id));
        model.addAttribute("hkh",hangKhachHangService.getALL0());
        return "khach-hang/khach-hang-update";
    }


    @PostMapping("/update")
    public String updateDongSP(Model model,

                               @ModelAttribute("kh")@Valid KhachHang khachHang, BindingResult bindingResult
    ) {



        if(bindingResult.hasErrors()){
            khachHang=khachHangService.findById(khachHang.getId());
            return "khach-hang/khach-hang-update";
        }


        long millis = System.currentTimeMillis();
        java.sql.Date date = new java.sql.Date(millis);
        khachHang.setNgayCapNhat(date);

        khachHangService.add(khachHang);


        return "redirect:/khach-hang/hien-thi";
    }





    @PostMapping("/add")
    public String updateadd(Model model,
                            @ModelAttribute("kh")@Valid KhachHang khachHang,
                            BindingResult bindingResult
    ) {

        long millis = System.currentTimeMillis();
        Date date = new java.sql.Date(millis);

        if(bindingResult.hasErrors()){

            khachHang.setGioiTinh(true);


            model.addAttribute("dulieu", khachHangService.getALL0());
            model.addAttribute("hkh",hangKhachHangService.getALL0());
            return "khach-hang/khach-hang";
        }



        String mhd = "MKH" + khachHangService.findAll().size();
        khachHang.setMa(mhd);
        khachHang.setNgayTao(date);
        khachHang.setNgayCapNhat(date);
        khachHang.setTinhTrang(0);
        khachHangService.add(khachHang);
//        model.addAttribute("hkh",hangKhachHangService.getALL0());
        return "redirect:/khach-hang/hien-thi";
    }

}