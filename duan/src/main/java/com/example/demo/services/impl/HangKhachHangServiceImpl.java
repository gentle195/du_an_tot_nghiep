package com.example.demo.services.impl;

import com.example.demo.models.HangKhachHang;
import com.example.demo.repositories.HangKhachHangRepository;
import com.example.demo.services.HangKhachHangService;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.UUID;

@Service

public class HangKhachHangServiceImpl implements HangKhachHangService {

    @Autowired
    HangKhachHangRepository hangKhachHangRepository;


    @Override
    public Page<HangKhachHang> getAll(Pageable pageable) {
        return hangKhachHangRepository.findAll(pageable);
    }

    @Override
    public List<HangKhachHang> findAll() {
        return hangKhachHangRepository.findAll();
    }

    @Override
    public List<HangKhachHang> getALL0() {
        return hangKhachHangRepository.getall0();
    }

    @Override
    public HangKhachHang findById(UUID id) {
        return hangKhachHangRepository.findById(id).orElse(null);
    }

    @Override
    public HangKhachHang add(HangKhachHang hangKhachHang) {
        return hangKhachHangRepository.save(hangKhachHang);
    }

    @Override
    public HangKhachHang update(UUID id, HangKhachHang hangKhachHang) {
        if (id != null) {
            HangKhachHang hangKhachHangUpdate = hangKhachHangRepository.findById(id).orElse(null);
            if (hangKhachHangUpdate != null) {
                BeanUtils.copyProperties(hangKhachHang, hangKhachHangUpdate);
                hangKhachHangRepository.save(hangKhachHangUpdate);
            }
        }
        return null;
    }

    @Override
    public Boolean delete(UUID id) {
        if (id != null) {
            HangKhachHang hangKhachHang = hangKhachHangRepository.findById(id).orElse(null);
            if (hangKhachHang != null) {
                hangKhachHangRepository.delete(hangKhachHang);
                return true;
            }
        }
        return false;
    }
}
