package test.sample.dao;

import org.springframework.data.jpa.repository.JpaRepository;

import test.sample.entity.Tag;

public interface TagDao extends JpaRepository<Tag, Integer>{
	Tag findByName(String tagName);
}
