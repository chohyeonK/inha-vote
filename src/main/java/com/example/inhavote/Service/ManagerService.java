package com.example.inhavote.Service;

import com.example.inhavote.Entity.*;
import com.example.inhavote.DTO.ManagerDTO;
import com.example.inhavote.Repository.ManagerRepository;
import com.example.inhavote.Repository.StudentsRepository;
import jakarta.transaction.Transactional;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@RequiredArgsConstructor
@Service
public class ManagerService {
    private final ManagerRepository managerRepository;

    public void create_vote(ManagerDTO managerDTO) {
        ManagerEntity manager = new ManagerEntity() ;
        manager.setManagerid(managerDTO.getManager_id());
        manager.setManagername(managerDTO.getManager_name());
        manager.setManagertel(managerDTO.getManager_tel());
        manager.setVoteid(managerDTO.getVote_id());
        manager.setVoteactive(managerDTO.getVote_active());
        System.out.println("매니저 서비스");
        this.managerRepository.save(manager);
    }
    @Transactional
    public  void register_vote(String vote_id, String vote_name,int student_grade,String student_major,Date start_date,Date end_date){
        ManagerEntity manager=managerRepository.findByVoteid(vote_id);
        manager.setVotename(vote_name);
        manager.setEnddate(end_date);
        manager.setStartdate(start_date);
        manager.setStudentgrade(student_grade);
        manager.setStudentmajor(student_major);
    }

    public ManagerEntity findByManager_id(String manager_id){
        System.out.println("managerRepository.findByVote_id(vote_id):"+managerRepository.findByManagerid(manager_id));
        return managerRepository.findByManagerid(manager_id);
    }
    public ManagerEntity findByVote_id(String vote_id){
        System.out.println("managerRepository.findByVote_id(vote_id):"+managerRepository.findByVoteid(vote_id));
        return managerRepository.findByVoteid(vote_id);
    }
    public Boolean findByManager_idAndManager_name(String manager_id,String manager_name){
        ManagerEntity manager=managerRepository.findByManageridAndManagername(manager_id,manager_name);
        boolean exists=(manager!=null);
        return exists;
    }
    public void imgUpload( MultipartFile file) {
        String fileName = file.getOriginalFilename();
        if (fileName.endsWith(".jpg") || fileName.endsWith(".png")) {
            if (!file.isEmpty()) {
                try {
                    byte[] bytes = file.getBytes();
                    Path path = Paths.get("./src/main/webapp/resources/img_candidate/" + file.getOriginalFilename());
                    Files.write(path, bytes);
                    //return "succes";
                } catch (IOException e) {
                    e.printStackTrace();
                }
            }
            //return "empty file";
        }
        //return "extension error"; //err
    }



}
