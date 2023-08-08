package com.example.demo.controllers;

import com.example.demo.models.Camera;
import com.example.demo.models.HangSanPham;
import com.example.demo.models.ManHinh;

import com.example.demo.models.SanPham;
import com.example.demo.services.CameraService;
import com.example.demo.services.HangSanPhamService;
import com.example.demo.services.ManHinhService;
import com.example.demo.services.SanPhamService;
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
import java.time.LocalDate;
import java.util.List;
import java.util.Optional;
import java.util.UUID;

@Controller
@RequestMapping("/san-pham")
public class SanPhamController {
    @Autowired
    SanPhamService sanPhamService;
    @Autowired
    HangSanPhamService hangSanPhamService;
    @Autowired
    ManHinhService manHinhService;
    @Autowired
    CameraService cameraService;

    @GetMapping("hien-thi")
    public String hienthi(@ModelAttribute("dulieuxem") SanPham dulieuxem,
                          @ModelAttribute("manHinh") ManHinh manHinh,
                          @ModelAttribute("hangSP") HangSanPham hangSanPham,
                          @ModelAttribute("camera") Camera camera,
                          Model model, @RequestParam("num") Optional<Integer> num,
                          @RequestParam(name = "size", defaultValue = "5", required = false) Integer size) {
        Pageable pageable = PageRequest.of(num.orElse(0), size);
        Page<SanPham> list = sanPhamService.getAll(pageable);
        model.addAttribute("listManHinh", manHinhService.findAll());
        model.addAttribute("listHangSP", hangSanPhamService.findAll());
        model.addAttribute("listCamera", cameraService.findAll());
        model.addAttribute("hsp", list.getContent());
        model.addAttribute("total", list.getTotalPages());
        return "SanPham/hien-thi";
    }

//    @ModelAttribute("hangsp")
//    public List<HangSanPham> hsp() {
//        return hangSanPhamService.findAll();
//    }
//
//    @ModelAttribute("manHinh")
//    public List<ManHinh> manHinh() {
//        return manHinhService.findAll();
//    }
//
//    @ModelAttribute("camera")
//    public List<Camera> camera() {
//        return cameraService.findAll();
//    }

    @GetMapping("/view-update/{id}")
    public String viewupdate(Model model, @PathVariable("id") UUID id, @ModelAttribute("manHinh") ManHinh manHinh,
                             @ModelAttribute("hangSP") HangSanPham hangSanPham,
                             @ModelAttribute("camera") Camera camera) {
        SanPham hsp = sanPhamService.findById(id);
        model.addAttribute("dulieuxem", hsp);
        model.addAttribute("listManHinh", manHinhService.findAll());
        model.addAttribute("listHangSP", hangSanPhamService.findAll());
        model.addAttribute("listCamera", cameraService.findAll());
        return "SanPham/update";
    }

    @PostMapping("/add")
    public String add(Model model, @ModelAttribute("dulieuxem") @Valid SanPham dulieuxem,
                      BindingResult bindingResult, @RequestParam("num") Optional<Integer> num,
                      @RequestParam(name = "size", defaultValue = "5", required = false) Integer size,
                      @ModelAttribute("hangSP") HangSanPham hangSanPham,
                      @ModelAttribute("camera") Camera camera) {
        if (bindingResult.hasErrors()) {
            model.addAttribute("content", "SanPham/hien-thi.jsp");
            Sort sort = Sort.by("ngayTao").ascending();
            Pageable pageable = PageRequest.of(num.orElse(0), size, sort);
            Page<SanPham> list = sanPhamService.getAll(pageable);
            model.addAttribute("listManHinh", manHinhService.findAll());
            model.addAttribute("listHangSP", hangSanPhamService.findAll());
            model.addAttribute("listCamera", cameraService.findAll());
            model.addAttribute("hsp", list.getContent());
            model.addAttribute("total", list.getTotalPages());

            return "SanPham/hien-thi";
        }

        dulieuxem.setNgayTao(Date.valueOf(LocalDate.now()));
        dulieuxem.setMa("SP" + String.valueOf(sanPhamService.findAll().size() + 1));
        sanPhamService.add(dulieuxem);
        return "redirect:/san-pham/hien-thi";
        // Tiếp tục xử lý và trả về view tương ứng
    }

    @PostMapping("/update/{id}")
    public String update(Model model, @ModelAttribute("dulieuxem") @Valid SanPham dulieuxem,
                         BindingResult bindingResult, @PathVariable("id") UUID id) {
        if (bindingResult.hasErrors()) {
            model.addAttribute("content", "SanPham/update.jsp");
            return "SanPham/update";
        }
        SanPham sp = sanPhamService.findById(id);
        Date ngayTao = sp.getNgayTao();
        sp.setTen(dulieuxem.getTen());
        sp.setHeDieuHanh(dulieuxem.getHeDieuHanh());
        sp.setSoSim(dulieuxem.getSoSim());
        sp.setBluetooth(dulieuxem.getBluetooth());
        sp.setHoTroMang(dulieuxem.getHoTroMang());
        sp.setCongGiaoTiep(dulieuxem.getCongGiaoTiep());
        sp.setThongSoWifi(dulieuxem.getThongSoWifi());
        sp.setKichThuoc(dulieuxem.getKichThuoc());
        sp.setTrongLuong(dulieuxem.getTrongLuong());
        sp.setChatLieu(dulieuxem.getChatLieu());
        sp.setNgayTao(ngayTao);
        sp.setHangSanPham(dulieuxem.getHangSanPham());
        sp.setManHinh(dulieuxem.getManHinh());
        sp.setCamera(dulieuxem.getCamera());
        // Gán ngày hiện tại
        sp.setNgayCapNhat(Date.valueOf(LocalDate.now()));
        sp.setTinhTrang(dulieuxem.getTinhTrang());
        sp.setMoTa(dulieuxem.getMoTa());
        sanPhamService.update(sp);
        return "redirect:/san-pham/hien-thi";
    }

    @GetMapping("/delete/{id}")
    public String delete(Model model, @ModelAttribute("dulieuxem") SanPham dulieuxem, @PathVariable("id") UUID id, @RequestParam("num") Optional<Integer> num,
                         @RequestParam(name = "size", defaultValue = "5", required = false) Integer size) {
        sanPhamService.delete(id);
        Pageable pageable = PageRequest.of(num.orElse(0), size);
        Page<SanPham> list = sanPhamService.getAll(pageable);
        model.addAttribute("hsp", list.getContent());
        model.addAttribute("total", list.getTotalPages());
        return "SanPham/hien-thi";

    }
}
