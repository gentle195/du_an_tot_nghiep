package com.example.demo.services;

import com.example.demo.models.Chip;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import java.util.List;
import java.util.UUID;

public interface ChipService {
    public Page<Chip> getAll(Pageable pageable);

    public List<Chip> findAll();

    public Chip findById(UUID id);

    public Chip add(Chip chip);

    public Chip update(UUID id, Chip chip);

    public Boolean delete(UUID id);
}


