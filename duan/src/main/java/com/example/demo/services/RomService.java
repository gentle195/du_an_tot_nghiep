package com.example.demo.services;

import com.example.demo.models.Rom;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import java.util.List;
import java.util.UUID;

public interface RomService {
    public Page<Rom> getAll(Pageable pageable);

    public List<Rom> findAll();

    public Rom findById(UUID id);

    public Rom add(Rom rom);

    public Rom update(UUID id, Rom rom);

    public Boolean delete(UUID id);
}


