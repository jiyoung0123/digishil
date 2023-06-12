package com.kbstar.mapper;


import com.kbstar.dto.ChatDetails;
import com.kbstar.dto.ChatRecentData;
import com.kbstar.dto.Chatcontents;
import com.kbstar.frame.KBMapper;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
@Mapper
public interface ChatContentsMapper extends KBMapper<Integer, Chatcontents> {
    public String findRecentDate(Integer chatRoomId);
    public String findRecentContents(Integer chatRoomId);
    public ChatRecentData findRecentData(Integer ChatRoomId);

    public List<ChatDetails> findChatDetailsHost(Integer chatRoomId, String hostId);
    public List<ChatDetails> findChatDetailsGuest(Integer chatRoomId, String guestId);

}