package com.example.demo.service.impl;

import com.example.demo.Model.Ram;
import com.example.demo.repository.RamRepository;
import com.example.demo.service.RamService;
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
    public Page<Ram> getAllByPages(Pageable pageable) {
        return ramRepository.findAll(pageable);
    }

    @Override
    public List<Ram> getAllRam() {
        return ramRepository.findAll();
    }

    @Override
    public Ram getOne(UUID id) {
        return ramRepository.getReferenceById(id);
    }

    @Override
    public void addOrUpdate(Ram ram) {
        ramRepository.save(ram);

    }

    @Override
    public void remove(UUID id) {
        ramRepository.deleteById(id);

    }
}
