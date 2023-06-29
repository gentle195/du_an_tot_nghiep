package com.example.demo.repositories;

import com.example.demo.models.Chip;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.UUID;

@Repository
public interface ChipRepository extends JpaRepository<Chip, UUID> {
}
