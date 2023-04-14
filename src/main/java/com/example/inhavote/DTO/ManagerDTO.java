package com.example.inhavote.DTO;

import com.example.inhavote.RandomCode;
import lombok.Getter;

@Getter
public class ManagerDTO {
    private String manager_name;
    private String manager_tel;

    private String manager_id;

    public ManagerDTO(String manager_name, String manager_tel) {
        this.manager_name=manager_name;
        this.manager_tel=manager_tel;
        manager_id= RandomCode.randomCode();
    }

    @Override
    public String toString(){
        return "ManagerDTO{" +
                "이름='" + manager_name + '\'' +
                ", 전화번호='" + manager_tel + '\'' +
                ", 관리자 코드='" + manager_id+'\''+
                '}';
    }
}
