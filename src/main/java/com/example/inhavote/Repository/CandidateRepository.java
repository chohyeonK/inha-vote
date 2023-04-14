package com.example.inhavote.Repository;

import com.example.inhavote.Entity.CandidateEntity;
import org.springframework.data.jpa.repository.JpaRepository;

public interface CandidateRepository extends JpaRepository<CandidateEntity,String> {
}
