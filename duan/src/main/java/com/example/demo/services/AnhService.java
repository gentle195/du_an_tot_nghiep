package com.example.demo.services;

import com.example.demo.models.Anh;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import java.util.List;
import java.util.UUID;

public interface AnhService {
    public Page<Anh> getAll(Pageable pageable);

    public List<Anh> findAll();

    public Anh findById(UUID id);

    public Anh add(Anh anh);

    public Anh update(UUID id, Anh anh);

    public Boolean delete(UUID id);
}


