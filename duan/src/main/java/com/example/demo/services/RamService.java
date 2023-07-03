package com.example.demo.services;

import com.example.demo.models.Ram;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import java.util.List;
import java.util.UUID;

public interface RamService {
    public Page<Ram> getAll(Pageable pageable);

    public List<Ram> findAll();

    public List<Ram> getAll0();

    public Ram findById(UUID id);

    public Ram add(Ram ram);

    public Ram update(UUID id, Ram ram);

    public Boolean delete(UUID id);
}


