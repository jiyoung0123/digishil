package com.kbstar.service;

import com.kbstar.dto.Guest;
import com.kbstar.frame.KBService;
import com.kbstar.mapper.GuestMapper;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Service;

import java.util.List;
@Service
@Slf4j
@Component
public class GuestService implements KBService<String, Guest> {

    @Autowired
    GuestMapper mapper;

    @Override
    public void register(Guest guest) throws Exception {
        mapper.insert(guest);
    }

    @Override
    public void remove(String s) throws Exception {
        mapper.delete(s);
    }

    @Override
    public void modify(Guest guest) throws Exception {
        mapper.update(guest);
    }

    @Override
    public Guest get(String s) throws Exception {
        return mapper.select(s);
    }

    @Override
    public List<Guest> get() throws Exception {
        return mapper.selectall();
    }



    public void updatePwd(Guest guest) throws Exception {
        mapper.updatePwd(guest);
    }
}
