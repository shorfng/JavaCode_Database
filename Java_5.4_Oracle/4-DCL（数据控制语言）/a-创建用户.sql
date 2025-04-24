-- 创建用户（执行 CREATE USER 需要 DBA 或 CREATE USER 系统权限）
-- 用户名需符合 Oracle 命名规则（如长度≤30字符，不含空格）
-- Oracle 12c+ 默认强制密码复杂度（需包含大小写、数字，长度≥8），双引号包裹密码可包含特殊字符（如 "P@ss#2025"）
-- Oracle 默认密码有效期为 180 天，可通过以下命令禁用：ALTER PROFILE DEFAULT LIMIT PASSWORD_LIFE_TIME UNLIMITED;
-- 指定用户的默认表空间为 users，若未指定，默认使用 SYSTEM 表空间（强烈不推荐，会导致系统性能问题）
-- 表空间需预先存在（可通过 SELECT tablespace_name FROM dba_tablespaces 验证）
-- 指定用户的临时表空间为 temp，用于存储排序、哈希等操作的临时数据，临时表空间不足会导致 SQL 操作失败（如 ORA-01652: unable to extend temp segment）
-- 限制用户在 users 表空间上的存储配额为 100MB
-- 多表空间配额：可为用户分配多个表空间配额（如 QUOTA 50M ON users, QUOTA 200M ON data_ts）
CREATE USER 用户名
    IDENTIFIED BY "密码"
    DEFAULT TABLESPACE users
    TEMPORARY TABLESPACE temp
    QUOTA 100M ON users;

-- 允许登录
GRANT CREATE SESSION TO 用户名;

-- 授予基础权限（如建表）
GRANT RESOURCE TO 用户名;