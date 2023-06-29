package com.example.demo.service;

import com.example.demo.Model.MucQuyDoi;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import java.util.UUID;

public interface MucQuyDoiService {
    Page<MucQuyDoi> getAll(Pageable pageable);

    void add(MucQuyDoi mucQuyDoi);

    void update(MucQuyDoi mucQuyDoi);

    void delete(UUID id);

    MucQuyDoi getById(UUID id);
}
