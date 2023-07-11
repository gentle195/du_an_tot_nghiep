package com.example.demo.services.impl;

import com.example.demo.models.Ram;
import com.example.demo.repositories.RamRepository;
import com.example.demo.services.RamService;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.UUID;

@Service

public class RamServiceImpl implements RamService {

    @Autowired
    RamRepository ramRepository;


    @Override
    public Page<Ram> getAll(Pageable pageable) {
        return ramRepository.findAll(pageable);
    }

    @Override
    public List<Ram> findAll() {
        return ramRepository.findAll();
    }

    @Override
    public List<Ram> getAll0() {
        return ramRepository.getAll0();
    }

    @Override
    public Ram findById(UUID id) {
        return ramRepository.findById(id).orElse(null);
    }

    @Override
    public Ram add(Ram ram) {
        return ramRepository.save(ram);
    }

    @Override
    public Ram update(UUID id, Ram ram) {
        if (id != null) {
            Ram ramUpdate = ramRepository.findById(id).orElse(null);
            if (ramUpdate != null) {
                BeanUtils.copyProperties(ram, ramUpdate);
                ramRepository.save(ramUpdate);
            }
        }
        return null;
    }

    @Override
    public Boolean delete(UUID id) {
        if (id != null) {
            Ram ram = ramRepository.findById(id).orElse(null);
            if (ram != null) {
                ramRepository.delete(ram);
                return true;
            }
        }
        return false;
    }
}
