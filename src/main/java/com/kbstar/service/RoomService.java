package com.kbstar.service;

import com.kbstar.dto.Room;
import com.kbstar.frame.KBService;
import com.kbstar.mapper.RoomMapper;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
@Service
@Slf4j
public class RoomService implements KBService<Integer, Room> {

    @Autowired
    RoomMapper mapper;
    @Override
    public void register(Room room) throws Exception {
        mapper.insert(room);
    }

    @Override
    public void remove(Integer i) throws Exception {
        mapper.delete(i);
    }

    @Override
    public void modify(Room room) throws Exception {
        mapper.update(room);
    }

    @Override
    public Room get(Integer i) throws Exception {
        return mapper.select(i);
    }

    @Override
    public List<Room> get() throws Exception {
        return mapper.selectall();
    }
}
