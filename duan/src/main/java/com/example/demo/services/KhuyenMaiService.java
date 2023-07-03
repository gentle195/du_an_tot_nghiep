package com.example.demo.services;

import com.example.demo.models.KhuyenMai;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import java.util.List;
import java.util.UUID;

public interface KhuyenMaiService {
    public Page<KhuyenMai> getAll(Pageable pageable);

    public List<KhuyenMai> findAll();

    public List<KhuyenMai> getAll0();
    public KhuyenMai findById(UUID id);

    public KhuyenMai add(KhuyenMai khuyenMai);

    public KhuyenMai update(UUID id, KhuyenMai khuyenMai);

    public Boolean delete(UUID id);


}


