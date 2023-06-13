package com.kbstar.mapper;

import com.kbstar.dto.Review;
import com.kbstar.frame.KBMapper;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

@Repository
@Mapper
public interface ReviewMapper extends KBMapper<Integer, Review> {
    public void insertReview(Review review);
}
