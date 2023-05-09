package com.example.inhavote.Service;

import com.example.inhavote.Entity.*;
import com.example.inhavote.Repository.*;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import java.util.List;
@RequiredArgsConstructor
@Service
public class StudentsService {
    @Autowired
    private final StudentsRepository studentsRepository;
    @Autowired
    private final UserRepository userRepository;


    public void create_user(String student_major,int student_grade,String vote_id) {
        List<StudentsEntity> students = null;
        if (student_major.equals("모든과") && student_grade == 0)
            students = studentsRepository.findAll();
        else if (student_major.equals("모든과")&&student_grade>0)
            students = studentsRepository.findByStudentgrade(student_grade);
        else if (!student_major.equals("모든과")&&student_grade==0)
            students = studentsRepository.findByStudentmajor(student_major);
        else
            students = studentsRepository.findByStudentmajorAndStudentgrade(student_major, student_grade);


        for(StudentsEntity student:students){
            UserEntity user = new UserEntity();
            user.setStudentid(student.getStudentid());
            user.setVoteid(vote_id);
            /*System.out.println(student.getStudentmajor() + "/" + student.getStudentgrade() + "/" + student.getStudentid());
            System.out.println("\n");*/
            this.userRepository.save(user);
        }
    }

    public List<StudentsEntity> findAll()
    {
        return studentsRepository.findAll();
    }
}
