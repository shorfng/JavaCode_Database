# 级联删除：删除主表数据的同时，也删除掉从表数据

# 在建表的时候，添加级联删除（ON DELETE CASCADE）
CREATE TABLE employee
(
    eid     INT PRIMARY KEY AUTO_INCREMENT,
    ename   VARCHAR(20),
    age     INT,
    dept_id INT,
    CONSTRAINT emp_dept_fk FOREIGN KEY (dept_id) REFERENCES department (id)
        ON DELETE CASCADE -- 添加级联删除
);
