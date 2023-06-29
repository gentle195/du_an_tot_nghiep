package com.example.demo.service.impl;

import com.example.demo.Model.SanPham;

import com.example.demo.repository.SanPhamRepository;
import com.example.demo.service.SanPhamService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.UUID;

@Service
public class SanPhamServiceimpl implements SanPhamService {
    @Autowired
    SanPhamRepository sanPhamRepository;
    @Override
    public List<SanPham> getAlll(){
        return sanPhamRepository.findAll();
    }
    @Override
    public Page<SanPham> getAll(Pageable pageable){
        return sanPhamRepository.findAll(pageable);
    }
    @Override
    public SanPham getOne(UUID id){
       return sanPhamRepository.findById(id).orElse(null);
    }
    @Override
    public void addvsupdate(SanPham sp){
        sanPhamRepository.save(sp);
    }
    @Override
    public void delete(UUID id){
        sanPhamRepository.deleteById(id);
    }
}
