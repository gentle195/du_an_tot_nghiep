package com.example.demo.services.impl;

import com.example.demo.models.GioHangChiTiet;
import com.example.demo.repositories.GioHangChiTietRepository;
import com.example.demo.services.GioHangChiTietService;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.UUID;

@Service

public class GioHangChiTietServiceImpl implements GioHangChiTietService {

    @Autowired
    GioHangChiTietRepository gioHangChiTietRepository;


    @Override
    public Page<GioHangChiTiet> getAll(Pageable pageable) {
        return gioHangChiTietRepository.findAll(pageable);
    }

    @Override
    public List<GioHangChiTiet> findAll() {
        return gioHangChiTietRepository.findAll();
    }

    @Override
    public GioHangChiTiet findById(UUID id) {
        return gioHangChiTietRepository.findById(id).orElse(null);
    }

    @Override
    public GioHangChiTiet add(GioHangChiTiet gioHangChiTiet) {
        return gioHangChiTietRepository.save(gioHangChiTiet);
    }

    @Override
    public GioHangChiTiet update(UUID id, GioHangChiTiet gioHangChiTiet) {
        if (id != null) {
            GioHangChiTiet gioHangChiTietUpdate = gioHangChiTietRepository.findById(id).orElse(null);
            if (gioHangChiTietUpdate != null) {
                BeanUtils.copyProperties(gioHangChiTiet, gioHangChiTietUpdate);
                gioHangChiTietRepository.save(gioHangChiTietUpdate);
            }
        }
        return null;
    }

    @Override
    public Boolean delete(UUID id) {
        if (id != null) {
            GioHangChiTiet gioHangChiTiet = gioHangChiTietRepository.findById(id).orElse(null);
            if (gioHangChiTiet != null) {
                gioHangChiTietRepository.delete(gioHangChiTiet);
                return true;
            }
        }
        return false;
    }
}
