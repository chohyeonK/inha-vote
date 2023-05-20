package com.example.inhavote.Repository;

import com.example.inhavote.Entity.CandidateEntity;
import com.example.inhavote.Entity.CandidateId;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface CandidateRepository extends JpaRepository<CandidateEntity, CandidateId> {


    List<CandidateEntity> findByVoteid(String vote_id);
    CandidateEntity findByStudentidAndVoteid(String student_id,String vote_id);

}
