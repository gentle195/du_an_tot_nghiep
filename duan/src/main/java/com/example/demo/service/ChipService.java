package com.example.demo.service;

import com.example.demo.Model.Chip;
import com.example.demo.Model.Pin;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import java.util.List;
import java.util.UUID;

public interface ChipService {
    Page<Chip> getAllByPages(Pageable pageable);

    List<Chip> getAllCTSP();

    Chip getOne(UUID id);

    void add(Chip chip);

    void update(Chip chip, UUID id);

    void remove(UUID id);

}
