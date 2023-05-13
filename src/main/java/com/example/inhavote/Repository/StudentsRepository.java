package com.example.inhavote.Repository;

import com.example.inhavote.Entity.StudentsEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

public interface StudentsRepository extends JpaRepository<StudentsEntity,String> {
    List<StudentsEntity> findByStudentname(String student_name);
    List<StudentsEntity> findByStudentmajorAndStudentgrade(String student_major, int student_grade);
    List<StudentsEntity> findByStudentmajor(String student_major);
    List<StudentsEntity> findByStudentgrade(int student_grade);
    StudentsEntity findByStudentid(String student_id);
    List<StudentsEntity> findAll();

    // 후보자(학생 이름) 검색
    @Query(value = "SELECT * FROM student WHERE student_name LIKE %:username% ORDER BY student_name",
            nativeQuery = true)
    List<StudentsEntity> findByStudent(@Param("username") String username);
}
