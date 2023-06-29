package com.example.demo.Service.impl;

import com.example.demo.Model.DiaChi;
import com.example.demo.Repository.DiaChiRepository;
import com.example.demo.Service.DiaChiService;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.UUID;

@Service

public class DiaChiServiceImpl implements DiaChiService {

    @Autowired
    DiaChiRepository diaChiRepository;


    @Override
    public Page<DiaChi> getAll(Pageable pageable) {
        return diaChiRepository.findAll(pageable);
    }

    @Override
    public List<DiaChi> findAll() {
        return diaChiRepository.findAll();
    }

    @Override
    public DiaChi findById(UUID id) {
        return diaChiRepository.findById(id).orElse(null);
    }

    @Override
    public DiaChi add(DiaChi diaChi) {
        return diaChiRepository.save(diaChi);
    }

    @Override
    public DiaChi update(UUID id, DiaChi diaChi) {
        if (id != null) {
            DiaChi diaChiUpdate = diaChiRepository.findById(id).orElse(null);
            if (diaChiUpdate != null) {
                BeanUtils.copyProperties(diaChi, diaChiUpdate);
                diaChiRepository.save(diaChiUpdate);
            }
        }
        return null;
    }

    @Override
    public Boolean delete(UUID id) {
        if (id != null) {
            DiaChi diaChi = diaChiRepository.findById(id).orElse(null);
            if (diaChi != null) {
                diaChiRepository.delete(diaChi);
                return true;
            }
        }
        return false;
    }
}
