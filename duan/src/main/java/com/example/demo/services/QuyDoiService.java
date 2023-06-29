package com.example.demo.services;

import com.example.demo.models.QuyDoi;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import java.util.List;
import java.util.UUID;

public interface QuyDoiService {
    public Page<QuyDoi> getAll(Pageable pageable);

    public List<QuyDoi> findAll();

    public QuyDoi findById(UUID id);

    public QuyDoi add(QuyDoi quyDoi);

    public QuyDoi update(UUID id, QuyDoi quyDoi);

    public Boolean delete(UUID id);
}


