package com.example.inhavote.Repository;

import com.example.inhavote.Entity.StudentsEntity;
import com.example.inhavote.Entity.UserEntity;
import com.example.inhavote.Entity.UserId;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface UserRepository extends JpaRepository<UserEntity, UserId> {
    UserEntity findByStudentidAndVoteid(String studentId, String voteId);

    List<UserEntity> findByVoteid(String vote_id);
}
