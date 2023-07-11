package com.example.demo.controllers;

import com.example.demo.models.ChucVu;
import com.example.demo.models.NhanVien;
import com.example.demo.repositories.ChucVuRepository;
import com.example.demo.services.impl.NhanVienServiceImpl;
import jakarta.validation.Valid;
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
        Sort sort = Sort.by("ma").ascending();
        if (page < 1) page = 1;
        Pageable pageable = PageRequest.of(page - 1, 5, sort);
        listNhanVien = nhanVienService.getAllNhanVien(pageable);
        model.addAttribute("listNhanVien", listNhanVien);
        return "nhan-vien/nhan-vien";
    }

    @GetMapping("/view-add")
    public String viewAdd(Model model){
        List<ChucVu> listChucVu = chucVuRepository.findAll();
        model.addAttribute("listChucVu", listChucVu);
        model.addAttribute("nhanVien", new NhanVien());
        return "nhan-vien/nhan-vien-add";
    }

    @PostMapping("/add")
    public String add(@Valid @ModelAttribute(name = "nhanVien") NhanVien nhanVien, BindingResult bindingResult, Model model) {
        if (bindingResult.hasErrors()){
            List<ChucVu> listChucVu = chucVuRepository.findAll();
            model.addAttribute("listChucVu", listChucVu);
            return "nhan-vien/nhan-vien-add";
        }
//        if(nhanVienService.existsByPhoneNumber(nhanVien.getSdt())){
//            return "nhan-vien/nhan-vien-add";
//        }
        String maNV = "NV" + nhanVienService.findAll().size() + 1;
        nhanVien.setMa(maNV);
        nhanVien.setNgayTao(Date.valueOf(LocalDate.now()));
        nhanVienService.add(nhanVien);
        return "redirect:/nhan-vien/hien-thi";
    }

    @GetMapping("/detail/{id}")
    public String detail(@PathVariable(name = "id") UUID id,
                         Model model){
        List<ChucVu> listChucVu = chucVuRepository.findAll();
        model.addAttribute("listChucVu", listChucVu);
        NhanVien nhanVien = nhanVienService.getById(id);
        model.addAttribute("nhanVien", nhanVien);
        return "nhan-vien/nhan-vien-detail";
    }

    @GetMapping("/delete/{id}")
    public String delete(@PathVariable(name = "id") UUID id){
        nhanVienService.delete(id);
        return "redirect:/nhan-vien/hien-thi";
    }

    @PostMapping("/update/{id}")
    public String update(@ModelAttribute(name = "nhanVien") NhanVien nhanVien,
                         @PathVariable(name = "id") UUID id){
        nhanVien.setId(id);
        nhanVien.setNgayCapNhat(Date.valueOf(LocalDate.now()));
        nhanVienService.update(id, nhanVien);
        return "redirect:/nhan-vien/hien-thi";
    }
}
