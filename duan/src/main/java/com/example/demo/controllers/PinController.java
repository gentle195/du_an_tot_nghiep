package com.example.demo.controllers;

import com.example.demo.models.Pin;
import com.example.demo.services.DungLuongPinService;
import com.example.demo.services.PinService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

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
        Page<Pin> page = pinService.getAllByPages(pageable);
        model.addAttribute("dungLuongPin", dungLuongPinService.getList());
        model.addAttribute("list", page.getContent());
        model.addAttribute("page", page.getNumber());
        model.addAttribute("total", page.getTotalPages());
        return "pin/pin";
    }

    @PostMapping("/add-pin")
    public String addPin(Model model, @ModelAttribute("Pin") Pin pin, @RequestParam("pageNum") Optional<Integer> pageNum,
                             @RequestParam(name = "pageSize", required = false, defaultValue = "5") Integer pageSize) {
        pinService.add(pin);
        Sort sort = Sort.by("ma").ascending();
        Pageable pageable = PageRequest.of(pageNum.orElse(0), pageSize, sort);
        Page<Pin> page = pinService.getAllByPages(pageable);
        model.addAttribute("dungLuongPin", dungLuongPinService.getList());
        model.addAttribute("list", page.getContent());
        model.addAttribute("page", page.getNumber());
        model.addAttribute("total", page.getTotalPages());
        return "pin/pin";
    }

    @PostMapping("/update-pin/{id}")
    public String updatePin(Model model, @PathVariable("id") UUID id, @ModelAttribute("Pin") Pin pin, @RequestParam("pageNum") Optional<Integer> pageNum,
                                @RequestParam(name = "pageSize", required = false, defaultValue = "3") Integer pageSize) {

        pinService.update(pin, id);
        Sort sort = Sort.by("ma").ascending();
        Pageable pageable = PageRequest.of(pageNum.orElse(0), pageSize, sort);
        Page<Pin> page = pinService.getAllByPages(pageable);
        model.addAttribute("dungLuongPin", dungLuongPinService.getList());
        model.addAttribute("list", page.getContent());
        model.addAttribute("page", page.getNumber());
        model.addAttribute("total", page.getTotalPages());
        return "pin/pin";
    }

    @GetMapping("/remove-pin/{id}")
    public String delete(Model model, @PathVariable("id") UUID id, @RequestParam("pageNum") Optional<Integer> pageNum,
                         @RequestParam(name = "pageSize", required = false, defaultValue = "5") Integer pageSize, @ModelAttribute("Pin") Pin pin) {
        Sort sort = Sort.by("ma").ascending();
        Pageable pageable = PageRequest.of(pageNum.orElse(0), pageSize, sort);

        pinService.remove(id);
        Page<Pin> page = pinService.getAllByPages(pageable);
        model.addAttribute("dungLuongPin", dungLuongPinService.getList());
        model.addAttribute("list", page.getContent());
        model.addAttribute("page", page.getNumber());
        model.addAttribute("total", page.getTotalPages());
        return "pin/pin";
    }

    @GetMapping("/detail-pin/{id}")
    public String detail(Model model, @PathVariable("id") UUID id, @RequestParam("pageNum") Optional<Integer> pageNum,
                         @RequestParam(name = "pageSize", required = false, defaultValue = "5") Integer pageSize) {
        Pin sp = pinService.getOne(id);
        model.addAttribute("Pin", sp);
        Sort sort = Sort.by("ma").ascending();
        Pageable pageable = PageRequest.of(pageNum.orElse(0), pageSize, sort);
        Page<Pin> page = pinService.getAllByPages(pageable);
        model.addAttribute("dungLuongPin", dungLuongPinService.getList());
        model.addAttribute("list", page.getContent());
        model.addAttribute("page", page.getNumber());
        model.addAttribute("total", page.getTotalPages());
        return "/pin/pin";
    }

    @GetMapping("/view-update-pin/{id}")
    public String viewUpdate(Model model, @PathVariable("id") UUID id) {
        Pin sp = pinService.getOne(id);
        model.addAttribute("dungLuongPin", dungLuongPinService.getList());
        model.addAttribute("Pin", sp);
        return "/pin/pin-update";
    }
}
