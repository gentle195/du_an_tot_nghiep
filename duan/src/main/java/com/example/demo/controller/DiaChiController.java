package com.example.demo.controller;

import com.example.demo.Model.DiaChi;
import com.example.demo.Model.KhachHang;
import com.example.demo.service.DiaChiService;
import com.example.demo.service.HangKhachHangService;
import com.example.demo.service.KhachHangService;
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
@RequestMapping("/dia-chi")
public class DiaChiController {
    @Autowired
    DiaChiService diaChiService;
    @Autowired
    KhachHangService khachHangService;


    @GetMapping("/hien-thi")
    public String hienThi(
            Model model,
            @ModelAttribute("dc")DiaChi diaChi


            ) {
        diaChi.setTinhTrang(0);



        model.addAttribute("dulieu",diaChiService.getAllDC());
        model.addAttribute("kh",khachHangService.getAllKH());
        return "dia-chi/dia-chi";
    }


    @GetMapping("/remove/{id}")

    public String remove(Model model,
                         @PathVariable("id") UUID id

    ) {
        diaChiService.remove(id);
        return "redirect:/dia-chi/hien-thi";
    }


    @GetMapping("/view-update/{id}")

    public String viewUpdate(Model model,
                             @PathVariable("id") UUID id,
                             @ModelAttribute("dc") DiaChi diaChi

    ) {
        diaChi.setTinhTrang(0);

        model.addAttribute("dc", diaChiService.getOne(id));
        model.addAttribute("kh",khachHangService.getAllKH());
        return "dia-chi/dia-chi-update";
    }


    @PostMapping("/update")
    public String updateDongSP(Model model,

                               @ModelAttribute("dc") DiaChi diaChi
    ) {



        diaChiService.addOrUpdate(diaChi);

        return "redirect:/dia-chi/hien-thi";
    }





    @PostMapping("/add")
    public String updateadd(Model model,
                            @ModelAttribute("dc") DiaChi diaChi
    ) {


        diaChiService.addOrUpdate(diaChi);
        return "redirect:/dia-chi/hien-thi";
    }
}
