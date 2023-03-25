package com.example.inhavote.Entity;

import jakarta.persistence.*;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
@Entity
@Table(name="User")
public class UserEntity {

    private String student_id;

    private boolean email_confirm;
    private boolean vote_confirm;
    private String vote_id;

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer user_id;


}
