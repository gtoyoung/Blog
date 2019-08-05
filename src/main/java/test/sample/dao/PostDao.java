package test.sample.dao;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;

import test.sample.entity.Member;
import test.sample.entity.Post;

public interface PostDao extends JpaRepository<Post, Integer> {
	public Page<Post> findByCategoryId(int categoryId, Pageable pageable);

	public Page<Post> findByPostTagListTagName(String tagName, Pageable pageable);
}
