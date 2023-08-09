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
//@RequestMapping("/dia-chi")
public class DiaChiController {
    @Autowired
    DiaChiService diaChiService;
    @Autowired
    KhachHangService khachHangService;


    @GetMapping("/dia-chi/hien-thi")
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
        model.addAttribute("contentPage","dia-chi/dia-chi.jsp");
        return "layout";
    }


    @GetMapping("/dia-chi/remove/{id}")
    public String remove(Model model,
                         @PathVariable("id") UUID id,
                         @ModelAttribute("dc") DiaChi diaChi,
                         @ModelAttribute("hangKhachHang") HangKhachHang hangKhachHang,
                         @ModelAttribute("khachHang") HangKhachHang khachHang
    ) {


        DiaChi diaChi1 = diaChiService.findById(id);
        diaChi1.setTinhTrang(1);
        diaChiService.add(diaChi1);

        diaChi.setTinhTrang(0);
        model.addAttribute("dulieu", diaChiService.getAll0());
        model.addAttribute("kh", khachHangService.getALL0());
        model.addAttribute("tong", diaChiService.getAll0().size());
        model.addAttribute("contentPage","dia-chi/dia-chi.jsp");
        return "layout";
    }

    @GetMapping("/dia-chi/view-update/{id}")
    public String viewUpdate(Model model,
                             @PathVariable("id") UUID id,
                             @ModelAttribute("dc") DiaChi diaChi

    ) {
        model.addAttribute("dc", diaChiService.findById(id));
        model.addAttribute("kh", khachHangService.getALL0());
        model.addAttribute("contentPage","dia-chi/dia-chi-update.jsp");
        return "layout";
    }


    @PostMapping("/dia-chi/update")
    public String updateDongSP(Model model,
                               @ModelAttribute("dc") @Valid DiaChi diaChi
            , BindingResult bindingResult,
                               @ModelAttribute("hangKhachHang") HangKhachHang hangKhachHang,
                               @ModelAttribute("khachHang") HangKhachHang khachHang
    ) {

        if (bindingResult.hasErrors()) {

            model.addAttribute("contentPage","dia-chi/dia-chi-update.jsp");
            return "layout";
        }


        long millis = System.currentTimeMillis();
        java.sql.Date date = new java.sql.Date(millis);
        diaChi.setNgayCapNhat(date);

        diaChiService.add(diaChi);

        diaChi.setTinhTrang(0);
        model.addAttribute("dulieu", diaChiService.getAll0());
        model.addAttribute("kh", khachHangService.getALL0());
        model.addAttribute("tong", diaChiService.getAll0().size());
        model.addAttribute("contentPage","dia-chi/dia-chi.jsp");
        return "layout";
    }


    @PostMapping("/dia-chi/add")
    public String updateadd(Model model,
                            @ModelAttribute("dc") @Valid DiaChi diaChi
//                            @ModelAttribute("hangKhachHang")@Valid HangKhachHang hangKhachHang,
//                            @ModelAttribute("KhachHang")@Valid KhachHang khachHang


            , BindingResult bindingResult,
                            @ModelAttribute("hangKhachHang") HangKhachHang hangKhachHang,
                            @ModelAttribute("khachHang") HangKhachHang khachHang
    ) {
        long millis = System.currentTimeMillis();
        Date date = new java.sql.Date(millis);

        if (bindingResult.hasErrors()) {
            model.addAttribute("dulieu", diaChiService.getAll0());
            model.addAttribute("kh", khachHangService.getALL0());
            diaChi.setTinhTrang(0);
            model.addAttribute("dulieu", diaChiService.getAll0());
            model.addAttribute("kh", khachHangService.getALL0());
            model.addAttribute("tong", diaChiService.getAll0().size());
            model.addAttribute("contentPage","dia-chi/dia-chi.jsp");
            return "layout";
        }

        Integer sl = khachHangService.findAll().size() + 1;

        String mhd = "MDC" + sl;
        diaChi.setMa(mhd);
        diaChi.setNgayTao(date);
        diaChi.setNgayCapNhat(date);
        diaChi.setTinhTrang(0);
        diaChiService.add(diaChi);
        diaChi.setTinhTrang(0);
        model.addAttribute("dulieu", diaChiService.getAll0());
        model.addAttribute("kh", khachHangService.getALL0());
        model.addAttribute("tong", diaChiService.getAll0().size());
        model.addAttribute("contentPage","dia-chi/dia-chi.jsp");
        return "layout";
    }
}
