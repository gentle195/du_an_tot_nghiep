package com.example.demo.services.impl;

import com.example.demo.models.QuyDoi;
import com.example.demo.repositories.QuyDoiRepository;
import com.example.demo.services.QuyDoiService;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.UUID;

@Service

public class QuyDoiServiceImpl implements QuyDoiService {

    @Autowired
    QuyDoiRepository quyDoiRepository;


    @Override
    public Page<QuyDoi> getAll(Pageable pageable) {
        return quyDoiRepository.findAll(pageable);
    }

    @Override
    public List<QuyDoi> findAll() {
        return quyDoiRepository.findAll();
    }

    @Override
    public QuyDoi findById(UUID id) {
        return quyDoiRepository.findById(id).orElse(null);
    }

    @Override
    public QuyDoi add(QuyDoi quyDoi) {
        return quyDoiRepository.save(quyDoi);
    }

    @Override
    public QuyDoi update(UUID id, QuyDoi quyDoi) {
        if (id != null) {
            QuyDoi quyDoiUpdate = quyDoiRepository.findById(id).orElse(null);
            if (quyDoiUpdate != null) {
                BeanUtils.copyProperties(quyDoi, quyDoiUpdate);
                quyDoiRepository.save(quyDoiUpdate);
            }
        }
        return null;
    }

    @Override
    public Boolean delete(UUID id) {
        if (id != null) {
            QuyDoi quyDoi = quyDoiRepository.findById(id).orElse(null);
            if (quyDoi != null) {
                quyDoiRepository.delete(quyDoi);
                return true;
            }
        }
        return false;
    }
}
