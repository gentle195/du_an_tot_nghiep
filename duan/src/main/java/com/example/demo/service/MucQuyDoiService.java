package com.example.demo.Service;

import com.example.demo.Model.MucQuyDoi;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import java.util.List;
import java.util.UUID;

public interface MucQuyDoiService {
    public Page<MucQuyDoi> getAll(Pageable pageable);

    public List<MucQuyDoi> findAll();

    public MucQuyDoi findById(UUID id);

    public MucQuyDoi add(MucQuyDoi mucQuyDoi);

    public MucQuyDoi update(UUID id, MucQuyDoi mucQuyDoi);

    public Boolean delete(UUID id);
}


