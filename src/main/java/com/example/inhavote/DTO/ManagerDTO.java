package com.example.inhavote.DTO;

import com.example.inhavote.Entity.ManagerEntity;
import com.example.inhavote.RandomCode;
import com.example.inhavote.Repository.ManagerRepository;
import lombok.Getter;

import java.util.Date;

@Getter
public class ManagerDTO {
    private String manager_name;
    private String manager_tel;
    private String vote_id;
    private String manager_id;
    private char vote_active;
    private String vote_name;
    private int student_grade;
    private String student_major;
    private Date start_date;
    private Date end_date;
    private String randomdata=RandomCode.randomCode();
    public ManagerDTO(String manager_name, String manager_tel) {
        this.manager_name=manager_name;
        this.manager_tel=manager_tel;
        manager_id= randomdata;
        vote_id="vote_"+randomdata;
        vote_active='Y';
    }

    @Override
    public String toString(){
        return "ManagerDTO{" +
                "이름='" + manager_name + '\'' +
                ", 전화번호='" + manager_tel + '\'' +
                ", 관리자 코드='" + manager_id+'\''+
                ", 투표 코드='" +vote_id+'\''+
                ", 투표 활성화='" +vote_active+'\''+
                '}';
    }


}
