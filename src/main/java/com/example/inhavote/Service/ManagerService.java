package com.example.inhavote.Service;

import com.example.inhavote.Entity.ManagerEntity;
import com.example.inhavote.DTO.ManagerDTO;
import com.example.inhavote.Repository.ManagerRepository;
import jakarta.transaction.Transactional;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

@RequiredArgsConstructor
@Service
public class ManagerService {
    private final ManagerRepository managerRepository;

    public void create(ManagerDTO managerDTO) {
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
    public  void register(String vote_id,String vote_name){
        ManagerEntity manager=managerRepository.findByVoteid(vote_id);
        manager.setVotename(vote_name);

        /*manager.setEnddate(managerDTO.getEnd_date());
        manager.setStartdate(managerDTO.getStart_date());
        manager.setStudentgrade(managerDTO.getStudent_grade());
        manager.setStudentmajor(managerDTO.getStudent_major());*/
        //this.managerRepository.save(manager);
    }
    public ManagerEntity findByManager_id(String manager_id){
        System.out.println("managerRepository.findByVote_id(vote_id):"+managerRepository.findByManagerid(manager_id));
        return managerRepository.findByManagerid(manager_id);
    }
    public ManagerEntity findByVote_id(String vote_id){
        System.out.println("managerRepository.findByVote_id(vote_id):"+managerRepository.findByVoteid(vote_id));
        return managerRepository.findByVoteid(vote_id);
    }
}
