package com.example.demo.controller;

import com.example.demo.Model.DungLuongPin;
import com.example.demo.service.DungLuongPinService;
import org.springframework.beans.BeanUtils;
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
@RequestMapping("/dung-luong-pin")
public class DungLuongPinController {

    @Autowired
    private DungLuongPinService service;

    @GetMapping("/hien-thi")
    public String hienThi(Model model, @ModelAttribute("DungLuongPin") DungLuongPin dungLuongPin,
                          @RequestParam("pageNum") Optional<Integer> pageNum,
                          @RequestParam(name = "pageSize", required = false, defaultValue = "5") Integer pageSize) {

        Sort sort = Sort.by("ma").ascending();
        Pageable pageable = PageRequest.of(pageNum.orElse(0), pageSize, sort);
        Page<DungLuongPin> page = service.getAllByPages(pageable);
        model.addAttribute("list", page.getContent());
        model.addAttribute("page", page.getNumber());
        model.addAttribute("total", page.getTotalPages());
        return "dungluongpin/dung-luong-pin";
    }

    @PostMapping("/add-dung-luong-pin")
    public String addDungLuongPin(Model model, @ModelAttribute("DungLuongPin") DungLuongPin dungLuongPin, @RequestParam("pageNum") Optional<Integer> pageNum,
                             @RequestParam(name = "pageSize", required = false, defaultValue = "5") Integer pageSize) {
        service.add(dungLuongPin);
        Sort sort = Sort.by("ma").ascending();
        Pageable pageable = PageRequest.of(pageNum.orElse(0), pageSize, sort);
        Page<DungLuongPin> page = service.getAllByPages(pageable);
        model.addAttribute("list", page.getContent());
        model.addAttribute("page", page.getNumber());
        model.addAttribute("total", page.getTotalPages());
        return "dungluongpin/dung-luong-pin";
    }

    @PostMapping("/update-dung-luong-pin/{id}")
    public String updateDungLuongPin(Model model, @PathVariable("id") UUID id, @ModelAttribute("DungLuongPin") DungLuongPin dungLuongPin, @RequestParam("pageNum") Optional<Integer> pageNum,
                                @RequestParam(name = "pageSize", required = false, defaultValue = "5") Integer pageSize) {
        service.update(dungLuongPin, id);
        Sort sort = Sort.by("ma").ascending();
        Pageable pageable = PageRequest.of(pageNum.orElse(0), pageSize, sort);
        Page<DungLuongPin> page = service.getAllByPages(pageable);
        model.addAttribute("list", page.getContent());
        model.addAttribute("page", page.getNumber());
        model.addAttribute("total", page.getTotalPages());
       return "dungluongpin/dung-luong-pin";
    }

    @GetMapping("/remove-dung-luong-pin/{id}")
    public String delete(Model model, @PathVariable("id") UUID id, @RequestParam("pageNum") Optional<Integer> pageNum,
                         @RequestParam(name = "pageSize", required = false, defaultValue = "5") Integer pageSize, @ModelAttribute("DungLuongPin") DungLuongPin dungLuongPin) {
        Sort sort = Sort.by("ma").ascending();
        Pageable pageable = PageRequest.of(pageNum.orElse(0), pageSize, sort);
        service.remove(id);
        Page<DungLuongPin> page = service.getAllByPages(pageable);
        model.addAttribute("list", page.getContent());
        model.addAttribute("page", page.getNumber());
        model.addAttribute("total", page.getTotalPages());
        return "dungluongpin/dung-luong-pin";
    }

    @GetMapping("/detail-dung-luong-pin/{id}")
    public String detail(Model model, @PathVariable("id") UUID id, @RequestParam("pageNum") Optional<Integer> pageNum,
                         @RequestParam(name = "pageSize", required = false, defaultValue = "5") Integer pageSize,@ModelAttribute("DungLuongPin") DungLuongPin dungLuongPin) {
        DungLuongPin sp = service.getOne(id);
        model.addAttribute("DungLuongPin", sp);
        Sort sort = Sort.by("ma").ascending();
        Pageable pageable = PageRequest.of(pageNum.orElse(0), pageSize, sort);
        Page<DungLuongPin> page = service.getAllByPages(pageable);
        model.addAttribute("list", page.getContent());
        model.addAttribute("page", page.getNumber());
        model.addAttribute("total", page.getTotalPages());
        return "dungluongpin/dung-luong-pin";
    }

    @GetMapping("/view-update-dung-luong-pin/{id}")
    public String viewUpdate(Model model, @PathVariable("id") UUID id) {
        DungLuongPin sp = service.getOne(id);
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
