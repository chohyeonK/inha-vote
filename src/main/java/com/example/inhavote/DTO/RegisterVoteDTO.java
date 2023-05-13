package com.example.inhavote.DTO;

import com.example.inhavote.Entity.CandidateEntity;
import lombok.Getter;
import lombok.Setter;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

@Getter
@Setter
public class RegisterVoteDTO {
    private String manager_id;
    private String vote_name;
    private String student_major;
    private int student_grade;
    private Date start_date;
    private Date end_date;
//페이지 1
    private List<CandidateEntity> candidates;


    public RegisterVoteDTO() {

        this.candidates = candidates;
    }

    @Override
    public String toString() {
        return "RegisterVoteDTO{" +
                "manager_id='" + manager_id + '\'' +
                ", vote_name='" + vote_name + '\'' +
                ", student_major='" + student_major + '\'' +
                ", student_grade=" + student_grade +
                ", start_date=" + start_date +
                ", end_date=" + end_date +
                ", candidates=" + candidates +
                '}';
    }
}
