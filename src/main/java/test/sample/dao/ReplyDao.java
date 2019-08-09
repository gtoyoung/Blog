package test.sample.dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import test.sample.entity.Post;
import test.sample.entity.Reply;



public interface ReplyDao extends JpaRepository<Reply, Integer> {
	public List<Reply> findByPostId(int postId);
}
