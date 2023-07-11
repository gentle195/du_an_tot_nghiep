package com.example.demo.services.impl;

import com.example.demo.models.Anh;
import com.example.demo.repositories.AnhRepository;
import com.example.demo.services.AnhService;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.UUID;

@Service

public class AnhServiceImpl implements AnhService {

    @Autowired
    AnhRepository anhRepository;


    @Override
    public Page<Anh> getAll(Pageable pageable) {
        return anhRepository.findAll(pageable);
    }

    @Override
    public List<Anh> findAll() {
        return anhRepository.findAll();
    }

    @Override
    public Anh findById(UUID id) {
        return anhRepository.findById(id).orElse(null);
    }

    @Override
    public Anh add(Anh anh) {
        return anhRepository.save(anh);
    }

    @Override
    public Anh update(UUID id, Anh anh) {
        if (id != null) {
            Anh anhUpdate = anhRepository.findById(id).orElse(null);
            if (anhUpdate != null) {
                BeanUtils.copyProperties(anh, anhUpdate);
                anhRepository.save(anhUpdate);
            }
        }
        return null;
    }

    @Override
    public Boolean delete(UUID id) {
        if (id != null) {
            Anh anh = anhRepository.findById(id).orElse(null);
            if (anh != null) {
                anhRepository.delete(anh);
                return true;
            }
        }
        return false;
    }
}
