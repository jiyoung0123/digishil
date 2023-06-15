package com.kbstar.mapper;

import com.github.pagehelper.Page;
import com.kbstar.dto.Like;
import com.kbstar.frame.KBMapper;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

@Repository
@Mapper
public interface LikeMapper extends KBMapper<Integer, Like> {
    Like getLike(Like like) throws Exception;
    Page<Like> likeList(String s) throws Exception;
}
