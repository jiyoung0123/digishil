package com.kbstar.service;

import com.kbstar.dto.ChatDetails;
import com.kbstar.dto.ChatRecentData;
import com.kbstar.dto.Chatcontents;
import com.kbstar.frame.KBService;
import com.kbstar.mapper.ChatContentsMapper;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Slf4j
@Service
public class ChatContentsService implements KBService<Integer, Chatcontents> {
    @Autowired
    ChatContentsMapper mapper;
    @Override
    public void register(Chatcontents chatcontents) throws Exception {
        mapper.insert(chatcontents);
    }

    @Override
    public void remove(Integer k) throws Exception {
        mapper.delete(k);
    }

    @Override
    public void modify(Chatcontents chatcontents) throws Exception {

    }

    @Override
    public Chatcontents get(Integer k) throws Exception {
        return mapper.select(k);
    }

    @Override
    public List<Chatcontents> get() throws Exception {
        return mapper.selectall();
    }
    //채팅방의 최신 메세지 날짜를 찾는 메소드
    public String findRecentDate(Integer chatRoomId){
        return String.valueOf(mapper.findRecentDate(chatRoomId));
    }
    //채팅장의 최신 메세지 내용을 찾는 메소드
    public String findRecentContents(Integer chatRoomId){
        return mapper.findRecentContents(chatRoomId);
    }

    //그냥 한번에 배열 형태로 최근 메세지 날짜랑 내용을 다 찾아서 배열형태로 받는 메소드
    public ChatRecentData findRecentData(Integer chatRoomId){
        return mapper.findRecentData(chatRoomId);
    }

    //Host의 채팅 전체내용
    public List<ChatDetails> findChatDetailsHost(Integer chatRoomId, String hostId){return mapper.findChatDetailsHost(chatRoomId, hostId);}
}
