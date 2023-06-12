package com.kbstar.mapper;


import com.kbstar.dto.Chatroom;
import com.kbstar.frame.KBMapper;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

@Repository
@Mapper
public interface ChatRoomMapper extends KBMapper<Integer, Chatroom> {

    public Integer findChatRoomNumber(String hostId, String guestId);
}