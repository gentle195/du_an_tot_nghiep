package com.example.demo.controllers;

import com.example.demo.models.DungLuongPin;
import com.example.demo.services.DungLuongPinService;
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
@RequestMapping("/dung-luong-pin")
public class DungLuongPinController {

    @Autowired
    private DungLuongPinService service;

    @GetMapping("/hien-thi")
    public String hienThi(Model model, @ModelAttribute("DungLuongPin") DungLuongPin dungLuongPin,
                          @RequestParam("pageNum") Optional<Integer> pageNum,
                          @RequestParam(name = "pageSize", required = false, defaultValue = "5") Integer pageSize) {

        Sort sort = Sort.by("ngayTao").ascending();
        Pageable pageable = PageRequest.of(pageNum.orElse(0), pageSize, sort);
        Page<DungLuongPin> page = service.getAll(pageable);
        model.addAttribute("list", page.getContent());
        model.addAttribute("page", page.getNumber());
        model.addAttribute("total", page.getTotalPages());
        return "dungluongpin/dung-luong-pin";
    }

    @PostMapping("/add-dung-luong-pin")
    public String addDungLuongPin(Model model, @ModelAttribute("DungLuongPin") @Valid DungLuongPin dungLuongPin, BindingResult bindingResult, @RequestParam("pageNum") Optional<Integer> pageNum,
                                  @RequestParam(name = "pageSize", required = false, defaultValue = "5") Integer pageSize) {
        Sort sort = Sort.by("ngayTao").ascending();
        Pageable pageable = PageRequest.of(pageNum.orElse(0), pageSize, sort);
        Page<DungLuongPin> page = service.getAll(pageable);
        if (bindingResult.hasErrors()) {
            model.addAttribute("list", page.getContent());
            model.addAttribute("page", page.getNumber());
            model.addAttribute("total", page.getTotalPages());
            return "dungluongpin/dung-luong-pin";
        }

        long millis = System.currentTimeMillis();
        Date date = new java.sql.Date(millis);
        String ma = "DLP" + service.findAll().size();
        dungLuongPin.setMa(ma);
        dungLuongPin.setNgayTao(date);
        dungLuongPin.setTinhTrang(0);

        service.add(dungLuongPin);
        model.addAttribute("list", page.getContent());
        model.addAttribute("page", page.getNumber());
        model.addAttribute("total", page.getTotalPages());
        return "redirect:/dung-luong-pin/hien-thi";
    }

    @PostMapping("/update-dung-luong-pin/{id}")
    public String updateDungLuongPin(Model model, @PathVariable("id") UUID id, @ModelAttribute("DungLuongPin")@Valid DungLuongPin dungLuongPin,BindingResult bindingResult, @RequestParam("pageNum") Optional<Integer> pageNum,
                                     @RequestParam(name = "pageSize", required = false, defaultValue = "5") Integer pageSize) {
        if (bindingResult.hasErrors()) {
            return "dungluongpin/dung-luong-pin-update";
        }

        long millis = System.currentTimeMillis();
        Date date = new java.sql.Date(millis);
        dungLuongPin.setNgayCapNhat(date);
        service.update(id, dungLuongPin);

        return "redirect:/dung-luong-pin/hien-thi";
    }

    @GetMapping("/remove-dung-luong-pin/{id}")
    public String delete(Model model, @PathVariable("id") UUID id, @RequestParam("pageNum") Optional<Integer> pageNum,
                         @RequestParam(name = "pageSize", required = false, defaultValue = "5") Integer pageSize, @ModelAttribute("DungLuongPin") DungLuongPin dungLuongPin) {
        Sort sort = Sort.by("ngayTao").ascending();
        Pageable pageable = PageRequest.of(pageNum.orElse(0), pageSize, sort);
        service.delete(id);
        Page<DungLuongPin> page = service.getAll(pageable);
        model.addAttribute("list", page.getContent());
        model.addAttribute("page", page.getNumber());
        model.addAttribute("total", page.getTotalPages());
        return "dungluongpin/dung-luong-pin";
    }

    @GetMapping("/detail-dung-luong-pin/{id}")
    public String detail(Model model, @PathVariable("id") UUID id, @RequestParam("pageNum") Optional<Integer> pageNum,
                         @RequestParam(name = "pageSize", required = false, defaultValue = "5") Integer pageSize, @ModelAttribute("DungLuongPin") DungLuongPin dungLuongPin) {
        DungLuongPin sp = service.findById(id);
        model.addAttribute("DungLuongPin", sp);
        Sort sort = Sort.by("ngayTao").ascending();
        Pageable pageable = PageRequest.of(pageNum.orElse(0), pageSize, sort);
        Page<DungLuongPin> page = service.getAll(pageable);
        model.addAttribute("list", page.getContent());
        model.addAttribute("page", page.getNumber());
        model.addAttribute("total", page.getTotalPages());
        return "dungluongpin/dung-luong-pin";
    }

    @GetMapping("/view-update-dung-luong-pin/{id}")
    public String viewUpdate(Model model, @PathVariable("id") UUID id) {
        DungLuongPin sp = service.findById(id);
        model.addAttribute("DungLuongPin", sp);
        return "dungluongpin/dung-luong-pin-update";
    }

//    @PostMapping("/search-pin")
//    public String search(Model model, @RequestParam("tenTk") String ten, @ModelAttribute("pin") DungLuongPin pin, @RequestParam("pageNum") Optional<Integer> pageNum,
//                         @RequestParam(name = "pageSize", required = false, defaultValue = "3") Integer pageSize) {
//        List<DungLuongPin> listTk = new ArrayList<>();
//        Sort sort = Sort.by("ma").ascending();
//        Pageable pageable = PageRequest.of(pageNum.orElse(0), pageSize, sort);
//        Page<DungLuongPin> page = service.getAll(pageable);
//        for (DungLuongPin sp : page
//        ) {
//            if (sp.getTen().contains(ten)) {
//                listTk = service.search(ten);
//            }
//        }
//        model.addAttribute("list", listTk);
//        model.addAttribute("page",page.getNumber());
//        model.addAttribute("total", page.getTotalPages());
//        return "pin";
//    }
}
