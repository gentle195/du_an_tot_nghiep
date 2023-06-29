package com.example.demo.services;

import com.example.demo.models.Pin;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import java.util.List;
import java.util.UUID;

public interface PinService {
    public Page<Pin> getAll(Pageable pageable);

    public List<Pin> findAll();

    public Pin findById(UUID id);

    public Pin add(Pin pin);

    public Pin update(UUID id, Pin pin);

    public Boolean delete(UUID id);
}


