package com.example.demo.controllers;

import com.example.demo.models.ChiTietSanPham;
import com.example.demo.models.Chip;
import com.example.demo.models.MauSac;
import com.example.demo.models.Pin;
import com.example.demo.models.Ram;
import com.example.demo.models.Rom;
import com.example.demo.models.SanPham;
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
import com.oracle.wls.shaded.org.apache.xpath.operations.Mod;
import jakarta.validation.Valid;
import org.springframework.beans.BeanUtils;
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
import java.util.List;
import java.util.Optional;
import java.util.UUID;

@Controller
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

    @GetMapping("/chi-tiet-san-pham/hien-thi")
    public String hienThi(Model model, @RequestParam("pageNum") Optional<Integer> pageNum,
                          @ModelAttribute("chitietsanpham") ChiTietSanPham chiTietSanPham,
                          @ModelAttribute(name = "Pin") Pin pin,
                          @ModelAttribute(name = "chip") Chip chip,
                          @ModelAttribute(name = "ram") Ram ram,
                          @ModelAttribute(name = "mauSac") MauSac mauSac,
                          @ModelAttribute(name = "rom") Rom rom,
                          @ModelAttribute(name = "sanPham") SanPham sanPham) {
        Sort sort = Sort.by("ngayTao").descending();
        Pageable pageable = PageRequest.of(pageNum.orElse(0), 5);
        Page<ChiTietSanPham> chiTietSanPhamPage = chiTietSanPhamService.getAll(pageable);
        model.addAttribute("total", chiTietSanPhamPage.getTotalPages());
        model.addAttribute("list", chiTietSanPhamPage.getContent());
        model.addAttribute("size", chiTietSanPhamPage.getSize());
        model.addAttribute("listSanPham", sanPhamService.findAll());
        model.addAttribute("listMauSac", mauSacService.findAll());
        model.addAttribute("listChip", chipService.findAll());
        model.addAttribute("listRam", ramService.findAll());
        model.addAttribute("listRom", romService.findAll());
        model.addAttribute("listHang", hangSanPhamService.findAll());
        model.addAttribute("dungLuongPin", dungLuongPinService.findAll());
        model.addAttribute("listPin", pinService.findAll());
        model.addAttribute("listManHinh", manHinhService.findAll());
        model.addAttribute("listCamera", cameraService.findAll());
        model.addAttribute("contentPage", "chi-tiet-san-pham/index.jsp");
        model.addAttribute("page", chiTietSanPhamPage.getNumber());
        model.addAttribute("listCTSP", chiTietSanPhamPage.getContent());
        return "layout";
    }

//    @GetMapping("/chi-tiet-san-pham/add")
//    public String viewAdd(Model model, @ModelAttribute(name = "Pin") Pin pin,
//                          @ModelAttribute(name = "chip") Chip chip,
//                          @ModelAttribute(name = "ram") Ram ram,
//                          @ModelAttribute(name = "mauSac") MauSac mauSac,
//                          @ModelAttribute(name = "rom") Rom rom,
//                          @ModelAttribute(name = "sanPham") SanPham sanPham,
//                          @ModelAttribute(name = "chitietsanpham") ChiTietSanPham chiTietSanPham) {
//
//        model.addAttribute("listSP", sanPhamService.findAll());
//        model.addAttribute("listMauSac", mauSacService.findAll());
//        model.addAttribute("listChip", chipService.findAll());
//        model.addAttribute("listRam", ramService.findAll());
//        model.addAttribute("listRom", romService.findAll());
//        model.addAttribute("listPin", pinService.findAll());
//        model.addAttribute("dungLuongPin", dungLuongPinService.findAll());
//        model.addAttribute("listManHinh", manHinhService.findAll());
//        model.addAttribute("listCamera", cameraService.findAll());
//        model.addAttribute("chitietsanpham", new ChiTietSanPham());
//
//
//        return "chi-tiet-san-pham/add-chi-tiet-san-pham";
//
//
//    }


    @PostMapping("/chi-tiet-san-pham/add")
    public String add(@Valid @ModelAttribute(name = "chitietsanpham") ChiTietSanPham chiTietSanPham,
                      BindingResult result, Model model, @RequestParam("pageNum") Optional<Integer> pageNum,
                      @RequestParam(name = "pageSize", required = false, defaultValue = "5") Integer pageSize) {
        Sort sort = Sort.by("ngayTao").ascending();
        Pageable pageable = PageRequest.of(pageNum.orElse(0), pageSize, sort);
        Page<ChiTietSanPham> page = chiTietSanPhamService.getAll(pageable);
        if (result.hasErrors()) {
            model.addAttribute("total", page.getTotalPages());
            model.addAttribute("list", page.getContent());
            model.addAttribute("size", page.getSize());
            model.addAttribute("listSanPham", sanPhamService.findAll());
            model.addAttribute("listMauSac", mauSacService.findAll());
            model.addAttribute("listChip", chipService.findAll());
            model.addAttribute("listRam", ramService.findAll());
            model.addAttribute("listRom", romService.findAll());
            model.addAttribute("listHang", hangSanPhamService.findAll());
            model.addAttribute("dungLuongPin", dungLuongPinService.findAll());
            model.addAttribute("listPin", pinService.findAll());
            model.addAttribute("listManHinh", manHinhService.findAll());
            model.addAttribute("listCamera", cameraService.findAll());
            model.addAttribute("contentPage", "chi-tiet-san-pham/index.jsp");
            model.addAttribute("page", page.getNumber());
            return "layout";
        }
        LocalDate localDate = LocalDate.now();
        chiTietSanPham.setNgayTao(Date.valueOf(localDate));
        chiTietSanPham.setTinhTrang(1);
        chiTietSanPhamService.add(chiTietSanPham);
        return "redirect:/chi-tiet-san-pham/hien-thi";


    }

//    @GetMapping("/chi-tiet-san-pham/view-update/{id}")
//    public String viewupdate(Model model, @PathVariable("id") UUID id, @ModelAttribute("chitietsanphamupdate") ChiTietSanPham chiTietSanPham,
//                             @ModelAttribute(name = "Pin") Pin pin,
//                             @ModelAttribute(name = "chip") Chip chip,
//                             @ModelAttribute(name = "ram") Ram ram,
//                             @ModelAttribute(name = "mauSac") MauSac mauSac,
//                             @ModelAttribute(name = "rom") Rom rom,
//                             @ModelAttribute(name = "sanPham") SanPham sanPham) {
//        model.addAttribute("listSanPham", sanPhamService.findAll());
//        model.addAttribute("listMauSac", mauSacService.findAll());
//        model.addAttribute("listChip", chipService.findAll());
//        model.addAttribute("listRam", ramService.findAll());
//        model.addAttribute("listRom", romService.findAll());
//        model.addAttribute("listPin", pinService.findAll());
//        model.addAttribute("dungLuongPin", dungLuongPinService.findAll());
//        ChiTietSanPham chiTietSanPham1 = chiTietSanPhamService.findById(id);
//        ngay = Date.valueOf(chiTietSanPham1.getNgayTao().toString());
//        System.out.println(chiTietSanPham1.getNgayTao());
//        model.addAttribute("chitietsanphamupdate", chiTietSanPham1);
//        return "chi-tiet-san-pham/update-chi-tiet-san-pham";
//
//
//    }

//    @PostMapping("chi-tiet-san-pham/update/{id}")
//    public String update(@PathVariable("id") UUID id, @Valid @ModelAttribute("chitietsanphamupdate") ChiTietSanPham chiTietSanPham,
//                         BindingResult result, Model model, @ModelAttribute(name = "Pin") Pin pin,
//                         @ModelAttribute(name = "chip") Chip chip,
//                         @ModelAttribute(name = "ram") Ram ram,
//                         @ModelAttribute(name = "mauSac") MauSac mauSac,
//                         @ModelAttribute(name = "rom") Rom rom,
//                         @ModelAttribute(name = "sanPham") SanPham sanPham) {
//        if (result.hasErrors()) {
//            model.addAttribute("listSanPham", sanPhamService.findAll());
//            model.addAttribute("listMauSac", mauSacService.findAll());
//            model.addAttribute("listChip", chipService.findAll());
//            model.addAttribute("listRam", ramService.findAll());
//            model.addAttribute("listRom", romService.findAll());
//            model.addAttribute("listPin", pinService.findAll());
//            model.addAttribute("dungLuongPin", dungLuongPinService.findAll());
//            ChiTietSanPham chiTietSanPham1 = chiTietSanPhamService.findById(id);
////            model.addAttribute("chitietsanphamupdate",chiTietSanPham1);
//            return "chi-tiet-san-pham/update-chi-tiet-san-pham";
//        }
//        ChiTietSanPham chiTietSanPham1 = chiTietSanPhamService.findById(id);
//        BeanUtils.copyProperties(chiTietSanPham, chiTietSanPham1);
//        LocalDate localDate = LocalDate.now();
//        chiTietSanPham1.setNgayCapNhat(Date.valueOf(localDate));
//        chiTietSanPham1.setNgayTao(ngay);
//        chiTietSanPhamService.update(id, chiTietSanPham1);
//        System.out.println(chiTietSanPham.getNgayTao());
//        return "redirect:/chi-tiet-san-pham/hien-thi";
//
//    }

    @GetMapping("/chi-tiet-san-pham/remove/{id}")
    public String remove(@PathVariable("id") UUID id, @RequestParam("pageNum") Optional<Integer> pageNum,
                         @RequestParam(name = "pageSize", required = false, defaultValue = "5") Integer pageSize, Model model) {
        chiTietSanPhamService.delete(id);
        Sort sort = Sort.by("ngayTao").ascending();
        Pageable pageable = PageRequest.of(pageNum.orElse(0), pageSize, sort);
        Page<ChiTietSanPham> page = chiTietSanPhamService.getAll(pageable);
        model.addAttribute("total", page.getTotalPages());
        model.addAttribute("list", page.getContent());
        model.addAttribute("size", page.getSize());
        model.addAttribute("listSanPham", sanPhamService.findAll());
        model.addAttribute("listMauSac", mauSacService.findAll());
        model.addAttribute("listChip", chipService.findAll());
        model.addAttribute("listRam", ramService.findAll());
        model.addAttribute("listRom", romService.findAll());
        model.addAttribute("listHang", hangSanPhamService.findAll());
        model.addAttribute("dungLuongPin", dungLuongPinService.findAll());
        model.addAttribute("listPin", pinService.findAll());
        model.addAttribute("listManHinh", manHinhService.findAll());
        model.addAttribute("listCamera", cameraService.findAll());
        model.addAttribute("contentPage", "chi-tiet-san-pham/index.jsp");
        model.addAttribute("page", page.getNumber());
        return "redirect:/chi-tiet-san-pham/hien-thi";
    }

    @PostMapping("/chi-tiet-san-pham/search")
    public String search(Model model, @RequestParam("search") String search,
                         @ModelAttribute("chitietsanpham") ChiTietSanPham chiTietSanPham,
                         @ModelAttribute(name = "Pin") Pin pin,
                         @ModelAttribute(name = "chip") Chip chip,
                         @ModelAttribute(name = "ram") Ram ram,
                         @ModelAttribute(name = "mauSac") MauSac mauSac,
                         @ModelAttribute(name = "rom") Rom rom,
                         @ModelAttribute(name = "sanPham") SanPham sanPham) {
        List<ChiTietSanPham> list = chiTietSanPhamService.search(search);
        model.addAttribute("listCTSP", list);
        model.addAttribute("listSanPham", sanPhamService.findAll());
        model.addAttribute("listMauSac", mauSacService.findAll());
        model.addAttribute("listChip", chipService.findAll());
        model.addAttribute("listRam", ramService.findAll());
        model.addAttribute("listRom", romService.findAll());
        model.addAttribute("listHang", hangSanPhamService.findAll());
        model.addAttribute("dungLuongPin", dungLuongPinService.findAll());
        model.addAttribute("listPin", pinService.findAll());
        model.addAttribute("listManHinh", manHinhService.findAll());
        model.addAttribute("listCamera", cameraService.findAll());
        model.addAttribute("contentPage", "chi-tiet-san-pham/index.jsp");
        return "layout";
    }

    @GetMapping("/chi-tiet-sp/detail/{id}")
    public String detail(@PathVariable("id") UUID id, @RequestParam("pageNum") Optional<Integer> pageNum,
                         @RequestParam(name = "pageSize", required = false, defaultValue = "5") Integer pageSize, Model model) {
        ChiTietSanPham chiTietSanPham1 = chiTietSanPhamService.findById(id);
        model.addAttribute("chitietsanpham", chiTietSanPham1);
        Sort sort = Sort.by("ngayTao").ascending();
        Pageable pageable = PageRequest.of(pageNum.orElse(0), pageSize, sort);
        Page<ChiTietSanPham> chiTietSanPhamPage = chiTietSanPhamService.getAll(pageable);
        model.addAttribute("total", chiTietSanPhamPage.getTotalPages());
        model.addAttribute("list", chiTietSanPhamPage.getContent());
        model.addAttribute("size", chiTietSanPhamPage.getSize());
        model.addAttribute("listSanPham", sanPhamService.findAll());
        model.addAttribute("listMauSac", mauSacService.findAll());
        model.addAttribute("listChip", chipService.findAll());
        model.addAttribute("listRam", ramService.findAll());
        model.addAttribute("listRom", romService.findAll());
        model.addAttribute("listHang", hangSanPhamService.findAll());
        model.addAttribute("dungLuongPin", dungLuongPinService.findAll());
        model.addAttribute("listPin", pinService.findAll());
        model.addAttribute("listManHinh", manHinhService.findAll());
        model.addAttribute("listCamera", cameraService.findAll());
        model.addAttribute("contentPage", "chi-tiet-san-pham/index.jsp");
        model.addAttribute("page", chiTietSanPhamPage.getNumber());
        model.addAttribute("listCTSP", chiTietSanPhamPage.getContent());
        return "layout";

    }

    @PostMapping("/chi-tiet-san-pham/loc")
    public String loc(Model model, @RequestParam(value = "hang", required = false) UUID hang,
                      @RequestParam(value = "ram", required = false) UUID Ram,
                      @RequestParam(value = "rom", required = false) UUID Rom,
                      @RequestParam(value = "dungLuongPin", required = false) UUID dungLuongPin,
                      @RequestParam(value = "chip", required = false) UUID Chip,
                      @RequestParam(value = "manHinh", required = false) UUID moTaMan,
                      @RequestParam(value = "camera", required = false) UUID moTaCam,
                      @ModelAttribute("chitietsanpham") ChiTietSanPham chiTietSanPham,
                      @ModelAttribute(name = "Pin") Pin pin,
                      @ModelAttribute(name = "chip") Chip chip,
                      @ModelAttribute(name = "ram") Ram ram,
                      @ModelAttribute(name = "mauSac") MauSac mauSac,
                      @ModelAttribute(name = "rom") Rom rom,
                      @ModelAttribute(name = "sanPham") SanPham sanPham) {
        List<ChiTietSanPham> list = chiTietSanPhamService.loc(hang, Ram, Rom, dungLuongPin, Chip, moTaMan, moTaCam);
        model.addAttribute("listCTSP", list);
        model.addAttribute("listSanPham", sanPhamService.findAll());
        model.addAttribute("listMauSac", mauSacService.findAll());
        model.addAttribute("listChip", chipService.findAll());
        model.addAttribute("listRam", ramService.findAll());
        model.addAttribute("listRom", romService.findAll());
        model.addAttribute("listHang", hangSanPhamService.findAll());
        model.addAttribute("dungLuongPin", dungLuongPinService.findAll());
        model.addAttribute("listPin", pinService.findAll());
        model.addAttribute("listManHinh", manHinhService.findAll());
        model.addAttribute("listCamera", cameraService.findAll());
        model.addAttribute("contentPage", "chi-tiet-san-pham/index.jsp");
        return "layout";
    }

    @GetMapping("/chi-tiet-san-pham/hien-thi-loc")
    public String hienThiLoc(Model model, @Valid @ModelAttribute("chitietsanphamupdate") ChiTietSanPham chiTietSanPham,
                             BindingResult result, @ModelAttribute(name = "Pin") Pin pin,
                             @ModelAttribute(name = "chip") Chip chip,
                             @ModelAttribute(name = "ram") Ram ram,
                             @ModelAttribute(name = "mauSac") MauSac mauSac,
                             @ModelAttribute(name = "rom") Rom rom,
                             @ModelAttribute(name = "sanPham") SanPham sanPham) {
        model.addAttribute("listHang", hangSanPhamService.findAll());
        model.addAttribute("listMauSac", mauSacService.findAll());
        model.addAttribute("listChip", chipService.findAll());
        model.addAttribute("listRam", ramService.findAll());
        model.addAttribute("listRom", romService.findAll());
        model.addAttribute("listManHinh", manHinhService.findAll());
        model.addAttribute("listCamera", cameraService.findAll());
        model.addAttribute("dungLuongPin", dungLuongPinService.findAll());
        model.addAttribute("contentPage", "chi-tiet-san-pham/index.jsp");
        return "layout";

    }

}
