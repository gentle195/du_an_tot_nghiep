package com.example.demo.controllers;

import com.example.demo.models.Ram;
import com.example.demo.services.RamService;
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
@RequestMapping("/ram")

public class RamController {
    @Autowired
    RamService ramService;

    @GetMapping("/hien-thi")
    public String hienThi(Model model, @ModelAttribute("r") Ram ram
    ) {
        ram.setTinhTrang(0);
        model.addAttribute("duLieu", ramService.findAll());
        return "ram/ram";
    }


    @PostMapping("add-ram")
    public String addMauSac(Model model, @ModelAttribute("r") Ram ram
    ) {
        ramService.add(ram);

        return "redirect:/ram/hien-thi";
    }

    @GetMapping("/view-update-ram/{id}")
    public String viewUpdate(Model model, @PathVariable("id") UUID id, @ModelAttribute("r") Ram ram) {

        ram.setTinhTrang(0);
        model.addAttribute("r", ramService.findById(id));
        return "/ram/ram-update";
    }

    @PostMapping("/update-ram")
    public String updateRam(Model model, @ModelAttribute("r") Ram ram) {

        ramService.add(ram);

        return "redirect:/ram/hien-thi";
    }

    @GetMapping("/remove-ram/{id}")
    public String delete(Model model, @PathVariable("id") UUID id) {
        ramService.delete(id);
        return "redirect:/ram/hien-thi";
    }


}
