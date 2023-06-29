package com.example.demo.service;

import com.example.demo.Model.MauSac;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import java.util.List;
import java.util.UUID;

public interface MauSacService {
    Page<MauSac> getAllByPages(Pageable pageable);
    List<MauSac> getAllMauSac();
    MauSac getOne(UUID id);
    void addOrUpdate(MauSac mauSac);
    void remove(UUID id);

}
