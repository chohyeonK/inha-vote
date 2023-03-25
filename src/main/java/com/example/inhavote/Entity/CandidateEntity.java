package com.example.inhavote.Entity;

import jakarta.persistence.*;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
@Entity
@Table(name="Candidate")
public class CandidateEntity {
    @Id
    private String student_id;

    @Column(columnDefinition = "TEXT")
    private String candidate_spec;
    @Column(columnDefinition = "TEXT")
    private String candidate_promise;

    private String vote_id;
    private int vote_counter;

    @ManyToOne
    private ManagerEntity vote;
}
