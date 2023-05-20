package com.example.inhavote.Service;

import com.example.inhavote.DTO.RegisterVoteDTO;
import com.example.inhavote.Entity.*;
import com.example.inhavote.DTO.CreateVoteDTO;
import com.example.inhavote.Repository.ManagerRepository;
import jakarta.transaction.Transactional;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.Date;
import java.util.List;

@RequiredArgsConstructor
@Service
public class ManagerService {
    private final ManagerRepository managerRepository;

    public void create_vote(CreateVoteDTO createVoteDTO) {
        ManagerEntity manager = new ManagerEntity() ;
        manager.setManagerid(createVoteDTO.getManager_id());
        manager.setManagername(createVoteDTO.getManager_name());
        manager.setManagertel(createVoteDTO.getManager_tel());
        manager.setVoteid(createVoteDTO.getVote_id());
        manager.setVoteactive(createVoteDTO.getVote_active());
        //System.out.println("매니저 서비스");
        this.managerRepository.save(manager);
    }

    @Transactional
    public  void register_vote(String vote_id,RegisterVoteDTO registerVoteDTO){
        ManagerEntity manager=managerRepository.findByVoteid(vote_id);
        manager.setVotename(registerVoteDTO.getVote_name());
        manager.setEnddate(registerVoteDTO.getEnd_date());
        manager.setStartdate(registerVoteDTO.getStart_date());
        manager.setStudentgrade(registerVoteDTO.getStudent_grade());
        manager.setStudentmajor(registerVoteDTO.getStudent_major());
    }
    public List<ManagerEntity> findByManager_id(String manager_id){
        //System.out.println("managerRepository.findByVote_id(vote_id):"+managerRepository.findByManagerid(manager_id));
        return managerRepository.findByManagerid(manager_id);
    }
    public int vote_count(String manager_id){ return managerRepository.findByManagerid(manager_id).size();}

    public Boolean findByManager_idAndManager_name(String manager_id,String manager_name){ //managerLogin
        ManagerEntity manager=managerRepository.findByManageridAndManagername(manager_id,manager_name);
        boolean exists=(manager!=null);
        return exists;
    }

    public ManagerEntity findByVote_id(String vote_id){
        return managerRepository.findByVoteid(vote_id);
    }



}
