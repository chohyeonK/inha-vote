package com.example.inhavote.Entity;

import jakarta.persistence.*;
import lombok.Getter;
import lombok.Setter;

import java.util.Date;
import java.util.List;

@Getter
@Setter
@Entity
@Table(name="vote")
public class ManagerEntity {

    private String manager_id;
    private String manager_name;
    private String manager_tel;
    private String vote_name;
    private char vote_active;
    @Id
    private String vote_id;

    private String student_major;
    private int student_grade;

    @Temporal(TemporalType.TIMESTAMP)
    private Date start_date;
    @Temporal(TemporalType.TIMESTAMP)
    private Date end_date;

    @OneToMany(mappedBy = "vote",cascade = CascadeType.REMOVE)
    private List<CandidateEntity> candidateList;
}

