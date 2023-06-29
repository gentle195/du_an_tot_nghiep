package com.example.demo.service.impl;

import com.example.demo.Model.HangKhachHang;
import com.example.demo.repository.HangKhachHangRepository;
import com.example.demo.repository.KhachHangRepository;
import com.example.demo.service.HangKhachHangService;
import com.example.demo.service.KhachHangService;
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
    public Page<HangKhachHang> getAllByPages(Pageable pageable) {
        return hangKhachHangRepository.findAll(pageable);
    }

    @Override
    public List<HangKhachHang> getAllHKH() {
        return hangKhachHangRepository.findAll();
    }

    @Override
    public HangKhachHang getOne(UUID id) {
        return hangKhachHangRepository.findById(id).get();
    }

    @Override
    public void addOrUpdate(HangKhachHang hangKhachHang) {
        hangKhachHangRepository.save(hangKhachHang);
    }

    @Override
    public void remove(UUID id) {
        hangKhachHangRepository.deleteById(id);
    }
}
