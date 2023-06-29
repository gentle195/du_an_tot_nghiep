package com.example.demo.repository;

import com.example.demo.Model.KhuyenMai;
import org.springframework.data.jpa.repository.JpaRepository;

import java.rmi.server.UID;
import java.util.UUID;

public interface KhuyenMaiRepository extends JpaRepository<KhuyenMai, UUID> {
}
