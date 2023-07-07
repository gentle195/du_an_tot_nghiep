package com.example.demo.controllers;

import com.example.demo.models.MucQuyDoi;
import com.example.demo.services.impl.MucQuyDoiServiceImpl;
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
        Sort sort = Sort.by("soDiem").ascending();
        if (page < 1) page = 1;
        Pageable pageable = PageRequest.of(page - 1, 5, sort);
        listMucQuyDoi = mucQuyDoiService.getAllMucQuyDoi(pageable);
        model.addAttribute("listMucQuyDoi", listMucQuyDoi);
        return "muc-quy-doi/muc-quy-doi";
    }

    @GetMapping("/view-add")
    public String viewAdd(Model model) {
        model.addAttribute("mucQuyDoi", new MucQuyDoi());
        return "muc-quy-doi/muc-quy-doi-add";
    }

    @PostMapping("/add")
    public String add(@Valid @ModelAttribute(name = "mucQuyDoi") MucQuyDoi mucQuyDoi, BindingResult bindingResult) {
        if (bindingResult.hasErrors()){
            return "muc-quy-doi/muc-quy-doi-add";
        }
        long millis = System.currentTimeMillis();
        Date date = new Date(millis);
        mucQuyDoi.setNgayTao(date);
        mucQuyDoiService.add(mucQuyDoi);
        return "redirect:/muc-quy-doi/hien-thi";
    }

    @GetMapping("/detail/{id}")
    public String detail(Model model,
                         @PathVariable(name = "id") UUID id) {
        MucQuyDoi mucQuyDoi = mucQuyDoiService.getById(id);
        model.addAttribute("mucQuyDoi", mucQuyDoi);
        return "muc-quy-doi/muc-quy-doi-detail";
    }

    @PostMapping("/update/{id}")
    public String update(@ModelAttribute(name = "mucQuyDoi") MucQuyDoi mucQuyDoi,
                         @PathVariable(name = "id") UUID id) {
        mucQuyDoi.setId(id);
        long millis = System.currentTimeMillis();
        Date date = new Date(millis);
        mucQuyDoi.setNgayCapNhat(date);
        mucQuyDoiService.update(id, mucQuyDoi);
        return "redirect:/muc-quy-doi/hien-thi";
    }

    @GetMapping("/delete/{id}")
    public String delete(@PathVariable(name = "id") UUID id) {
        mucQuyDoiService.delete(id);
        return "redirect:/muc-quy-doi/hien-thi";
    }
}
