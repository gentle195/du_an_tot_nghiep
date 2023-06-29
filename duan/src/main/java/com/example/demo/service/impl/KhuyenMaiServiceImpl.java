package com.example.demo.service.impl;

import com.example.demo.Model.KhuyenMai;
import com.example.demo.repository.KhuyenMaiRepository;
import com.example.demo.service.KhuyenMaiService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.UUID;

@Service
public class KhuyenMaiServiceImpl implements KhuyenMaiService {
    @Autowired
    KhuyenMaiRepository khuyenMaiRepository;
    @Override
    public Page<KhuyenMai> getAllByPages(Pageable pageable) {
        return khuyenMaiRepository.findAll(pageable);
    }

    @Override
    public List<KhuyenMai> getAllKhuyenMai() {
        return khuyenMaiRepository.findAll();
    }

    @Override
    public KhuyenMai getOne(UUID id) {
        return khuyenMaiRepository.getReferenceById(id);
    }

    @Override
    public void addOrUpdate(KhuyenMai khuyenMai) {
        khuyenMaiRepository.save(khuyenMai);

    }

    @Override
    public void remove(UUID id) {
        khuyenMaiRepository.deleteById(id);

    }
}
