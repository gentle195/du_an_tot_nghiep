package com.example.demo.Service.impl;

import com.example.demo.Model.IMEI;
import com.example.demo.Repository.IMEIRepository;
import com.example.demo.Service.IMEIService;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.UUID;

@Service

public class IMEIServiceImpl implements IMEIService {

    @Autowired
    IMEIRepository imeiRepository;


    @Override
    public Page<IMEI> getAll(Pageable pageable) {
        return imeiRepository.findAll(pageable);
    }

    @Override
    public List<IMEI> findAll() {
        return imeiRepository.findAll();
    }

    @Override
    public IMEI findById(UUID id) {
        return imeiRepository.findById(id).orElse(null);
    }

    @Override
    public IMEI add(IMEI imei) {
        return imeiRepository.save(imei);
    }

    @Override
    public IMEI update(UUID id, IMEI imei) {
        if (id != null) {
            IMEI imeiUpdate = imeiRepository.findById(id).orElse(null);
            if (imeiUpdate != null) {
                BeanUtils.copyProperties(imei, imeiUpdate);
                imeiRepository.save(imeiUpdate);
            }
        }
        return null;
    }

    @Override
    public Boolean delete(UUID id) {
        if (id != null) {
            IMEI imei = imeiRepository.findById(id).orElse(null);
            if (imei != null) {
                imeiRepository.delete(imei);
                return true;
            }
        }
        return false;
    }
}
