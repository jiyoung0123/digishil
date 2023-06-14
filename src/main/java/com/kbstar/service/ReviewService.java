package com.kbstar.service;


import com.kbstar.dto.Review;
import com.kbstar.frame.KBService;
import com.kbstar.mapper.ReviewMapper;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@Slf4j
public class ReviewService implements KBService<Integer, Review> {

    @Autowired
    ReviewMapper mapper;

    /**
     * 등록 및 가입 진행
     * argument : Object
     * return: null
     *
     * @param review
     */
    @Override
    public void register(Review review) throws Exception {
        mapper.insert(review);
    }

    @Override
    public void remove(Integer integer) throws Exception {

    }

    @Override
    public void modify(Review review) throws Exception {

    }

    @Override
    public Review get(Integer integer) throws Exception {
        return mapper.select(integer);
    }

    @Override
    public List<Review> get() throws Exception {
        return null;
    }

}
