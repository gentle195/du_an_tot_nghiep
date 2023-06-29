package com.example.demo.services;

import com.example.demo.models.NhatKy;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import java.util.List;
import java.util.UUID;

public interface NhatKyService {
    public Page<NhatKy> getAll(Pageable pageable);

    public List<NhatKy> findAll();

    public NhatKy findById(UUID id);

    public NhatKy add(NhatKy nhatKy);

    public NhatKy update(UUID id, NhatKy nhatKy);

    public Boolean delete(UUID id);
}


