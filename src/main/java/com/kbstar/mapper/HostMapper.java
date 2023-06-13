package com.kbstar.mapper;

import com.kbstar.dto.Host;
import com.kbstar.dto.HostRoomReserveReview;
import com.kbstar.frame.KBMapper;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
@Mapper
public interface HostMapper extends KBMapper<String, Host> {
    public void updatePwd(Host host);
    public List<HostRoomReserveReview> selectMyAllRoom(String hostId);
    public List<HostRoomReserveReview> selectMyRoomReviews(Integer roomId);
}