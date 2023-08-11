package com.example.demo.controllers;

import com.example.demo.models.Ram;
import com.example.demo.services.RamService;
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
public class RamController {
    @Autowired
    RamService ramService;

    @GetMapping("/ram/hien-thi")
    public String hienThi(Model model, @ModelAttribute("r") Ram ram,
                          @RequestParam("num") Optional<Integer> num,
                          @RequestParam(name = "tongDuLieu", required = false, defaultValue = "5") Integer tongDuLieu) {
        Sort sort = Sort.by("ma").ascending();
        Pageable pageable = PageRequest.of(num.orElse(0), tongDuLieu,sort);
        ram.setTinhTrang(0);
        Page<Ram> list = ramService.getAll(pageable);
        model.addAttribute("tongSoTrang", list.getTotalPages());
        model.addAttribute("duLieu", list.getContent());
        model.addAttribute("contentPage","ram/ram.jsp");
        return "layout";
    }


    @PostMapping("add-ram")
    public String addMauSac(Model model, @ModelAttribute("r") @Valid Ram ram,
                            BindingResult bindingResult
    ) {
        if (bindingResult.hasErrors()) {
            model.addAttribute("duLieu", ramService.getAll0());
            model.addAttribute("contentPage","ram/ram.jsp");
            return "layout";
        }
        String maR = "R" + ramService.findAll().size();
        ram.setMa(maR);
        long millis = System.currentTimeMillis();
        Date date = new java.sql.Date(millis);
        ram.setNgayTao(date);
//        ram.setNgayCapNhat(date);
        ram.setTinhTrang(0);
        System.out.println(ram.toString());
        ramService.add(ram);
        return "redirect:/ram/hien-thi";
    }

    @GetMapping("/view-update-ram/{id}")
    public String viewUpdate(Model model, @PathVariable("id") UUID id, @ModelAttribute("r") Ram ram) {
        model.addAttribute("r", ramService.findById(id));
        model.addAttribute("contentPage","ram/ram-update.jsp");
        return "layout";
    }

    @PostMapping("/update-ram")
    public String updateRam(Model model, @ModelAttribute("r") @Valid Ram ram,
                            BindingResult bindingResult) {
        if (bindingResult.hasErrors()) {
            ram = ramService.findById(ram.getId());
            model.addAttribute("contentPage","ram/ram.jsp");
            return "layout";
        }

        long millis = System.currentTimeMillis();
        Date date = new java.sql.Date(millis);
        ram.setNgayTao(date);
        ram.setNgayCapNhat(date);
        Ram ram1 = ramService.findById(ram.getId());
        ramService.update(ram1.getId(), ram);
        return "redirect:/ram/hien-thi";
    }

    @GetMapping("/remove-ram/{id}")
    public String delete(Model model, @PathVariable("id") UUID id) {
        ramService.delete(id);
        return "redirect:/ram/hien-thi";
    }


}