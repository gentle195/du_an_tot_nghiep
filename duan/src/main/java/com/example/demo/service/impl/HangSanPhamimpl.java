package com.example.demo.service.impl;

import com.example.demo.Model.HangSanPham;

import com.example.demo.repository.HangSanPhamRepository;
import com.example.demo.service.HangSanPhamService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.UUID;

@Service
public class HangSanPhamimpl implements HangSanPhamService {
@Autowired
HangSanPhamRepository hangSanPhamRepository;
@Override
public List<HangSanPham> getAlll(){
    return hangSanPhamRepository.findAll();
}
@Override
public Page<HangSanPham> getAll(Pageable pageable){
    return hangSanPhamRepository.findAll(pageable);
}
@Override
public HangSanPham getOne(UUID id){
    return hangSanPhamRepository.findById(id).orElse(null);
}
@Override
public void  AddandUpdate(HangSanPham hangSanPham){
     hangSanPhamRepository.save(hangSanPham);
}
@Override
public void delete(UUID id){
    hangSanPhamRepository.deleteById(id);
}
}
