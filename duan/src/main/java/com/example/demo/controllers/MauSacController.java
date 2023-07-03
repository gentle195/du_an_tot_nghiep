package com.example.demo.controllers;

import com.example.demo.models.MauSac;
import com.example.demo.services.MauSacService;
import jakarta.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.sql.Date;
import java.util.Optional;
import java.util.UUID;

@Controller
@RequestMapping("/mau-sac")


public class MauSacController {
    @Autowired
    MauSacService mauSacService;

    @GetMapping("/hien-thi")
    public String hienThi(Model model, @ModelAttribute("ms") MauSac mauSac,
                          @RequestParam("num") Optional<Integer> num,// lần lượt làm di làm đi
                          @RequestParam(name = "tongDuLieu", required = false, defaultValue = "5") Integer tongDuLieu) {
        Sort sort = Sort.by("ma").ascending();

        Pageable pageable = PageRequest.of(num.orElse(0), tongDuLieu);

        mauSac.setTinhTrang(0);
        Page<MauSac> list = mauSacService.getAll(pageable);
        model.addAttribute("tongSoTrang", list.getTotalPages());
        model.addAttribute("duLieu", list.getContent());

        return "mau-sac/mau-sac";
    }

    @PostMapping("/add-mau-sac")
    public String addMauSac(Model model, @ModelAttribute("ms") @Valid MauSac mauSac,
                            BindingResult bindingResult
    ) {
        if (bindingResult.hasErrors()) {
            model.addAttribute("duLieu", mauSacService.getAll0());
            return "/mau-sac/mau-sac";
        }

        String maMS = "MMS" + mauSacService.findAll().size();
        mauSac.setMa(maMS);
        long millis = System.currentTimeMillis();
        Date date = new java.sql.Date(millis);
        mauSac.setNgayTao(date);
        mauSac.setNgayCapNhat(date);

        mauSac.setTinhTrang(0);
        mauSacService.add(mauSac);
        return "redirect:/mau-sac/hien-thi";
    }


    @GetMapping("/view-update-mau-sac/{id}")
    public String viewUpdate(Model model, @PathVariable("id") UUID id, @ModelAttribute("ms") MauSac mauSac) {


        model.addAttribute("ms", mauSacService.findById(id));

        return "mau-sac/mau-sac-update";
    }

    @PostMapping("/update-mau-sac")
    public String updateMauSac(Model model, @ModelAttribute("ms") @Valid MauSac mauSac,
                               BindingResult bindingResult) {
        if (bindingResult.hasErrors()) {
            mauSac = mauSacService.findById(mauSac.getId());
            return "mau-sac/mau-sac-update";
        }


        long millis = System.currentTimeMillis();
        Date date = new java.sql.Date(millis);
        mauSac.setNgayTao(date);
        mauSac.setNgayCapNhat(date);
        MauSac mauSac1 = mauSacService.findById(mauSac.getId());

        mauSacService.update(mauSac1.getId(), mauSac);
        return "redirect:/mau-sac/hien-thi";


    }

    @GetMapping("/remove-mau-sac/{id}")
    public String delete(Model model, @PathVariable("id") UUID id,
                         @ModelAttribute("ms") MauSac mauSac) {

        mauSacService.delete(id);
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
