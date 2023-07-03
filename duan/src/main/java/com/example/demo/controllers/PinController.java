package com.example.demo.controllers;

import com.example.demo.models.Chip;
import com.example.demo.models.Pin;
import com.example.demo.services.DungLuongPinService;
import com.example.demo.services.PinService;
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
@RequestMapping("/pin")
public class PinController {

    @Autowired
    private PinService pinService;

    @Autowired
    private DungLuongPinService dungLuongPinService;

    @GetMapping("/hien-thi")
    public String hienThi(Model model, @ModelAttribute("Pin") Pin pin,
                          @RequestParam("pageNum") Optional<Integer> pageNum,
                          @RequestParam(name = "pageSize", required = false, defaultValue = "5") Integer pageSize) {

        Sort sort = Sort.by("ma").ascending();
        Pageable pageable = PageRequest.of(pageNum.orElse(0), pageSize, sort);
        Page<Pin> page = pinService.getAll(pageable);
        model.addAttribute("dungLuongPin", dungLuongPinService.findAll());
        model.addAttribute("list", page.getContent());
        model.addAttribute("page", page.getNumber());
        model.addAttribute("total", page.getTotalPages());
        return "pin/pin";
    }

    @PostMapping("/add-pin")
    public String addPin(Model model,@ModelAttribute("Pin")@Valid Pin pin, BindingResult bindingResult, @RequestParam("pageNum") Optional<Integer> pageNum,
                             @RequestParam(name = "pageSize", required = false, defaultValue = "5") Integer pageSize) {
        Sort sort = Sort.by("ngayTao").ascending();
        Pageable pageable = PageRequest.of(pageNum.orElse(0), pageSize, sort);
        Page<Pin> page = pinService.getAll(pageable);

        if(bindingResult.hasErrors()){
            model.addAttribute("list", page.getContent());
            model.addAttribute("page", page.getNumber());
            model.addAttribute("total", page.getTotalPages());
            return "pin/pin";
        }

        long millis = System.currentTimeMillis();
        Date date = new java.sql.Date(millis);
        String ma = "CHIP"+pinService.findAll().size();
        pin.setMa(ma);
        pin.setNgayTao(date);
        pin.setTinhTrang(0);
        pinService.add(pin);

        model.addAttribute("list", page.getContent());
        model.addAttribute("page", page.getNumber());
        model.addAttribute("total", page.getTotalPages());
        return "redirect:/pin/hien-thi";
    }

    @PostMapping("/update-pin/{id}")
    public String updatePin(Model model, @PathVariable("id") UUID id, @ModelAttribute("Pin")@Valid Pin pin, BindingResult bindingResult, @RequestParam("pageNum") Optional<Integer> pageNum,
                            @RequestParam(name = "pageSize", required = false, defaultValue = "3") Integer pageSize) {

        if(bindingResult.hasErrors()){
            model.addAttribute("dungLuongPin", dungLuongPinService.findAll());
            return "pin/pin-update";
        }
        model.addAttribute("dungLuongPin", dungLuongPinService.findAll());
        long millis = System.currentTimeMillis();
        Date date = new java.sql.Date(millis);
        pin.setNgayCapNhat(date);
        pinService.update(id,pin);

        return "redirect:/pin/hien-thi";
    }

    @GetMapping("/remove-pin/{id}")
    public String delete(Model model, @PathVariable("id") UUID id, @RequestParam("pageNum") Optional<Integer> pageNum,
                         @RequestParam(name = "pageSize", required = false, defaultValue = "5") Integer pageSize, @ModelAttribute("Pin") Pin pin) {
        Sort sort = Sort.by("ma").ascending();
        Pageable pageable = PageRequest.of(pageNum.orElse(0), pageSize, sort);

        pinService.delete(id);
        Page<Pin> page = pinService.getAll(pageable);
        model.addAttribute("dungLuongPin", dungLuongPinService.findAll());
        model.addAttribute("list", page.getContent());
        model.addAttribute("page", page.getNumber());
        model.addAttribute("total", page.getTotalPages());
        return "pin/pin";
    }

    @GetMapping("/detail-pin/{id}")
    public String detail(Model model, @PathVariable("id") UUID id, @RequestParam("pageNum") Optional<Integer> pageNum,
                         @RequestParam(name = "pageSize", required = false, defaultValue = "5") Integer pageSize) {
        Pin sp = pinService.findById(id);
        model.addAttribute("Pin", sp);
        Sort sort = Sort.by("ma").ascending();
        Pageable pageable = PageRequest.of(pageNum.orElse(0), pageSize, sort);
        Page<Pin> page = pinService.getAll(pageable);
        model.addAttribute("dungLuongPin", dungLuongPinService.findAll());
        model.addAttribute("list", page.getContent());
        model.addAttribute("page", page.getNumber());
        model.addAttribute("total", page.getTotalPages());
        return "/pin/pin";
    }

    @GetMapping("/view-update-pin/{id}")
    public String viewUpdate(Model model, @PathVariable("id") UUID id) {
        Pin sp = pinService.findById(id);
        model.addAttribute("dungLuongPin", dungLuongPinService.findAll());
        model.addAttribute("Pin", sp);
        return "/pin/pin-update";
    }
}
