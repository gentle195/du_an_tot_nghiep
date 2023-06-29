package com.example.demo.controller;

import com.example.demo.Model.Rom;
import com.example.demo.service.RomService;
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
@RequestMapping("/rom")
public class RomController {
    @Autowired
    RomService romService;

    @GetMapping("hien-thi")
    public String hienthi(@ModelAttribute("dulieuxem") Rom dulieuxem, Model model, @RequestParam("num") Optional<Integer> num,
                          @RequestParam(name = "size",defaultValue = "5",required = false)Integer size){
        Pageable pageable= PageRequest.of(num.orElse(0),size );
        Page<Rom> list=romService.getAll(pageable);
        model.addAttribute("hsp",list.getContent());
        model.addAttribute("total",list.getTotalPages());
        return "Rom/hien-thi";
    }

    @GetMapping("/view-update/{id}")
    public String viewupdate(Model model, @PathVariable("id") UUID id){
        Rom hsp=romService.getOne(id);
        model.addAttribute("dulieuxem",hsp);
        return "Rom/update";
    }
    @PostMapping("/add")
    public String add(Model model,@ModelAttribute("dulieuxem") Rom dulieuxem, @RequestParam("num")Optional<Integer> num,
                      @RequestParam(name = "size",defaultValue = "5",required = false)Integer size){
        romService.AddandUpdate(dulieuxem);
        Pageable pageable= PageRequest.of(num.orElse(0),size );
        Page<Rom> list=romService.getAll(pageable);
        model.addAttribute("hsp",list.getContent());
        model.addAttribute("total",list.getTotalPages());
        return "redirect:/rom/hien-thi";
    }
    @PostMapping("/update/{id}")
    public String update(Model model,@ModelAttribute("dulieuxem") Rom dulieuxem,@PathVariable("id") UUID id){
        Rom hsp=romService.getOne(id);
        BeanUtils.copyProperties(dulieuxem,hsp);
        romService.AddandUpdate(hsp);
        return "redirect:/rom/hien-thi";
    }
    @GetMapping("/delete/{id}")
    public String delete(Model model,@ModelAttribute("dulieuxem") Rom dulieuxem,@PathVariable("id") UUID id,@RequestParam("num")Optional<Integer> num,
                         @RequestParam(name = "size",defaultValue = "5",required = false)Integer size){
        romService.delete(id);
        Pageable pageable= PageRequest.of(num.orElse(0),size );
        Page<Rom> list=romService.getAll(pageable);
        model.addAttribute("hsp",list.getContent());
        model.addAttribute("total",list.getTotalPages());
        return "Rom/hien-thi";

    }
}
