package test.sample.dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import test.sample.entity.PostTag;


public interface PostTagDao extends JpaRepository<PostTag, Integer> {
	
	List<PostTag> findByTagName(String tagName);

	List<PostTag> findByPostId(int postId);
}
