package com.kbstar.mapper;

import com.kbstar.dto.Reserve;
import com.kbstar.frame.KBMapper;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

@Repository
@Mapper
public interface ReserveMapper extends KBMapper<Integer, Reserve> {
    public Reserve searchId(Reserve reserve);
    public Object getReserve(Integer i);
}
