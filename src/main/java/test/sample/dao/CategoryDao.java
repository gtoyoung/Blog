package test.sample.dao;

import org.springframework.data.jpa.repository.JpaRepository;

import test.sample.entity.Category;

public interface CategoryDao extends JpaRepository<Category, Integer>{

}
