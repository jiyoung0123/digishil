package com.kbstar.mapper;

import com.github.pagehelper.Page;
import com.kbstar.dto.Room;
import com.kbstar.dto.RoomSearch;
import com.kbstar.frame.KBMapper;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
@Mapper
public interface RoomMapper extends KBMapper<Integer, Room> {
    Page<Room> getpage() throws Exception;
    Page<Room> getpage2(String s) throws Exception;

    Page<Room> roomSearch(RoomSearch rs) throws Exception;

    List<Room> getRoomLocList(String roomLoc);
}
