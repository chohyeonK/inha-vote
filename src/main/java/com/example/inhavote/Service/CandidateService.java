package com.example.inhavote.Service;

import com.example.inhavote.Entity.*;
import com.example.inhavote.Entity.CandidateId;
import com.example.inhavote.Repository.CandidateRepository;
import com.example.inhavote.Repository.StudentsRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.List;

@RequiredArgsConstructor
@Service
public class CandidateService {
    private final CandidateRepository candidateRepository;
    private final StudentsRepository studentsRepository;

    public void register_candidate(List<CandidateEntity> candidateList,String vote_id){
        for(CandidateEntity candidate:candidateList){
            CandidateEntity candidateEntity=new CandidateEntity();
            candidateEntity.setCandidatepromise(candidate.getCandidatepromise());
            candidateEntity.setCandidatespec(candidate.getCandidatespec());
            candidateEntity.setVoteid(vote_id);
            candidateEntity.setImgpath(candidate.getStudentid()+".png");
            candidateEntity.setStudentid(candidate.getStudentid());
            this.candidateRepository.save(candidateEntity);
        }
    }
    public void imgUpload( MultipartFile file,String student_id) {
        String fileName = file.getOriginalFilename();
        if (!file.isEmpty()) {
            try {
                byte[] bytes = file.getBytes();
                Path path = Paths.get("./src/main/webapp/resources/img/candidate_img/" + student_id+".png");
                Files.write(path, bytes);
                //return "succes";
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
    }
    public int candidates_count(String vote_id){
        return candidateRepository.findByVoteid(vote_id).size();
    }
    public List<StudentsEntity> candidate_List(String vote_id){
        List<StudentsEntity> candidate_list = new ArrayList<>();
        for(CandidateEntity candidate: candidateRepository.findByVoteid(vote_id)) {
            candidate_list.add(studentsRepository.findByStudentid(candidate.getStudentid()));
        }

        return candidate_list;
    }
    public List<CandidateEntity> findByVote_id(String vote_id){
        return candidateRepository.findByVoteid(vote_id);
    }
    public CandidateEntity findByStudentidAndVoteid(String student_id,String vote_id){
        return candidateRepository.findByStudentidAndVoteid(student_id,vote_id);
    }

}
