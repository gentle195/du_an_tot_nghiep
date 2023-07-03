package com.example.demo.controllers;

import com.example.demo.models.MucQuyDoi;
import com.example.demo.services.impl.MucQuyDoiServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.UUID;

@Controller
@RequestMapping("/muc-quy-doi")
public class MucQuyDoiController {

    @Autowired
    private MucQuyDoiServiceImpl mucQuyDoiService;

    private Page<MucQuyDoi> listMucQuyDoi;

    @GetMapping("/hien-thi")
    public String viewAll(Model model,
                          @RequestParam(defaultValue = "1", name = "page") int page) {
        if (page < 1) page = 1;
        Pageable pageable = PageRequest.of(page - 1, 5);
        listMucQuyDoi = mucQuyDoiService.getAll(pageable);
        model.addAttribute("listMucQuyDoi", listMucQuyDoi);
        return "muc-quy-doi/muc-quy-doi";
    }

    @GetMapping("/view-add")
    public String viewAdd(Model model){
        model.addAttribute("mucQuyDoi", new MucQuyDoi());
        return "muc-quy-doi/add-muc-quy-doi";
    }

    @PostMapping("/add")
    public String add(@ModelAttribute(name = "mucQuyDoi") MucQuyDoi mucQuyDoi){
        mucQuyDoiService.add(mucQuyDoi);
        return "redirect:/muc-quy-doi/hien-thi";
    }

    @GetMapping("/detail/{id}")
    public String detail(Model model,
                         @PathVariable(name = "id") UUID id){
        MucQuyDoi mucQuyDoi = mucQuyDoiService.findById(id);
        model.addAttribute("mucQuyDoi", mucQuyDoi);
        return "muc-quy-doi/detail-muc-quy-doi";
    }

    @PostMapping("/update/{id}")
    public String update(@ModelAttribute(name = "mucQuyDoi") MucQuyDoi mucQuyDoi){
        mucQuyDoiService.add(mucQuyDoi);
        return "redirect:/muc-quy-doi/hien-thi";
    }

    @GetMapping("/delete/{id}")
    public String delete(@PathVariable(name = "id") UUID id){
        mucQuyDoiService.delete(id);
        return "redirect:/muc-quy-doi/hien-thi";
    }
}
