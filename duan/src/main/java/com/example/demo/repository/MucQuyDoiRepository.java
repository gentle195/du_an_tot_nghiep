package com.example.demo.repository;

import com.example.demo.Model.MucQuyDoi;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.UUID;

public interface MucQuyDoiRepository extends JpaRepository<MucQuyDoi, UUID> {
}
