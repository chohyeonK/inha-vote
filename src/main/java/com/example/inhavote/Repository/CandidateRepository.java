package com.example.inhavote.Repository;

import com.example.inhavote.Entity.CandidateEntity;
import com.example.inhavote.Entity.CandidateId;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface CandidateRepository extends JpaRepository<CandidateEntity, CandidateId> {
}
