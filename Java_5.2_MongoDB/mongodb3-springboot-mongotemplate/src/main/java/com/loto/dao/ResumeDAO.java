package com.loto.dao;

import com.loto.bean.Resume;

import java.util.List;

public interface ResumeDAO {
    void insertResume(Resume resume);

    /**
     * 根据 name 获取
     */
    Resume findByName(String name);

    List<Resume> findList(String name);

    /**
     * 根据 name 和 expectSalary 查询
     */
    List<Resume> findListByNameAndExpectSalary(String name, double expectSalary);
}
