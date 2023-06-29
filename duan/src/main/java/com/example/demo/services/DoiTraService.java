package com.example.demo.services;

import com.example.demo.models.DoiTra;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import java.util.List;
import java.util.UUID;

public interface DoiTraService {
    public Page<DoiTra> getAll(Pageable pageable);

    public List<DoiTra> findAll();

    public DoiTra findById(UUID id);

    public DoiTra add(DoiTra doiTra);

    public DoiTra update(UUID id, DoiTra doiTra);

    public Boolean delete(UUID id);
}


