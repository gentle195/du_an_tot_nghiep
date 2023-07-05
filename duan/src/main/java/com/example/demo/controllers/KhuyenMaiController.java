package com.example.demo.controllers;

import com.example.demo.models.KhuyenMai;
import com.example.demo.services.KhuyenMaiService;
import jakarta.validation.Valid;
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
import java.util.Optional;
import java.util.UUID;

@Controller
@RequestMapping("/khuyen-mai")

public class KhuyenMaiController {

    @Autowired
    KhuyenMaiService khuyenMaiService;

    @GetMapping("/hien-thi")
    public String hienThi(Model model, @ModelAttribute("km") KhuyenMai khuyenMai,
                          @RequestParam("num") Optional<Integer> num,
                          @RequestParam(name = "tongDuLieu", required = false, defaultValue = "5") Integer tongDuLieu) {
        Sort sort = Sort.by("ma").ascending();

        Pageable pageable = PageRequest.of(num.orElse(0), tongDuLieu);

        khuyenMai.setTinhTrang(0);
        Page<KhuyenMai> list = khuyenMaiService.getAll(pageable);
        model.addAttribute("tongSoTrang", list.getTotalPages());
        model.addAttribute("duLieu", list.getContent());
        return "khuyen-mai/khuyen-mai";
    }


    @PostMapping("/add-khuyen-mai")
    public String addMauSac(Model model, @ModelAttribute("km") @Valid KhuyenMai khuyenMai,
                            BindingResult bindingResult
    ) {
        if (bindingResult.hasErrors()) {
            model.addAttribute("duLieu", khuyenMaiService.getAll0());
            return "khuyen-mai/khuyen-mai";
        }

        String maKM = "MKM" + khuyenMaiService.findAll().size();
        khuyenMai.setMa(maKM);
        long millis = System.currentTimeMillis();
        Date date = new java.sql.Date(millis);
        khuyenMai.setNgayTao(date);
        khuyenMai.setNgayCapNhat(date);
//        khuyenMai.setNgayBatDau(date);
//        khuyenMai.setNgayKetThuc(date);

        khuyenMai.setTinhTrang(0);
        khuyenMaiService.add(khuyenMai);
        return "redirect:/khuyen-mai/hien-thi";
    }

    @GetMapping("/view-update-khuyen-mai/{id}")
    public String viewUpdate(Model model, @PathVariable("id") UUID id, @ModelAttribute("km") KhuyenMai khuyenMai) {


//
        model.addAttribute("km", khuyenMaiService.findById(id));
        return "khuyen-mai/khuyen-mai-update";
    }

    @PostMapping("/update-khuyen-mai")
    public String updateKhuyenMai(Model model, @ModelAttribute("km") @Valid KhuyenMai khuyenMai,
                                  BindingResult bindingResult) {

        if (bindingResult.hasErrors()) {
            khuyenMai = khuyenMaiService.findById(khuyenMai.getId());
            return "khuyen-mai/khuyen-mai-update";
        }
        long millis = System.currentTimeMillis();
        Date date = new java.sql.Date(millis);
        khuyenMai.setNgayTao(date);
        khuyenMai.setNgayCapNhat(date);
//        khuyenMai.setNgayBatDau(date);
//        khuyenMai.setNgayKetThuc(date);

        KhuyenMai khuyenMai1 = khuyenMaiService.findById(khuyenMai.getId());
        khuyenMaiService.update(khuyenMai1.getId(), khuyenMai);
        return "redirect:/khuyen-mai/hien-thi";
    }

    @GetMapping("/remove-khuyen-mai/{id}")
    public String delete(Model model, @PathVariable("id") UUID id,
                         @ModelAttribute("khuyenMai") KhuyenMai khuyenMai) {

        khuyenMaiService.delete(id);

        return "redirect:/khuyen-mai/hien-thi";
    }

}

