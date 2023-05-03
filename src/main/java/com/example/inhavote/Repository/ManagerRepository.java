package com.example.inhavote.Repository;

import com.example.inhavote.Entity.ManagerEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface ManagerRepository extends JpaRepository<ManagerEntity,String> {



    ManagerEntity findByVoteid(String vote_id);
    ManagerEntity findByManagerid(String manager_id);
    ManagerEntity findByManageridAndManagername(String manager_id,String manager_name);
}
