package com.example.inhavote.Repository;

import com.example.inhavote.DTO.CandidateStudentDTO;
import com.example.inhavote.Entity.CandidateEntity;
import com.example.inhavote.Entity.CandidateId;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface CandidateRepository extends JpaRepository<CandidateEntity, CandidateId> {


    List<CandidateEntity> findByVoteid(String vote_id);
    CandidateEntity findByStudentidAndVoteid(String student_id,String vote_id);

    CandidateEntity findByVoteidAndVotecounter(String vote_id, int vote_counter);

    @Query(value = "SELECT * FROM student S INNER JOIN candidate C ON S.student_id=C.student_id WHERE C.vote_id=:voteId",
            nativeQuery = true)
    List<CandidateStudentDTO> findCandidateStudent(@Param("voteId") String voteId);

   @Query(value = "SELECT * FROM student S INNER JOIN candidate C ON S.student_id=C.student_id WHERE C.vote_id=:voteId AND C.student_id=:voteNumber", nativeQuery = true)
   CandidateStudentDTO findCandidateVote(@Param("voteId") String voteId, @Param("voteNumber") String voteNumber);
}
