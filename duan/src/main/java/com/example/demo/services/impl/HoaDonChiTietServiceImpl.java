package com.example.demo.services.impl;

import com.example.demo.models.HoaDonChiTiet;
import com.example.demo.repositories.HoaDonChiTietRepository;
import com.example.demo.services.HoaDonChiTietService;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.UUID;

@Service

public class HoaDonChiTietServiceImpl implements HoaDonChiTietService {

    @Autowired
    HoaDonChiTietRepository hoaDonChiTietRepository;


    @Override
    public Page<HoaDonChiTiet> getAll(Pageable pageable) {
        return hoaDonChiTietRepository.findAll(pageable);
    }

    @Override
    public Page<HoaDonChiTiet> getHoaDonChiTiet(Pageable pageable, UUID id) {
        return hoaDonChiTietRepository.getHoaDonChiTiet(pageable,id);
    }

    @Override
    public List<HoaDonChiTiet> findAll() {
        return hoaDonChiTietRepository.findAll();
    }

    @Override
    public List<HoaDonChiTiet> getHoaDonChiTiet(UUID id) {
        return hoaDonChiTietRepository.getHoaDonChiTiet(id);
    }

    @Override
    public HoaDonChiTiet findById(UUID id) {
        return hoaDonChiTietRepository.findById(id).orElse(null);
    }

    @Override
    public HoaDonChiTiet add(HoaDonChiTiet hoaDonChiTiet) {
        return hoaDonChiTietRepository.save(hoaDonChiTiet);
    }

    @Override
    public HoaDonChiTiet update(UUID id, HoaDonChiTiet hoaDonChiTiet) {
        if (id != null) {
            HoaDonChiTiet hoaDonChiTietUpdate = hoaDonChiTietRepository.findById(id).orElse(null);
            if (hoaDonChiTietUpdate != null) {
                BeanUtils.copyProperties(hoaDonChiTiet, hoaDonChiTietUpdate);
                hoaDonChiTietRepository.save(hoaDonChiTietUpdate);
            }
        }
        return null;
    }

    @Override
    public Boolean delete(UUID id) {
        if (id != null) {
            HoaDonChiTiet hoaDonChiTiet = hoaDonChiTietRepository.findById(id).orElse(null);
            if (hoaDonChiTiet != null) {
                hoaDonChiTietRepository.delete(hoaDonChiTiet);
                return true;
            }
        }
        return false;
    }
}
