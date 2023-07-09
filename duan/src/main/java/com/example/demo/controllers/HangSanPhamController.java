package com.example.demo.controllers;

import com.example.demo.models.HangSanPham;
import com.example.demo.services.HangSanPhamService;
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
import org.springframework.web.bind.annotation.*;

import java.sql.Date;
import java.time.LocalDate;
import java.util.Optional;
import java.util.UUID;

@Controller
@RequestMapping("/hang-san-pham")
public class HangSanPhamController {
    @Autowired
    HangSanPhamService hangSanPhamService;

    @GetMapping("hien-thi")
    public String hienthi(@ModelAttribute("dulieuxem") HangSanPham dulieuxem, Model model, @RequestParam("num") Optional<Integer> num,
                          @RequestParam(name = "size", defaultValue = "5", required = false) Integer size) {
        Sort sort = Sort.by("ngayTao").ascending();
        Pageable pageable = PageRequest.of(num.orElse(0), size, sort);
        Page<HangSanPham> list = hangSanPhamService.getAll(pageable);
        model.addAttribute("hsp", list.getContent());
        model.addAttribute("total", list.getTotalPages());
        return "HangSanPham/hien-thi";
    }

    @GetMapping("/view-update/{id}")
    public String viewupdate(Model model, @PathVariable("id") UUID id) {
        HangSanPham hsp = hangSanPhamService.findById(id);
        model.addAttribute("dulieuxem", hsp);
        return "HangSanPham/update";
    }

    @PostMapping("/add")
    public String add(Model model, @ModelAttribute("dulieuxem") @Valid HangSanPham dulieuxem, BindingResult bindingResult, @RequestParam("num") Optional<Integer> num,
                      @RequestParam(name = "size", defaultValue = "5", required = false) Integer size) {
        if (bindingResult.hasErrors()) {
            model.addAttribute("content", "HangSanPham/hien-thi.jsp");
            Sort sort = Sort.by("ngayTao").ascending();
            Pageable pageable = PageRequest.of(num.orElse(0), size, sort);
            Page<HangSanPham> list = hangSanPhamService.getAll(pageable);
            model.addAttribute("hsp", list.getContent());
            model.addAttribute("total", list.getTotalPages());
            return "HangSanPham/hien-thi";
        }

        dulieuxem.setNgayTao(Date.valueOf(LocalDate.now()));
        dulieuxem.setMa("H" + String.valueOf(hangSanPhamService.findAll().size() + 1));

        hangSanPhamService.add(dulieuxem);

        return "redirect:/hang-san-pham/hien-thi";
        // Tiếp tục xử lý và trả về view tương ứng
    }

    @PostMapping("/update/{id}")
    public String update(Model model, @ModelAttribute("dulieuxem") @Valid HangSanPham dulieuxem, BindingResult bindingResult, @PathVariable("id") UUID id) {
        if (bindingResult.hasErrors()) {
            model.addAttribute("content", "HangSanPham/update.jsp");

            return "HangSanPham/update";
        }
        HangSanPham hsp = hangSanPhamService.findById(id);
        Date ngayTao = hsp.getNgayTao();
        hsp.setTen(dulieuxem.getTen());
        hsp.setNgayTao(ngayTao);
        // Gán ngày hiện tại
        hsp.setNgayCapNhat(Date.valueOf(LocalDate.now()));
        hsp.setTinhTrang(dulieuxem.getTinhTrang());
        hsp.setMoTa(dulieuxem.getMoTa());
        hangSanPhamService.update(id,hsp);
        return "redirect:/hang-san-pham/hien-thi";
    }

    @GetMapping("/delete/{id}")
    public String delete(Model model, @ModelAttribute("dulieuxem") HangSanPham dulieuxem, @PathVariable("id") UUID id, @RequestParam("num") Optional<Integer> num,
                         @RequestParam(name = "size", defaultValue = "5", required = false) Integer size) {
        hangSanPhamService.delete(id);
        Pageable pageable = PageRequest.of(num.orElse(0), size);
        Page<HangSanPham> list = hangSanPhamService.getAll(pageable);
        model.addAttribute("hsp", list.getContent());
        model.addAttribute("total", list.getTotalPages());
        return "HangSanPham/hien-thi";

    }
}
