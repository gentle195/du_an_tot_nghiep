package com.example.demo.service.impl;

import com.example.demo.Model.DungLuongPin;
import com.example.demo.Model.Pin;
import com.example.demo.repository.DungLuongPinRepository;
import com.example.demo.repository.PinRepository;
import com.example.demo.service.DungLuongPinService;
import com.example.demo.service.PinService;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.UUID;

@Service

public class DungLuongPinServiceImpl implements DungLuongPinService {
    @Autowired
    DungLuongPinRepository repository;


    @Override
    public Page<DungLuongPin> getAllByPages(Pageable pageable) {
        return repository.findAll(pageable);
    }

    @Override
    public List<DungLuongPin> getAllCTSP() {
        return repository.findAll();
    }

    @Override
    public DungLuongPin getOne(UUID id) {
        return repository.findById(id).get();
    }

    @Override
    public void add(DungLuongPin pin) {
        repository.save(pin);
    }

    @Override
    public void update(DungLuongPin pin, UUID id) {
        DungLuongPin dungLuongPin =  repository.getOne(id);
        BeanUtils.copyProperties(pin, dungLuongPin);
        repository.save(dungLuongPin);
    }

    @Override
    public void remove(UUID id) {
        repository.deleteById(id);
    }

    @Override
    public List<DungLuongPin> getList() {
        return repository.findAll();
    }
}
