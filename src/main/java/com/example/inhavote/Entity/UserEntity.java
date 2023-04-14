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
    @Id
    private String vote_id;


}
