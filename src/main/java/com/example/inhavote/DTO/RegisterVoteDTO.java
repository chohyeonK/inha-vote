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


    public RegisterVoteDTO(String manager_id, String vote_name, String student_major, int student_grade, String start_date, String end_date,  List<CandidateEntity> candidates) throws ParseException {
        this.manager_id = manager_id;
        this.vote_name = vote_name;
        this.student_major = student_major;
        this.student_grade = student_grade;
        SimpleDateFormat formatter= new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        Date m_start_date,m_end_date;
        m_start_date=formatter.parse(start_date+" 09:00:00");
        m_end_date=formatter.parse(end_date+" 18:00:00");
        this.start_date = m_start_date;
        this.end_date = m_end_date;

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
