package com.example.inhavote.DTO;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class VoteDTO {
    private String student_id;
    private int student_grade;
    private String student_major;
    private String vote_id;
    private String candidate_spec;
    private String img_path;
    private String vote_counter;
    private String candidate_promise;
    private String vote_number;
}
