package com.example.demo.service;

import com.example.demo.Model.Rom;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import java.util.List;
import java.util.UUID;

public interface RomService {
    public List<Rom> getAlll();
    public Page<Rom> getAll(Pageable pageable);
    public Rom getOne(UUID id);
    public void  AddandUpdate(Rom rom);
    public void delete(UUID id);
}
