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
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.Objects;

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

        Calendar end_date = Calendar.getInstance();
        end_date.setTime(registerVoteDTO.getEnd_date());
        end_date.set(Calendar.HOUR_OF_DAY, 18); // 시간을 09로 설정
        end_date.set(Calendar.MINUTE, 0); // 분을 00으로 설정
        end_date.set(Calendar.SECOND, 0); // 초를 00으로 설정
        end_date.add(Calendar.DATE, 30); // 30일을 더함
        manager.setLastenddate(end_date.getTime());
    }
    /*public boolean compareVoteDate(String manager_id) {
        List<ManagerEntity> manager = findByManager_id(manager_id);
        if (Objects.nonNull(manager.get(0).getEnddate())){
            Date today = new Date();
            return today.before(manager.get(0).getEnddate())?true:false;
        }
        else return true;
    }*/
    public String compareVoteDate(String manager_id) {
        List<ManagerEntity> manager = findByManager_id(manager_id);

        Date today = new Date();
        Date endDate = manager.get(0).getEnddate();
        Date lastEndDate = manager.get(0).getLastenddate();

        if (endDate != null && today.before(endDate)) {
            return "err2";
        } else if (lastEndDate != null && today.after(lastEndDate)) {
            return "err5";
        } else if(endDate==null||lastEndDate==null){
            return "err4";
        }
        return "success";
    }
    public boolean existVote(String manager_id){
        List<ManagerEntity> manager=findByManager_id(manager_id);
        return manager.get(0).getVotename()!=null ? true:false;
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
