package com.kbstar.service;

import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import com.kbstar.dto.Reserve;
import com.kbstar.dto.Room;
import com.kbstar.dto.RoomSearch;
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

    public Page<Room> getPage(int pageNo) throws Exception {
        PageHelper.startPage(pageNo, 6); // 3: 한화면에 출력되는 개수
        return mapper.getpage();
    }

    public Page<Room> roomSearch(int pageNo, RoomSearch rs) throws Exception {
        PageHelper.startPage(pageNo, 6);
        return mapper.roomSearch(rs);
    }
}
