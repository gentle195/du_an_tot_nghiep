package com.example.demo.controller;

import com.example.demo.Model.ChiTietSanPham;
import com.example.demo.repository.ChiTietSanPhamRepository;
import com.example.demo.service.ChiTietSanPhamService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@RequestMapping("/chi-tiet-san-pham")
public class ChiTietSanPhamController {
    @Autowired
    ChiTietSanPhamService chiTietSanPhamService;
   @GetMapping("/hien-thi")
    public String hienThi(Model model, @RequestParam(value = "pageNum",required = false,defaultValue = "0") int pageNum){
       Pageable pageable = PageRequest.of(5,pageNum);
       Page<ChiTietSanPham> listCTSP = chiTietSanPhamService.getAllByPages(pageable);
       model.addAttribute("listCTSP",listCTSP.getContent());
       model.addAttribute("total",listCTSP.getTotalPages());
       return  "index";

   }
   
}
