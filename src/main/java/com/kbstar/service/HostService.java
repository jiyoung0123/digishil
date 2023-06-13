package com.kbstar.service;


import com.kbstar.dto.Host;
import com.kbstar.dto.HostRoomReserveReview;
import com.kbstar.frame.KBService;
import com.kbstar.mapper.HostMapper;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@Slf4j
@Component
public class HostService implements KBService<String, Host> {

    @Autowired
    HostMapper mapper;

    @Override
    public void register(Host host) throws Exception {
        mapper.insert(host);
    }

    @Override
    public void remove(String s) throws Exception {
        mapper.delete(s);
    }

    @Override
    public void modify(Host host) throws Exception {
        mapper.update(host);
    }

    @Override
    public Host get(String s) throws Exception {
        return mapper.select(s);
    }

    @Override
    public List<Host> get() throws Exception {
        return mapper.selectall();
    }

    public void updatePwd(Host host) throws Exception {
        mapper.updatePwd(host);
    }
    public List<HostRoomReserveReview> getMyAllRoom(String hostId) throws Exception{
        return mapper.selectMyAllRoom(hostId);
    }
    public List<HostRoomReserveReview> getMyRoomReviews(Integer roomId) throws Exception{
        return mapper.selectMyRoomReviews(roomId);
    }
}