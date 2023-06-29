package com.example.demo.controller;

import com.example.demo.Model.HangSanPham;
import com.example.demo.service.HangSanPhamService;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.Optional;
import java.util.UUID;

@Controller
@RequestMapping("/hang-san-pham")
public class HangSanPhamController {
    @Autowired
    HangSanPhamService hangSanPhamService;
    @GetMapping("hien-thi")
public String hienthi(@ModelAttribute("dulieuxem") HangSanPham dulieuxem, Model model, @RequestParam("num")Optional<Integer> num,
                      @RequestParam(name = "size",defaultValue = "5",required = false)Integer size){
    Pageable pageable= PageRequest.of(num.orElse(0),size );
    Page<HangSanPham> list=hangSanPhamService.getAll(pageable);
    model.addAttribute("hsp",list.getContent());
    model.addAttribute("total",list.getTotalPages());
    return "HangSanPham/hien-thi";
}
@GetMapping("/view-update/{id}")
    public String viewupdate(Model model, @PathVariable("id")UUID id){
     HangSanPham hsp=hangSanPhamService.getOne(id);
     model.addAttribute("dulieuxem",hsp);
return "HangSanPham/update";
}
@PostMapping("/add")
    public String add(Model model,@ModelAttribute("dulieuxem") HangSanPham dulieuxem, @RequestParam("num")Optional<Integer> num,
                      @RequestParam(name = "size",defaultValue = "5",required = false)Integer size){
hangSanPhamService.AddandUpdate(dulieuxem);
    Pageable pageable= PageRequest.of(num.orElse(0),size );
    Page<HangSanPham> list=hangSanPhamService.getAll(pageable);
    model.addAttribute("hsp",list.getContent());
    model.addAttribute("total",list.getTotalPages());
return "HangSanPham/hien-thi";
}
@PostMapping("/update/{id}")
    public String update(Model model,@ModelAttribute("dulieuxem") HangSanPham dulieuxem,@PathVariable("id") UUID id){
HangSanPham hsp=hangSanPhamService.getOne(id);
    BeanUtils.copyProperties(dulieuxem,hsp);
hangSanPhamService.AddandUpdate(hsp);
return "redirect:/hang-san-pham/hien-thi";
}
@GetMapping("/delete/{id}")
    public String delete(Model model,@ModelAttribute("dulieuxem") HangSanPham dulieuxem,@PathVariable("id") UUID id,@RequestParam("num")Optional<Integer> num,
                         @RequestParam(name = "size",defaultValue = "5",required = false)Integer size){
        hangSanPhamService.delete(id);
    Pageable pageable= PageRequest.of(num.orElse(0),size );
    Page<HangSanPham> list=hangSanPhamService.getAll(pageable);
    model.addAttribute("hsp",list.getContent());
    model.addAttribute("total",list.getTotalPages());
    return "HangSanPham/hien-thi";

}
}
