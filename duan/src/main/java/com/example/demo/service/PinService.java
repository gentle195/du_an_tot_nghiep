package com.example.demo.service;

import com.example.demo.Model.ChiTietSanPham;
import com.example.demo.Model.DungLuongPin;
import com.example.demo.Model.Pin;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import java.util.List;
import java.util.UUID;

public interface PinService {
    Page<Pin> getAllByPages(Pageable pageable);

    List<Pin> getAllCTSP();

    Pin getOne(UUID id);

    void add(Pin pin);

    void update(Pin pin, UUID id);

    void remove(UUID id);

}
