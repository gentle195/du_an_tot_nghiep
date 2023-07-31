package com.example.demo.services.impl;

import com.example.demo.models.HoaDon;
import com.example.demo.repositories.HoaDonRepository;
import com.example.demo.services.HoaDonService;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import java.sql.Date;
import java.time.LocalDate;
import java.util.List;
import java.util.UUID;

@Service

public class HoaDonServiceImpl implements HoaDonService {

    @Autowired
    HoaDonRepository hoaDonRepository;


    @Override
    public Page<HoaDon> getAll(Pageable pageable) {
        return hoaDonRepository.findAll(pageable);
    }

    @Override
    public List<HoaDon> findAll() {
        return hoaDonRepository.findAll();
    }

    @Override
    public List<HoaDon> find() {
        return hoaDonRepository.find();
    }

    @Override
    public HoaDon findById(UUID id) {
        return hoaDonRepository.findById(id).orElse(null);
    }

    @Override
    public HoaDon add(HoaDon hoaDon) {
        return hoaDonRepository.save(hoaDon);
    }

    @Override
    public HoaDon update(UUID id, HoaDon hoaDon) {
        if (id != null) {
            HoaDon hoaDonUpdate = hoaDonRepository.findById(id).orElse(null);
            if (hoaDonUpdate != null) {
                BeanUtils.copyProperties(hoaDon, hoaDonUpdate);
                hoaDonRepository.save(hoaDonUpdate);
            }
        }
        return null;
    }

    @Override
    public HoaDon thanhToan(HoaDon hoaDon) {
        return hoaDonRepository.save(hoaDon);
    }

    @Override
    public Boolean delete(UUID id) {
        if (id != null) {
            HoaDon hoaDon = hoaDonRepository.findById(id).orElse(null);
            if (hoaDon != null) {
                hoaDonRepository.delete(hoaDon);
                return true;
            }
        }
        return false;
    }

    @Override
    public void update(UUID id,int tinhTrang, Date ngayCapNhat) {
        hoaDonRepository.update(id,tinhTrang, ngayCapNhat);
    }
}
