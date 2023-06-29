package com.example.demo.controller;

import com.example.demo.Model.HangSanPham;
import com.example.demo.Model.SanPham;

import com.example.demo.service.HangSanPhamService;
import com.example.demo.service.SanPhamService;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

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
        return hangSanPhamService.getAlll();
    }
    @GetMapping("/view-update/{id}")
    public String viewupdate(Model model, @PathVariable("id") UUID id){
        SanPham hsp=sanPhamService.getOne(id);
        model.addAttribute("dulieuxem",hsp);
        return "SanPham/update";
    }
    @PostMapping("/add")
    public String add(Model model,@ModelAttribute("dulieuxem") SanPham dulieuxem, @RequestParam("num")Optional<Integer> num,
                      @RequestParam(name = "size",defaultValue = "5",required = false)Integer size){
        sanPhamService.addvsupdate(dulieuxem);
        Pageable pageable= PageRequest.of(num.orElse(0),size );
        Page<SanPham> list=sanPhamService.getAll(pageable);
        model.addAttribute("hsp",list.getContent());
        model.addAttribute("total",list.getTotalPages());
        return "SanPham/hien-thi";
    }
    @PostMapping("/update/{id}")
    public String update(Model model,@ModelAttribute("dulieuxem") SanPham dulieuxem,@PathVariable("id") UUID id){
        SanPham hsp=sanPhamService.getOne(id);
        BeanUtils.copyProperties(dulieuxem,hsp);
        sanPhamService.addvsupdate(hsp);
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
