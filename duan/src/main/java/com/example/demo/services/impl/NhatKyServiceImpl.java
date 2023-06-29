package com.example.demo.services.impl;

import com.example.demo.models.NhatKy;
import com.example.demo.repositories.NhatKyRepository;
import com.example.demo.services.NhatKyService;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.UUID;

@Service

public class NhatKyServiceImpl implements NhatKyService {

    @Autowired
    NhatKyRepository nhatKyRepository;


    @Override
    public Page<NhatKy> getAll(Pageable pageable) {
        return nhatKyRepository.findAll(pageable);
    }

    @Override
    public List<NhatKy> findAll() {
        return nhatKyRepository.findAll();
    }

    @Override
    public NhatKy findById(UUID id) {
        return nhatKyRepository.findById(id).orElse(null);
    }

    @Override
    public NhatKy add(NhatKy nhatKy) {
        return nhatKyRepository.save(nhatKy);
    }

    @Override
    public NhatKy update(UUID id, NhatKy nhatKy) {
        if (id != null) {
            NhatKy nhatKyUpdate = nhatKyRepository.findById(id).orElse(null);
            if (nhatKyUpdate != null) {
                BeanUtils.copyProperties(nhatKy, nhatKyUpdate);
                nhatKyRepository.save(nhatKyUpdate);
            }
        }
        return null;
    }

    @Override
    public Boolean delete(UUID id) {
        if (id != null) {
            NhatKy nhatKy = nhatKyRepository.findById(id).orElse(null);
            if (nhatKy != null) {
                nhatKyRepository.delete(nhatKy);
                return true;
            }
        }
        return false;
    }
}
