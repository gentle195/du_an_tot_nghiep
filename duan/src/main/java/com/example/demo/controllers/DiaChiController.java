package com.example.demo.controllers;

import com.example.demo.models.DiaChi;
import com.example.demo.services.DiaChiService;
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
@RequestMapping("/dia-chi")
public class DiaChiController {
    @Autowired
    DiaChiService diaChiService;
    @Autowired
    KhachHangService khachHangService;


    @GetMapping("/hien-thi")
    public String hienThi(
            Model model,
            @ModelAttribute("dc") DiaChi diaChi
    ) {
        diaChi.setTinhTrang(0);
        model.addAttribute("dulieu", diaChiService.findAll());
        model.addAttribute("kh", khachHangService.findAll());
        return "dia-chi/dia-chi";
    }


    @GetMapping("/remove/{id}")
    public String remove(Model model,
                         @PathVariable("id") UUID id
    ) {
        diaChiService.delete(id);
        return "redirect:/dia-chi/hien-thi";
    }

    @GetMapping("/view-update/{id}")
    public String viewUpdate(Model model,
                             @PathVariable("id") UUID id,
                             @ModelAttribute("dc") DiaChi diaChi

    ) {
        diaChi.setTinhTrang(0);
        model.addAttribute("dc", diaChiService.findById(id));
        model.addAttribute("kh", khachHangService.findAll());
        return "dia-chi/dia-chi-update";
    }


    @PostMapping("/update")
    public String updateDongSP(Model model,
                               @ModelAttribute("dc") DiaChi diaChi
    ) {
        diaChiService.add(diaChi);
        return "redirect:/dia-chi/hien-thi";
    }


    @PostMapping("/add")
    public String updateadd(Model model,
                            @ModelAttribute("dc") DiaChi diaChi
    ) {
        diaChiService.add(diaChi);
        return "redirect:/dia-chi/hien-thi";
    }
}
