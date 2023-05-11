package com.example.inhavote.Repository;

import com.example.inhavote.Entity.StudentsEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

public interface StudentsRepository extends JpaRepository<StudentsEntity,String> {
    List<StudentsEntity> findByStudentname(String student_name);
    List<StudentsEntity> findByStudentmajorAndStudentgrade(String student_major, int student_grade);
    List<StudentsEntity> findByStudentmajor(String student_major);
    List<StudentsEntity> findByStudentgrade(int student_grade);
    List<StudentsEntity> findByStudentname(String student_name);
    List<StudentsEntity> findAll();
}
