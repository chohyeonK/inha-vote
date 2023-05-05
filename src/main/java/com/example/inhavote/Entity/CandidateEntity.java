package com.example.inhavote.Entity;

import jakarta.persistence.*;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
@Entity
@IdClass(CandidateId.class)
@Table(name="Candidate")
public class CandidateEntity {
    @Id
    @Column(name = "student_id")
    private String studentid;
    @Id
    @Column(name = "vote_id")
    private String voteid;


    @Column(name = "candidate_spec")
    private String candidatespec;
    @Column(name = "student_promise")
    private String candidatepromise;

    @Column(name = "vote_counter")
    private int votecounter;
    @Column(name = "img_path")
    private String imgpath;

}
