package com.example.demo.services.impl;

import com.example.demo.models.GioHang;
import com.example.demo.repositories.GioHangRepository;
import com.example.demo.services.GioHangService;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.UUID;

@Service

public class GioHangServiceImpl implements GioHangService {

    @Autowired
    GioHangRepository gioHangRepository;


    @Override
    public Page<GioHang> getAll(Pageable pageable) {
        return gioHangRepository.findAll(pageable);
    }

    @Override
    public List<GioHang> findAll() {
        return gioHangRepository.findAll();
    }

    @Override
    public GioHang findById(UUID id) {
        return gioHangRepository.findById(id).orElse(null);
    }

    @Override
    public GioHang add(GioHang gioHang) {
        return gioHangRepository.save(gioHang);
    }

    @Override
    public GioHang update(UUID id, GioHang gioHang) {
        if (id != null) {
            GioHang gioHangUpdate = gioHangRepository.findById(id).orElse(null);
            if (gioHangUpdate != null) {
                BeanUtils.copyProperties(gioHang, gioHangUpdate);
                gioHangRepository.save(gioHangUpdate);
            }
        }
        return null;
    }

    @Override
    public Boolean delete(UUID id) {
        if (id != null) {
            GioHang gioHang = gioHangRepository.findById(id).orElse(null);
            if (gioHang != null) {
                gioHangRepository.delete(gioHang);
                return true;
            }
        }
        return false;
    }
}
