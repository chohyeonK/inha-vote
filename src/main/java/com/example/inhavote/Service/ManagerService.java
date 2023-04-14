package com.example.inhavote.Service;

import com.example.inhavote.Entity.*;
import com.example.inhavote.DTO.ManagerDTO;
import com.example.inhavote.Repository.ManagerRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

@RequiredArgsConstructor
@Service
public class ManagerService {
    private final ManagerRepository managerRepository;
    public void create(ManagerDTO managerDTO) {
        ManagerEntity manager = new ManagerEntity();
        manager.setManager_id(managerDTO.getManager_id());
        manager.setManager_name(managerDTO.getManager_name());
        manager.setManager_tel(managerDTO.getManager_tel());
        System.out.println("매니저 서비스");
        this.managerRepository.save(manager);
    }
}
