package com.example.inhavote.Entity;

//import jakarta.persistence.Column;
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
    private String student_id;

    private String student_name;

    private String student_major;

    private int student_grade;


}
