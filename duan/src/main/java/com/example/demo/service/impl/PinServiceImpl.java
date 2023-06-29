package com.example.demo.service.impl;

import com.example.demo.Model.ChiTietSanPham;
import com.example.demo.Model.Pin;
import com.example.demo.repository.ChiTietSanPhamRepository;
import com.example.demo.repository.PinRepository;
import com.example.demo.service.ChiTietSanPhamService;
import com.example.demo.service.PinService;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.UUID;

@Service

public class PinServiceImpl implements PinService {
    @Autowired
    PinRepository repository;


    @Override
    public Page<Pin> getAllByPages(Pageable pageable) {
        return repository.findAll(pageable);
    }

    @Override
    public List<Pin> getAllCTSP() {
        return repository.findAll();
    }

    @Override
    public Pin getOne(UUID id) {
        return repository.findById(id).get();
    }

    @Override
    public void add(Pin pin) {
        repository.save(pin);
    }

    @Override
    public void update(Pin pin, UUID id) {
        Pin pin1 = repository.getOne(id);
        BeanUtils.copyProperties(pin, pin1);
        repository.save(pin1);
    }


    @Override
    public void remove(UUID id) {
        repository.deleteById(id);
    }
}
