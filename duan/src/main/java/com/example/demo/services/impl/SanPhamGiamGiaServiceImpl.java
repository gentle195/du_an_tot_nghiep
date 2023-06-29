package com.example.demo.services.impl;

import com.example.demo.models.SanPhamGiamGia;
import com.example.demo.repositories.SanPhamGiamGiaRepository;
import com.example.demo.services.SanPhamGiamGiaService;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.UUID;

@Service

public class SanPhamGiamGiaServiceImpl implements SanPhamGiamGiaService {

    @Autowired
    SanPhamGiamGiaRepository sanPhamGiamGiaRepository;


    @Override
    public Page<SanPhamGiamGia> getAll(Pageable pageable) {
        return sanPhamGiamGiaRepository.findAll(pageable);
    }

    @Override
    public List<SanPhamGiamGia> findAll() {
        return sanPhamGiamGiaRepository.findAll();
    }

    @Override
    public SanPhamGiamGia findById(UUID id) {
        return sanPhamGiamGiaRepository.findById(id).orElse(null);
    }

    @Override
    public SanPhamGiamGia add(SanPhamGiamGia sanPhamGiamGia) {
        return sanPhamGiamGiaRepository.save(sanPhamGiamGia);
    }

    @Override
    public SanPhamGiamGia update(UUID id, SanPhamGiamGia sanPhamGiamGia) {
        if (id != null) {
            SanPhamGiamGia sanPhamGiamGiaUpdate = sanPhamGiamGiaRepository.findById(id).orElse(null);
            if (sanPhamGiamGiaUpdate != null) {
                BeanUtils.copyProperties(sanPhamGiamGia, sanPhamGiamGiaUpdate);
                sanPhamGiamGiaRepository.save(sanPhamGiamGiaUpdate);
            }
        }
        return null;
    }

    @Override
    public Boolean delete(UUID id) {
        if (id != null) {
            SanPhamGiamGia sanPhamGiamGia = sanPhamGiamGiaRepository.findById(id).orElse(null);
            if (sanPhamGiamGia != null) {
                sanPhamGiamGiaRepository.delete(sanPhamGiamGia);
                return true;
            }
        }
        return false;
    }
}
