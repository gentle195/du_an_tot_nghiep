package com.example.demo.service.impl;

import com.example.demo.Model.ChiTietSanPham;
import com.example.demo.repository.ChiTietSanPhamRepository;
import com.example.demo.service.ChiTietSanPhamService;
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
    public Page<ChiTietSanPham> getAllByPages(Pageable pageable) {
        return chiTietSanPhamRepository.findAll(pageable);
    }

    @Override
    public List<ChiTietSanPham> getAllCTSP() {
        return chiTietSanPhamRepository.findAll();
    }

    @Override
    public ChiTietSanPham getOne(UUID id) {
        return chiTietSanPhamRepository.findById(id).get();
    }

    @Override
    public void addOrUpdate(ChiTietSanPham chiTietSanPham) {
        chiTietSanPhamRepository.save(chiTietSanPham);
    }

    @Override
    public void remove(UUID id) {
        chiTietSanPhamRepository.deleteById(id);
    }
}
