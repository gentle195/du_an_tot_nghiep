package com.example.demo.repository;

import com.example.demo.Model.DungLuongPin;
import com.example.demo.Model.Pin;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.UUID;

@Repository
public interface DungLuongPinRepository extends JpaRepository<DungLuongPin, UUID> {
}
