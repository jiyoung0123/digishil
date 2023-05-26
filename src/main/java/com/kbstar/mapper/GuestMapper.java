package com.kbstar.mapper;

import com.kbstar.dto.Guest;
import com.kbstar.frame.KBMapper;
import org.apache.ibatis.annotations.Mapper;
import org.mybatis.spring.annotation.MapperScan;
import org.springframework.stereotype.Repository;
import org.springframework.web.bind.annotation.RequestMapping;
@Repository
@Mapper
public interface GuestMapper extends KBMapper<String, Guest> {

}
