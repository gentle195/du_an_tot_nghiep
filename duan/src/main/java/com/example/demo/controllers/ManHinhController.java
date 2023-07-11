package com.example.demo.controllers;

import com.example.demo.models.ManHinh;
import com.example.demo.services.ManHinhService;
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
import java.time.LocalDate;
import java.util.Optional;
import java.util.UUID;

@Controller
@RequestMapping("/man-hinh")
public class ManHinhController {
    @Autowired
    private ManHinhService manHinhService;

    @GetMapping("hien-thi")
    public String hienthi(@ModelAttribute("manHinh") ManHinh manHinh, Model model, @RequestParam("num") Optional<Integer> num,
                          @RequestParam(name = "size", defaultValue = "5", required = false) Integer size) {
        Sort sort = Sort.by("ngayTao").ascending();
        Pageable pageable = PageRequest.of(num.orElse(0), size, sort);
        Page<ManHinh> list = manHinhService.getAll(pageable);
        model.addAttribute("listManHinh", list.getContent());
        model.addAttribute("total", list.getTotalPages());
        return "man-hinh/hien-thi";
    }

    @GetMapping("/view-update/{id}")
    public String viewupdate(Model model, @PathVariable("id") UUID id) {
        ManHinh hsp = manHinhService.findById(id);
        model.addAttribute("manHinh", hsp);
        return "man-hinh/update";
    }

    @PostMapping("/add")
    public String add(Model model, @ModelAttribute("manHinh") @Valid ManHinh manHinh, BindingResult bindingResult,
                      @RequestParam("num") Optional<Integer> num, @RequestParam(name = "size", defaultValue = "5", required = false) Integer size) {
        if (bindingResult.hasErrors()) {
            model.addAttribute("content", "ManHinh/hien-thi.jsp");
            Sort sort = Sort.by("ngayTao").ascending();
            Pageable pageable = PageRequest.of(num.orElse(0), size, sort);
            Page<ManHinh> list = manHinhService.getAll(pageable);
            model.addAttribute("listManHinh", list.getContent());
            model.addAttribute("total", list.getTotalPages());
            return "man-hinh/hien-thi";
        }
        manHinh.setNgayTao(Date.valueOf(LocalDate.now()));
        manHinh.setMa("MH" + String.valueOf(manHinhService.findAll().size() + 1));
        manHinhService.add(manHinh);
        Sort sort = Sort.by("ngayTao").ascending();
        Pageable pageable = PageRequest.of(num.orElse(0), size, sort);
        Page<ManHinh> list = manHinhService.getAll(pageable);
        model.addAttribute("listManHinh", list.getContent());
        model.addAttribute("total", list.getTotalPages());
        return "redirect:/man-hinh/hien-thi";
        // Tiếp tục xử lý và trả về view tương ứng
    }

    @PostMapping("/update/{id}")
    public String update(Model model, @ModelAttribute("manHinh") @Valid ManHinh manHinh, BindingResult bindingResult, @PathVariable("id") UUID id) {
        if (bindingResult.hasErrors()) {
            model.addAttribute("content", "ManHinh/update.jsp");
            return "man-hinh/update";
        }
        ManHinh hsp = manHinhService.findById(id);
        Date ngayTao = hsp.getNgayTao();
        hsp.setThongSo(manHinh.getThongSo());
        hsp.setNgayTao(ngayTao);
        // Gán ngày hiện tại
        hsp.setNgayCapNhat(Date.valueOf(LocalDate.now()));
        hsp.setTinhTrang(manHinh.getTinhTrang());
        hsp.setMoTa(manHinh.getMoTa());
        manHinhService.update(id, hsp);
        return "redirect:/man-hinh/hien-thi";
    }

    @GetMapping("/delete/{id}")
    public String delete(Model model, @ModelAttribute("manHinh") ManHinh manHinh, @PathVariable("id") UUID id, @RequestParam("num") Optional<Integer> num,
                         @RequestParam(name = "size", defaultValue = "5", required = false) Integer size) {
        manHinhService.delete(id);
        Pageable pageable = PageRequest.of(num.orElse(0), size);
        Page<ManHinh> list = manHinhService.getAll(pageable);
        model.addAttribute("listManHinh", list.getContent());
        model.addAttribute("total", list.getTotalPages());
        return "man-hinh/hien-thi";

    }
}
