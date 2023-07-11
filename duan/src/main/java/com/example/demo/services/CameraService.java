package com.example.demo.services;

import com.example.demo.models.Camera;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import java.util.List;
import java.util.UUID;

public interface CameraService {
    public Page<Camera> getAll(Pageable pageable);

    public List<Camera> findAll();

    public Camera findById(UUID id);

    public Camera add(Camera camera);

    public Camera update(UUID id, Camera camera);

    public Boolean delete(UUID id);
}
