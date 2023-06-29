package com.example.demo.Service;

import com.example.demo.Model.IMEI;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import java.util.List;
import java.util.UUID;

public interface IMEIService {
    public Page<IMEI> getAll(Pageable pageable);

    public List<IMEI> findAll();

    public IMEI findById(UUID id);

    public IMEI add(IMEI imei);

    public IMEI update(UUID id, IMEI imei);

    public Boolean delete(UUID id);
}


