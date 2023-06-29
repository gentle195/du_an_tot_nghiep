package com.example.demo.services.impl;

import com.example.demo.models.Pin;
import com.example.demo.repositories.PinRepository;
import com.example.demo.services.PinService;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.UUID;

@Service

public class PinServiceImpl implements PinService {

    @Autowired
    PinRepository pinRepository;


    @Override
    public Page<Pin> getAll(Pageable pageable) {
        return pinRepository.findAll(pageable);
    }

    @Override
    public List<Pin> findAll() {
        return pinRepository.findAll();
    }

    @Override
    public Pin findById(UUID id) {
        return pinRepository.findById(id).orElse(null);
    }

    @Override
    public Pin add(Pin pin) {
        return pinRepository.save(pin);
    }

    @Override
    public Pin update(UUID id, Pin pin) {
        if (id != null) {
            Pin pinUpdate = pinRepository.findById(id).orElse(null);
            if (pinUpdate != null) {
                BeanUtils.copyProperties(pin, pinUpdate);
                pinRepository.save(pinUpdate);
            }
        }
        return null;
    }

    @Override
    public Boolean delete(UUID id) {
        if (id != null) {
            Pin pin = pinRepository.findById(id).orElse(null);
            if (pin != null) {
                pinRepository.delete(pin);
                return true;
            }
        }
        return false;
    }
}
