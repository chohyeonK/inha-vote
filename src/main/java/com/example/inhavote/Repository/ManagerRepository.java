package com.example.inhavote.Repository;

import com.example.inhavote.Entity.ManagerEntity;
import org.springframework.data.jpa.repository.JpaRepository;

public interface ManagerRepository extends JpaRepository<ManagerEntity,String> {
}
