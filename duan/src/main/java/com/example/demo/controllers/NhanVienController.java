package com.example.demo.controllers;

import com.example.demo.models.ChucVu;
import com.example.demo.models.NhanVien;
import com.example.demo.repositories.ChucVuRepository;
import com.example.demo.services.impl.NhanVienServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.UUID;

@Controller
@RequestMapping("/nhan-vien")
public class NhanVienController {

    @Autowired
    private NhanVienServiceImpl nhanVienService;

    @Autowired
    private ChucVuRepository chucVuRepository;

    private Page<NhanVien> listNhanVien;

    @GetMapping("/hien-thi")
    public String viewAll(Model model,
                          @RequestParam(name = "page", defaultValue = "1") int page){
        if (page < 1) page = 1;
        Pageable pageable = PageRequest.of(page - 1, 5);
        listNhanVien = nhanVienService.getAll(pageable);
        model.addAttribute("listNhanVien", listNhanVien);
        return "nhan-vien/nhan-vien";
    }

    @GetMapping("/view-add")
    public String viewAdd(Model model){
        List<ChucVu> listChucVu = chucVuRepository.findAll();
        model.addAttribute("listChucVu", listChucVu);
        model.addAttribute("nhanVien", new NhanVien());
        return "nhan-vien/add-nhan-vien";
    }

    @PostMapping("/add")
    public String add(@ModelAttribute(name = "nhanVien") NhanVien nhanVien) {
        nhanVienService.add(nhanVien);
        return "redirect:/nhan-vien/hien-thi";
    }

    @GetMapping("/detail/{id}")
    public String detail(@PathVariable(name = "id") UUID id,
                         Model model){
        List<ChucVu> listChucVu = chucVuRepository.findAll();
        model.addAttribute("listChucVu", listChucVu);
        nhanVienService.getById(id);
        return "nhan-vien/detail-nhan-vien";
    }

    @GetMapping("/delete/{id}")
    public String delete(@PathVariable(name = "id") UUID id){
        nhanVienService.delete(id);
        return "redirect:/nhan-vien/hien-thi";
    }

    @PostMapping("/update/{id}")
    public String update(@ModelAttribute(name = "nhanVien") NhanVien nhanVien){
        nhanVienService.update(nhanVien);
        return "redirect:/nhan-vien/hien-thi";
    }
}
