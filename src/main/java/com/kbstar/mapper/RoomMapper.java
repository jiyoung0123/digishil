package com.kbstar.mapper;

import com.github.pagehelper.Page;
import com.kbstar.dto.Room;
import com.kbstar.frame.KBMapper;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

@Repository
@Mapper
public interface RoomMapper extends KBMapper<Integer, Room> {
    Page<Room> getpage() throws Exception;

}
