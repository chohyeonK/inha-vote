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

    @Column(name = "manager_id")
    private String managerid;
    @Column(name = "manager_name")
    private String managername;
    @Column(name = "manager_tel")
    private String managertel;
    @Column(name = "vote_name")
    private String votename;
    @Column(name = "vote_active")
    private char voteactive;

    @Id
    @Column(name = "vote_id")
    private String voteid;
    @Column(name = "student_major")
    private String studentmajor;
    @Column(name = "student_grade")
    private int studentgrade;

    @Temporal(TemporalType.TIMESTAMP)
    @Column(name = "start_date")
    private Date startdate;
    @Temporal(TemporalType.TIMESTAMP)
    @Column(name = "end_date")
    private Date enddate;
}

