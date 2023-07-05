package com.example.demo.controllers;

import com.example.demo.models.HangKhachHang;
import com.example.demo.services.HangKhachHangService;
import jakarta.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import java.sql.Date;
import java.util.UUID;

@Controller
@RequestMapping("/hang-khach-hang")
public class HangKhachHangController {
    @Autowired
    HangKhachHangService hangKhachHangService;


    @GetMapping("/hien-thi")
    public String hienThi(
            Model model,
            @ModelAttribute("hkh") HangKhachHang hangKhachHang


    ) {


        model.addAttribute("dulieu", hangKhachHangService.getALL0());
        model.addAttribute("tong", hangKhachHangService.getALL0().size());
        return "hang-khach-hang/hang-khach-hang";
    }


    @GetMapping("/remove/{id}")

    public String remove(Model model,
                         @PathVariable("id") UUID id

    ) {
        HangKhachHang hangKhachHang=hangKhachHangService.findById(id);
        hangKhachHang.setTinhTrang(1);
        hangKhachHangService.add(hangKhachHang);
        return "redirect:/hang-khach-hang/hien-thi";
    }


    @GetMapping("/view-update/{id}")

    public String viewUpdate(Model model,
                             @PathVariable("id") UUID id,
                             @ModelAttribute("hkh")HangKhachHang hangKhachHang

    ) {

        model.addAttribute("hkh", hangKhachHangService.findById(id));

        return "hang-khach-hang/hang-khach-hang-update";
    }


    @PostMapping("/update")
    public String updateDongSP(Model model,
                               @ModelAttribute("hkh")@Valid HangKhachHang hangKhachHang,
                               BindingResult bindingResult
    ) {
        System.out.println("ttttttt----"+hangKhachHang.getMa());
        if(bindingResult.hasErrors()){
            hangKhachHang=hangKhachHangService.findById(hangKhachHang.getId());
            return "hang-khach-hang/hang-khach-hang-update";
        }


        long millis = System.currentTimeMillis();
        java.sql.Date date = new java.sql.Date(millis);
        hangKhachHang.setNgayCapNhat(date);

        hangKhachHangService.add(hangKhachHang);

        return "redirect:/hang-khach-hang/hien-thi";
    }





    @PostMapping("/add")
    public String updateadd(Model model,
                            @ModelAttribute("hkh")@Valid HangKhachHang hangKhachHang,
                            BindingResult bindingResult
    ) {
        long millis = System.currentTimeMillis();
        Date date = new java.sql.Date(millis);


        if(bindingResult.hasErrors()){
            model.addAttribute("dulieu", hangKhachHangService.getALL0());
            return "hang-khach-hang/hang-khach-hang";
        }


         Integer sl= hangKhachHangService.findAll().size()+1;

        String mhd = "MHKH" +sl;
        hangKhachHang.setMa(mhd);
        hangKhachHang.setNgayTao(date);
        hangKhachHang.setNgayCapNhat(date);
        hangKhachHang.setTinhTrang(0);
        hangKhachHangService.add(hangKhachHang);
        return "redirect:/hang-khach-hang/hien-thi";
    }

}
