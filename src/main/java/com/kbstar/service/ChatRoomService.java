package com.kbstar.service;

import com.kbstar.dto.Chatroom;
import com.kbstar.frame.KBService;
import com.kbstar.mapper.ChatRoomMapper;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Slf4j
@Service
public class ChatRoomService implements KBService<Integer, Chatroom> {
    @Autowired
    ChatRoomMapper mapper;
    @Override
    public void register(Chatroom chatroom) throws Exception {
        mapper.insert(chatroom);
        //mapper.insert(cust);
    }

    @Override
    public void remove(Integer k) throws Exception {
        mapper.delete(k);
    }

    @Override
    public void modify(Chatroom chatroom) throws Exception {

    }

    @Override
    public Chatroom get(Integer k) throws Exception {
        return mapper.select(k);
    }

    @Override
    public List<Chatroom> get() throws Exception {
        return mapper.selectall();
    }

    public Integer findChatRoomNumber(String hostId, String guestId) throws Exception {
        return mapper.findChatRoomNumber(hostId, guestId);
    }
    public List<Chatroom> findGuestChatRoom(String guestId) throws Exception {
        return mapper.findGuestChatRoomId(guestId);
    }
    public List<Chatroom> findHostChatRoom(String hostId) throws Exception {
        return mapper.findHostChatRoomId(hostId);
    }


}
