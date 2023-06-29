package com.example.demo.services;

import com.example.demo.models.DungLuongPin;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import java.util.List;
import java.util.UUID;

public interface DungLuongPinService {
    public Page<DungLuongPin> getAll(Pageable pageable);

    public List<DungLuongPin> findAll();

    public DungLuongPin findById(UUID id);

    public DungLuongPin add(DungLuongPin dungLuongPin);

    public DungLuongPin update(UUID id, DungLuongPin dungLuongPin);

    public Boolean delete(UUID id);
}


