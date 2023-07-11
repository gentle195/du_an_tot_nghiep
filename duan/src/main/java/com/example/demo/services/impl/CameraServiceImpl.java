package com.example.demo.services.impl;

import com.example.demo.models.Camera;
import com.example.demo.repositories.CameraRepository;
import com.example.demo.services.CameraService;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.UUID;

@Service
public class CameraServiceImpl implements CameraService {
    @Autowired
    private CameraRepository cameraRepository;

    @Override
    public Page<Camera> getAll(Pageable pageable) {
        return cameraRepository.findAll(pageable);
    }

    @Override
    public List<Camera> findAll() {
        return cameraRepository.findAll();
    }

    @Override
    public Camera findById(UUID id) {
        return cameraRepository.findById(id).orElse(null);
    }

    @Override
    public Camera add(Camera camera) {
        return cameraRepository.save(camera);
    }

    @Override
    public Camera update(UUID id, Camera camera) {
        if (id != null) {
            Camera cameraUpdate = cameraRepository.findById(id).orElse(null);
            if (cameraUpdate != null) {
                BeanUtils.copyProperties(camera, cameraUpdate);
                cameraRepository.save(cameraUpdate);
            }
        }
        return null;
    }

    @Override
    public Boolean delete(UUID id) {
        if (id != null) {
            Camera camera = cameraRepository.findById(id).orElse(null);
            if (camera != null) {
                cameraRepository.delete(camera);
                return true;
            }
        }
        return null;
    }
}
