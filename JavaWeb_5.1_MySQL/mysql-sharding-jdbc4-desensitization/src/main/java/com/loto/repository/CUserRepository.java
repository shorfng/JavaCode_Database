package com.loto.repository;

import com.loto.entity.CUser;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface CUserRepository extends JpaRepository<CUser, Long> {
    public List<CUser> findByPwd(String pwd);
}
