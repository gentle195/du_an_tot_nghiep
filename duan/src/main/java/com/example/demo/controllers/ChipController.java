package com.example.demo.controllers;

import com.example.demo.models.Chip;
import com.example.demo.services.ChipService;

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
public class ChipController {

    @Autowired
    private ChipService chipService;


    @GetMapping("/chip/hien-thi")
    public String hienThi(Model model, @ModelAttribute("Chip") Chip chip,
                          @RequestParam("pageNum") Optional<Integer> pageNum,
                          @RequestParam(name = "pageSize", required = false, defaultValue = "5") Integer pageSize) {

        Sort sort = Sort.by("ngayTao").descending();
        Pageable pageable = PageRequest.of(pageNum.orElse(0), pageSize, sort);
        Page<Chip> page = chipService.getAll(pageable);
        model.addAttribute("contentPage","chip/chip.jsp");
        model.addAttribute("list", page.getContent());
        model.addAttribute("page", page.getNumber());
        model.addAttribute("total", page.getTotalPages());

        return "layout";
    }

    @PostMapping("/add-chip")
    public String addPin(Model model, @ModelAttribute("Chip")@Valid Chip chip, BindingResult bindingResult, @RequestParam("pageNum") Optional<Integer> pageNum,
                         @RequestParam(name = "pageSize", required = false, defaultValue = "5") Integer pageSize) {
        Sort sort = Sort.by("ngayTao").ascending();
        Pageable pageable = PageRequest.of(pageNum.orElse(0), pageSize, sort);
        Page<Chip> page = chipService.getAll(pageable);

        if(bindingResult.hasErrors()){
            model.addAttribute("contentPage","chip/chip.jsp");
            model.addAttribute("list", page.getContent());
            model.addAttribute("page", page.getNumber());
            model.addAttribute("total", page.getTotalPages());
            return "layout";
        }

        long millis = System.currentTimeMillis();
        Date date = new java.sql.Date(millis);
        String ma = "CHIP"+chipService.findAll().size();
        chip.setMa(ma);
        chip.setNgayTao(date);
        chip.setTinhTrang(0);
        chipService.add(chip);
        model.addAttribute("contentPage","chip/chip.jsp");
        model.addAttribute("list", page.getContent());
        model.addAttribute("page", page.getNumber());
        model.addAttribute("total", page.getTotalPages());
        return "redirect:/chip/hien-thi";
    }

    @PostMapping("/update-chip/{id}")
    public String updatePin(Model model, @PathVariable("id") UUID id, @ModelAttribute("Chip")@Valid Chip chip,BindingResult bindingResult, @RequestParam("pageNum") Optional<Integer> pageNum,
                            @RequestParam(name = "pageSize", required = false, defaultValue = "5") Integer pageSize) {

        if(bindingResult.hasErrors()){
            return "chip/chip-update";
        }
        long millis = System.currentTimeMillis();
        Date date = new java.sql.Date(millis);
        chip.setNgayCapNhat(date);
        chipService.update(id,chip);

        return "redirect:/chip/hien-thi";
    }

    @GetMapping("/remove-chip/{id}")
    public String delete(Model model, @PathVariable("id") UUID id, @RequestParam("pageNum") Optional<Integer> pageNum,
                         @RequestParam(name = "pageSize", required = false, defaultValue = "5") Integer pageSize, @ModelAttribute("Chip") Chip chip) {
        Sort sort = Sort.by("ngayTao").ascending();
        Pageable pageable = PageRequest.of(pageNum.orElse(0), pageSize, sort);
        chipService.delete(id);
        Page<Chip> page = chipService.getAll(pageable);
        model.addAttribute("contentPage","chip/chip.jsp");
        model.addAttribute("list", page.getContent());
        model.addAttribute("page", page.getNumber());
        model.addAttribute("total", page.getTotalPages());
        return "layout";
    }

    @GetMapping("/detail-chip/{id}")
    public String detail(Model model, @PathVariable("id") UUID id, @RequestParam("pageNum") Optional<Integer> pageNum,
                         @RequestParam(name = "pageSize", required = false, defaultValue = "5") Integer pageSize) {
        Chip sp = chipService.findById(id);
        model.addAttribute("Chip", sp);
        Sort sort = Sort.by("ngayTao").ascending();
        Pageable pageable = PageRequest.of(pageNum.orElse(0), pageSize, sort);
        Page<Chip> page = chipService.getAll(pageable);
        model.addAttribute("contentPage","chip/chip.jsp");
        model.addAttribute("list", page.getContent());
        model.addAttribute("page", page.getNumber());
        model.addAttribute("total", page.getTotalPages());
        return "layout";
    }

    @GetMapping("/view-update-chip/{id}")
    public String viewUpdate(Model model, @PathVariable("id") UUID id) {
        Chip sp = chipService.findById(id);
        model.addAttribute("Chip", sp);
        return "chip/chip-update";
    }
}
