package com.example.demo.service.impl;

import com.example.demo.Model.KhachHang;

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
public class KhachHangServiceImpl implements KhachHangService {
    @Autowired
    KhachHangRepository khachHangRepository;


    @Override
    public Page<KhachHang> getAllByPages(Pageable pageable) {
        return khachHangRepository.findAll(pageable);
    }

    @Override
    public List<KhachHang> getAllKH() {
        return khachHangRepository.findAll();
    }

    @Override
    public KhachHang getOne(UUID id) {
        return khachHangRepository.findById(id).get();
    }

    @Override
    public void addOrUpdate(KhachHang khachHang) {
        khachHangRepository.save(khachHang);
    }

    @Override
    public void remove(UUID id) {
        khachHangRepository.deleteById(id);
    }

}
