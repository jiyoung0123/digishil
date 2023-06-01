package com.kbstar.service;

import com.kbstar.dto.Reserve;
import com.kbstar.frame.KBService;
import com.kbstar.mapper.ReserveMapper;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@Slf4j
public class ReserveService implements KBService<Integer, Reserve> {
    /**
     * 등록 및 가입 진행
     * argument : Object
     * return: null
     *
     * @param reserve
     */
    @Autowired
    ReserveMapper mapper;
    @Override
    public void register(Reserve reserve) throws Exception {
        mapper.insert(reserve);
    }

    @Override
    public void remove(Integer i) throws Exception {
        mapper.delete(i);
    }

    @Override
    public void modify(Reserve reserve) throws Exception {
        mapper.update(reserve);
    }

    @Override
    public Reserve get(Integer i) throws Exception {
        return mapper.select(i);
    }

    @Override
    public List<Reserve> get() throws Exception {
        return mapper.selectall();
    }

    public Reserve searchId(Reserve reserve) throws Exception {
        return mapper.searchId(reserve);
    }

    public Object getReserve(Integer i) throws Exception{
        return mapper.getReserve(i);
    }

    public List<Reserve> reserveDate(Integer i) throws Exception {
        return mapper.reserveDate(i);
    }
}
