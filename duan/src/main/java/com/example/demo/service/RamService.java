package com.example.demo.service;

import com.example.demo.Model.Ram;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import java.util.List;
import java.util.UUID;

public interface RamService {
    Page<Ram> getAllByPages(Pageable pageable);
    List<Ram> getAllRam();
    Ram getOne(UUID id);
    void addOrUpdate(Ram ram);
    void remove(UUID id);
}
