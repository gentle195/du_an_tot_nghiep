package com.example.demo.service;

import com.example.demo.Model.DungLuongPin;
import com.example.demo.Model.Pin;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import java.util.List;
import java.util.UUID;

public interface DungLuongPinService {
    Page<DungLuongPin> getAllByPages(Pageable pageable);

    List<DungLuongPin> getAllCTSP();

    DungLuongPin getOne(UUID id);

    void add(DungLuongPin pin);

    void update(DungLuongPin pin, UUID id);

    void remove(UUID id);

    List<DungLuongPin> getList();
}
