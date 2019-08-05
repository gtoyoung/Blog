package test.sample.repository;

import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Repository;

import test.sample.dao.MemberDao;
import test.sample.dao.PostDao;
import test.sample.entity.Member;
import test.sample.entity.Post;
import test.sample.entity.command.PostCommand;
import test.sample.entity.exception.IllegalUserException;

@Repository
public class PostRepository {

	@Autowired
	private PostDao postDao;

	@Autowired
	private MemberDao memberDao;

	public Page<Post> getPostList(Pageable pageable) {
		Page<Post> postPage = postDao.findAll(pageable);

		return postPage;
	}

	public Page<Post> getPostList(Pageable pageable, int categoryId) {
		return postDao.findByCategoryId(categoryId, pageable);
	}

	public Page<Post> getPostList(Pageable pageable, String tagName) {
		return postDao.findByPostTagListTagName(tagName, pageable);
	}

	public Post getPostById(int id) throws IllegalArgumentException {

		Post post = postDao.findOne(id);

		if (post == null) {
			throw new IllegalArgumentException("Post Not Found.");
		}

		return post;
	}

	public Post writePost(Post post) {
		post.setRegDate(new Date());
		post.setUpdateDate(new Date());

		return postDao.save(post);
	}

	public void deletePost(int id) {
		postDao.delete(id);
	}

	public Post editPost(PostCommand postCommand) {
		Post post = getPostById(postCommand.getId());

		post.setUpdateDate(new Date());
		post.setTitle(postCommand.getTitle());
		post.setSubtitle(postCommand.getSubtitle());
		post.setContent(postCommand.getContent());

		return post;
	}

	public Post findByIdAndMember(int id, String username) throws RuntimeException {
		if (isThisUserPostWriter(memberDao.findByUsername(username), id))
			return getPostById(id);
		else
			throw new IllegalUserException("Not the Writer.");
	}

	public boolean isThisUserPostWriter(Member member, int id) throws IllegalArgumentException {
		Post post = getPostById(id);

		return post.getMember().equals(member);
	}
}
