package com.example.demo.Repository;

import com.example.demo.Model.Rom;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.UUID;

@Repository
public interface RomRepository extends JpaRepository<Rom, UUID> {
}
