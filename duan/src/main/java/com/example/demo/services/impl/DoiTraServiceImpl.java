package com.example.demo.services.impl;

import com.example.demo.models.DoiTra;
import com.example.demo.repositories.DoiTraRepository;
import com.example.demo.services.DoiTraService;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.UUID;

@Service

public class DoiTraServiceImpl implements DoiTraService {

    @Autowired
    DoiTraRepository doiTraRepository;


    @Override
    public Page<DoiTra> getAll(Pageable pageable) {
        return doiTraRepository.findAll(pageable);
    }

    @Override
    public List<DoiTra> findAll() {
        return doiTraRepository.findAll();
    }

    @Override
    public DoiTra findById(UUID id) {
        return doiTraRepository.findById(id).orElse(null);
    }

    @Override
    public DoiTra add(DoiTra doiTra) {
        return doiTraRepository.save(doiTra);
    }

    @Override
    public DoiTra update(UUID id, DoiTra doiTra) {
        if (id != null) {
            DoiTra doiTraUpdate = doiTraRepository.findById(id).orElse(null);
            if (doiTraUpdate != null) {
                BeanUtils.copyProperties(doiTra, doiTraUpdate);
                doiTraRepository.save(doiTraUpdate);
            }
        }
        return null;
    }

    @Override
    public Boolean delete(UUID id) {
        if (id != null) {
            DoiTra doiTra = doiTraRepository.findById(id).orElse(null);
            if (doiTra != null) {
                doiTraRepository.delete(doiTra);
                return true;
            }
        }
        return false;
    }
}
