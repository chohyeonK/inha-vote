package com.example.inhavote.Entity;

//import jakarta.persistence.Column;
import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.Id;

import jakarta.persistence.Table;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
@Entity
@Table(name="Student")
public class StudentsEntity {
    @Id
    @Column(name = "student_id")
    private String studentid;
    @Column(name = "student_name")
    private String studentname;
    @Column(name = "student_major")
    private String studentmajor;
    @Column(name = "student_grade")
    private int studentgrade;
    @Column(name = "student_email")
    private String studentemail;

}
