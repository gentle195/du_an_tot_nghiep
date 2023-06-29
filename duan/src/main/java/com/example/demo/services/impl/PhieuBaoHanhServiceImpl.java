package com.example.demo.services.impl;

import com.example.demo.models.PhieuBaoHanh;
import com.example.demo.repositories.PhieuBaoHanhRepository;
import com.example.demo.services.PhieuBaoHanhService;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.UUID;

@Service

public class PhieuBaoHanhServiceImpl implements PhieuBaoHanhService {

    @Autowired
    PhieuBaoHanhRepository phieuBaoHanhRepository;


    @Override
    public Page<PhieuBaoHanh> getAll(Pageable pageable) {
        return phieuBaoHanhRepository.findAll(pageable);
    }

    @Override
    public List<PhieuBaoHanh> findAll() {
        return phieuBaoHanhRepository.findAll();
    }

    @Override
    public PhieuBaoHanh findById(UUID id) {
        return phieuBaoHanhRepository.findById(id).orElse(null);
    }

    @Override
    public PhieuBaoHanh add(PhieuBaoHanh phieuBaoHanh) {
        return phieuBaoHanhRepository.save(phieuBaoHanh);
    }

    @Override
    public PhieuBaoHanh update(UUID id, PhieuBaoHanh phieuBaoHanh) {
        if (id != null) {
            PhieuBaoHanh anhUpdate = phieuBaoHanhRepository.findById(id).orElse(null);
            if (anhUpdate != null) {
                BeanUtils.copyProperties(phieuBaoHanh, anhUpdate);
                phieuBaoHanhRepository.save(anhUpdate);
            }
        }
        return null;
    }

    @Override
    public Boolean delete(UUID id) {
        if (id != null) {
            PhieuBaoHanh phieuBaoHanh = phieuBaoHanhRepository.findById(id).orElse(null);
            if (phieuBaoHanh != null) {
                phieuBaoHanhRepository.delete(phieuBaoHanh);
                return true;
            }
        }
        return false;
    }
}
