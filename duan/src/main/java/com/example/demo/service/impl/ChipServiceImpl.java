package com.example.demo.service.impl;

import com.example.demo.Model.Chip;
import com.example.demo.Model.Pin;
import com.example.demo.repository.ChipRepository;
import com.example.demo.repository.PinRepository;
import com.example.demo.service.ChipService;
import com.example.demo.service.PinService;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.UUID;

@Service

public class ChipServiceImpl implements ChipService {
    @Autowired
    ChipRepository repository;


    @Override
    public Page<Chip> getAllByPages(Pageable pageable) {
        return repository.findAll(pageable);
    }

    @Override
    public List<Chip> getAllCTSP() {
        return repository.findAll();
    }

    @Override
    public Chip getOne(UUID id) {
        return repository.findById(id).get();
    }

    @Override
    public void add(Chip pin) {
        repository.save(pin);
    }

    @Override
    public void update(Chip chip, UUID id) {
        Chip chip1 = repository.getOne(id);
        BeanUtils.copyProperties(chip, chip1);
        repository.save(chip1);
    }


    @Override
    public void remove(UUID id) {
        repository.deleteById(id);
    }
}
