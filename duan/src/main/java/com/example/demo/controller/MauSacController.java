package com.example.demo.controller;

import com.example.demo.Model.MauSac;
import com.example.demo.service.MauSacService;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;
import java.util.UUID;

@Controller
@RequestMapping("/mau-sac")


public class MauSacController {
    @Autowired
    MauSacService mauSacService;

    @GetMapping("/hien-thi")
    public String hienThi(Model model, @ModelAttribute("ms") MauSac mauSac
    ) {

        mauSac.setTinhTrang(0);
        model.addAttribute("duLieu", mauSacService.getAllMauSac());

        return "mau-sac/mau-sac";
    }

    @PostMapping("/add-mau-sac")
    public String addMauSac(Model model, @ModelAttribute("ms") MauSac mauSac
    ) {
        mauSacService.addOrUpdate(mauSac);
        return "redirect:/mau-sac/hien-thi";
    }

    @GetMapping("/view-update-mau-sac/{id}")
    public String viewUpdate(Model model, @PathVariable("id") UUID id, @ModelAttribute("ms") MauSac mauSac) {

//        mauSac.setTinhTrang(0);
        model.addAttribute("ms", mauSacService.getOne(id));

        return "mau-sac/mau-sac-update";
    }

    @PostMapping("/update-mau-sac")
    public String updateMauSac(Model model, @ModelAttribute("ms") MauSac mauSac) {


        mauSacService.addOrUpdate(mauSac);

        return "redirect:/mau-sac/hien-thi";
    }

    @GetMapping("/remove-mau-sac/{id}")
    public String delete(Model model, @PathVariable("id") UUID id,
                         @ModelAttribute("ms") MauSac mauSac) {

        mauSacService.remove(id);
        return "redirect:/mau-sac/hien-thi";
    }

//    @PostMapping("/search-mau-sac")
//    public String search(Model model, @RequestParam("tenTk") String ten, @ModelAttribute("mauSac") MauSac mauSac
//                    ) {
//        List<MauSac> listTk = new ArrayList<>();
//
//       List<MauSac> mauSacList = mauSacService.getAllMauSac();
//        for (MauSac sp : mauSacList
//        ) {
//            if (sp.getTen().contains(ten)) {
//                listTk = mauSacService.search(ten);
//            }
//        }
//        model.addAttribute("duLieu", listTk);
//
//        return "mau-sac";
//    }
}




