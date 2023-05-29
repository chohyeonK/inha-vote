package com.example.inhavote.Service;

import com.example.inhavote.DTO.CandidateStudentDTO;
import com.example.inhavote.DTO.VoteDTO;
import com.example.inhavote.Entity.*;
import com.example.inhavote.Repository.CandidateRepository;
import com.example.inhavote.Repository.StudentsRepository;
import jakarta.transaction.Transactional;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
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

    private final UserService userService;

//    @Autowired
//    private final CandidateStudentDTORepository candidateStudentDTORepository;

    public void register_candidate(List<CandidateEntity> candidateList,String vote_id){
        for(CandidateEntity candidate:candidateList){
            CandidateEntity candidateEntity=new CandidateEntity();
            candidateEntity.setCandidatepromise(candidate.getCandidatepromise());
            candidateEntity.setCandidatespec(candidate.getCandidatespec());
            candidateEntity.setVoteid(vote_id);
            candidateEntity.setImgpath(vote_id+"-"+candidate.getStudentid()+".png");
            candidateEntity.setStudentid(candidate.getStudentid());
            this.candidateRepository.save(candidateEntity);
        }
    }
    public void imgUpload( MultipartFile file,String student_id,String vote_id) {
        String fileName = file.getOriginalFilename();
        if (!file.isEmpty()) {
            try {
                byte[] bytes = file.getBytes();
                Path path = Paths.get("./src/main/webapp/resources/img/candidate_img/" + vote_id+"-"+student_id+".png");
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

    public List<CandidateStudentDTO> findCandidateStudent(String vote_id){
        return candidateRepository.findCandidateStudent(vote_id);
    }

    public CandidateStudentDTO findCandidateVote(String vote_id, String vote_number) {
        return candidateRepository.findCandidateVote(vote_id, vote_number);
    }

    // 후보자 득표수 증가
    @Transactional
    public boolean voteCounter(String studentId, String voteId, String voteNumber) {
        CandidateEntity vote_student = findCandidateStudent(voteNumber, voteId);
        if (vote_student != null) {
            voteCounterUp(vote_student); // 득표수 +1 증가

            UserEntity vote_user = userService.findByStudent_idAndVote_id(studentId, voteId);
            if (vote_user != null) {
                vote_user.setVoteconfirm(true);
                return true;
            } else {
                return false;
            }
        } else {
            return false;
        }
    }
    
    // 투표 대상 찾기
    public CandidateEntity findCandidateStudent(String vote_number, String vote_id) {
        return candidateRepository.findByStudentidAndVoteid(vote_number, vote_id);
    }

    // 투표 대상 득표수 증가
    @Transactional
    public void voteCounterUp(CandidateEntity voteUser) {
        //System.out.println("voteCounterUp");
        int currentCounter = voteUser.getVotecounter() + 1;
        voteUser.setVotecounter(currentCounter);
        //System.out.println(voteUser.getVotecounter());
    }
}
