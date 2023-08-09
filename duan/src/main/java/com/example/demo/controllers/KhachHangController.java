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
//@RequestMapping("/khach-hang")
public class KhachHangController {


    @Autowired
    KhachHangService khachHangService;
    @Autowired
    HangKhachHangService hangKhachHangService;


    @GetMapping("/khach-hang/hien-thi")
    public String hienThi(
            Model model,
            @ModelAttribute("kh") KhachHang khachHang,
            @ModelAttribute("hangKhachHang") HangKhachHang hangKhachHang

    ) {


        khachHang.setGioiTinh(true);


        model.addAttribute("dulieu", khachHangService.getALL0());
        model.addAttribute("hkh", hangKhachHangService.getALL0());
        model.addAttribute("tong", khachHangService.getALL0().size());
        model.addAttribute("contentPage","khach-hang/khach-hang.jsp");
        return "layout";

    }


    @GetMapping("/khach-hang/remove/{id}")

    public String remove(Model model,
                         @PathVariable("id") UUID id,
                         @ModelAttribute("kh") KhachHang khachHang,
                         @ModelAttribute("hangKhachHang") HangKhachHang hangKhachHang

    ) {
        KhachHang khachHang1 = khachHangService.findById(id);
        khachHang.setTinhTrang(1);
        khachHangService.add(khachHang1);


        khachHang.setGioiTinh(true);


        model.addAttribute("dulieu", khachHangService.getALL0());
        model.addAttribute("hkh", hangKhachHangService.getALL0());
        model.addAttribute("tong", khachHangService.getALL0().size());
        model.addAttribute("contentPage","khach-hang/khach-hang.jsp");
        return "layout";

    }


    @GetMapping("/khach-hang/view-update/{id}")

    public String viewUpdate(Model model,
                             @PathVariable("id") UUID id,
                             @ModelAttribute("kh") KhachHang khachHang


    ) {
        khachHang.setTinhTrang(0);
        khachHang.setGioiTinh(true);
        model.addAttribute("kh", khachHangService.findById(id));
        model.addAttribute("hkh", hangKhachHangService.getALL0());


        model.addAttribute("contentPage","khach-hang/khach-hang-update.jsp");
        return "layout";
    }


    @PostMapping("/khach-hang/update")
    public String updateDongSP(Model model, @ModelAttribute("kh") @Valid KhachHang khachHang,
                               BindingResult bindingResult,
                               @ModelAttribute("hangKhachHang") HangKhachHang hangKhachHang) {
        if (bindingResult.hasErrors()) {
            khachHang = khachHangService.findById(khachHang.getId());
            model.addAttribute("contentPage","khach-hang/khach-hang-update.jsp");
            return "layout";
        }


        long millis = System.currentTimeMillis();
        java.sql.Date date = new java.sql.Date(millis);
        khachHang.setNgayCapNhat(date);

        khachHangService.add(khachHang);


        khachHang.setGioiTinh(true);


        model.addAttribute("dulieu", khachHangService.getALL0());
        model.addAttribute("hkh", hangKhachHangService.getALL0());
        model.addAttribute("tong", khachHangService.getALL0().size());
        model.addAttribute("contentPage","khach-hang/khach-hang.jsp");
        return "layout";
    }


    @PostMapping("/khach-hang/add")
    public String updateadd(Model model,
                            @ModelAttribute("kh") @Valid KhachHang khachHang,
                            BindingResult bindingResult,
                            @ModelAttribute("hangKhachHang")  HangKhachHang hangKhachHang
    ) {

        long millis = System.currentTimeMillis();
        Date date = new java.sql.Date(millis);

        if (bindingResult.hasErrors()) {

            khachHang.setGioiTinh(true);
            model.addAttribute("dulieu", khachHangService.getALL0());
            model.addAttribute("hkh", hangKhachHangService.getALL0());
            model.addAttribute("tong", khachHangService.getALL0().size());
            model.addAttribute("contentPage","khach-hang/khach-hang.jsp");
            return "layout";
        }

        Integer sl = khachHangService.findAll().size() + 1;

        String mhd = "MKH" + sl;
        khachHang.setMa(mhd);
        khachHang.setNgayTao(date);
        khachHang.setNgayCapNhat(date);
        khachHang.setTinhTrang(0);
        khachHangService.add(khachHang);
//        model.addAttribute("hkh",hangKhachHangService.getALL0());
        khachHang.setGioiTinh(true);


        model.addAttribute("dulieu", khachHangService.getALL0());
        model.addAttribute("hkh", hangKhachHangService.getALL0());
        model.addAttribute("tong", khachHangService.getALL0().size());
        model.addAttribute("contentPage","khach-hang/khach-hang.jsp");
        return "layout";
    }

}