package com.example.demo.services.impl;

import com.example.demo.models.MucQuyDoi;
import com.example.demo.repositories.MucQuyDoiRepository;
import com.example.demo.services.MucQuyDoiService;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.UUID;

@Service

public class MucQuyDoiServiceImpl implements MucQuyDoiService {

    @Autowired
    MucQuyDoiRepository mucQuyDoiRepository;


    @Override
    public Page<MucQuyDoi> getAllMucQuyDoi(Pageable pageable) {
        return mucQuyDoiRepository.findAll(pageable);
    }

    @Override
    public List<MucQuyDoi> findAll() {
        return mucQuyDoiRepository.findAll();
    }

    @Override
    public MucQuyDoi getById(UUID id) {
        return mucQuyDoiRepository.findById(id).orElse(null);
    }

    @Override
    public MucQuyDoi add(MucQuyDoi mucQuyDoi) {
        return mucQuyDoiRepository.save(mucQuyDoi);
    }

    @Override
    public MucQuyDoi update(UUID id, MucQuyDoi mucQuyDoi) {
        if (id != null) {
            MucQuyDoi mucQuyDoiUpdate = mucQuyDoiRepository.findById(id).orElse(null);
            if (mucQuyDoiUpdate != null) {
                BeanUtils.copyProperties(mucQuyDoi, mucQuyDoiUpdate);
                mucQuyDoiRepository.save(mucQuyDoiUpdate);
            }
        }
        return null;
    }

    @Override
    public Boolean delete(UUID id) {
        if (id != null) {
            MucQuyDoi mucQuyDoi = mucQuyDoiRepository.findById(id).orElse(null);
            if (mucQuyDoi != null) {
                mucQuyDoiRepository.delete(mucQuyDoi);
                return true;
            }
        }
        return false;
    }
}
