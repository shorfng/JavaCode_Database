# 查看查询缓存是否启用，空间大小，限制等
show variables like '%query_cache%';

# 查看更详细的缓存参数，可用缓存空间，缓存块，缓存多少等
show status like 'Qcache%';
