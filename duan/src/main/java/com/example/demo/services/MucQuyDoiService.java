package com.example.demo.services;

import com.example.demo.models.MucQuyDoi;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import java.util.List;
import java.util.UUID;

public interface MucQuyDoiService {

    public Page<MucQuyDoi> getAllMucQuyDoi(Pageable pageable);

    public List<MucQuyDoi> findAll();

    public MucQuyDoi getById(UUID id);

    public MucQuyDoi add(MucQuyDoi mucQuyDoi);

    public MucQuyDoi update(UUID id, MucQuyDoi mucQuyDoi);

    public Boolean delete(UUID id);
}


