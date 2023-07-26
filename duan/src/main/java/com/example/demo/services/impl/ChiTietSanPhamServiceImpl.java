package com.example.demo.services.impl;

import com.example.demo.models.ChiTietSanPham;
import com.example.demo.repositories.ChiTietSanPhamRepository;
import com.example.demo.services.ChiTietSanPhamService;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.UUID;

@Service

public class ChiTietSanPhamServiceImpl implements ChiTietSanPhamService {
    @Autowired
    ChiTietSanPhamRepository chiTietSanPhamRepository;


    @Override
    public Page<ChiTietSanPham> getAll(Pageable pageable) {
        return chiTietSanPhamRepository.findAll(pageable);
    }

    @Override
    public List<ChiTietSanPham> findAll() {
        return chiTietSanPhamRepository.findAll();
    }

    @Override
    public List<ChiTietSanPham> search(String ten) {
        return chiTietSanPhamRepository.search(ten);
    }

    @Override
    public List<ChiTietSanPham> loc(UUID idHang,UUID idRam,UUID idRom,UUID idDLPin,UUID idChip,UUID moTaMan,UUID moTaCam) {
        return chiTietSanPhamRepository.loc(idHang, idRam, idRom, idDLPin,idChip,moTaMan,moTaCam);
    }

    @Override
    public ChiTietSanPham findById(UUID id) {
        return chiTietSanPhamRepository.findById(id).orElse(null);
    }

    @Override
    public ChiTietSanPham getChiTiet(UUID id) {
        return chiTietSanPhamRepository.getChiTiet(id);
    }

    @Override
    public ChiTietSanPham getChiTiet2(UUID id) {
        return chiTietSanPhamRepository.getChiTiet2(id);
    }

    @Override
    public ChiTietSanPham add(ChiTietSanPham chiTietSanPham) {
        return chiTietSanPhamRepository.save(chiTietSanPham);
    }

    @Override
    public ChiTietSanPham update(UUID id, ChiTietSanPham chiTietSanPham) {
        if (id != null) {
            ChiTietSanPham chiTietSanPhamUpdate = chiTietSanPhamRepository.findById(id).orElse(null);
            if (chiTietSanPhamUpdate != null) {
                BeanUtils.copyProperties(chiTietSanPham, chiTietSanPhamUpdate);
                chiTietSanPhamRepository.save(chiTietSanPhamUpdate);
            }
        }
        return null;
    }

    @Override
    public ChiTietSanPham update1(ChiTietSanPham chiTietSanPham) {
        return chiTietSanPhamRepository.save(chiTietSanPham);
    }

    @Override
    public Boolean delete(UUID id) {
        if (id != null) {
            ChiTietSanPham chiTietSanPham = chiTietSanPhamRepository.findById(id).orElse(null);
            if (chiTietSanPham != null) {
                chiTietSanPhamRepository.delete(chiTietSanPham);
                return true;
            }
        }
        return false;
    }
}
