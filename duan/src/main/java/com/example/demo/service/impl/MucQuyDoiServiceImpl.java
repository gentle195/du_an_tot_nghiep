package com.example.demo.service.impl;

import com.example.demo.Model.MucQuyDoi;
import com.example.demo.repository.MucQuyDoiRepository;
import com.example.demo.service.MucQuyDoiService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import java.util.UUID;

@Service
public class MucQuyDoiServiceImpl implements MucQuyDoiService {

    @Autowired
    private MucQuyDoiRepository mucQuyDoiRepository;

    @Override
    public Page<MucQuyDoi> getAll(Pageable pageable) {
        return mucQuyDoiRepository.findAll(pageable);
    }

    @Override
    public void add(MucQuyDoi mucQuyDoi) {
        mucQuyDoiRepository.save(mucQuyDoi);
    }

    @Override
    public void update(MucQuyDoi mucQuyDoi) {
        mucQuyDoiRepository.save(mucQuyDoi);
    }

    @Override
    public void delete(UUID id) {
        mucQuyDoiRepository.deleteById(id);
    }

    @Override
    public MucQuyDoi getById(UUID id) {
        return mucQuyDoiRepository.findById(id).orElse(null);
    }
}
