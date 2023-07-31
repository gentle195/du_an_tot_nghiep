package com.example.demo.services;

import com.example.demo.models.HoaDon;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import java.sql.Date;
import java.time.LocalDate;
import java.util.List;
import java.util.UUID;

public interface HoaDonService {
    public Page<HoaDon> getAll(Pageable pageable);

    public List<HoaDon> findAll();

    public List<HoaDon> find();

    public HoaDon findById(UUID id);

    public HoaDon add(HoaDon hoaDon);

    public HoaDon update(UUID id, HoaDon hoaDon);

    public HoaDon thanhToan(HoaDon hoaDon);

    public Boolean delete(UUID id);

    public void update(UUID id, int tinhTrang, Date ngayCapNhat);
}


