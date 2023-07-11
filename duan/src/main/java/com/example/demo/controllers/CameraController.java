package com.example.demo.controllers;

import com.example.demo.models.Camera;
import com.example.demo.services.CameraService;
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
import java.time.LocalDate;
import java.util.Optional;
import java.util.UUID;

@Controller
@RequestMapping("/camera")
public class CameraController {
    @Autowired
    private CameraService cameraService;
    @GetMapping("hien-thi")
    public String hienthi(@ModelAttribute("camera") Camera camera, Model model, @RequestParam("num") Optional<Integer> num,
                          @RequestParam(name = "size", defaultValue = "5", required = false) Integer size) {
        Sort sort = Sort.by("ngayTao").ascending();
        Pageable pageable = PageRequest.of(num.orElse(0), size, sort);
        Page<Camera> list = cameraService.getAll(pageable);
        model.addAttribute("listCamera", list.getContent());
        model.addAttribute("total", list.getTotalPages());
        return "camera/hien-thi";
    }

    @GetMapping("/view-update/{id}")
    public String viewupdate(Model model, @PathVariable("id") UUID id) {
        Camera hsp = cameraService.findById(id);
        model.addAttribute("camera", hsp);
        return "camera/update";
    }

    @PostMapping("/add")
    public String add(Model model, @ModelAttribute("camera") @Valid Camera camera, BindingResult bindingResult,
                      @RequestParam("num") Optional<Integer> num, @RequestParam(name = "size", defaultValue = "5", required = false) Integer size) {
        if (bindingResult.hasErrors()) {
            model.addAttribute("content", "Camera/hien-thi.jsp");
            Sort sort = Sort.by("ngayTao").ascending();
            Pageable pageable = PageRequest.of(num.orElse(0), size, sort);
            Page<Camera> list = cameraService.getAll(pageable);
            model.addAttribute("listCamera", list.getContent());
            model.addAttribute("total", list.getTotalPages());
            return "camera/hien-thi";
        }
        camera.setNgayTao(Date.valueOf(LocalDate.now()));
        camera.setMa("MH" + String.valueOf(cameraService.findAll().size() + 1));
        cameraService.add(camera);
        Sort sort = Sort.by("ngayTao").ascending();
        Pageable pageable = PageRequest.of(num.orElse(0), size, sort);
        Page<Camera> list = cameraService.getAll(pageable);
        model.addAttribute("listCamera", list.getContent());
        model.addAttribute("total", list.getTotalPages());
        return "redirect:/camera/hien-thi";
        // Tiếp tục xử lý và trả về view tương ứng
    }

    @PostMapping("/update/{id}")
    public String update(Model model, @ModelAttribute("camera") @Valid Camera camera, BindingResult bindingResult, @PathVariable("id") UUID id) {
        if (bindingResult.hasErrors()) {
            model.addAttribute("content", "Camera/update.jsp");
            return "camera/update";
        }
        Camera hsp = cameraService.findById(id);
        Date ngayTao = hsp.getNgayTao();
        hsp.setThongSo(camera.getThongSo());
        hsp.setNgayTao(ngayTao);
        // Gán ngày hiện tại
        hsp.setNgayCapNhat(Date.valueOf(LocalDate.now()));
        hsp.setTinhTrang(camera.getTinhTrang());
        hsp.setMoTa(camera.getMoTa());
        cameraService.update(id, hsp);
        return "redirect:/camera/hien-thi";
    }

    @GetMapping("/delete/{id}")
    public String delete(Model model, @ModelAttribute("camera") Camera camera, @PathVariable("id") UUID id, @RequestParam("num") Optional<Integer> num,
                         @RequestParam(name = "size", defaultValue = "5", required = false) Integer size) {
        cameraService.delete(id);
        Pageable pageable = PageRequest.of(num.orElse(0), size);
        Page<Camera> list = cameraService.getAll(pageable);
        model.addAttribute("listCamera", list.getContent());
        model.addAttribute("total", list.getTotalPages());
        return "camera/hien-thi";

    }
}
