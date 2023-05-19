package com.example.inhavote.Entity;

import jakarta.persistence.*;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
@Entity
@IdClass(UserId.class)
@Table(name="User")
public class UserEntity {

    @Column(name = "email_confirm")
    private String emailconfirm;
    @Column(name = "vote_confirm")
    private boolean voteconfirm;


    @Id
    @Column(name = "vote_id")
    private String voteid;
    @Id
    @Column(name = "student_id")
    private String studentid;


}
