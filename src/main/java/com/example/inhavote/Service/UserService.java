package com.example.inhavote.Service;

import com.example.inhavote.Entity.UserEntity;
import com.example.inhavote.Repository.UserRepository;
import jakarta.transaction.Transactional;
import org.apache.catalina.User;
import org.springframework.stereotype.Service;

@Service
public class UserService {
    private final UserRepository userRepository;

    public UserService(UserRepository userRepository) {
        this.userRepository = userRepository;
    }

    public UserEntity findByStudent_idAndVote_id(String studentId, String voteId) {
        UserEntity student = userRepository.findByStudentidAndVoteid(studentId, voteId);
        return student;
    }

    @Transactional
    public UserEntity authUser(String studentId, String voteId, String authCode) {
        UserEntity voteStudent = findByStudent_idAndVote_id(studentId, voteId);
        voteStudent.setEmailconfirm(authCode);
        return voteStudent;
    }

    @Transactional
    public void authCode(UserEntity user) {
        user.setEmailconfirm("T");
    }
}
