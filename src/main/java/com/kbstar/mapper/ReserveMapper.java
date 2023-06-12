package com.kbstar.mapper;

import com.kbstar.dto.HostRoomReserveReview;
import com.kbstar.dto.Reserve;
import com.kbstar.frame.KBMapper;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
@Mapper
public interface ReserveMapper extends KBMapper<Integer, Reserve> {
    public Reserve searchId(Reserve reserve);
    public Object getReserve(Integer i);
    public List<Reserve> reserveDate(Integer i);
    public List<Reserve> getMyReserve(String guestId);

    public Reserve refund(Reserve reserve);
    public List<HostRoomReserveReview> selectHostGuestReserve(String hostId, String guestId);

}
