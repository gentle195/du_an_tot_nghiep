package com.example.demo.controllers;

import com.example.demo.models.ChiTietSanPham;
import com.example.demo.services.CameraService;
import com.example.demo.services.ChiTietSanPhamService;
import com.example.demo.services.ChipService;
import com.example.demo.services.DungLuongPinService;
import com.example.demo.services.HangSanPhamService;
import com.example.demo.services.ManHinhService;
import com.example.demo.services.MauSacService;
import com.example.demo.services.PinService;
import com.example.demo.services.RamService;
import com.example.demo.services.RomService;
import com.example.demo.services.SanPhamService;
import jakarta.validation.Valid;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
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
import java.util.List;
import java.util.Optional;
import java.util.UUID;

@Controller
@RequestMapping("/chi-tiet-san-pham")
public class ChiTietSanPhamController {
    @Autowired
    ChiTietSanPhamService chiTietSanPhamService;
    @Autowired
    SanPhamService sanPhamService;

    @Autowired
    MauSacService mauSacService;
    @Autowired
    ChipService chipService;
    @Autowired
    RamService ramService;
    @Autowired
    RomService romService;
    @Autowired
    PinService pinService;
    @Autowired
    HangSanPhamService hangSanPhamService;
    @Autowired
    DungLuongPinService dungLuongPinService;
    @Autowired
    ManHinhService manHinhService;
    @Autowired
    CameraService cameraService;


    private Date ngay;

    @GetMapping("/hien-thi")
    public String hienThi(Model model, @RequestParam("pageNum") Optional<Integer> pageNum) {
        Pageable pageable = PageRequest.of(pageNum.orElse(0), 5);
        Page<ChiTietSanPham> chiTietSanPhamPage = chiTietSanPhamService.getAll(pageable);
        model.addAttribute("total", chiTietSanPhamPage.getTotalPages());
        model.addAttribute("listCTSP", chiTietSanPhamPage.getContent());
        model.addAttribute("size", chiTietSanPhamPage.getSize());
        model.addAttribute("listHang", hangSanPhamService.findAll());
        model.addAttribute("listMauSac", mauSacService.findAll());
        model.addAttribute("listChip", chipService.findAll());
        model.addAttribute("listRam", ramService.findAll());
        model.addAttribute("listRom", romService.findAll());
        model.addAttribute("listPin", dungLuongPinService.findAll());
        model.addAttribute("listManHinh", manHinhService.findAll());
        model.addAttribute("listCamera", cameraService.findAll());
        return "chi-tiet-san-pham/index";
    }

    @GetMapping("/add")
    public String viewadd(Model model) {
        model.addAttribute("listSanPham", sanPhamService.findAll());
        model.addAttribute("listMauSac", mauSacService.findAll());
        model.addAttribute("listChip", chipService.findAll());
        model.addAttribute("listRam", ramService.findAll());
        model.addAttribute("listRom", romService.findAll());
        model.addAttribute("listPin", pinService.findAll());
        model.addAttribute("chitietsanpham", new ChiTietSanPham());
        return "chi-tiet-san-pham/add-chi-tiet-san-pham";

    }

    @PostMapping("/add")
    public String add(@Valid @ModelAttribute(name = "chitietsanpham") ChiTietSanPham chiTietSanPham,
                      BindingResult result, Model model) {
        if (result.hasErrors()) {
            model.addAttribute("listSanPham", sanPhamService.findAll());
            model.addAttribute("listMauSac", mauSacService.findAll());
            model.addAttribute("listChip", chipService.findAll());
            model.addAttribute("listRam", ramService.findAll());
            model.addAttribute("listRom", romService.findAll());
            model.addAttribute("listPin", pinService.findAll());

            return "chi-tiet-san-pham/add-chi-tiet-san-pham";
        }
        LocalDate localDate = LocalDate.now();
        chiTietSanPham.setNgayTao(Date.valueOf(localDate));
        chiTietSanPhamService.add(chiTietSanPham);
        return "redirect:/chi-tiet-san-pham/hien-thi";


    }

    @GetMapping("/update/{id}")
    public String viewupdate(Model model, @PathVariable("id") UUID id, @ModelAttribute("chitietsanphamupdate") ChiTietSanPham chiTietSanPham) {
        model.addAttribute("listSanPham", sanPhamService.findAll());
        model.addAttribute("listMauSac", mauSacService.findAll());
        model.addAttribute("listChip", chipService.findAll());
        model.addAttribute("listRam", ramService.findAll());
        model.addAttribute("listRom", romService.findAll());
        model.addAttribute("listPin", pinService.findAll());
        ChiTietSanPham chiTietSanPham1 = chiTietSanPhamService.findById(id);
        ngay = Date.valueOf(chiTietSanPham1.getNgayTao().toString());
        System.out.println(chiTietSanPham1.getNgayTao());
        model.addAttribute("chitietsanphamupdate", chiTietSanPham1);
        return "chi-tiet-san-pham/update-chi-tiet-san-pham";


    }

    @PostMapping("/update/{id}")
    public String update(@PathVariable("id") UUID id, @Valid @ModelAttribute("chitietsanphamupdate") ChiTietSanPham chiTietSanPham,
                         BindingResult result, Model model) {
        if (result.hasErrors()) {
            model.addAttribute("listSanPham", sanPhamService.findAll());
            model.addAttribute("listMauSac", mauSacService.findAll());
            model.addAttribute("listChip", chipService.findAll());
            model.addAttribute("listRam", ramService.findAll());
            model.addAttribute("listRom", romService.findAll());
            model.addAttribute("listPin", pinService.findAll());
            ChiTietSanPham chiTietSanPham1 = chiTietSanPhamService.findById(id);
//            model.addAttribute("chitietsanphamupdate",chiTietSanPham1);
            return "chi-tiet-san-pham/update-chi-tiet-san-pham";
        }
        ChiTietSanPham chiTietSanPham1 = chiTietSanPhamService.findById(id);
        BeanUtils.copyProperties(chiTietSanPham, chiTietSanPham1);

        LocalDate localDate = LocalDate.now();
        chiTietSanPham1.setNgayCapNhat(Date.valueOf(localDate));
        chiTietSanPham1.setNgayTao(ngay);
        chiTietSanPhamService.update(id, chiTietSanPham1);
        System.out.println(chiTietSanPham.getNgayTao());
        return "redirect:/chi-tiet-san-pham/hien-thi";

    }

    @GetMapping("/remove/{id}")
    public String remove(@PathVariable("id") UUID id) {

        chiTietSanPhamService.delete(id);
        return "redirect:/chi-tiet-san-pham/hien-thi";
    }

    @PostMapping("/search")
    public String search(Model model, @RequestParam("search") String search) {
        List<ChiTietSanPham> list = chiTietSanPhamService.search(search);
        model.addAttribute("listCTSP", list);
        return "/chi-tiet-san-pham/index";
    }

    @PostMapping("/loc")
    public String loc(Model model, @RequestParam(value = "hang", required = false) UUID hang, @RequestParam(value = "ram", required = false) UUID ram,
                      @RequestParam(value = "rom", required = false) UUID rom, @RequestParam(value = "dungLuongPin", required = false) UUID dungLuongPin,
                      @RequestParam(value = "chip", required = false) UUID chip,
                      @RequestParam(value = "manHinh", required = false) UUID moTaMan,
                      @RequestParam(value = "camera", required = false) UUID moTaCam) {
        List<ChiTietSanPham> list = chiTietSanPhamService.loc(hang, ram, rom, dungLuongPin,chip,moTaMan,moTaCam);
        model.addAttribute("listCTSP", list);
        model.addAttribute("listHang", hangSanPhamService.findAll());
        model.addAttribute("listMauSac", mauSacService.findAll());
        model.addAttribute("listChip", chipService.findAll());
        model.addAttribute("listRam", ramService.findAll());
        model.addAttribute("listRom", romService.findAll());
        model.addAttribute("listPin", dungLuongPinService.findAll());
        model.addAttribute("listManHinh", manHinhService.findAll());
        model.addAttribute("listCamera", cameraService.findAll());
        return "/chi-tiet-san-pham/index";
    }

}
