
package com.example.inhavote.Entity;

import jakarta.persistence.Column;
import jakarta.persistence.Embeddable;
import lombok.Data;
import lombok.Getter;
import lombok.Setter;

import java.io.Serializable;

@Getter
@Setter
@Data
public class UserId implements Serializable {

    private String voteid;


    private String studentid;
}
