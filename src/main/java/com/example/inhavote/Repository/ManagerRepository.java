package com.example.inhavote.Repository;

import com.example.inhavote.Entity.ManagerEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface ManagerRepository extends JpaRepository<ManagerEntity,String> {



    ManagerEntity findByVoteid(String vote_id);
    List<ManagerEntity> findByManagerid(String manager_id);
    ManagerEntity findByManageridAndManagername(String manager_id,String manager_name);
}
