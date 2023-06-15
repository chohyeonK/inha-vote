package com.example.inhavote.Service;

import com.example.inhavote.Entity.*;
import com.example.inhavote.Repository.*;
import jakarta.transaction.Transactional;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Objects;

@Service
public class UserService {
    private final UserRepository userRepository;
    private final StudentsRepository studentsRepository;

    public UserService(UserRepository userRepository, StudentsRepository studentsRepository) {
        this.userRepository = userRepository;
        this.studentsRepository = studentsRepository;
    }

    public UserEntity findByStudent_idAndVote_id(String studentId, String voteId) {
        UserEntity student = userRepository.findByStudentidAndVoteid(studentId, voteId);
        return student;
    }

    // 투표 대상 확인
    public UserEntity voterConfirm(String studentId, String voteId) {
        UserEntity voter = findByStudent_idAndVote_id(studentId, voteId);

        return voter;
    }

    // 이메일 인증 번호 저장
    @Transactional
    public void saveAuthCode(UserEntity voter, String authCode) {
        voter.setEmailconfirm(authCode);
    }

    // 인증 번호 확인 완료
    @Transactional
    public void authCode(UserEntity user) {
        user.setEmailconfirm("T");
    }

    public List<UserEntity> findByVoteid(String vote_id)
    {
        return userRepository.findByVoteid(vote_id);
    }

    public int getUserVoteRateByVote_id(String vote_id)
    {
        long voteCount = 0;
        long userCount = 0;
        List<UserEntity> users = findByVoteid(vote_id);

        for(UserEntity user : users)
        {
            userCount++;
            if(user.isVoteconfirm())
                voteCount++;
        }
        double voteRate = (double)voteCount / (double)userCount * 100;
        return (int)voteRate;
    }
    public int getUserVoteRateByVote_idAndStudentGrade(String vote_id, int student_grade)
    {
        long voteCount = 0;
        long userCount = 0;
        List<UserEntity> users = findByVoteid(vote_id);

        for(UserEntity user : users)
        {
            StudentsEntity student = studentsRepository.findByStudentid(user.getStudentid());
            if(student.getStudentgrade() == student_grade)
            {
                userCount++;
                if (user.isVoteconfirm())
                    voteCount++;
            }
        }
        double voteRate = (double)voteCount / (double)userCount * 100;
        return (int)voteRate;
    }
    public int getUserVoteRateByVote_idAndStudentMajor(String vote_id, String student_major)
    {
        long voteCount = 0;
        long userCount = 0;
        List<UserEntity> users = findByVoteid(vote_id);

        for(UserEntity user : users)
        {
            StudentsEntity student = studentsRepository.findByStudentid(user.getStudentid());
            if(Objects.equals(student.getStudentmajor(), student_major))
            {
                userCount++;
                if (user.isVoteconfirm())
                    voteCount++;
            }
        }
        double voteRate = (double)voteCount / (double)userCount * 100;
        return (int)voteRate;
    }

}
