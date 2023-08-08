package com.example.demo.services.impl;

import com.example.demo.models.SanPham;
import com.example.demo.repositories.SanPhamRepository;
import com.example.demo.services.SanPhamService;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.UUID;

@Service

public class SanPhamServiceImpl implements SanPhamService {

    @Autowired
    SanPhamRepository sanPhamRepository;


    @Override
    public Page<SanPham> getAll(Pageable pageable) {
        return sanPhamRepository.findAll(pageable);
    }

    @Override
    public List<SanPham> findAll() {
        return sanPhamRepository.findAll();
    }

    @Override
    public SanPham findById(UUID id) {
        return sanPhamRepository.findById(id).orElse(null);
    }

    @Override
    public SanPham add(SanPham sanPham) {
        return sanPhamRepository.save(sanPham);
    }

    @Override
    public SanPham update(UUID id, SanPham sanPham) {
        if (id != null) {
            SanPham sanPhamUpdate = sanPhamRepository.findById(id).orElse(null);
            if (sanPhamUpdate != null) {
                BeanUtils.copyProperties(sanPham, sanPhamUpdate);
                sanPhamRepository.save(sanPhamUpdate);
            }
        }
        return null;
    }

    @Override
    public SanPham update(SanPham sanPham) {
        return sanPhamRepository.save(sanPham);
    }

    @Override
    public Boolean delete(UUID id) {
        if (id != null) {
            SanPham sanPham = sanPhamRepository.findById(id).orElse(null);
            if (sanPham != null) {
                sanPhamRepository.delete(sanPham);
                return true;
            }
        }
        return false;
    }
}
