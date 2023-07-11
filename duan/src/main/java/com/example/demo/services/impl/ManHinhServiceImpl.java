package com.example.demo.services.impl;

import com.example.demo.models.ManHinh;
import com.example.demo.repositories.ManHinhRepository;
import com.example.demo.services.ManHinhService;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.UUID;

@Service
public class ManHinhServiceImpl implements ManHinhService {

    @Autowired
    private ManHinhRepository manHinhRepository;

    @Override
    public Page<ManHinh> getAll(Pageable pageable) {
        return manHinhRepository.findAll(pageable);
    }

    @Override
    public List<ManHinh> findAll() {
        return manHinhRepository.findAll();
    }

    @Override
    public ManHinh findById(UUID id) {
        return manHinhRepository.findById(id).orElse(null);
    }

    @Override
    public ManHinh add(ManHinh manHinh) {
        return manHinhRepository.save(manHinh);
    }

    @Override
    public ManHinh update(UUID id, ManHinh manHinh) {
        if (id != null) {
            ManHinh manHinhUpdate = manHinhRepository.findById(id).orElse(null);
            if (manHinhUpdate != null) {
                BeanUtils.copyProperties(manHinh, manHinhUpdate);
                manHinhRepository.save(manHinhUpdate);
            }
        }
        return null;
    }

    @Override
    public Boolean delete(UUID id) {
        if (id != null) {
            ManHinh manHinh = manHinhRepository.findById(id).orElse(null);
            if (manHinh != null) {
                manHinhRepository.delete(manHinh);
                return true;
            }
        }
        return null;
    }
}
