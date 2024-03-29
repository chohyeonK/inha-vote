package com.example.inhavote.DTO;

import com.example.inhavote.RandomCode;
import lombok.Getter;

@Getter
public class CreateVoteDTO {
    private String manager_name;
    private String manager_tel;
    private String vote_id;
    private String manager_id;
    private char vote_active;

    public CreateVoteDTO(String manager_name, String manager_tel) {
        this.manager_name=manager_name;
        this.manager_tel=manager_tel;
        manager_id= RandomCode.randomCode();
        vote_id="vote_"+RandomCode.randomCode();
        vote_active='Y';
    }

    @Override
    public String toString(){
        return "CreateVoteDTO{" +
                "이름='" + manager_name + '\'' +
                ", 전화번호='" + manager_tel + '\'' +
                ", 관리자 코드='" + manager_id+'\''+
                ", 투표 코드='" +vote_id+'\''+
                ", 투표 활성화='" +vote_active+'\''+
                '}';
    }


}
