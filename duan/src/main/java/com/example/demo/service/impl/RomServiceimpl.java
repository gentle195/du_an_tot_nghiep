package com.example.demo.service.impl;

import com.example.demo.Model.Rom;

import com.example.demo.repository.RomRepository;
import com.example.demo.service.RomService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.UUID;

@Service
public class RomServiceimpl implements RomService {
    @Autowired
    RomRepository romRepository;
    @Override
    public List<Rom> getAlll(){
        return romRepository.findAll();
    }
    @Override
    public Page<Rom> getAll(Pageable pageable){
        return romRepository.findAll(pageable);
    }
    @Override
    public Rom getOne(UUID id){
        return romRepository.findById(id).orElse(null);
    }
    @Override
    public void  AddandUpdate(Rom rom){
        romRepository.save(rom);
    }
    @Override
    public void delete(UUID id){
        romRepository.deleteById(id);
    }
}
