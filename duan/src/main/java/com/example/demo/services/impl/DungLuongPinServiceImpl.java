package com.example.demo.services.impl;

import com.example.demo.models.DungLuongPin;
import com.example.demo.repositories.DungLuongPinRepository;
import com.example.demo.services.DungLuongPinService;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.UUID;

@Service

public class DungLuongPinServiceImpl implements DungLuongPinService {

    @Autowired
    DungLuongPinRepository dungLuongPinRepository;


    @Override
    public Page<DungLuongPin> getAll(Pageable pageable) {
        return dungLuongPinRepository.findAll(pageable);
    }

    @Override
    public List<DungLuongPin> findAll() {
        return dungLuongPinRepository.findAll();
    }

    @Override
    public DungLuongPin findById(UUID id) {
        return dungLuongPinRepository.findById(id).orElse(null);
    }

    @Override
    public DungLuongPin add(DungLuongPin dungLuongPin) {
        return dungLuongPinRepository.save(dungLuongPin);
    }

    @Override
    public DungLuongPin update(UUID id, DungLuongPin dungLuongPin) {
        if (id != null) {
            DungLuongPin dungLuongPinUpdate = dungLuongPinRepository.findById(id).orElse(null);
            if (dungLuongPinUpdate != null) {
                BeanUtils.copyProperties(dungLuongPin, dungLuongPinUpdate);
                dungLuongPinRepository.save(dungLuongPinUpdate);
            }
        }
        return null;
    }

    @Override
    public Boolean delete(UUID id) {
        if (id != null) {
            DungLuongPin dungLuongPin = dungLuongPinRepository.findById(id).orElse(null);
            if (dungLuongPin != null) {
                dungLuongPinRepository.delete(dungLuongPin);
                return true;
            }
        }
        return false;
    }
}
