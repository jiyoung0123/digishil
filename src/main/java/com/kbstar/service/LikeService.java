package com.kbstar.service;

import com.kbstar.dto.Like;
import com.kbstar.frame.KBService;
import com.kbstar.mapper.LikeMapper;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@Slf4j
public class LikeService implements KBService<Integer, Like> {
    /**
     * 등록 및 가입 진행
     * argument : Object
     * return: null
     *
     * @param like
     */
    @Autowired
    LikeMapper mapper;
    @Override
    public void register(Like like) throws Exception {
        mapper.insert(like);
    }

    @Override
    public void remove(Integer i) throws Exception {
        mapper.delete(i);
    }

    @Override
    public void modify(Like like) throws Exception {
        mapper.update(like);
    }

    @Override
    public Like get(Integer i) throws Exception {
        return mapper.select(i);
    }

    @Override
    public List<Like> get() throws Exception {
        return mapper.selectall();
    }
}
