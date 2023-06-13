package com.pet.sseudam.dao;

import com.pet.sseudam.model.PetBean;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.session.SqlSession;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

@Repository
public interface PetDao {


    // 동물리스트
    int getTotal(PetBean pet);
    List<PetBean> p_list(PetBean pet);


}
