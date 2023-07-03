package com.example.demo.controllers;

import com.example.demo.models.HangSanPham;
import com.example.demo.models.SanPham;

import com.example.demo.services.HangSanPhamService;
import com.example.demo.services.SanPhamService;
import jakarta.validation.Valid;
import org.springframework.beans.BeanUtils;
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
import java.util.Optional;
import java.util.UUID;

@Controller
@RequestMapping("/san-pham")
public class SanPhamController {
@Autowired
SanPhamService sanPhamService;
@Autowired
HangSanPhamService hangSanPhamService;

    @GetMapping("hien-thi")
    public String hienthi(@ModelAttribute("dulieuxem") SanPham dulieuxem, Model model, @RequestParam("num") Optional<Integer> num,
                          @RequestParam(name = "size",defaultValue = "5",required = false)Integer size){
        Pageable pageable= PageRequest.of(num.orElse(0),size );
        Page<SanPham> list=sanPhamService.getAll(pageable);
        model.addAttribute("hsp",list.getContent());
        model.addAttribute("total",list.getTotalPages());
        return "SanPham/hien-thi";
    }
    @ModelAttribute("hangsp")
    public List<HangSanPham> hsp(){
        return hangSanPhamService.findAll();
    }
    @GetMapping("/view-update/{id}")
    public String viewupdate(Model model, @PathVariable("id") UUID id){
        SanPham hsp=sanPhamService.findById(id);
        model.addAttribute("dulieuxem",hsp);
        return "SanPham/update";
    }
    @PostMapping("/add")
    public String add(Model model, @ModelAttribute("dulieuxem") @Valid SanPham dulieuxem, BindingResult bindingResult, @RequestParam("num")Optional<Integer> num,
                      @RequestParam(name = "size",defaultValue = "5",required = false)Integer size) {
        if (bindingResult.hasErrors()) {
            model.addAttribute("content", "SanPham/hien-thi.jsp");
            Sort sort=Sort.by("ngayTao").ascending();
            Pageable pageable= PageRequest.of(num.orElse(0),size,sort );
            Page<SanPham> list=sanPhamService.getAll(pageable);
            model.addAttribute("hsp",list.getContent());
            model.addAttribute("total",list.getTotalPages());
            return "SanPham/hien-thi";
        }

        dulieuxem.setNgayTao(Date.valueOf(LocalDate.now()));
        dulieuxem.setMa("SP" + String.valueOf(hangSanPhamService.findAll().size() + 1));

        sanPhamService.add(dulieuxem);

        return "redirect:/san-pham/hien-thi";
        // Tiếp tục xử lý và trả về view tương ứng
    }
    @PostMapping("/update/{id}")
    public String update(Model model, @ModelAttribute("dulieuxem") @Valid SanPham dulieuxem, BindingResult bindingResult, @PathVariable("id") UUID id){
        if (bindingResult.hasErrors()) {
            model.addAttribute("content", "SanPham/update.jsp");

            return "SanPham/update";
        }

        SanPham hsp=sanPhamService.findById(id);
        Date ngayTao = hsp.getNgayTao();

        hsp.setTen(dulieuxem.getTen());
        hsp.setNgayTao(ngayTao);
        // Gán ngày hiện tại
        hsp.setNgayCapNhat(Date.valueOf(LocalDate.now()));
        hsp.setTinhTrang(dulieuxem.getTinhTrang());
        hsp.setMoTa(dulieuxem.getMoTa());
        sanPhamService.add(hsp);
        return "redirect:/san-pham/hien-thi";
    }
    @GetMapping("/delete/{id}")
    public String delete(Model model,@ModelAttribute("dulieuxem") SanPham dulieuxem,@PathVariable("id") UUID id,@RequestParam("num")Optional<Integer> num,
                         @RequestParam(name = "size",defaultValue = "5",required = false)Integer size){
        sanPhamService.delete(id);
        Pageable pageable= PageRequest.of(num.orElse(0),size );
        Page<SanPham> list=sanPhamService.getAll(pageable);
        model.addAttribute("hsp",list.getContent());
        model.addAttribute("total",list.getTotalPages());
        return "SanPham/hien-thi";

    }
}
