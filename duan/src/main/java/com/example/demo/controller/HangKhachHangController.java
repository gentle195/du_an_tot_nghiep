package com.example.demo.controller;

import com.example.demo.Model.HangKhachHang;
import com.example.demo.service.HangKhachHangService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.UUID;

@Controller
@RequestMapping("/hang-khach-hang")
public class HangKhachHangController {
    @Autowired
    HangKhachHangService hangKhachHangService;


    @GetMapping("/hien-thi")
    public String hienThi(
            Model model,
            @ModelAttribute("hkh")HangKhachHang hangKhachHang


            ) {
hangKhachHang.setTinhTrang(0);

        model.addAttribute("dulieu", hangKhachHangService.getAllHKH());

        return "hang-khach-hang/hang-khach-hang";
    }


    @GetMapping("/remove/{id}")

    public String remove(Model model,
                         @PathVariable("id") UUID id

    ) {
        hangKhachHangService.remove(id);
        return "redirect:/hang-khach-hang/hien-thi";
    }


    @GetMapping("/view-update/{id}")

    public String viewUpdate(Model model,
                             @PathVariable("id") UUID id,
                             @ModelAttribute("hkh")HangKhachHang hangKhachHang

    ) {
hangKhachHang.setTinhTrang(0);
        model.addAttribute("hkh", hangKhachHangService.getOne(id));

        return "hang-khach-hang/hang-khach-hang-update";
    }


    @PostMapping("/update")
    public String updateDongSP(Model model,

                               @ModelAttribute("hkh")HangKhachHang hangKhachHang
    ) {



       hangKhachHangService.addOrUpdate(hangKhachHang);

        return "redirect:/hang-khach-hang/hien-thi";
    }





    @PostMapping("/add")
    public String updateadd(Model model,
                            @ModelAttribute("hkh") HangKhachHang hangKhachHang
    ) {


        hangKhachHangService.addOrUpdate(hangKhachHang);
        return "redirect:/hang-khach-hang/hien-thi";
    }

}
