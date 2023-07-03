package com.example.demo.controllers;

import com.example.demo.models.ChucVu;
import com.example.demo.services.impl.ChucVuServiceImpl;
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

import java.util.UUID;

@Controller
@RequestMapping("/chuc-vu")
public class ChucVuController {

    @Autowired
    private ChucVuServiceImpl chucVuService;

    private Page<ChucVu> listChucVu;

    @GetMapping("/hien-thi")
    public String viewAll(Model model,
                          @RequestParam(defaultValue = "0", name = "page") int page) {
        Sort sort = Sort.by("ma").ascending();
        if (page < 1) page = 1;
        Pageable pageable = PageRequest.of(page - 1, 5, sort);
        listChucVu = chucVuService.getAllByPages(pageable);
        model.addAttribute("listChucVu", listChucVu);
        return "chuc-vu/chuc-vu";
    }

    @GetMapping("/view-add")
    public String viewAdd(Model model){
        model.addAttribute("chucVu", new ChucVu());
        return "chuc-vu/chuc-vu-add";
    }

    @PostMapping("/add")
    public String add(@Valid @ModelAttribute(name = "chucVu") ChucVu chucVu, BindingResult bindingResult){
        if(bindingResult.hasErrors()){
            return "chuc-vu/chuc-vu-add";
        }
        chucVuService.add(chucVu);
        return "redirect:/chuc-vu/hien-thi";
    }

    @GetMapping("/detail/{id}")
    public String detail(Model model,
            @PathVariable(name = "id") UUID id){
        ChucVu chucVu = chucVuService.getById(id);
        System.out.println(chucVu.toString());
        model.addAttribute("chucVu", chucVu);
        return "chuc-vu/chuc-vu-detail";
    }

    @PostMapping("/update/{id}")
    public String update(@ModelAttribute(name = "chucVu") ChucVu chucVu,
                         @PathVariable(name = "id") UUID id){
        chucVu.setId(id);
        chucVuService.update(id, chucVu);
        return "redirect:/chuc-vu/hien-thi";
    }

    @GetMapping("/delete/{id}")
    public String delete(@PathVariable(name = "id") UUID id){
        chucVuService.delete(id);
        return "redirect:/chuc-vu/hien-thi";
    }
}
