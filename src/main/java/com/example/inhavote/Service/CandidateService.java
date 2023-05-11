package com.example.inhavote.Service;

import com.example.inhavote.Entity.CandidateEntity;
import com.example.inhavote.Entity.CandidateId;
import com.example.inhavote.Repository.CandidateRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.List;

@RequiredArgsConstructor
@Service
public class CandidateService {
    private final CandidateRepository candidateRepository;

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
    public void imgUpload( MultipartFile file,String img_path) {
        String fileName = file.getOriginalFilename();
        if (!file.isEmpty()) {
            try {
                byte[] bytes = file.getBytes();
                Path path = Paths.get("./src/main/webapp/resources/img_candidate/" + img_path);
                Files.write(path, bytes);
                //return "succes";
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
    }
}
