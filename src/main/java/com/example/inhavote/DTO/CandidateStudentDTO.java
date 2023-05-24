package com.example.inhavote.DTO;

import com.example.inhavote.Entity.CandidateEntity;
import com.example.inhavote.Entity.StudentsEntity;
import lombok.Getter;

public interface CandidateStudentDTO  {
    String getStudent_id();
    String getStudent_grade();
    int getStudent_major();
    String getStudent_name();

    String getVote_id();

    String getCandidate_spec();

    String getImg_path();

    int getVote_counter();

    String getCandidate_promise();

    String getVote_number();

    void setStudent_id(String studentId);
    void setStudent_grade(int studentGrade);
    void setStudent_major(String studentMajor);
    void setStudent_name(String studentName);
    void setVote_id(String voteId);
    void setVote_counter(int voteCounter);
    void setVoteNumber(String voteNumber);




}


