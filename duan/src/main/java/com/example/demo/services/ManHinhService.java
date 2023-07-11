package com.example.demo.services;

import com.example.demo.models.ManHinh;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import java.util.List;
import java.util.UUID;

public interface ManHinhService {
    public Page<ManHinh> getAll(Pageable pageable);

    public List<ManHinh> findAll();

    public ManHinh findById(UUID id);

    public ManHinh add(ManHinh manHinh);

    public ManHinh update(UUID id, ManHinh manHinh);

    public Boolean delete(UUID id);
}
