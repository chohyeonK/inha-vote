package com.example.inhavote.DTO;


import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class ResponseDTO {

    // 110: 투표권 없는 투표자,
    // 120: 미 투표자,
    // 130: 기 투표자,
    // 140: 투표자는 맞으나 오류
    // 190: 시스템 오류
    private int resCode;
    private String resMessage;
}
