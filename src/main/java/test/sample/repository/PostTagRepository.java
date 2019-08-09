package test.sample.repository;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import test.sample.dao.PostTagDao;
import test.sample.entity.PostTag;

@Repository
public class PostTagRepository {

	@Autowired
	PostTagDao postTagDao;

	@Autowired
	TagRepository tagRepository;

	public void insertPostTag(PostTag postTag) {
		postTag.setRegDate(new Date());
		postTagDao.save(postTag);

		tagRepository.increaseUseCount(postTag.getTagId());
	}

	public List<PostTag> findByPostId(int postId) {
		return postTagDao.findByPostId(postId);
	}

	public void deletePostTag(PostTag postTag) {
		postTagDao.delete(postTag.getId());

		tagRepository.decreaseUseCount(postTag.getTagId());
	}
}
