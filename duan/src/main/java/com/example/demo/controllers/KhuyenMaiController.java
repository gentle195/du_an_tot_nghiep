package com.example.demo.controllers;

import com.example.demo.models.KhuyenMai;
import com.example.demo.services.KhuyenMaiService;
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
@RequestMapping("/khuyen-mai")

public class KhuyenMaiController {

    @Autowired
    KhuyenMaiService khuyenMaiService;

    @GetMapping("/hien-thi")
    public String hienThi(Model model, @ModelAttribute("km") KhuyenMai khuyenMai
    ) {

        khuyenMai.setTinhTrang(0);
        model.addAttribute("duLieu", khuyenMaiService.findAll());
        return "khuyen-mai/khuyen-mai";
    }


    @PostMapping("add-khuyen-mai")
    public String addMauSac(Model model, @ModelAttribute("km") KhuyenMai khuyenMai

    ) {

        khuyenMaiService.add(khuyenMai);
        return "redirect:/khuyen-mai/hien-thi";
    }

    @GetMapping("/view-update-khuyen-mai/{id}")
    public String viewUpdate(Model model, @PathVariable("id") UUID id, @ModelAttribute("km") KhuyenMai khuyenMai) {


        khuyenMai.setTinhTrang(0);
        model.addAttribute("km", khuyenMaiService.findById(id));
        return "khuyen-mai/khuyen-mai-update";
    }

    @PostMapping("/update-khuyen-mai")
    public String updateKhuyenMai(Model model, @ModelAttribute("km") KhuyenMai khuyenMai) {

        khuyenMaiService.add(khuyenMai);

        return "redirect:/khuyen-mai/hien-thi";
    }

    @GetMapping("/remove-khuyen-mai/{id}")
    public String delete(Model model, @PathVariable("id") UUID id,
                         @ModelAttribute("khuyenMai") KhuyenMai khuyenMai) {

        khuyenMaiService.delete(id);

        return "redirect:/khuyen-mai/hien-thi";
    }

}

