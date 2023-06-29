package com.example.demo.service.impl;

import com.example.demo.Model.MauSac;
import com.example.demo.repository.MauSacRepository;
import com.example.demo.service.MauSacService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.UUID;

@Service
public class MauSacServiceImpl implements MauSacService {
    @Autowired
    MauSacRepository mauSacRepository;
    @Override
    public Page<MauSac> getAllByPages(Pageable pageable) {
        return mauSacRepository.findAll(pageable);
    }

    @Override
    public List<MauSac> getAllMauSac() {
        return mauSacRepository.findAll();
    }

    @Override
    public MauSac getOne(UUID id) {
        return mauSacRepository.getReferenceById(id);
    }

    @Override
    public void addOrUpdate(MauSac mauSac) {
        mauSacRepository.save(mauSac);


    }

    @Override
    public void remove(UUID id) {
        mauSacRepository.deleteById(id);

    }
}
